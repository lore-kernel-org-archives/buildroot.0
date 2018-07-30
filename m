From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 15:04:33 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
 <20180520143139.GA14607@x230> <20180520144141.GB3453@scaer>
 <20180520165009.56b44d9b@windsurf>
 <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be>
 <20180528203743.GK2965@scaer>
 <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
Message-ID: <20180730150433.704e57ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 May 2018 12:44:28 +0200, Arnout Vandecappelle wrote:

> > We're only talking about dropping the need for host-flex and host-bison
> > for the kconfig stuff. In this case, we don;t care that the user
> > generates C code one way or another: it's only a host tool...  
> 
>  I was replying to Thomas's "we should remove host-flex and host-bison
> entirely". Yes we can rely on system-installed flex and bison for kconfig, but
> we can't rely on that for target packages, e.g. target dtc.

Why so ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
