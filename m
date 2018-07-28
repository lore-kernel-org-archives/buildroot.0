From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 23:22:20 +0200
Subject: [Buildroot] [PATCH] Makefile: help: BR2_DEFCONFIG for defconfig
 must be on command line
In-Reply-To: <20180722213445.29358-1-arnout@mind.be>
References: <20180722213445.29358-1-arnout@mind.be>
Message-ID: <20180728232220.4f75ee21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jul 2018 23:34:45 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The help text says that BR2_DEFCONFIG will be used as input, but a
> BR2_DEFCONFIG specified in the existing .config file will *not* be
> used. So say explicitly that it must be specified on the command line.
> Note that both "BR2_DEFCONFIG=... make defconfig" and
> "make defconfig BR2_DEFCONFIG=..." will work.
> 
> While we're at it, add a semicolon to separate the two statements.
> 
> Note that this overflows the help text beyond 80 characters, but that
> is already the case in many other lines.
> 
> Reported-by: "aissen" on IRC

aissen is Anisse Astier, so I've fixed that up when applying.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
