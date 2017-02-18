From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 10:39:19 +0100
Subject: [Buildroot] [PATCH] samba4: requires NPTL
In-Reply-To: <20170217202403.GA13945@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 17 Feb 2017 21:24:03 +0100")
References: <20170217202403.GA13945@waldemar-brodkorb.de>
Message-ID: <87efyvu9bs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > With OpenRISC there is a uClibc-ng based toolchain for an
 > architecture with MMU support, but with only Linuxthreads
 > and no NPTL. Samba4 uses pthread_mutexattr_setrobust which
 > is not implemented in uClibc-ng Linuxthreads.

 > Fixes:
 >   http://autobuild.buildroot.net/results/ec8f078046c92ae23dc973c88ac0fef136ad1535

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
