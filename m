From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:16:48 +0100
Subject: [Buildroot] [PATCH v1] libdrm: disable nouveau test for static
 build
In-Reply-To: <20191125151229.31626-1-ps.report@gmx.net>
References: <20191125151229.31626-1-ps.report@gmx.net>
Message-ID: <20191125181648.52baa9ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 16:12:29 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   [46/66] Compiling C object 'tests/nouveau/e47a46e@@threaded at exe/threaded.c.o'.
>   FAILED: tests/nouveau/e47a46e@@threaded at exe/threaded.c.o
>   ./tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory
>   #include <dlfcn.h>
> 
> [1] http://autobuild.buildroot.net/results/3042637f54d2d232904ea009455cae82e159ea2e
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...d-disable-nouveau-tests-for-static-b.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch

Applied to master, thanks. Could you submit the patch upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
