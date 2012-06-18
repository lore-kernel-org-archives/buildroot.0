From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 21:43:25 +0200
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <CADiAo4LGUmUUjsq7VtWLEiX5KXPrcEasGJqvHSHgE+xxbqnGMA@mail.gmail.com>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
 <4FDF24E2.6020603@free-electrons.com>
 <20120618152138.056695e303d6688dd90bba87@kinali.ch>
 <CADiAo4K46d1ztgeg-6k-mZaj7oohsT5MdPZLEfiQC++r6yC2dw@mail.gmail.com>
 <CADiAo4LGUmUUjsq7VtWLEiX5KXPrcEasGJqvHSHgE+xxbqnGMA@mail.gmail.com>
Message-ID: <20120618214325.235a6247@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 18 Jun 2012 14:59:36 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> Why was version 44 selected for Buildroot rather than any later
> version - just to avoid conflict with already included udev?

I guess just because Maxime started the work of packaging systemd into
Buildroot a while ago, and at the time, version 44 was the latest one.
It would of course be good to bump to the newest version.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
