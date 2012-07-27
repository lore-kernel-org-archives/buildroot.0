From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 12:28:43 +0200
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <50126BB3.2070502@zacarias.com.ar>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
 <50126BB3.2070502@zacarias.com.ar>
Message-ID: <20120727122843.3b28ddf3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 07:21:39 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Yes, i agree it's pretty much some little thing.
> I did some tests in the past and it doesn't seem to be configure
> options related (didn't try everything around, just what would be
> more obvious to cause such a failure).
> Yet OpenWRT, which is BR's closest relative, still uses 5.7, maybe
> they didn't care about bumping it or hit the same issue.

I indeed just talked to Florian Fainelli on IRC (he is an OpenWRT
developer), and he remembers hearing issues about ncurses 5.9, and
those issues being the reason to stick to 5.7 for now.

But still, PTXdist and OE have it. So it should work somehow. And they
don't seem to have bizarre patches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
