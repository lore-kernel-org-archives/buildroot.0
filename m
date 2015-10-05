From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2015 16:34:22 +0100
Subject: [Buildroot] [PATCH 1/2] pkgconf: bump to version 0.9.12
In-Reply-To: <1444052970-26682-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444052970-26682-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151005163422.2cd54057@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  5 Oct 2015 10:49:29 -0300, Gustavo Zacarias wrote:
> Drop patches, they aren't required any more.
> It fixes a bug where inline comments cause issues, like:
> 
> Libs: -lblah # -lbleh
> 
> ...it would make pkgconf search for the '#' package
> 
> This is required for the nettle 3.1.1 upgrade since howgeed.pc adjusts
> Libs according to static/dynamic builds using the comment feature.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pkgconf/0001-fix-variable.patch       | 29 -------------------
>  package/pkgconf/0002-fix-double-sysroot.patch | 40 ---------------------------
>  package/pkgconf/pkgconf.hash                  |  4 +--
>  package/pkgconf/pkgconf.mk                    |  4 +--
>  4 files changed, 4 insertions(+), 73 deletions(-)
>  delete mode 100644 package/pkgconf/0001-fix-variable.patch
>  delete mode 100644 package/pkgconf/0002-fix-double-sysroot.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
