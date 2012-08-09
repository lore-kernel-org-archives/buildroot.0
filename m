From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 8 Aug 2012 22:24:07 -0400
Subject: [Buildroot] Best practices for managing the dl directory
Message-ID: <CA+-urNRgQ5ExvyLq1q4kZj-jp6KHueDC=LG9+Y3J2n7cOz0LAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was wondering how others have managed files in the dl directory. I
need to make sure that old versions are buildable. The main buildroot
upstream source code mirror has been extremely reliable. In fact, it
has never failed for me (a big thanks to everyone who maintains this),
but as you can imagine some people want every bit that goes into a
build to be locally managed. I've addressed this in the past by
setting up a local mirror that has copies of all of the files in the
dl directory. However, recently, it was desired that all of these
files be checked in under revision control. This didn't seem like a
bad suggestion in principle, but the files are large, and I'm afraid
that the git repository will soon become too large and slow to work
with regularly.

Does anyone manage their dl directories differently? I'm curious how
other people have managed this.

Thanks,
Frank
