From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:43:41 +0100
Subject: [Buildroot] [PATCH v3] util-linux: build schedutils without
 enabling basic binaries
In-Reply-To: <1487610335-7149-1-git-send-email-casantos@datacom.ind.br>
References: <bug-9656-163-MVhQ2W5IfX@https.bugs.busybox.net/>
 <1487610335-7149-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170220214341.1155737d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 14:05:35 -0300, Carlos Santos wrote:
> Pull an upstream fix to allow building schedutils (ionice, taskset,
> chrt) when util-linux is configured with
> 
>   $ configure --disable-all-programs --enable-schedutils
> 
> Fixes:
>   https://bugs.busybox.net/show_bug.cgi?id=9656
> 
> Reported-by: Aaron Holtzman <aholtzma@gmail.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1->v2
>   Update comment explaining why we need UTIL_LINUX_AUTORECONF = YES

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
