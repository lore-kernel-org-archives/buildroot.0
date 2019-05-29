From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:18 -0400
Subject: [Buildroot] [PATCH 00/19] Add missing license file hashes for
 various packages
Message-ID: <20190529033537.128311-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

These are just some packages I found today that don't have hashes for their
respective license files.

I also added a sha256sum hash for the bzip2-1.0.6.tar.gz archive, as it seems
like a fairly standard shasum to have for packages.


Adam Duskett (19):
  package/acl: add hashes for license files
  package/attr: add hashes for license files
  package/bzip2: add license hash
  package/cmake: add hash for license file
  package/dbus-glib: add hash for license file
  package/dbus-python: add hash for license file
  package/fontconfig: add hash for license file
  package/gmp: add hashes for license files
  package/gperf: add hash for license file
  package/intltool: add hash for license file
  package/kmod: add hash for license file
  package/libxml-parser-perl: add hash for license file
  package/ncurses: add hash for license file
  package/parted: add hash for license file
  package/polkit: add hash for license file
  package/swig: add hashes for license files
  package/udisks: add hash for license file
  package/ustr: add hashes for license files
  package/wireless_tools: add hash for license file

 package/acl/acl.hash                               | 5 +++++
 package/attr/attr.hash                             | 4 ++++
 package/bzip2/bzip2.hash                           | 4 ++++
 package/cmake/cmake.hash                           | 3 +++
 package/dbus-glib/dbus-glib.hash                   | 3 +++
 package/dbus-python/dbus-python.hash               | 3 +++
 package/fontconfig/fontconfig.hash                 | 3 +++
 package/gmp/gmp.hash                               | 4 ++++
 package/gperf/gperf.hash                           | 3 +++
 package/intltool/intltool.hash                     | 1 +
 package/kmod/kmod.hash                             | 3 +++
 package/libxml-parser-perl/libxml-parser-perl.hash | 1 +
 package/ncurses/ncurses.hash                       | 3 +++
 package/parted/parted.hash                         | 3 +++
 package/polkit/polkit.hash                         | 3 +++
 package/swig/swig.hash                             | 3 +++
 package/udisks/udisks.hash                         | 1 +
 package/ustr/ustr.hash                             | 5 +++++
 package/wireless_tools/wireless_tools.hash         | 1 +
 19 files changed, 56 insertions(+)

-- 
2.21.0
