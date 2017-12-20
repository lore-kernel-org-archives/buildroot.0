From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:22:48 +0100
Subject: [Buildroot] [PATCH] qemu: security bump to version 2.10.2
In-Reply-To: <20171220112601.19056-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 20 Dec 2017 12:26:01 +0100")
References: <20171220112601.19056-1-peter@korsgaard.com>
Message-ID: <87zi6dcfon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-13672: QEMU (aka Quick Emulator), when built with the VGA display
 > emulator support, allows local guest OS privileged users to cause a denial
 > of service (out-of-bounds read and QEMU process crash) via vectors involving
 > display update.

 > CVE-2017-15118: Stack buffer overflow in NBD server triggered via long
 > export name

 > CVE-2017-15119: DoS via large option request

 > CVE-2017-15268: Qemu through 2.10.0 allows remote attackers to cause a
 > memory leak by triggering slow data-channel read operations, related to
 > io/channel-websock.c.

 > For more details, see the release announcement:
 > https://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg03618.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
