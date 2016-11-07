From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:09:51 +0100
Subject: [Buildroot] [PATCH] board/boundarydevices: fix boot partition
 number in bootscript
In-Reply-To: <20161107165400.28802-1-gary.bisson@boundarydevices.com>
References: <20161107165400.28802-1-gary.bisson@boundarydevices.com>
Message-ID: <20161107220951.241f1de8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 17:54:00 +0100, Gary Bisson wrote:
> It was previously hardcoded to use the 1st partition although the
> bootpart variable was used to download kernel/dtb from any partition.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
