From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:35 +0100
Subject: [Buildroot] [PATCH 00/31] License hashes
Message-ID: <20171103103706.25574-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series adding license hashes to numerous packages.

Regards,


Samuel Martin (31):
  pkg-generic: allow legal-info to be verbose
  package/armadillo: add license hash
  package/automake: add license hash
  package/bison: add license hash
  package/bluez_utils: add license hash
  package/busybox: add license hash
  package/canfestival: add license hash
  package/check: add license hash
  package/clapack: add license hash
  package/cwiid: add license hash
  package/fakeroot: add license hash
  package/flex: add license hash
  package/flite: add license hash
  package/gettext: add license hash
  package/libffi: add license hash
  package/libglib2: add license hash
  package/libtool: add license hash
  package/libxml2: add license hash
  package/m4: add license hash
  package/nginx: add license hash
  package/opencv3: add license hash
  package/openobex: add license hash
  package/patchelf: add license hash
  package/pcre: add license hash
  package/python-numpy: add license hash
  package/python: add license hash
  package/scrub: add license hash
  package/urg: add license hash
  package/ussp-push: add license hash
  package/util-linux: add license hash
  package/zlib: add license hash

 package/armadillo/armadillo.hash       | 1 +
 package/automake/automake.hash         | 1 +
 package/bison/bison.hash               | 1 +
 package/bluez_utils/bluez_utils.hash   | 2 ++
 package/busybox/busybox.hash           | 2 ++
 package/canfestival/canfestival.hash   | 3 +++
 package/check/check.hash               | 1 +
 package/clapack/clapack.hash           | 2 ++
 package/cwiid/cwiid.hash               | 1 +
 package/fakeroot/fakeroot.hash         | 2 ++
 package/flex/flex.hash                 | 1 +
 package/flite/flite.hash               | 1 +
 package/gettext/gettext.hash           | 2 ++
 package/libffi/libffi.hash             | 2 ++
 package/libglib2/libglib2.hash         | 2 ++
 package/libtool/libtool.hash           | 1 +
 package/libxml2/libxml2.hash           | 1 +
 package/m4/m4.hash                     | 1 +
 package/nginx/nginx.hash               | 1 +
 package/opencv3/opencv3.hash           | 1 +
 package/openobex/openobex.hash         | 3 +++
 package/patchelf/patchelf.hash         | 1 +
 package/pcre/pcre.hash                 | 1 +
 package/pkg-generic.mk                 | 4 ++--
 package/python-numpy/python-numpy.hash | 2 ++
 package/python/python.hash             | 1 +
 package/scrub/scrub.hash               | 2 ++
 package/urg/urg.hash                   | 1 +
 package/ussp-push/ussp-push.hash       | 1 +
 package/util-linux/util-linux.hash     | 7 +++++++
 package/zlib/zlib.hash                 | 2 ++
 31 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 package/canfestival/canfestival.hash

--
2.15.0
