From: Scott Ellis <scott@jumpnowtek.com>
Date: Fri, 27 Oct 2017 08:34:23 -0400 (EDT)
Subject: [Buildroot] python-pyqt5 fails when using qt 5.6.3
Message-ID: <1509107663.90771784@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding Qt_5_6_3 to the existing fix-qt-5.6.2 patch fixes it.

diff --git a/package/python-pyqt5/0002-fix-qt-5.6.2.patch b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
index a56af09..730104e 100644
--- a/package/python-pyqt5/0002-fix-qt-5.6.2.patch
+++ b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
@@ -22,7 +22,7 @@ Index: PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip
  %Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", version=1)

 -%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_7_0}
-+%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_7_0}
++%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_6_3 Qt_5_7_0}

  %Platforms {WS_X11 WS_WIN WS_MACX}
