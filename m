From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 13:45:48 +0200
Subject: [Buildroot] [PATCH v8] configs: add defconfig for TS-4800
In-Reply-To: <1468867296-9995-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468867296-9995-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <20160720134548.4420af74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 14:41:36 -0400, Patrick Keroulas wrote:
> The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot
> as of v2016-07.
> 
> The package requires the custom ts4800-mbrboot routine.
> 
> A post-image script is provided to generate an image that can be
> directly written to an SD card.
> 
> More details on the board here:
>   http://wiki.embeddedarm.com/wiki/TS-4800
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> ---
> Changes v7->v8:
> 	- cleaned up defconfig and post-image script
> 	- added a readme file
> Changes v6->v7:
> 	- moved package to boot/
> Changes v5->v6:
> 	- removed custom U-boot v2016.07 which is now the default version in
> 	  BR
> Changes v4->v5:
> with Linaro toolchain
> 	- delete all the unnecessary defconfig options

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
