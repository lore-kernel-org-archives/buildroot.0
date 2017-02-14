From: Mylene Josserand <mylene.josserand@free-electrons.com>
Date: Tue, 14 Feb 2017 15:06:28 +0100
Subject: [Buildroot] Issue with Vivante OpenGL driver and X11
Message-ID: <16509520-1f05-41eb-8053-24716f1091d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I got an issue with OpenGL Vivante support with X11 on Nitrogen board 
(nitrogen6max).

I am on Buildroot's Master branch, last commit:
5bf12ad141f5de02c79c04a773e7709b87070229

I tried Qt5 OpenGL examples and X is segfaulting. I tested with vivante 
examples too (tutorial2) and same issue.

You can find a log here:
http://code.bulix.org/wfkcna-115447

Any idea? Did I miss something or configured something wrong?

Thank you very much for your help.

Best regards,

-- 
Myl?ne Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
