From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 21:41:06 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
In-Reply-To: <873afl9c8r.fsf@macbook.be.48ers.dk>
References: <20090114234926.0B74B7697C@busybox.osuosl.org>
	<873afl9c8r.fsf@macbook.be.48ers.dk>
Message-ID: <1232052066.4757.34.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 09:58 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-14 23:49:24 +0000 (Wed, 14 Jan 2009)
>  ulf> New Revision: 24847
> 
>  ulf> Log:
>  ulf> libeXosip2 is dependent on libosip2
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/libeXosip2/libeXosip2.mk
> 
> You forgot a select in Config.in

OK, I added it to my tree and will commit once
I have run through the buildall.sh script again.
BR
Ulf Samuelsson


> 
> Please fix.
> 
