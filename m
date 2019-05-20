From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 21 May 2019 00:40:34 +0300
Subject: [Buildroot] [PATCH/next v2 0/3] Update WPE WebKit to 2.24.x
In-Reply-To: <20190514114111.20424-1-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
Message-ID: <20190520214037.58011-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch set includes updated versions of the patches pending to
merge for the WPE WebKit 2.24.x update.

Cheers,
?Adri?n


Adrian Perez de Castro (3):
  package/wpebackend-fdo: bump to version 1.2.0
  package/wpewebkit: bump to version 2.24.2
  package/cog: bump version to 0.3.0

 package/cog/cog.hash                          |   2 +-
 package/cog/cog.mk                            |   2 +-
 ...-how-CMake-looks-for-wayland-scanner.patch | 137 ++++++++++++++++++
 package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
 ...uild-failure-after-r243644-in-GTK-Li.patch |  36 +++++
 package/wpewebkit/Config.in                   |  17 +--
 package/wpewebkit/wpewebkit.hash              |   8 +-
 package/wpewebkit/wpewebkit.mk                |  10 +-
 9 files changed, 187 insertions(+), 35 deletions(-)
 create mode 100644 package/wpebackend-fdo/0001-Improve-how-CMake-looks-for-wayland-scanner.patch
 create mode 100644 package/wpewebkit/0001-Build-failure-after-r243644-in-GTK-Li.patch

-- 
2.21.0
