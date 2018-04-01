From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 17:48:55 +0200
Subject: [Buildroot] [PATCH v2] syslinux: Use the host compiler to build
 extlinux
In-Reply-To: <20170930233520.20143-1-casantos@datacom.ind.br>
References: <20170930231309.17677-1-casantos@datacom.ind.br>
 <20170930233520.20143-1-casantos@datacom.ind.br>
Message-ID: <20180401174855.1d8696eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Sep 2017 20:35:20 -0300, Carlos Santos wrote:
> Like the utilities, it is meant to run on the host machine, hence must
> be built using the host toolchain.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> Changes v1->v2
>   - Patch for syslinux version 6.03 (the previous one was for the master
>     branch (syslinux-6.04-pre1).
> ---
> Tested with the following defconfig:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
