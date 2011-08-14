From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Aug 2011 08:59:17 +0200
Subject: [Buildroot] about TARGET_CROSS
In-Reply-To: <CAAa76NR2f4jkSem4vx1_-K5OjK-v567kU98zDP8skN+=eX-zGA@mail.gmail.com>
 (raymond zhao's message of "Fri, 12 Aug 2011 10:51:03 -0400")
References: <CAAa76NR2f4jkSem4vx1_-K5OjK-v567kU98zDP8skN+=eX-zGA@mail.gmail.com>
Message-ID: <87liuwh41m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "raymond" == raymond zhao <raymond.zhao.ml@gmail.com> writes:

 raymond> Hi,
 raymond> There is a variable named TARGET_CROSS in the Makefile.in under
 raymond> buildroot/package directory. It is used for lots of package build
 raymond> command. The problem is that it end with "-". Some packages add that
 raymond> "-" itself in their own building system. These kind of packages will
 raymond> complain that it can not find the compiler, for instance,
 raymond> powerpc-unknown-linux-gnu--gcc. Please note that there are two "-"
 raymond> before gcc. Use makefile string functions to strip out the last "-" is
 raymond> not easy. So I suggest we add another variable named
 raymond> TARGET_CROSS_STRIP, which is another version of TARGET_CROSS without
 raymond> the last "-".
 raymond> Here is the modification. I did not use patch format since it is very
 raymond> simple modification.

I have no problem with that, but what packages are we talking about?

Please submit this change together with the package(s) which needs it.

-- 
Bye, Peter Korsgaard
