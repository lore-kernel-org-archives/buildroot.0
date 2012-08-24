From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:34:20 +0200
Subject: [Buildroot] [PATCH] freetype, libfuse, libpng, x11vnc,
 zlib: get rid of BR2_SOURCEFORGE_MIRROR
In-Reply-To: <1345673515-1719-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1345673515-1719-1-git-send-email-stefan.froberg@petroprogram.com>
 <1345673515-1719-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20120824233420.296862c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 23 Aug 2012 01:11:55 +0300,
Stefan Froberg <stefan.froberg@petroprogram.com> a ?crit :

> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
> ---
>  package/freetype/freetype.mk |    2 +-
>  package/libfuse/libfuse.mk   |    2 +-
>  package/libpng/libpng.mk     |    2 +-
>  package/x11vnc/x11vnc.mk     |    2 +-
>  package/zlib/zlib.mk         |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

I have done one small change: use $() everywhere instead of the ${}
that you introduced. We use $() everywhere in Buildroot to reference
make variables.

Could you look at the other packages that reference the
BR2_SOURCEFORGE_MIRROR variable?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
