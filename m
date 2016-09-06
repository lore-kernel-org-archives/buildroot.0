From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 22:55:35 +0200
Subject: [Buildroot] [PATCH] platform: update galileo to 3.14 kernel
In-Reply-To: <1473175415-31470-1-git-send-email-padraig.connolly@intel.com>
References: <1473175415-31470-1-git-send-email-padraig.connolly@intel.com>
Message-ID: <20160906225535.1b467d4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Sep 2016 16:23:35 +0100, Padraig James Connolly wrote:
> Updating kernel for Galileo board BSP from 3.8 to 3.14
>  *Changed board defconfig to pull new 3.14 kernel
>  *New kernel config file for 3.14 kernel
>  *Changed defconfig to use new kernel config
>  *Removed old 3.8 kernel config
> 
> Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>
> ---
>  .../{linux-3.8.config => linux-3.14.config}        | 97 +++++++++++-----------
>  configs/galileo_defconfig                          | 10 +--
>  2 files changed, 54 insertions(+), 53 deletions(-)
>  rename board/intel/galileo/{linux-3.8.config => linux-3.14.config} (86%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
