From: =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>
Date: Fri, 19 Aug 2016 15:42:23 +0200
Subject: [Buildroot] [PATCH 0/2] PyQt5 package
Message-ID: <20160819134225.1490-1-develop@manuel-voegele.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package contains Python bindings for Qt5. Since PyQt4 and PyQt5
are similar in many ways most of the package configuration is taken
directly from the python-pyqt package and altered to fit PyQt5.

Manuel V?gele (2):
  python-sip: allow package to be built using Qt5
  python-pyqt5: new package

 package/Config.in                                  |  1 +
 .../0001-configure-skip-qtdetail.patch             | 29 +++++++
 package/python-pyqt5/Config.in                     | 23 ++++++
 package/python-pyqt5/python-pyqt5.hash             |  3 +
 package/python-pyqt5/python-pyqt5.mk               | 88 ++++++++++++++++++++++
 package/python-sip/Config.in                       |  7 +-
 package/python-sip/python-sip.mk                   |  4 +
 7 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 package/python-pyqt5/0001-configure-skip-qtdetail.patch
 create mode 100644 package/python-pyqt5/Config.in
 create mode 100644 package/python-pyqt5/python-pyqt5.hash
 create mode 100644 package/python-pyqt5/python-pyqt5.mk

-- 
2.1.4
