From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Feb 2014 11:53:23 +0100
Subject: [Buildroot] no linux console output for 2014.02-rc1 microblaze
	using internal buildroot toolchain
In-Reply-To: <CAPALihNZkxiyex7OkQzUQhQU4s-Lxo_N4GmOpTsK-o0qY4nh2Q@mail.gmail.com>
 (William Welch's message of "Sat, 15 Feb 2014 04:37:12 -0600")
References: <CAPALihNZkxiyex7OkQzUQhQU4s-Lxo_N4GmOpTsK-o0qY4nh2Q@mail.gmail.com>
Message-ID: <87ha80k5p8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Welch <bvwelch@gmail.com> writes:

 > Greetings,
 > I have used buildroot, successfully, on this microblaze design for the past
 > year or so.? For example, buildroot 2013.11 works fine.

 > I was glad to hear that 2014.02-rc1 has an internal toolchain for Microblaze.
 > However, my first attempt to use it failed.

 > I realize that not getting any kernel console output can be due to any number
 > of mistakes in configuring the kernel, but when I switch to an external
 > toolchain -- gcc 4.6.4 20120924 prerelease crosstool-NG 1.18.0 -- the kernel
 > works fine.?

 > I can certainly continue to use the external toolchain for my work,
 > but if there is interest in tracking down this issue, some hints as
 > to the best way to proceed would be welcome.

No output at all? That sounds bad. We're certainly interested in people
using the internal toolchain. I've added Spenser to this mail as he did
the microblaze work.

Spenser, any ideas?

-- 
Bye, Peter Korsgaard
