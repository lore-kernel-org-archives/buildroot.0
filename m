From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Dec 2012 12:27:30 +0100
Subject: [Buildroot] e17 and related packages
Message-ID: <20121224122730.527a71ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just to prevent duplicate work, I wanted to let people know I've
started creating a package for the recently released Enlightenment 17,
and done the related version bumps on EFL libraries.

The current status of the work is visible at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=e17

For now, the enlightenment package builds, but I didn't manage to start
it under X.org. It just seems to hang while talking with the X server,
for some reason (strace says it's waiting on a poll() call on the Unix
socket that it uses to talk with the X server).

Help is of course welcome to improve things.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
