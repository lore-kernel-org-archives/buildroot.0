From: DATACOM - Joao <joao@datacom.ind.br>
Date: Fri, 15 Jan 2016 18:24:37 -0200
Subject: [Buildroot] [PATCH 1/1] support/download: Aternative access
 methods to CVS
In-Reply-To: <20160115145259.0fbabb8a@free-electrons.com>
References: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
 <20160115145259.0fbabb8a@free-electrons.com>
Message-ID: <1452889477.2460.104.camel@joao-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas.

Thanks for your analysis, already submitted a new version with better
examples.

Rgds,
Joao.


On Sex, 2016-01-15 at 14:52 +0100, Thomas Petazzoni wrote:
> Dear Joao Mano,
> 
> On Fri, 15 Jan 2016 10:55:10 -0200, Joao Mano wrote:
> 
> > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> > index 1c25c4e..a5726d8 100644
> > --- a/docs/manual/adding-packages-generic.txt
> > +++ b/docs/manual/adding-packages-generic.txt
> > @@ -279,7 +279,8 @@ information is (assuming the package name is +libfoo+) :
> >    ** +cvs+ for retrieving source code from a CVS repository.
> >       Used by default when +LIBFOO_SITE+ begins with +cvs://+.
> >       The downloaded source code is cached as with the +svn+ method.
> > -     Only anonymous pserver mode is supported.
> > +     Anonymous pserver mode is assumed otherwise explicitly defined
> > +     on +LIBFOO_SITE+.
> 
> I think an example would be good (for both the anonymous pserver mode,
> and the other mode).
> 
> Otherwise, it looks good.
> 
> Thomas
