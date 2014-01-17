From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 17 Jan 2014 12:31:55 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
Message-ID: <20140117113153.GB10730@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Fri, Jan 17, 2014 at 11:39:10AM +0100, Freedreamer wrote:

>    In my br rootfs I 've been using a lot of scripts based on python and a
>    lot of them are based on Gobject. Unfourtanetely when I try to start one I
>    always got a problem 'cause python misses the support for the Gobject.

Which versions of Python and GObject bindings are you using? Two combos are
possible:

1) Python 2.7 + Python-GObject < 2.28 (classic Python C bindings).
2) Python 3.x + Python-GObject > 3.x (bindings based on GObject introspection).

It looks like there are no packages (yet) for either one.
Packaging python-gobject 2.28 (also known as PyGtk) should be doable, but the
other combo requires to package gobject-introspection.

Best regards,
ELB
