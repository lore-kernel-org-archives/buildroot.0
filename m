From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:57:45 +0100
Subject: [Buildroot] [PATCH] glibc: remove version 2.21
In-Reply-To: <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
References: <1456142845-5372-1-git-send-email-gustavo@zacarias.com.ar>
 <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160229225745.36f4eba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Feb 2016 09:07:25 -0300, Gustavo Zacarias wrote:
> Mask out glibc for sparc as well since it's no longer available.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/2.21/0001-fix-CVE-2015-7547.patch | 236 ------------------------
>  package/glibc/2.21/0002-fix-CVE-2015-1781.patch |  32 ----
>  package/glibc/2.21/0003-fix-CVE-2014-8121.patch | 176 ------------------
>  package/glibc/Config.in                         |   4 -
>  package/glibc/glibc.hash                        |   1 -
>  toolchain/toolchain-buildroot/Config.in         |   5 +-
>  6 files changed, 2 insertions(+), 452 deletions(-)
>  delete mode 100644 package/glibc/2.21/0001-fix-CVE-2015-7547.patch
>  delete mode 100644 package/glibc/2.21/0002-fix-CVE-2015-1781.patch
>  delete mode 100644 package/glibc/2.21/0003-fix-CVE-2014-8121.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
