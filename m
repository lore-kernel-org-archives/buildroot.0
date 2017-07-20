From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:25:16 +0200
Subject: [Buildroot] [git commit] qt5base: add sob and upstream url to
	5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
Message-ID: <20170720202116.A301180408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d64451b6368f9bdac110c7bebbdf20e74e1212b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch b/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
index 92d93a8..69b1bd4 100644
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
