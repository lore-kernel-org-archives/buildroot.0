From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 4 Oct 2013 10:39:56 -0500
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <20131004173452.4f93d1c3@skate>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>	<20131002172307.0d6f02ea@skate>
 <524C4AD4.9040902@lucaceresoli.net>	<CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>	<CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
 <20131004110704.78f5b1a6@skate>	<OFD293F65F.D1285988-ON86257BFA.00549871-86257BFA.0055339A@rockwellcollins.com>
 <20131004173452.4f93d1c3@skate>
Message-ID: <OF600DCDCA.39F5DD8D-ON86257BFA.0055DAE8-86257BFA.00560DFC@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
10/04/2013 10:34:52 AM:

> Dear Ryan Barnett,
> 
> On Fri, 4 Oct 2013 10:30:36 -0500, Ryan Barnett wrote:
> 
> > What if the license files are only available from a website?
> > 
> > For example, I'm looking to add a new package, tornado (python 
webserver)
> > to buildroot- http://www.tornadoweb.org/en/stable/ . However the 
license
> > isn't apart of the distribution itself but it points me to a website 
for
> > the license.
> > 
> > http://www.apache.org/licenses/LICENSE-2.0.html
> > 
> > Would we then put N/A for the license file? Or how do we want to 
handle 
> > this?
> > 
> > This is the second time in about a week that I've run into this well 
> > adding
> > a new package?
> > 
> > Eventually in my release process, I will have to go to that website 
and 
> > get
> > that license, be it Apache, or whatever license it may be and package 
that
> > up so supporting a URL method of getting a license would be nice.
> 
> My suggestion in this case would be to use <pkg>_LICENSE_FILES = N/A
> (or whatever magic value is chosen) and in parallel ask the upstream
> maintainer to include the license file directly into the release
> tarballs.

I'm fine with this approach, with having the magic value there it 
will help know that these are files that I manually need to go 
pull the licenses for.

I just thought I would through this situation I ran into today
out in this discussion since it is very applicable.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131004/391a2f78/attachment-0001.html>
