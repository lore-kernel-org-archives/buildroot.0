From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:14:55 +0100
Subject: [Buildroot] [PATCH] libgdiplus: bump to version 5.4
In-Reply-To: <1510698580-4210-1-git-send-email-sergio.prado@e-labworks.com>
References: <1510698580-4210-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171115221455.0e3fc124@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 20:29:40 -0200, Sergio Prado wrote:
> Also, enable giflib if selected by the user and remove patch already
> applied upstream.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...01-Fix-compile-error-when-cross-compiling.patch | 35 ----------------------
>  package/libgdiplus/libgdiplus.hash                 |  2 +-
>  package/libgdiplus/libgdiplus.mk                   | 11 ++++---
>  3 files changed, 8 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
