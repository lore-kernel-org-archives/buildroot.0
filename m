From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 13:29:08 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbset
In-Reply-To: <1185192626.21840.6.camel@elrond.sweden.atmel.com>
References: <20070723090059.A7303A6816@busybox.net>
	<20070723105207.GD7044@aon.at>
	<1185192626.21840.6.camel@elrond.sweden.atmel.com>
Message-ID: <20070723112908.GF7044@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 02:10:26PM +0200, Ulf Samuelsson wrote:

>OK, I'll fix that, but AFAIK it is broken in busybox so It needs

hm? IIRC it builds fine for me. How is it broken?

>to be visible even if it is a busybox package 
>until someone fixes busybox.
>
>I will remove the complete conditional until then.

fair enough. Please comment this out then (if it's really broken in
1.6.1).
