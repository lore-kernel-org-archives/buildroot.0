From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 18 Jun 2012 14:53:54 +0200
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
Message-ID: <4FDF24E2.6020603@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

I was just replying to your previous mail.

Le 18/06/2012 14:46, Dmitry Golubovsky a ?crit :
> Maxime: do you use an alternative toolchain with systemd?

After a bit of testing, it seems indeed that the bug is uclibc-only, and
didn't encountered it as I do most of my testing using glibc.

Anyway, if it is only the %ms thing that is breaking systemd on uclibc,
it shouldn't be such a big problem. Quickly grepping the systemd source
code returns 17 occurences of such case, so a patch is definitely doable.

I won't have much time, do you mind doing so and sending us the patch so
that it could get included ?

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
