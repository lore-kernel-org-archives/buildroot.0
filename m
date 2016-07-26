From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:36:10 +0200
Subject: [Buildroot] [PATCH] ipmiutil: bump to version 2.9.9
In-Reply-To: <9edef8b029945e5a6f29ba4e1efb05ac5dcd1f19.1469528413.git.baruch@tkos.co.il>
References: <9edef8b029945e5a6f29ba4e1efb05ac5dcd1f19.1469528413.git.baruch@tkos.co.il>
Message-ID: <20160726213610.19061c36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 13:20:13 +0300, Baruch Siach wrote:
> Drop upstream patches, and update AUTORECONF comment accordingly.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0002-lib-Makefile.am-fix-lanplus-disable.patch | 38 ------------------
>  ...003-configure.ac-fix-stack-protector-test.patch | 45 ----------------------
>  package/ipmiutil/ipmiutil.hash                     |  4 +-
>  package/ipmiutil/ipmiutil.mk                       |  4 +-
>  4 files changed, 5 insertions(+), 86 deletions(-)
>  delete mode 100644 package/ipmiutil/0002-lib-Makefile.am-fix-lanplus-disable.patch
>  delete mode 100644 package/ipmiutil/0003-configure.ac-fix-stack-protector-test.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
