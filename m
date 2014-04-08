From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 14:19:39 +0200
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
In-Reply-To: <5343E30C.1090703@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 08 Apr 2014 08:52:44 -0300")
References: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
 <20140407152919.2d1147fb@skate> <5342A9EB.1030801@zacarias.com.ar>
 <20140407154148.2b35dd34@skate> <5343E30C.1090703@zacarias.com.ar>
Message-ID: <87fvloau90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Fine with me. My impression so far was that for critical components
 >> such as gcc/binutils/gdb/libc, we were keeping older versions a little
 >> bit longer to give it some time to test the newer version before
 >> forcing everyone to upgrade. Surely we need to continue to do this with
 >> gcc, where most of the 4.x.0 versions are typically broken on at least
 >> one architecture.

 > D'oh, eglibc 2.19 is broken for PowerPC SPE ABI.
 > So it seems we'll do two versions after all.
 > I'll send a revised patch shortly.

Ok, thanks. It anyway seems like the safest option (and matches our
other toolchain-related packages)

-- 
Bye, Peter Korsgaard
