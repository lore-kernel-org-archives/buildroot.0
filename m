From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:47:45 +0200
Subject: [Buildroot] [PATCH] package/qt5base: drop remnants patches from
 previous version
In-Reply-To: <20181005200502.16899-1-yann.morin.1998@free.fr>
References: <20181005200502.16899-1-yann.morin.1998@free.fr>
Message-ID: <20181008174745.6a2646b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Oct 2018 22:05:02 +0200, Yann E. MORIN wrote:
> When the bump to 5.11.2 was applied, master gained a new patch for 5.11.1
> in-between the bump submission and the moment it was applied. That patch
> still lingers around now.
> 
> Since that patch has been applied upstream (it is detected as a revert
> when applied to 5.11.2), we simply drop it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0003-Fix-qmake-build-with-glibc-2.28.patch     | 74 ----------------------
>  1 file changed, 74 deletions(-)
>  delete mode 100644 package/qt5/qt5base/5.11.1/0003-Fix-qmake-build-with-glibc-2.28.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
