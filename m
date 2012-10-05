From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Oct 2012 20:57:11 +0200
Subject: [Buildroot] eGalax Touchscreen
In-Reply-To: <506DBC0A.4030501@mind.be> (Arnout Vandecappelle's message of
 "Thu, 04 Oct 2012 18:40:42 +0200")
References: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
 <506DBC0A.4030501@mind.be>
Message-ID: <874nm8ycfs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> What I have to do to get the touchscreen running?
 >> Any help will be welcome.

 Arnout>  This is not really a buildroot-related question,
 Arnout> linux-input at vger.kernel.org would be more appropriate.

Or eGalaxy support for their non-upstream driver.

 Arnout>  Still, some ideas:

 Arnout> - I never heard of /dev/uinput or /dev/hidraw.  Input devices
 Arnout> can usually be found in /dev/input/.  Perhaps you need udev
 Arnout> rules to create /dev/uinput or /dev/hidraw?

uinput is the interface for injecting input events into the kernel
(E.G. for userspace input drivers), and hidraw is the interface
to communicate with non-input devices (ab)using the hid protocol.

 Arnout>  For future posts, please

 Arnout> - mention the buildroot and kernel versions you use;

 Arnout> - post a defconfig instead of a a full config;

 Arnout> - post text attachments with disposition:inline so people can
 Arnout> quote them.

Indeed.

-- 
Bye, Peter Korsgaard
