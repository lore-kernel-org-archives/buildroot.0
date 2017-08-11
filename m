From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 15:30:06 +0200
Subject: [Buildroot] [PATCH] nanopi_m1{,
 _plus}_defconfig: U-Boot needs pylibfdt
In-Reply-To: <20170810215929.13430-1-arnout@mind.be>
References: <20170810215929.13430-1-arnout@mind.be>
Message-ID: <20170811153006.053e3329@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Aug 2017 23:59:29 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> nanopi_m1 and nanopi_m1_plus are sunxi boards that need pylibfdt in
> U-Boot.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873655
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873656
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Chakra Divi <2chakrass@gmail.com>
> ---
> Apparently this was only tested on a host that had pylibfdt installed?

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
