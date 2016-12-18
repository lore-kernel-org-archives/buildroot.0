From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Sun, 18 Dec 2016 22:43:15 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161218213526.16032-1-theo.debrouwere@skynet.be>
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
 <20161218213526.16032-1-theo.debrouwere@skynet.be>
Message-ID: <20161218214315.xgonlacgkz4eh3hc@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops. I forgot to add some new comments.

PK proposed that I would split the config into 2.

* One pure beagleboard x15 config, using mainline linux/uboot.

* A seperate AM5728evm config, using TI's linux/uboot.



This patch contains the first config.


Theo

On Sun, Dec 18, 2016 at 10:35:26PM +0100, Theo Debrouwere wrote:
> From: Theo Debrouwere <Theo.Debrouwere@gmail.com>
> 
> This configuration provides a basic setup for using Buildroot
> to create a sd-card image a BeagleBoard X15 board.
