From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 20:51:42 +0100
Subject: [Buildroot] [pkg-perl infra V4 6/9] perl: remove useless patch
In-Reply-To: <CAB0FRss0MorGHCXKpq19nouNctZmUCRMQih7KnR3-Mf26GC0hw@mail.gmail.com>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-7-git-send-email-francois.perrad@gadz.org>
 <20140205170309.3a7da08e@skate>
 <CAB0FRss0MorGHCXKpq19nouNctZmUCRMQih7KnR3-Mf26GC0hw@mail.gmail.com>
Message-ID: <20140205205142.4212e305@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Wed, 5 Feb 2014 20:46:46 +0100, Fran?ois Perrad wrote:

> >>  package/perl/perl-fix-Module-Build.patch |   16 ----------------
> >>  1 file changed, 16 deletions(-)
> >>  delete mode 100644 package/perl/perl-fix-Module-Build.patch
> >
> > It would be good to indicate in the commit log why the patch was
> > useless.
> 
> The Perl infrastructure uses a host version of Module-Build
> (see previous commit "host-perl-module-build: new package").
> The target version is never used.

Ok, but the relation with the removal of this patch still isn't very
clear.

And the entire explanation should be part of the commit log :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
