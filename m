From: Julien Letessier <julien.letessier@technosens.fr>
Date: Sat, 23 Jun 2007 00:05:16 +0200
Subject: [Buildroot] [PATCH] libsndfile
Message-ID: <f0528b5b0706221505t6aa35866sa135a3fa21132fd6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed a type in the binary target.
Had the library installed in the $(STAGING_DIR) for clients to link with.

-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libsndfile-install-target.patch
Type: application/octet-stream
Size: 904 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070623/35931493/attachment.obj 
