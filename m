From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  2 Nov 2016 19:23:35 -0400
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: transfer lttng-* and liburcu
	projects to Philippe Proulx
Message-ID: <20161102232335.6274-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 DEVELOPERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c3d6d7..3229a2f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,7 +1197,12 @@ F:	package/libassuan/
 F:	package/libgpgme/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
+F:	package/lttng-babeltrace/
+F:	package/lttng-libust/
+F:	package/lttng-modules/
+F:	package/lttng-tools/
 F:	package/python-ipython/
+F:	package/liburcu/
 
 N:	Pierre Floury <pierre.floury@gmail.com>
 F:	package/trace-cmd/
@@ -1477,15 +1482,10 @@ F:	package/libcap/
 F:	package/libffi/
 F:	package/libsha1/
 F:	package/libtirpc/
-F:	package/liburcu/
 F:	package/libxkbcommon/
 F:	package/libxml-parser-perl/
 F:	package/localedef/
 F:	package/log4cxx/
-F:	package/lttng-babeltrace/
-F:	package/lttng-libust/
-F:	package/lttng-modules/
-F:	package/lttng-tools/
 F:	package/monit/
 F:	package/mpdecimal/
 F:	package/msmtp/
-- 
2.9.3
