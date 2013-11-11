From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:00:06 +0100
Subject: [Buildroot] [PATCH 0/7] OpenCV bump
Message-ID: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is a couple packages bumps and fixes related to OpenCV.

- Patches 1 and 2 are fairly independent of the rest, though still
  related.

- Patches 3 and 4 are coupled: the new dependency in opencv requires
  the install rules fix in eigen.

- Patches 5 to 7 just bumps opencv and update a few dependencies.

Yours,
Samuel

Samuel Martin (7):
  cmake: bump to version 2.8.12.1
  eigen: add C++ toolchain dependency
  eigen: fix install rules
  opencv: add eigen dependency
  opencv: bump to version 2.4.7
  opencv: rework V4L/libv4l support
  opencv: add Qt5 support

 package/cmake/cmake.mk   |  2 +-
 package/eigen/Config.in  |  4 ++++
 package/eigen/eigen.mk   | 10 ++++++++--
 package/opencv/Config.in | 52 +++++++++++++++++++++++++++++++++++++-----------
 package/opencv/opencv.mk | 33 ++++++++++++++++++++----------
 5 files changed, 76 insertions(+), 25 deletions(-)

--
1.8.4.2
