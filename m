From: g4 at novadsp.com <g4@novadsp.com>
Date: Wed, 27 May 2015 14:32:38 +0100
Subject: [Buildroot] B3 questions with 4.0.4
Message-ID: <049c01d09881$9a3b3900$ceb1ab00$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR .config is set up to use a custom kernel (4.0.4) and source from a
custom location. This all works fine for 3.XX varieties but hits the buffers
for 4.XX

 

Not quite sure I'm understanding the purpose of the
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM? If I am using 4.0.4, then will
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM=3.18.x work? Why are there 2 settings
that are apparently related but disconnected. And how come no manually
specified version for this.

 

TVMIA.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150527/953a6187/attachment.html>
