From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:12:09 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libunwind: bump to version
 1.5.0
In-Reply-To: <20201110205826.910569-1-fontaine.fabrice@gmail.com>
References: <20201110205826.910569-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116231209.59d6d87f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Nov 2020 21:58:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop second and third patch (already in version)
> 
> https://savannah.nongnu.org/forum/forum.php?forum_id=9854
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...t_t-instead-of-__sigset_t-on-AArch64.patch |  46 --
>  ...0003-Fix-compilation-with-fno-common.patch | 445 ------------------
>  package/libunwind/libunwind.hash              |   2 +-
>  package/libunwind/libunwind.mk                |   2 +-
>  4 files changed, 2 insertions(+), 493 deletions(-)
>  delete mode 100644 package/libunwind/0002-Use-sigset_t-instead-of-__sigset_t-on-AArch64.patch
>  delete mode 100644 package/libunwind/0003-Fix-compilation-with-fno-common.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
