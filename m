From: Tim Barr <tbarr@multitech.com>
Date: Wed, 6 Aug 2008 10:55:07 -0500
Subject: [Buildroot] Problem with SAM-BA and NAND Flash
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60D13ADFF@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems to be a problem with SAM-BA 2.7 and NAND Flash on my AT91SAM9G20
board. NAND Scrub does not seem to clear the bad block bit. In fact I
think it is actually setting the bad block bit. So now I have 5 boards
with 2048 bad NAND Flash blocks. Anyone seen something like this??


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080806/1e2a73e9/attachment.htm 
