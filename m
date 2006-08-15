From: Rob Landley <rob@landley.net>
Date: Tue, 15 Aug 2006 17:31:32 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/hotplug
In-Reply-To: <004f01c6bfe8$28afde10$e04565d5@atmel.com>
References: <20060810200831.C0916485D2@busybox.net>
	<20060814164542.GA16733@codepoet.org>
	<004f01c6bfe8$28afde10$e04565d5@atmel.com>
Message-ID: <200608151731.32449.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 14 August 2006 5:22 pm, Ulf Samuelsson wrote:
> 
> ----- Original Message ----- 
> From: "Erik Andersen" <andersen@codepoet.org>
> To: "Ulf Samuelsson" <ulfs@dof.se>
> Cc: <buildroot@uclibc.org>
> Sent: Monday, August 14, 2006 6:45 PM
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/hotplug
> 
> 
> > On Fri Aug 11, 2006 at 07:01:31AM +0200, Ulf Samuelsson wrote:
> >> This patch does not work, since the "diethotplug-0.5.tar" file is missing
> > 
> > It worked fine for me...
> > 
> > -Erik
> 
> 
> Yes because you may have the file already, but the patch sent on the 
distribution list did only contain a comment
> that it was a binary file, but not the file itself.

I got the file out of the web thingy.

http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/hotplug/diethotplug-0.5.tar?rev=15796&view=markup

I'm trying to resolve the license issues to get it into BusyBox proper.  (It's 
gplv2 only, and busybox is gplv2 or later...)

Rob
-- 
Never bet against the cheap plastic solution.
