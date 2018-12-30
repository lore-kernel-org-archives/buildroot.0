From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:46:26 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: Bump to version 2.56.3
In-Reply-To: <20181207173836.13091-1-petr.vorel@gmail.com>
References: <20181207173836.13091-1-petr.vorel@gmail.com>
Message-ID: <20181230224626.321891ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Dec 2018 18:38:36 +0100, Petr Vorel wrote:
> Drop 2 patches accepted by upstream.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...gobject-fix-compilation-with-gcc-4.7.patch | 50 ------------------
>  ...compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 -------------------
>  package/libglib2/libglib2.hash                |  4 +-
>  package/libglib2/libglib2.mk                  |  2 +-
>  4 files changed, 3 insertions(+), 105 deletions(-)
>  delete mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
>  delete mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
