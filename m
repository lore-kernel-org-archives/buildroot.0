From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:31:45 +0200
Subject: [Buildroot] [PATCH] glibc: remove version 2.21 stray patches
In-Reply-To: <1460680268-24000-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460680268-24000-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160415093145.1434eb24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Apr 2016 21:31:08 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/2.21/0001-fix-CVE-2015-7547.patch | 236 ------------------------
>  package/glibc/2.21/0002-fix-CVE-2015-1781.patch |  32 ----
>  package/glibc/2.21/0003-fix-CVE-2014-8121.patch | 176 ------------------
>  3 files changed, 444 deletions(-)
>  delete mode 100644 package/glibc/2.21/0001-fix-CVE-2015-7547.patch
>  delete mode 100644 package/glibc/2.21/0002-fix-CVE-2015-1781.patch
>  delete mode 100644 package/glibc/2.21/0003-fix-CVE-2014-8121.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
