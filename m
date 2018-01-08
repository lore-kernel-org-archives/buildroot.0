From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 20:59:43 +0100
Subject: [Buildroot] [PATCH 1/1] rygel: fix UI build
In-Reply-To: <20180108181042.16089-1-fontaine.fabrice@gmail.com>
References: <20180108181042.16089-1-fontaine.fabrice@gmail.com>
Message-ID: <20180108205943.5276e34b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Jan 2018 19:10:42 +0100, Fabrice Fontaine wrote:
> Add a patch to avoid failing on a configure error if UI example can't be
> built if libgtk3 is available but not gst1-plugins-base (gstreamer-video
> is only needed for UI example, not for rygel UI)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/6c659aadfc418c0a27a93284eb34d75e2b0dc169
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Allow-UI-build-without-gstreamer-video.patch | 37 ++++++++++++++++++++++
>  package/rygel/rygel.mk                             |  2 ++
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch

Applied to master, thanks. Please submit the patch upstream if not
already done. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
