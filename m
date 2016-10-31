From: Patrick Doyle <wpdster@gmail.com>
Date: Mon, 31 Oct 2016 11:33:42 -0400
Subject: [Buildroot] buildroot and SELinux
Message-ID: <CAF_dkJDYo2pxYTYojvOiUcCw0p6dV46_H6C4s6GVm2-nR+wqRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if SELinux is the right answer to my question(*), but
assuming that it is... how well do buildroot and SELinux play
together?  I found an email thread from 2013 where Clayton Shotwell
and Tomas Patazzoni were discussing rolling SELinux into buildroot.
And I see configuration items related to that now.  From the age of
that post, and the configuration items in the the system now, is it
reasonable to assume that it basically works?  Or did nothing ever
come of that and am I about to open up a can of worms?

(*) and my real question is: can I use SELinux to make a binary
executable, but unreadable by anybody, including root?  An ancillary
question would be, if that executable were included as part of the
CRAMFS rootfs built into the kernel, how would I set the the
attributes for that executable at buildtime to achieve this
executable-but-not-readable state?

Please feel free to recognize my total lack of any experience in this
area and to point me at appropriate resources.

Thank you,

--wpd
