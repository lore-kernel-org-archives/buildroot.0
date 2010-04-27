From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Tue, 27 Apr 2010 14:25:03 +0545
Subject: [Buildroot] segmentation fault with new X and matchbox
Message-ID: <o2x532dd5841004270140je3a9f019l79373bb02edcc20c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  all,
im using a daily snapshot with buildroot .my target board is at91sam9261
when i built the buildroot with new matchbox and Xserver im gettin
segmentation fault like this

record: RECORD extension enabled at configure time.
record: This extension is known to be broken, disabling extension now..
record: http://bugs.freedesktop.org/show_bug.cgi?id=20500
[dix] Could not init font path element /usr/lib/X11/fonts/misc/,
removing from list!
[dix] Could not init font path element /usr/lib/X11/fonts/TTF/,
removing from list!
[dix] Could not init font path element /usr/lib/X11/fonts/OTF,
removing from list!
[dix] Could not init font path element /usr/lib/X11/fonts/Type1/,
removing from list!
[dix] Could not init font path element /usr/lib/X11/fonts/100dpi/,
removing from list!
[dix] Could not init font path element /usr/lib/X11/fonts/75dpi/,
removing from list!

[1]+  Segmentation fault         Xfbdev -screen 640x480 -s 0 -logo -v

#matchbox-desktop
segmentation fault

the same X which i built with last week buildroot works fine and even
matchbox too.

warm regards,
Ravi Kulkarni.
