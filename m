From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Apr 2017 00:20:34 +0200
Subject: [Buildroot] Pre-built toolchain updates
In-Reply-To: <20170404131513.6c48f30e@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 4 Apr 2017 13:15:13 +0200")
References: <20170404131513.6c48f30e@free-electrons.com>
Message-ID: <87bmsbu85p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > I've updated all the Buildroot pre-built toolchains. The main changes
 > are:

 >  - uClibc is now 1.0.23, which means it no longer provides RPC support.
 >    Also, we now have the fix for sys/timex.h issue, which was affecting
 >    Qemu builds.

 >  - Binutils is now at version 2.27 for all toolchains, except the
 >    br-arm-glibc-cortex-a9 toolchain, which is a bleeding edge
 >    toolchain, and therefore uses binutils 2.28 (as well as gcc 6, etc.)

 >  - The kernel headers version has changed for a few toolchains. Two
 >    toolchains were using 3.18 kernel headers, which are no longer
 >    supported. So I've changed one toolchain to use 3.10 kernel headers,
 >    and the other to use 4.1 kernel headers. All other toolchains that
 >    use the "default" kernel header version now use 4.10 instead of 4.9.

Thanks! Lets see what breaks ..

-- 
Bye, Peter Korsgaard
