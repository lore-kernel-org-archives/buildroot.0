From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Jul 2015 11:40:22 +0200
Subject: [Buildroot] [PATCH v8 0/7] OpenCV bump
Message-ID: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Another round for the bump of OpenCV package, and related
features/packages, with still the same patches...

Patches 1 and 2 update gstreamer support.
Patches 3 to 6 update GUI toolkit support.
Patch 7 fixes reverse dependency (vlc).

Regards,


Samuel Martin (7):
  package/opencv: add a choice for selecting gstreamer support
  package/opencv: add gstreamer-1.x support
  package/opencv: add a choice for selecting the gui toolkit
  package/opencv: add qt5 support
  package/opencv: add gtk3 support
  package/opencv: add opengl support
  package/vlc: add opencv support

 package/opencv/Config.in                           | 156 +++++++++++++++++----
 package/opencv/opencv.mk                           |  40 +++++-
 ...opencv_wrapper-use-opencv2-style-includes.patch |  36 +++++
 ...cv_example-add-missing-include-statements.patch |  29 ++++
 package/vlc/Config.in                              |   2 +
 package/vlc/vlc.mk                                 |   8 +-
 6 files changed, 240 insertions(+), 31 deletions(-)
 create mode 100644 package/vlc/0008-opencv_wrapper-use-opencv2-style-includes.patch
 create mode 100644 package/vlc/0009-opencv_example-add-missing-include-statements.patch

--
2.4.5
