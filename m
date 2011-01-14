From: David Fisher <dfisher769@gmail.com>
Date: Thu, 13 Jan 2011 19:26:20 -0800
Subject: [Buildroot] buildroot's support of ltp-testsuite
Message-ID: <AANLkTi=9oRboKu2aRT-p6omj84UjDUFbtNFrvMA=Rx9R@mail.gmail.com>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110113/b529db73/attachment.html>
