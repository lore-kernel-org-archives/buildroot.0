From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:57:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-base: fix build
 with gcc 4.8
In-Reply-To: <20201214070232.1405442-1-fontaine.fabrice@gmail.com>
References: <20201214070232.1405442-1-fontaine.fabrice@gmail.com>
Message-ID: <20201230235754.3a9c58d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Dec 2020 08:02:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of gst1-plugins-base in version 1.18.2 with gcc 4.8
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/91f8a78a012fb30f323d82d1d7094f28d018a768
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eo-gstvideoaggregator.c-fix-build-wi.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
