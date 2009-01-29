From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 19:04:36 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87eiymtnsw.fsf@macbook.be.48ers.dk>
References: <20090129093412.2A2BA7741D@busybox.osuosl.org>
	<87eiymtnsw.fsf@macbook.be.48ers.dk>
Message-ID: <1233252276.4147.27.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-29 klockan 11:21 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-29 09:34:11 +0000 (Thu, 29 Jan 2009)
>  ulf> New Revision: 25115
> 
>  ulf> Log:
>  ulf> make flush, should always be visible
> 
> Did you give my proposal about letting the tgt-config.cache depend on
> .config a try?
> 


Not yet.
One issue with this is that there are things
that you can change in the .config
which will not impact the target cache.

BR
Ulf Samuelsson
