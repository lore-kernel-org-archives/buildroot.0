From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jun 2015 12:10:27 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: introduce SUBDIR
 variable and update patches
In-Reply-To: <1434529328-115195-1-git-send-email-kaszak@gmail.com>
References: <1434529328-115195-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150617121027.106f15d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Wed, 17 Jun 2015 10:22:08 +0200, Karoly Kasza wrote:
> The Open-vm-tools package is now distributed from GitHub and a new
> subdirectory was introduced, which breaks the Buildroot process.
> 
> This patch adds the _SUBDIR variable in the Makefile and also updates
> all distributed patches.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/bfd10c8d454a2686ebb1c4afdb49c55e39a9dd67/
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/openvmtools/0001-has_bsd_printf.patch       |  4 ++--
>  package/openvmtools/0002-no_cflags_werror.patch     | 11 ++++++-----
>  package/openvmtools/0003-dont-force-cppflags.patch  |  5 ++---
>  package/openvmtools/0004-uclibc_secure_getenv.patch |  4 ++--
>  package/openvmtools/openvmtools.mk                  |  1 +
>  5 files changed, 13 insertions(+), 12 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
