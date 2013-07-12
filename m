From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Jul 2013 13:35:30 +0200
Subject: [Buildroot] should make nconfig work?
In-Reply-To: <20130711211934.88ffa3f81464ea7e0c422d40@lavabit.com> (rh's
 message of "Thu, 11 Jul 2013 21:19:34 -0700")
References: <20130711211934.88ffa3f81464ea7e0c422d40@lavabit.com>
Message-ID: <8761wgdn99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "rh" == rh  <richard_hubbe11@lavabit.com> writes:

 rh> Hello,
 rh> When I do make nconfig some of the function keys work correctly.

 rh> in 2013-05 F1-F5 do not work

 rh> in 2013-08 F1 worked during one invocation but not the next,
 rh> F2-F5 did not work

Odd, I just did a quick test here (uptodate Debian), and it works
without problems.

What distribution are you using?

 rh> Do I need to make some change to use nconfig or is it unsupported?

No change should be needed. nconfig (and the other frontends) are from
the Linux kernel, so they are supported as long as the Linux kernel
does.

-- 
Bye, Peter Korsgaard
