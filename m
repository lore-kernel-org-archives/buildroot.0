From: Chris Bare <chris@bareflix.com>
Date: Fri, 17 Apr 2009 12:02:41 -0400 (EDT)
Subject: [Buildroot] package patches
Message-ID: <20090417160420.475DB3FCBC@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I created a patch and put the patch file in my packages/libxmlrpc-c/
next to Config.in and libxmlrpc-c.mk

I run the build and I see:

libxmlrpc-c 1.06.32 Downloading
libxmlrpc-c 1.06.32 Extracting
libxmlrpc-c 1.06.32 Patching libtool
libxmlrpc-c 1.06.32 Patching package/libxmlrpc-c
libxmlrpc-c 1.06.32 Configuring

but the patch is not applied. I looked at various other packages that include
patch files, but didn't see any place where they told buildroot about them.
Where/how do I have to list the patch file to get it automatically applied?

-- 
Chris Bare
chris at bareflix.com
