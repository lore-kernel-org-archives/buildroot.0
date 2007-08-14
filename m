From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 14 Aug 2007 16:35:48 -0400
Subject: [Buildroot] [patch] mdnsresponder doesn't do parallel makes
Message-ID: <46C21224.9020505@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apparently mdnsresponder will fail to build with parallel makes.
This patch just adds a -j1 to the $(MAKE) to force it to not
build in parallel.

-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: mdnsresponder-parallelmake.diff
Url: http://busybox.net/lists/buildroot/attachments/20070814/61fae0cd/attachment.diff 
