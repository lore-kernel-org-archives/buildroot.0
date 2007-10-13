From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 13 Oct 2007 11:57:19 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <0710131046500.9729@somehost>
References: <20071012210141.1DF69A5E1B@busybox.net>
	<0710131046500.9729@somehost>
Message-ID: <1192269439.26495.4.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-10-13 klockan 10:49 +0200 skrev Cristian Ionescu-Idbohrn:
> On Fri, 12 Oct 2007, ulf at uclibc.org wrote:
> 
> > Author: ulf
> > Date: 2007-10-12 14:01:41 -0700 (Fri, 12 Oct 2007)
> > New Revision: 20237
> >
> > Log:
> > Allow library copy to fail
> 
> As it's not obvious to me, may I ask why?
> Why not making sure it doesn't fail, instead?

That is the long term approach, but I have no control over that part.

If copying fails, then libgcc.a is available,
and the end application can be linked with this instead
It is better than aborting the build.

> 
> Cheers,
> 
-- 
Best Regards
Ulf Samuelsson
