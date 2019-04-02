<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HTML5RecorderApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <a href="//online-voice-recorder.com" class="app_logo">
                <img src="//static.123apps.com/i/glyphs/vrecorder.svg" alt="Online Voice Recorder" class="title-image" style="width:60px;">
                <div class="title" style="margin-left:70px; margin-top:10px;"> 
                    <div class="row_1">Voice Recorder</div>
                    <div class="row_2">online</div>
                </div>
            </a>
        </div>
    </div>
    <br />
    <div class="jumbotron" style="height:360px;">
        <p style="color:white; font-size:15px; text-align:center;" id="formats">Click the button to start recording...</p>
        <div style="text-align:center;"><span style="color:white;" id="minutes">00</span><span style="color:white;">:</span><span style="color:white;" id="seconds">00</span></div>
        
        <div id="controls" style="text-align:center;">
            <button id="recordButton" class="btn btn-danger btn-xs" style="border-radius:50px; padding-top:5px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M12 14c1.66 0 2.99-1.34 2.99-3L15 5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3zm5.3-3c0 3-2.54 5.1-5.3 5.1S6.7 14 6.7 11H5c0 3.41 2.72 6.23 6 6.72V21h2v-3.28c3.28-.48 6-3.3 6-6.72h-1.7z"/></svg>
            </button>
            <button id="pauseButton" class="btn btn-danger btn-xs" disabled style="border-radius:50px; padding-top:5px;">
                <svg id="pause" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>
            </button>
            <button id="stopButton" class="btn btn-danger btn-xs" disabled style="border-radius:50px; padding-top:5px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path d="M6 6h12v12H6z"/></svg>
            </button>
        </div>
        <ol id="recordingsList" style="text-align:center; list-style-type: none; display:initial;"></ol>
    </div>
    <br /><br />
    <div class="row">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block vrecorder">
                <img src="//static.123apps.com/i/glyphs/vrecorder.svg" alt="Online Voice Recorder" class="title-image">
                <div class="cnt">
                    <div class="h">Online Voice Recorder</div>
                    <div class="p">
                        Our Voice Recorder is a convenient and simple online tool that can be used right in your browser. It allows you to record your voice using a microphone and save it as an mp3 file.
                    </div> 
                    <br /><br />
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block free">
                <img src="//static.123apps.com/i/index_blocks/free.svg" alt="Free to use" class="title-image">
                <div class="cnt">
                    <div class="h">Free to use</div>
                    <div class="p">Voice Recorder is completely free. No hidden payments, activation fees, or charges for extra features.</div>
                    <br /><br />
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block auto_trim">
                <img src="//static.123apps.com/i/index_blocks/auto_trim.svg" alt="Auto silence trimming" class="title-image">
                <div class="cnt">
                    <div class="h">Auto silence trimming</div>
                    <div class="p">
                        Voice Recorder automatically detects silent fragments at the beginning and the end of your recording and deletes them for your convenience.
                    </div>
                    <br /><br />
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block cut">
                <img src="//static.123apps.com/i/index_blocks/cut.svg" alt="Cut your recording" class="title-image">
                <div class="cnt">
                    <div class="h">Cut your recording</div>
                    <div class="p">After the recording is complete, you can crop it to the section you actually need.</div>
                    <br /><br /><br /><br />
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block secure">
                <img src="//static.123apps.com/i/index_blocks/secure.svg" alt="Privacy guaranteed" class="title-image">
                <div class="cnt">
                    <div class="h">Privacy guaranteed</div>
                    <div class="p">We guarantee that our app is secure. Everything you record is accessible to you alone: nothing is uploaded to our servers for storage.
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <div class="block settings">
                <img src="//static.123apps.com/i/index_blocks/settings.svg" alt="Microphone settings" class="title-image">
                <div class="cnt">
                    <div class="h">Microphone settings</div>
                    <div class="p">You can adjust your microphone settings using standard Adobe Flash Player tools (decreasing echo and adjusting the volume).</div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <br /><br />
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
            <br /><br />
        </div>
    </div>
    <script src="Scripts/myrecorder.js"></script>
  	<script src="Scripts/app.js"></script>
    <script>
        var Clock = {
            totalSeconds: 0,

            start: function () {
                var self = this;
                
                this.interval = setInterval(function () {
                    self.totalSeconds += 1;
                    $("#minutes").text(pad(parseInt(self.totalSeconds / 60)));
                    $("#seconds").text(pad(self.totalSeconds % 60));
                }, 1000);
            },

            pause: function () {
                clearInterval(this.interval);
                delete this.interval;
            },

            resume: function () {
                if (!this.interval) this.start();
            }
        };

        function pad(val) {
            var valString = val + "";
            if (valString.length < 2) {
                return "0" + valString;
            } else {
                return valString;
            }
        }

        //Clock.start();
        $('#recordButton').click(function () {
            Clock.start();
        });
        $('#pauseButton').click(function () {
            var status = $('#pauseButton').children('svg').attr('id');
            if (status == "pause") {
                Clock.resume();
            }
            else {
                Clock.pause();
            }
            console.log(status);
        });
        $('#stopButton').click(function () {
            Clock.totalSeconds = 0;
        });
    </script>
</asp:Content>
