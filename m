From: Julien Letessier <julien.letessier@technosens.fr>
Date: Sun, 24 Jun 2007 18:57:32 +0200
Subject: [Buildroot] [PATCH] expat package : correct install
Message-ID: <f0528b5b0706240957r41f3afadt7304199d005a33fd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install expat cleanly under $(STAGING_DIR)/usr/ and $(TARGET_DIR)/usr/
instead of $(STAGING_DIR)/ and $(TARGET_DIR)/

-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-expat.patch
Type: application/octet-stream
Size: 2645 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070624/6dfd5250/attachment.obj 
