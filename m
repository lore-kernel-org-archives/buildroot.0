From: Patrick Doyle <wpdster@gmail.com>
Date: Sat, 30 Dec 2017 08:16:27 -0500
Subject: [Buildroot] How to apply RT kernel patches?
Message-ID: <CAF_dkJBtZ=gS8-GQme7eCYyZPRcHPFdYWTsOv=8kQvFdHbfJEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How do folks tend to apply the RT kernel patches using buildroot?

There are patch sets available at
https://cdn.kernel.org/pub/linux/kernel/projects/rt/4.9/.  I could
download one of those, unpack it into my buildroot tree, and configure
that directory as a patch directory for the kernel.  But that is
problematic from a version control standpoint.  I would end up with
the whole set of (300+) patches in my source tree that will lead to
repository bloat.

I would rather convince the buildroot machinery to download and apply
the patches automatically as part of the build process.

Do others do this?

Do others do something else?

I think I'll just toss this question out there and see what I can learn.

Thank you.

--wpd
