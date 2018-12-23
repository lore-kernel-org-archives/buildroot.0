From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 23 Dec 2018 16:48:42 +0100
Subject: [Buildroot] [RFC 0/3] WPE WebKit
Message-ID: <20181223154845.23556-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another port of WebKit (https://wpewebkit.org/), a project started in 2018.

Testing fresh code of various OpenGL backends is awful.

Francois Perrad (3):
  libwpe: new package
  wpebackend-fdo: new package
  wpewebkit: new package

 DEVELOPERS                                 |  3 +
 package/Config.in                          |  3 +
 package/libwpe/Config.in                   | 12 ++++
 package/libwpe/libwpe.hash                 |  7 ++
 package/libwpe/libwpe.mk                   | 15 ++++
 package/wpebackend-fdo/Config.in           | 17 +++++
 package/wpebackend-fdo/wpebackend-fdo.hash |  7 ++
 package/wpebackend-fdo/wpebackend-fdo.mk   | 15 ++++
 package/wpewebkit/Config.in                | 82 ++++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash           |  8 +++
 package/wpewebkit/wpewebkit.mk             | 69 ++++++++++++++++++
 11 files changed, 238 insertions(+)
 create mode 100644 package/libwpe/Config.in
 create mode 100644 package/libwpe/libwpe.hash
 create mode 100644 package/libwpe/libwpe.mk
 create mode 100644 package/wpebackend-fdo/Config.in
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
 create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk
 create mode 100644 package/wpewebkit/Config.in
 create mode 100644 package/wpewebkit/wpewebkit.hash
 create mode 100644 package/wpewebkit/wpewebkit.mk

-- 
2.17.1
