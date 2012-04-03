From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Apr 2012 23:02:47 +0200
Subject: [Buildroot] FYI: Udev and systemd to merge
In-Reply-To: <CAGm1_kucCZT97wq1JJfA4+NfGNrzvDm0V=sfLRvsW+vLF2_n+A@mail.gmail.com>
References: <CAGm1_kucCZT97wq1JJfA4+NfGNrzvDm0V=sfLRvsW+vLF2_n+A@mail.gmail.com>
Message-ID: <20120403230247.576f307f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 3 Apr 2012 22:53:27 +0200,
Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

> http://lwn.net/Articles/490413/rss

Yes, seen this. It isn't going to simplify our work. Both udev and
systemd are fairly complicated packages, so hearing that there are
going to be bundled together in the same source package is not a great
news.

Apparently, it will still be possible to build only udev, and keep a
non-systemd init. But still, it means a single source package that
actually contains two different binary packages. Not easy to handle
nicely in Buildroot.

I guess next year similar "joke" is to merge D-Bus in systemd.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
