From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Sep 2012 20:03:31 +0200
Subject: [Buildroot] fs skeleton quick rebuild
In-Reply-To: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
References: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
Message-ID: <20120904200331.1222b43d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Sep 2012 12:59:42 -0500,
Dallas Clement <dallas.a.clement@gmail.com> a ?crit :

> I'm working on a custom skeleton for my rootfs and wanting to make
> changes and test without having to rebuild everything.  Is there an
> easy way to do this?

Easiest way is to *not* use the custom skeleton mechanism, but instead
use the post-build script mechanism. See
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf for more
details.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
