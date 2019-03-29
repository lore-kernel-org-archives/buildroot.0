From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:06:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst1-libav: fix build on
 mips64el
In-Reply-To: <20190329153039.21860-1-fontaine.fabrice@gmail.com>
References: <20190329153039.21860-1-fontaine.fabrice@gmail.com>
Message-ID: <20190329170645.716abac9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 16:30:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Apply the same behavior for CPU in gst1-libav than in ffmpeg:
>  - use generic cpu for all mips architectures
>  - use GCC_TARGET_{ARCH,CPU} instead of BR2_TARGET_{ARCH,CPU}
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/776028a43bd180b4895efc74321e3aee56cbcb47
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-libav/gst1-libav.mk | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
