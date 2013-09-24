From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 24 Sep 2013 10:35:07 +0200
Subject: [Buildroot] [PATCH v2 0/2] lesstif support
Message-ID: <1380011709-20253-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for lesstif.
This is a quite old thing, latest version is from 2009
but it is useful to applications based on xmotif.
It has been tested with buildroot on ARM/iMX6.

Signed-off-by Thierry Bultel <thierry.bultel@wanadoo.fr>
---
Changes v1 -> v2
  - Fixed the way the aclocal file is handled: The lesstif makefile is patched in order not to install it.
  - Changed the location in xconfig, lesstif is now under 'Libraries' -> 'Graphics' (suggested by Thomas).
  - Fixes the indentation
  - Added dependency to freetype
  - Match dependencies in Config.in and lesstif.mk (Suggested by Peter) 
