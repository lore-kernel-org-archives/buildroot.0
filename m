From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 16:32:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-rtsp-server: disable
 examples and tests
In-Reply-To: <20190815225652.3699-1-fontaine.fabrice@gmail.com>
References: <20190815225652.3699-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817163251.210382b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 00:56:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/7a268af00535d0f93e94955a3beea2745cf93422
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
