From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 13 Aug 2008 16:46:33 -0600
Subject: [Buildroot] [PATCH] Makefile.autotools.in compatible with tar 1.14
Message-ID: <bbbeeccd0808131546j2b099b32t9df286eeba21958b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I came across a scenario where I needed to build on an older system
that only has tar 1.14.

This patch will automatically detect whether tar should use
--strip-components or --strip-path.

The shell is kinda clunky, but it works.

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-autotools_tar.patch
Type: text/x-diff
Size: 1102 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080813/e219abef/attachment.patch 
