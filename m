From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:15:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: fix kmsdrm build without
 EGL
In-Reply-To: <20200324222241.5808-1-fontaine.fabrice@gmail.com>
References: <20200324222241.5808-1-fontaine.fabrice@gmail.com>
Message-ID: <20200326231504.30d75478@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 23:22:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/fafd20a01591032662f9ca025fcea3478239cf3c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...o-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/sdl2/0002-src-video-kmsdrm-SDL_kmsdrmvideo.c-fix-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
