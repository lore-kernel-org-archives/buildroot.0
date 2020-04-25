From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:53:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.4.3
In-Reply-To: <CADvTj4ptKKjxeu6YHNGC+ANffqnOzgswFjAD54H15BTsghx5MA@mail.gmail.com>
References: <20200424224752.63673-1-james.hilliard1@gmail.com>
 <20200425153040.297e371c@windsurf.home>
 <CADvTj4ptKKjxeu6YHNGC+ANffqnOzgswFjAD54H15BTsghx5MA@mail.gmail.com>
Message-ID: <20200425215311.6ab6210d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sat, 25 Apr 2020 13:31:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Why don't we support it? Can it be made optional in a way that is
> > acceptable upstream?  
> This feature is very dependency heavy to begin with(we don't have
> buildroot packages for most) and not relevant to most autobahn use
> cases.

OK.

> I just got something merged upstream which should simplify stripping
> xbr however.

Would be good, indeed.

> > Urgh, we want a patch, not tweaks like that. I guess perhaps the patch
> > doesn't need to remove the actual source files, just remove the
> > handling in setup.py.  
> I'll respin this once upstream has a new release with the ENV variable I
> added that strips xbr during installation, not stripping xbr results in a fairly
> large target size increase, nearly 10MB from the looks of it.

Sounds good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
