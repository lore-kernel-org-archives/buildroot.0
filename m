From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:01:31 +0200
Subject: [Buildroot] alleged fbset brokenness
In-Reply-To: <20070724141320.GC19688@aon.at>
References: <20070723090059.A7303A6816@busybox.net>
	<20070723105207.GD7044@aon.at>
	<1185192626.21840.6.camel@elrond.sweden.atmel.com>
	<20070723112908.GF7044@aon.at>
	<1185194237.21840.14.camel@elrond.sweden.atmel.com>
	<20070724141320.GC19688@aon.at>
Message-ID: <1185433291.31437.38.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2007-07-24 at 16:13 +0200, Bernhard Fischer wrote:
> On Mon, Jul 23, 2007 at 02:37:16PM +0200, Ulf Samuelsson wrote:
> >m?n 2007-07-23 klockan 13:29 +0200 skrev Bernhard Fischer:
> >> On Mon, Jul 23, 2007 at 02:10:26PM +0200, Ulf Samuelsson wrote:
> >> 
> >> >OK, I'll fix that, but AFAIK it is broken in busybox so It needs
> >> 
> >> hm? IIRC it builds fine for me. How is it broken?
> >> 
> >
> >I do not know the exact details, since I am applying the
> >patches from an internal buildroot for AVR32 generated
> >by someone else which claims it is broken.
> >It might be AVR32 related, or it might be that he is slightly behind
> >in versions.
> 
> Looking forward to hear some details about how fbset from busybox-(1.6.1)
> is broken for you.

It does just not work, I am not able to set the timing parameters. The
depth parameter is the only one I have gotten to work with the fbset
supplied by busybox.

This was with 1.6.0, will test with 1.6.1 when I get my buildroot
working again.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
