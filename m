From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 22:38:35 +0200
Subject: [Buildroot] [PATCH] qemu: security bump to version 2.8.1.1
In-Reply-To: <20171004071357.15093-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Oct 2017 09:13:57 +0200")
References: <20171004071357.15093-1-peter@korsgaard.com>
Message-ID: <87wp49gwj8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues and adds a number of other bigfixes:
 > 2.8.1: Changelog:
 > https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg06332.html

 > CVE-2017-2615 - display: cirrus: oob access while doing bitblt copy backward
 > mode

 > CVE-2017-2620 - display: cirrus: out-of-bounds access issue while in
 > cirrus_bitblt_cputovideo

 > CVE-2017-2630 - nbd: oob stack write in client routine drop_sync

 > 2.8.1.1 Changelog:
 > https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg03460.html

 > CVE-2017-7471 - 9p: virtfs allows guest to change filesystem attributes on
 > host

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
