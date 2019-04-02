URL = window.URL || window.webkitURL;
var gumStream;
var rec;
var input;

var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext

var recordButton = document.getElementById("recordButton");
var stopButton = document.getElementById("stopButton");
var pauseButton = document.getElementById("pauseButton");

recordButton.addEventListener("click", startRecording);
stopButton.addEventListener("click", stopRecording);
pauseButton.addEventListener("click", pauseRecording);

function startRecording(e) {
    console.log("recordButton clicked");
    if ($("ol#recordingsList li").length > 0) {
        if (confirm('Are you sure you want to delete this audio?')) {
            recordingsList.removeChild(recordingsList.childNodes[0]);
        } else {
            e.preventDefault();
            return;
        }
    }

    https://addpipe.com/blog/audio-constraints-getusermedia/
    var constraints = { audio: true, video: false }

    recordButton.disabled = true;
    stopButton.disabled = false;
    pauseButton.disabled = false
    https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia
    navigator.mediaDevices.getUserMedia(constraints).then(function (stream) {
        console.log("getUserMedia() success, stream created, initializing Recorder.js ...");

        audioContext = new AudioContext();
        document.getElementById("formats").innerHTML = audioContext.sampleRate / 1000 + "kHz"
        gumStream = stream;
        input = audioContext.createMediaStreamSource(stream);
        rec = new Recorder(input, { numChannels: 1 })
        rec.record()
        console.log("Recording started");

    }).catch(function (err) {
        recordButton.disabled = false;
        stopButton.disabled = true;
        pauseButton.disabled = true
    });
}

function pauseRecording(e) {
    console.log("pauseButton clicked rec.recording=", rec.recording);
    if (rec.recording) {
        rec.stop();
        pauseButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>';
    } else {
        rec.record()
        pauseButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>';
    }
    e.preventDefault();
}

function stopRecording() {
    console.log("stopButton clicked");

    stopButton.disabled = true;
    recordButton.disabled = false;
    pauseButton.disabled = true;

    pauseButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>';
    rec.stop();
    gumStream.getAudioTracks()[0].stop();
    rec.exportWAV(createDownloadLink);
}

function createDownloadLink(blob) {

    var url = URL.createObjectURL(blob);
    var au = document.createElement('audio');
    var li = document.createElement('li');
    var link = document.createElement('a');

    var filename = new Date().toISOString();
    au.controls = true;
    au.src = url;

    link.href = url;
    link.download = filename + ".wav";
    link.innerHTML = "<span class='btn btn-success'>Save</span>";

    li.appendChild(au);
    li.appendChild(document.createTextNode(filename + ".wav "))
    //li.appendChild(link);

    var upload = document.createElement('a');
    upload.href = "";
    upload.innerHTML = "<span class='btn btn-success'>Save</span>";
    upload.addEventListener("click", function (event) {
        var xhr = new XMLHttpRequest();
        xhr.onload = function (e) {
            if (this.readyState === 4) {
                console.log("Server returned: ", e.target.responseText);
            }
        };
        var fd = new FormData();
        fd.append("data", blob, filename);
        xhr.open("POST", "/", false);
        xhr.send(fd);
    })
    li.appendChild(upload)

    recordingsList.appendChild(li);
}
