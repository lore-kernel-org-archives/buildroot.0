From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 9 May 2018 23:07:38 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
In-Reply-To: <20180509092254.24a64713@windsurf.home>
References: <20180505160530.GA1774@waldemar-brodkorb.de>
 <20180508153420.0c334f27@windsurf.home>
 <20180508173631.GP31635@waldemar-brodkorb.de>
 <20180509092254.24a64713@windsurf.home>
Message-ID: <20180509210738.GC31316@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 8 May 2018 19:36:31 +0200, Waldemar Brodkorb wrote:
> 
> > > Thanks Waldemar for fixing this issue. Some questions below, though.
> > > 
> > > On Sat, 5 May 2018 18:05:31 +0200, Waldemar Brodkorb wrote:  
> > > > This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.
> > > > 
> > > > Latest uClibc-ng release supports the missing functions even for  
> > > 
> > > What is "Latest" ? 1.0.30 ?  
> > 
> > Yes, 1.0.30. Or do you know of any newer release? ;)
> 
> No, but the problem with saying "Latest uClibc-ng release" in a commit
> log is that it's not going to be very informative 6 months or 2 years
> from now, when someone reads the commit log :-)
> 
> Saying "Since uClibc-ng 1.0.30, the missing functions are supported"
> makes it very clear, and will remain useful in the future.

You are totally right. Can you fix it up when commiting?

Thanks
 Waldemar
