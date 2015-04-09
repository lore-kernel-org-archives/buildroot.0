From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 9 Apr 2015 21:22:12 +0200
Subject: [Buildroot] [PATCH] sh64: drop support for architecture
In-Reply-To: <20150408225336.0b046dac@free-electrons.com>
References: <20150407203101.GA14853@waldemar-brodkorb.de>
 <20150408225336.0b046dac@free-electrons.com>
Message-ID: <20150409192212.GB27057@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Tue, 7 Apr 2015 22:31:01 +0200, Waldemar Brodkorb wrote:
> > There seems to be no hardware or emulator available for this
> > architecture. Someone from ST Microelectronics told me that
> > sh64/sh5 projects are dropped over ten years ago.
> > I found nothing about real hardware on the sites of Hitachi
> > or Renesas.
> > We should drop this.
> > Support in uClibc-ng will be dropped in 1.1.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Following my and Peter comments, we'd prefer to see this feature to be
> marked as deprecated. I've marked the patch as "Rejected" in patchwork.
> Can you cook a patch simply marking sh64 as deprecated?

Is there documentation how to do this?

best regards
 Waldemar
