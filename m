From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Dec 2009 08:49:02 +0100
Subject: [Buildroot] In-tree build OK, out-of-tree build fails
In-Reply-To: <hghkou$vu0$1@ger.gmane.org> (Grant Edwards's message of "Sat, 19
	Dec 2009 04:28:14 +0000 (UTC)")
References: <hghkou$vu0$1@ger.gmane.org>
Message-ID: <87k4wj2ykx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> The "not found" file crt1.o is present in the output directory
 Grant> in staging/usr/lib/crt1.o, but it looks like the gcc command
 Grant> line used to link busybox is missing the required --sysroot
 Grant> option.

 Grant> I've repeated the build several times. Building in-tree always
 Grant> works. Building out-of-tree with an internal toolchain also
 Grant> works OK.

 Grant> It looks like the combination of an external toolchain and
 Grant> out-of-tree build is what fails.

Seems like it. I "alway" build with O=<something>, so the busybox step
has been tested a lot, but I don't use an external toolchain.

I'll try to find some time to look into it this weekend.

-- 
Bye, Peter Korsgaard
