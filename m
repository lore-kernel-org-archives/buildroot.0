From: Esben Haabendal <esben@geanix.com>
Date: Fri, 20 Sep 2019 18:36:53 +0200
Subject: [Buildroot] [PATCH v2 0/3] python-scipy package
Message-ID: <20190920163656.6388-1-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new python-scipy package and fixup python-numpy so python-scipy can
be cross-compiled.

Changed in v2:

* Added mandatory and lovely comment header in python-scipy.mk file

Esben Haabendal (3):
  package/python-numpy: fix setup type
  package/python-numpy: fixup numpy distutils for cross compilation
  package/python-scipy: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-NPY_PKG_CONFIG_PATH.patch            | 84 +++++++++++++++++++
 package/python-numpy/python-numpy.mk          | 25 +++++-
 package/python-scipy/Config.in                | 21 +++++
 package/python-scipy/python-scipy.hash        |  9 ++
 package/python-scipy/python-scipy.mk          | 37 ++++++++
 7 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 package/python-numpy/0001-NPY_PKG_CONFIG_PATH.patch
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk

-- 
2.23.0
