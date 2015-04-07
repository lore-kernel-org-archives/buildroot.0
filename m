From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 7 Apr 2015 23:35:25 +0200
Subject: [Buildroot] [PATCH] sh64: drop support for architecture
In-Reply-To: <20150407233000.4f7af4c9@free-electrons.com>
References: <20150407203101.GA14853@waldemar-brodkorb.de>
 <20150407233000.4f7af4c9@free-electrons.com>
Message-ID: <20150407213524.GV20492@waldemar-brodkorb.de>
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
> Maybe we should start by marking it deprecated for this release cycle?

You normally do this. But do you have _any_ user using this in
buildroot? I thought the deprecation procedure is for
features/architecturs or whatever, which might have an existing userbase.

But maybe someone knows of any device/emulator.

best regards
 Waldemar
