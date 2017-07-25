From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:48:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump version to 1.64.0
In-Reply-To: <20170724170900.12639-1-bernd.kuhls@t-online.de>
References: <20170724170900.12639-1-bernd.kuhls@t-online.de>
Message-ID: <20170725214835.3d374fb6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 19:09:00 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ted-register-usage-in-x86-DCAS-asm-blocks.patch |  65 -----------
>  package/boost/0005-fix-test-of-fpe-support.patch   | 119 ---------------------
>  package/boost/boost.hash                           |   4 +-
>  package/boost/boost.mk                             |   2 +-
>  4 files changed, 3 insertions(+), 187 deletions(-)
>  delete mode 100644 package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
>  delete mode 100644 package/boost/0005-fix-test-of-fpe-support.patch

Applied to master, thanks. Please monitor the autobuilders in the next
few hours/days for any Boost related failure. Boost version bumps often
cause a number of issues here and there.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
