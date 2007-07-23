From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 14:37:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbset
In-Reply-To: <20070723112908.GF7044@aon.at>
References: <20070723090059.A7303A6816@busybox.net>
	<20070723105207.GD7044@aon.at>
	<1185192626.21840.6.camel@elrond.sweden.atmel.com>
	<20070723112908.GF7044@aon.at>
Message-ID: <1185194237.21840.14.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-23 klockan 13:29 +0200 skrev Bernhard Fischer:
> On Mon, Jul 23, 2007 at 02:10:26PM +0200, Ulf Samuelsson wrote:
> 
> >OK, I'll fix that, but AFAIK it is broken in busybox so It needs
> 
> hm? IIRC it builds fine for me. How is it broken?
> 

I do not know the exact details, since I am applying the
patches from an internal buildroot for AVR32 generated
by someone else which claims it is broken.
It might be AVR32 related, or it might be that he is slightly behind
in versions.

I decided to put a comment in front of the packages,
letting users know that this might be broken

He also generated the *_VER etc.
Will fix that and your other comments.

> >to be visible even if it is a busybox package 
> >until someone fixes busybox.
> >
> >I will remove the complete conditional until then.
> 
> fair enough. Please comment this out then (if it's really broken in
> 1.6.1).

B.R:
Ulf Samuelsson
