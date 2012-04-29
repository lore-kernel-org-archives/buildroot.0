From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Sun, 29 Apr 2012 01:48:49 -0600
Subject: [Buildroot] Pandaboard Rev. 2 & Pulseaudio...
Message-ID: <CAC2kKA9gsF3-Cknt1RKf6_gdiH66yBxr7OwY5SqRi3DCOri+yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All --

Quite a while ago I could never get pulseaudio to work beyond using
the audiotestsrc from gstreamer. EG: gst-launch audiotestsrc !
audioconvert ! pulsesink

Unfortunately,  other priorities came up and I haven't been able to
work on it since. I actually thought this would be a good thing
because now that I am able to get back into it (almost 5 months
later), I decided to rebuild my buildroot environment from scratch for
it. I figured if I were hitting a bug, it'd been fixed by now.
Unfortunately, my situation hasn't improved despite all the newer
versions. Pulseaudio still behaves the same. The audiotestsrc comes
through loud and clear, another src and I hear nothing. Alsa alone
plays everything fine.

Anyway.. I will obviously take this (back) to the pulseaudio/panda
groups, but wanted to check here to see if someone would mind sharing
their configuration/customizations that are successfully using
buildroot on panda with pulseaudio. (with or w/o gstreamer.. I can't
even get paplay to work, so I don't believe it's a gst issue) That way
I'm not wasting other peoples time if it's something stupid I've done.

Thanks in advance!
Shawn
