From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:31:42 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: transfer lttng-* and liburcu
	projects to Philippe Proulx
Message-ID: <20161103213512.1B41881662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c005353b6c517c7df84ef42fe55a42c9952f002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c4b3117..3a9c00d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1198,7 +1198,12 @@ F:	package/libassuan/
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
@@ -1476,15 +1481,10 @@ F:	package/libcap/
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
