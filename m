From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 May 2012 15:03:41 +0200
Subject: [Buildroot] gcc 4.2.4 toolchain
In-Reply-To: <CACDP-tcryHMzAjQ2iw+pRcGavZamDSHStABz5NFxfVrK3-iYzw@mail.gmail.com>
 (Andrew Chambers's message of "Wed, 23 May 2012 10:50:11 +1200")
References: <CACDP-tcryHMzAjQ2iw+pRcGavZamDSHStABz5NFxfVrK3-iYzw@mail.gmail.com>
Message-ID: <871umbqcb6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Chambers <andrewchamberss@gmail.com> writes:

 Andrew> Hello,

 Andrew> Recently ive tried to build a custom mips linux kernel version
 Andrew> 2.6.28 under the buildroot-2012.02. However all gcc versions
 Andrew> listed do not support some deprecated gcc inline assembly
 Andrew> syntax being used extensively.

 Andrew> Is it possible to use gcc 4.2.4 with buildroot-2012.02 . I
 Andrew> manually added it to the buildroot menu but when attempting a
 Andrew> mips build the toolchain i recieve the following errors while
 Andrew> building the cross compiler ...?

4.2 support got removed back in Dec 2011, so perhaps give
buildroot-2011.11 a try?

-- 
Bye, Peter Korsgaard
