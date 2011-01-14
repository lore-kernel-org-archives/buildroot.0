From: David Fisher <dfisher769@gmail.com>
Date: Thu, 13 Jan 2011 18:34:48 -0800
Subject: [Buildroot] buildroot's support of ltp-testsuite
Message-ID: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest version of buildroot has a directory of
.../buildroot/package/ltp-testsuite, which includes Config.in,
ltp-testsuite.mk and five patch files.
The third line of Config.in is "depends on BROKEN".  As a result the
ltp-testsuite could not be compiled under buildroot.

Any plan to fix this problem, so the ltp-testsuite could be built?



Thank you in advance,


David Fisher
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110113/188e3b71/attachment.html>
