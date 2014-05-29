From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 09:23:59 +0200
Subject: [Buildroot] python 2 or 3
In-Reply-To: <20140528194852.fe13e0e104246a21d4742916@lavabit.com> (rh's
 message of "Wed, 28 May 2014 19:48:52 -0700")
References: <20140528194852.fe13e0e104246a21d4742916@lavabit.com>
Message-ID: <87r43d9hf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "rh" == rh  <richard_hubbe11@lavabit.com> writes:

 > python won't build, I am trying to build with -static.
 > Should I abandon any hope of making this work?
 > I am building for ARM.

 > Fails on "Multiple definitions of setreuid" and friends.

It sounds like this issue:

http://autobuild.buildroot.net/results/fd2/fd295b2f324dc2649d95796cc37262aacad3fb4f/build-end.log

I haven't investigated it yet. Do you really want to build a statically
linked python?

-- 
Bye, Peter Korsgaard
