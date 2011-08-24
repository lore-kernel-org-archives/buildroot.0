From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 24 Aug 2011 10:13:24 -0700
Subject: [Buildroot] Howto add "single" to busybox command line.
Message-ID: <CALo-6+ise3H=_VaHC=xfZ886A8a=Ebox94gwhFS6gK-k=njEjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have another "howto" question, if I may. I need to be able to boot a
MPC8321 embedded system into single user mode for maintenance
occaisionally.

I know that if I add "single" to the kernel command line in u-boot, I
get a root prompt with no login, so it appears that busybox is
processing a single-user mode request.

But, ... I dont know how to change the kernel command line on the fly
from a button press during boot from u-boot. The requirement is that
pressing Ctrl-C causes single-user mode.

So, .... is it possible to change the kernel command line in u-boot
from a button press? All my research indicates button presses in
u-boot just stop the bootcmd processing, but I am hoping I am missing
a detail here.

An answer of the form "RTFM" is just fine, but it would be useful if
accompanied by a URL.

-- 
Charles Krinke
