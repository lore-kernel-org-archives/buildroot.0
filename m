From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 16 Aug 2011 11:07:43 -0700
Subject: [Buildroot] A question about busybox .config
Message-ID: <CALo-6+jFkNi6Z6cKPdoGBy0Ma-OzTPWjVaMJ5NLL0-0sCU_f0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can someone give me a few clues about busybox .config and buildroot, please?

I am trying to understand the flow and am a tiny bit, er, Makefile and
environment variable challenged in trying to work out how it works.

I see the "configured:" target in the top level Makefile and a
reference to busybox-config, but how do we:

1. Find our default busybox/.config. I am trying to get it into our
svn so different developers can tune busybox options and check into
our svn.
2. Get access to all the packages in buildroot's xconfig (or can we)?
If not, the reason I am searching for how the default busybox .config
gets set is so that I can run busybox-menuconfig and not get bolloxed
up on the fact that output/target doesnt exist in an svn checkout.

-- 
Charles Krinke
