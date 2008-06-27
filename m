From: Fathi Boudra <fboudra@gmail.com>
Date: Fri, 27 Jun 2008 19:33:05 +0200
Subject: [Buildroot] [PATCH] add gdb-6.8 support
In-Reply-To: <87wskbgou1.fsf@macbook.be.48ers.dk>
References: <6a2e33620806270011n5dfb63a7o279e26c5826b12e@mail.gmail.com>
	<87wskbgou1.fsf@macbook.be.48ers.dk>
Message-ID: <200806271933.05849.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This seems unrelated to 6.8 support - Please do this as a seperate patch.

right.

* Add gdb-6.8 support patches:
  - add_gdb-6.8_support.diff
  - 600-fix-compile-flag-mismatch.patch

* Disable configure caching in gdb package:
  - disable_gdb_configure_caching.diff

cheers,

Fathi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 600-fix-compile-flag-mismatch.patch
Type: text/x-diff
Size: 0 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080627/57e1f933/attachment.patch 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: add_gdb-6.8_support.diff
Type: text/x-diff
Size: 541 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080627/57e1f933/attachment.diff 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: disable_gdb_configure_caching.diff
Type: text/x-diff
Size: 1931 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080627/57e1f933/attachment-0001.diff 
