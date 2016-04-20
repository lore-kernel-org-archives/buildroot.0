From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 17:39:51 +0200
Subject: [Buildroot] [PATCH 1/4] linux: explicit latest kernel version
In-Reply-To: <1461099155-30702-2-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160420173951.229fa3ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 16:52:32 -0400, Vivien Didelot wrote:
> When setting BR2_LINUX_KERNEL_LATEST_VERSION, it is hard for the user to
> know that this version is subject to change in the future.
> 
> Explicit this in the Kconfig entry text.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after adapting to recent updates to linux/Config.in.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
