From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 16 May 2017 21:32:26 +0200
Subject: [Buildroot] RPi B+ update
Message-ID: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
A couple of years ago (it was in 2015) I built a buildroot environment 
for RPi B+. We ended up with an sd-card image that was cloned for every 
installation.
This months we've bought some other RPi B+ but with this batch the 
system refuses to boot: it hangs with black screen and the raspberry 
icon at the top-left corner.

We're aware they have changed the RAM chips (from Samsung to Elpida) and 
likely we should update the drivers with the new ones.

Here the buildroot related question: is it possible to change something 
in the current sd-card image instead of updating and rebuilding the 
whole system?

This is because if we need to go with the second option we're going to 
deeply upgrade the application and this is not affordable right now.

Of course, feel free to ask any details you need to try to help me!

Thanks in advance!
Marco
