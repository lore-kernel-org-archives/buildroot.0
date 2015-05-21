From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 19:05:09 +0200
Subject: [Buildroot] [PATCH 11/13] board/boundarydevices: update
 6x_bootscript
In-Reply-To: <1432116744-25760-12-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432116744-25760-12-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150521190509.044f7661@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Wed, 20 May 2015 12:12:22 +0200, Gary Bisson wrote:
> This script is executed by u-boot in order to detect the hardware
> configuration (board, displays etc...) and configure the bootargs and
> device tree accordingly.
> 
> This update is necessary due to the kernel bump to version 3.10.53.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I know this file is not introduced by your patch, but why do we have
this binary file in Buildroot? Isn't there a source form of this file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
