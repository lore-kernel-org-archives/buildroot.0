From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 22 Jul 2008 10:58:39 -0600
Subject: [Buildroot] [PATCH] Fix and enable vsftpd build
Message-ID: <bbbeeccd0807220958o7e86e928g529a8c410a72d89c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I see that vsftpd is included, but it was not enabled.  It also didn't
build because of the missing _TARGET_BINARY directive.

Attached is a patch to fix this (as well as add the correct link flags
for ssl depending if that's selected).

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_fix_vsftpd_build.patch
Type: text/x-diff
Size: 1347 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080722/801b2140/attachment.patch 
