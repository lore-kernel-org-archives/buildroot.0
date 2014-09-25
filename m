From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 09:30:03 +0200
Subject: [Buildroot] [PATCH] util-linux: disable all programs for host
	build
In-Reply-To: <1411592931-8237-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Wed, 24 Sep 2014 23:08:51 +0200")
References: <1411592931-8237-1-git-send-email-ps.report@gmx.net>
Message-ID: <87r3z017k4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Disable all programs for host build using '--disable-all-programs'
 > as suggested by Thomas Petazzoni ([1]).

 > Build libs before patch:
 > build/host-util-linux-2.25.1/.libs/libsmartcols.so
 > build/host-util-linux-2.25.1/.libs/libuuid.so
 > build/host-util-linux-2.25.1/.libs/libfdisk.a
 > build/host-util-linux-2.25.1/.libs/libcommon.a

 > Build libs after patch:
 > build/host-util-linux-2.25.1/.libs/libuuid.so
 > build/host-util-linux-2.25.1/.libs/libcommon.a

 > [1] http://lists.busybox.net/pipermail/buildroot/2014-September/106933.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
