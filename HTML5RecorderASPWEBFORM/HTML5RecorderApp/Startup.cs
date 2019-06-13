using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HTML5RecorderApp.Startup))]
namespace HTML5RecorderApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
