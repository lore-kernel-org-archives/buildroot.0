From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:36 +0200
Subject: [Buildroot] [PATCH 00/15] CMake janitor
Message-ID: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series cleaning the packages using the cmake-package infra.
It mostly consists in removing configure options already preset by the infra.

Regards,

Samuel Martin (15):
  package/pkg-cmake.mk: globally disable doc, examples and tests
  package/pkg-cmake.mk: disable colouring the output
  package/clapack: cleanup configure options
  package/flann: cleanup configure options
  package/libsoxr: cleanup configure options
  package/libsoxr: cleanup configure options
  package/libubox: cleanup dependencies
  package/libubox: cleanup configure options
  package/libubox: cleanup configure options
  package/libuci: cleanup configure options
  package/libuci: cleanup configure options
  package/ne10: cleanup configure options
  package/opencv: cleanup configure options
  package/polarssl: cleanup configure options
  docs/manual: update cmake-package infrastructure section

 docs/manual/adding-packages-cmake.txt | 10 ++++++++++
 package/clapack/clapack.mk            |  1 -
 package/flann/flann.mk                |  2 --
 package/libsoxr/libsoxr.mk            |  4 ++--
 package/libubox/libubox.mk            |  7 ++++---
 package/libuci/libuci.mk              |  5 +++--
 package/ne10/ne10.mk                  |  5 -----
 package/opencv/opencv.mk              |  2 --
 package/pkg-cmake.mk                  | 13 +++++++++++++
 package/polarssl/polarssl.mk          |  1 -
 10 files changed, 32 insertions(+), 18 deletions(-)

--
2.1.2
