From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 14:39:27 +0100
Subject: [Buildroot] [PATCH] WPE WebKit
Message-ID: <20181231133932.29718-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another port of WebKit (https://wpewebkit.org/), a project started in 2018.

Francois Perrad (5):
  libwpe: new package
  wpebackend-fdo: new package
  webkitgtk: remove GTK in WEBKITGTK_ARCH_SUPPORTS* variable names
  wpewebkit: new package
  cog: new package

 DEVELOPERS                                 |  8 +++
 package/Config.in                          |  4 ++
 package/cog/Config.in                      | 20 ++++++
 package/cog/cog.hash                       |  5 ++
 package/cog/cog.mk                         | 24 +++++++
 package/libwpe/Config.in                   | 13 ++++
 package/libwpe/libwpe.hash                 |  7 ++
 package/libwpe/libwpe.mk                   | 22 ++++++
 package/midori/Config.in                   |  4 +-
 package/webkitgtk/Config.in                |  8 +--
 package/webkitgtk/webkitgtk.mk             |  2 +-
 package/wpebackend-fdo/Config.in           | 19 +++++
 package/wpebackend-fdo/wpebackend-fdo.hash |  7 ++
 package/wpebackend-fdo/wpebackend-fdo.mk   | 15 ++++
 package/wpewebkit/Config.in                | 84 ++++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash           |  8 +++
 package/wpewebkit/wpewebkit.mk             | 61 ++++++++++++++++
 17 files changed, 304 insertions(+), 7 deletions(-)
 create mode 100644 package/cog/Config.in
 create mode 100644 package/cog/cog.hash
 create mode 100644 package/cog/cog.mk
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
