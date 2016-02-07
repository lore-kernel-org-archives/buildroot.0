From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:23:18 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1454863395-15652-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454863395-15652-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160207222318.0c6596d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  7 Feb 2016 13:43:15 -0300, Gustavo Zacarias wrote:
> It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
> http://autobuild.buildroot.net/results/498/4984850d872448c5702eac79b831891f77ad3cf0/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bluez5_utils/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
