From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:09:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 20.4.3
In-Reply-To: <CADvTj4pu05H-Q8jEnrn+pHNZpHHDwfkSy0xE8thHe-e+g5UwbQ@mail.gmail.com>
References: <20200424224752.63673-1-james.hilliard1@gmail.com>
 <20200425153040.297e371c@windsurf.home>
 <CADvTj4ptKKjxeu6YHNGC+ANffqnOzgswFjAD54H15BTsghx5MA@mail.gmail.com>
 <20200425215311.6ab6210d@windsurf.home>
 <CADvTj4pu05H-Q8jEnrn+pHNZpHHDwfkSy0xE8thHe-e+g5UwbQ@mail.gmail.com>
Message-ID: <20200425220904.3e117d7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 13:55:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> If you'd like you can merge just the version bump part without the xbr strip
> for now.

But you said we don't have what is needed for xbr. Or is that "just"
runtime dependencies that are missing?

If that really brings 10 MB of additional useless stuff, I think I'd
prefer to hold off on the version bump, and do it once there is a good
solution to avoid installing xbr.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
