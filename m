From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Aug 2009 07:44:53 +0200
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
	(Bill Bogstad's message of "Fri\, 28 Aug 2009 12\:20\:26 -0400")
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
Message-ID: <877hwlsvmy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bill" == Bill Bogstad <bogstad@pobox.com> writes:

Hi,

 Bill> P.S. Interestingly, I just did essentially the same thing with
 Bill> buildroot-2009.08-rc3 and it builds.  I now have four different
 Bill> config files 05/08 * kexec/nokexec and the only one that fails is
 Bill> 05 with kexec.  Oh, I've also tried to build 05 with kexec twice
 Bill> (starting from unarchiving buildroot tar file) and I get the same
 Bill> error each time so I don't think it's some hardware problem on my
 Bill> build host.

That's strange as the kexec package hasn't been changed since
February. I cannot think of other changes offhand that could have fixed
it..

2009.08 is to be released any moment now though, so maybe you could just
move to that?

-- 
Bye, Peter Korsgaard
