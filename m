From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 09:16:26 +0200
Subject: [Buildroot] About static linking
In-Reply-To: <20140424042911.GD22908@tarshish>
References: <a2d055301fd7b62deb7599263ad3ff0ee94c1870.1398283199.git.baruch@tkos.co.il>
 <20140423225243.38a542c0@skate> <20140424042911.GD22908@tarshish>
Message-ID: <20140424091626.61180eef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 24 Apr 2014 07:29:11 +0300, Baruch Siach wrote:

> > This is not at all against your patch specifically, but I'm a bit
> > worried about all the static linking related kludges we add all over
> > the place. Is this normal? Shouldn't we fix the packages themselves and
> > submit patches upstream?
> 
> Upstream submission is of course preferable. In this case upstream does not 
> appear to be very active. The current release is from 2008, while development 
> started at 2007.
> 
> Do you prefer a Makefile patch that could theoretically be upstreamed?

I must say I don't know. In fact, I was not necessarily speaking
specifically of this particular change, but more generally about all
the LIBS='-lfoo' we're adding all over the place to fix static linking
problems. This seems a bit fragile to me.

And the point of raising this question was specifically to get a
discussion started, and see the opinion of others (Gustavo, Peter,
Arnout, Yann, etc.).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
