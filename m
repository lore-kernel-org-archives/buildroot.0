From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 11 Sep 2012 12:15:58 -0500
Subject: [Buildroot] disabling parallel make for a generic package
Message-ID: <CAE9DZUThTZYAbwUhhDOct5wDA3BGh48z3Yvv0cK8_ZvAoJBp_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I need to turn off parallel make for one particular generic package.
I see that this can be done for an auto-tools package by doing the
following:

LIBFOO_MAKE=$(MAKE1)

This doesn't seem to work for my generic package though.  Is there a
different way to do this for generic packages?

Btw, I'm using buildroot 2012.08.


Thanks,

Dallas
