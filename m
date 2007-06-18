From: Iouri Kharon <bc-info@styx.cabel.net>
Date: Mon, 18 Jun 2007 11:16:44 +0400
Subject: [Buildroot] Ping bug
Message-ID: <1943652279.20070618111644@styx.cabel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Erik,

Applet 'ping' set source addres (option -I) incorrect (as destination :).
Also this patch make additional check for source interface.

-- 
Best regards,
 Iouri                          mailto:bc-info at styx.cabel.net
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-1.6.0-ping.patch
Type: application/octet-stream
Size: 1123 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070618/c492f7d8/attachment.obj 
