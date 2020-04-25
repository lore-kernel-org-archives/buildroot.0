From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 23:10:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.4.3
In-Reply-To: <CADvTj4qZX6Qqs8aYV3+OS-aaTbFyDGMbWBXCQWUoiOt3uLSfJw@mail.gmail.com>
References: <20200424224752.63673-1-james.hilliard1@gmail.com>
 <20200425153040.297e371c@windsurf.home>
 <CADvTj4ptKKjxeu6YHNGC+ANffqnOzgswFjAD54H15BTsghx5MA@mail.gmail.com>
 <20200425215311.6ab6210d@windsurf.home>
 <CADvTj4pu05H-Q8jEnrn+pHNZpHHDwfkSy0xE8thHe-e+g5UwbQ@mail.gmail.com>
 <20200425220904.3e117d7a@windsurf.home>
 <CADvTj4qZX6Qqs8aYV3+OS-aaTbFyDGMbWBXCQWUoiOt3uLSfJw@mail.gmail.com>
Message-ID: <20200425231043.2645b3f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 15:07:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > If that really brings 10 MB of additional useless stuff, I think I'd
> > prefer to hold off on the version bump, and do it once there is a good
> > solution to avoid installing xbr.
> >  
> It doesn't make a difference since the current version also has xbr.

Ah, then your patch should have been split into two, in the first
place. One for the version bump, one for the xdr cleanup/removal.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
