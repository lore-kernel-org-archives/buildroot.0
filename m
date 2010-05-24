From: Bob Bouterse <bob.bouterse@dm-holdings-na.com>
Date: Mon, 24 May 2010 16:23:44 -0400
Subject: [Buildroot] Help with configuring Buildroot for the Omap3530 EVM
Message-ID: <1274732624.9526.87.camel@bbouterse-debian.escient.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry everone, this is a bit of complaining from me, with a hope that
there is someone that can give me either help to configure Buildroot for
an Omap3530 EVM board, or hard measurements that I can use to show my
Management (and TI) that OE is slow and will cost us development time.

Here is my problem:
We are beginning a new project, an have decided to use the Omap3530 EVM
board to begin development on. We do not know if we will go to market
with the OMAP or some other processor at this time.
Seems like the entire Omap Open Source Community has jumped to using
OpenEmbedded with no consideration for how well it works. I find several
documents that give hearsay comments that it might be slow, but no
metrics to show what they mean. I have seen that it seems to be around
2.5 to 4 times slower that buildroot, and even worse running on a VM,
but due to my lack of experience with OE, it could be a configuration
error on my part. I am working with the Arago group on that.

Does anyone have a board configuration for the Omap3503 EVM for
buildroot? It would help a lot if I could show my management a working
build really quickly. I need the target/device files and Omap patches in
a working build. I am not being given any time to work on this because
Arago "works".
