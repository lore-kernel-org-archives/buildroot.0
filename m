From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 15:41:22 +0100
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.15
In-Reply-To: <1446457093-27978-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1446457093-27978-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151102154122.479c5419@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 2 Nov 2015 09:38:13 +0000, Vicente Olivert Riera wrote:
> Unneeded patches removed. Highlights from ChangeLog:
> 
> * Fixed a build problem on systems that don't implicitly include
>   sys/types.h from other header files. Bug #711.
> 
> * Fixed the compiler stack protector test in configure for compilers
>   that support -fstack-protector but don't actually have the ssp
>   library available.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/sudo/0001-musl-fix-missing-header.patch    |   19 -
>  ...etter-configure-test-for-fstack-protector.patch |  415 --------------------
>  ...LDFLAGS-when-checking-for-stack-protector.patch |   81 ----
>  ...program-when-checking-for-stack-protector.patch |  189 ---------
>  package/sudo/sudo.hash                             |    4 +-
>  package/sudo/sudo.mk                               |    2 +-
>  6 files changed, 3 insertions(+), 707 deletions(-)
>  delete mode 100644 package/sudo/0001-musl-fix-missing-header.patch
>  delete mode 100644 package/sudo/0002-Better-configure-test-for-fstack-protector.patch
>  delete mode 100644 package/sudo/0003-Preserve-LDFLAGS-when-checking-for-stack-protector.patch
>  delete mode 100644 package/sudo/0004-Actually-link-the-test-program-when-checking-for-stack-protector.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
