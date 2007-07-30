From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 30 Jul 2007 21:13:03 +0200 (CEST)
Subject: [Buildroot] [patch] $(STAGING_DIR)/include ->
	$(STAGING_DIR)/usr/include
Message-ID: <0707302108520.17391@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whitespace-cleanup too.
--includedir=/include -> --includedir=/usr/include and similar with
$(STAGING_DIR) mixed in there.


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br.mk.patch
Type: text/x-diff
Size: 31275 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070730/7b3246ff/attachment-0001.bin 
