From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 10 Oct 2018 01:08:48 +0300
Subject: [Buildroot] [PATCH 0/4] webkitgtk: assorted fixes and improvements
Message-ID: <20181009220852.4309-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch set takes some of the changes proposed along with the update to
WebKitGTK+ 2.22.x, and improves them to address the review comments. In
particular, moving the logic to determine whether to enable the JavaScriptCore
JIT support is much nicer to have in the Kconfig files.

Best regards,



Adrian Perez de Castro (4):
  webkitgtk: move JSC JIT selection logic to kconfig
  webkitgtk: enable package for aarch64
  webkitgtk: enable JIT support on 32-bit MIPS
  webkitgtk: explicitly set USE_GSTREAMER_GL build option

 package/webkitgtk/Config.in    | 18 ++++++++++++++++++
 package/webkitgtk/webkitgtk.mk | 11 ++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.19.1
