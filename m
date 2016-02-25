From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:14:02 +0100
Subject: [Buildroot] [PATCH] tvheadend: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1456143929-21552-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456143929-21552-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160225221402.57d19860@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Feb 2016 09:25:29 -0300, Gustavo Zacarias wrote:
> It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
> http://autobuild.buildroot.net/results/610/610ef13ee1d62597f51b061cd1216e7a4e96abff/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/tvheadend/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
