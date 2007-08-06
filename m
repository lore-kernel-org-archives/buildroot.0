From: Chris Malarky <chris@malarky.org>
Date: Mon, 06 Aug 2007 13:39:10 +0100
Subject: [Buildroot] [Patch] newt.mk
Message-ID: <1186403950.5741.42.camel@shadow.muzakdomain.imagesound.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Attached is a patch to update newt.mk to bring it in to line with the
latest STAGING_DIR layout.

It was creating STAGING_DIR/include (and breaking other compilations)
similar to slang.mk was last week.

Also adjusted all libs to be /usr/lib rather than /lib, and use the more
compact 'touch $@' syntax.

Cheers,
Chris
-- 
Chris Malarky
chris at malarky dot org
-------------- next part --------------
A non-text attachment was scrubbed...
Name: newt.patch
Type: text/x-patch
Size: 2059 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070806/bd980b6a/attachment.bin 
