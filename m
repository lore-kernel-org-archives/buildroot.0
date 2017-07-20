From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Jul 2017 20:54:18 +0200
Subject: [Buildroot] [PATCH v1] qt5base: add sob and upstream url to
	5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
Message-ID: <20170720185418.18567-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Suggested by Arnout Vandecappelle, see [1].

[1] http://lists.busybox.net/pipermail/buildroot/2017-July/198147.html
---
 .../qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch b/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
index 92d93a800b..69b1bd40f5 100644
--- a/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
+++ b/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
@@ -5,6 +5,9 @@ Subject: [PATCH] Fix error attribute(target("+crc")) is unknown
 
 Task-number: QTBUG-61975
 Change-Id: I0b1b55c0737dad485b5ace8e6eb7cb842589453d
+
+Upstream: https://codereview.qt-project.org/200171
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  src/corelib/tools/qhash.cpp | 2 ++
  src/corelib/tools/qsimd_p.h | 3 +++
-- 
2.11.0
