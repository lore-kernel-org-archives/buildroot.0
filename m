From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 23:46:28 +0200
Subject: [Buildroot] RPi B+ update
In-Reply-To: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com> (Marco
 Trapanese's message of "Tue, 16 May 2017 21:32:26 +0200")
References: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
Message-ID: <87vap079vv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

 > Hi!
 > A couple of years ago (it was in 2015) I built a buildroot environment
 > for RPi B+. We ended up with an sd-card image that was cloned for
 > every installation.
 > This months we've bought some other RPi B+ but with this batch the
 > system refuses to boot: it hangs with black screen and the raspberry
 > icon at the top-left corner.

 > We're aware they have changed the RAM chips (from Samsung to Elpida)
 > and likely we should update the drivers with the new ones.

 > Here the buildroot related question: is it possible to change
 > something in the current sd-card image instead of updating and
 > rebuilding the whole system?

 > This is because if we need to go with the second option we're going to
 > deeply upgrade the application and this is not affordable right now.

If it doesn't boot at all (E.G. no output on the serial port), then the
problem is most likely in the rpi-firmware and/or Linux kernel, so you
could try updating those and leaving the rootfs as is.

-- 
Bye, Peter Korsgaard
