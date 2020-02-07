From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 10:37:03 +0100
Subject: [Buildroot] [PATCH 0/2] Add python-pymupdf
Message-ID: <20200207093705.32687-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needs http://patchwork.ozlabs.org/patch/1161981/

Rapha?l M?lotte (2):
  package/mupdf: new package.
  package/python-pymupdf: new package.

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 ...-Makefile-add-an-install_libs-target.patch | 41 ++++++++++++
 package/mupdf/Config.in                       | 15 +++++
 package/mupdf/mupdf.hash                      |  8 +++
 package/mupdf/mupdf.mk                        | 62 +++++++++++++++++++
 package/python-pymupdf/Config.in              | 12 ++++
 package/python-pymupdf/python-pymupdf.hash    |  3 +
 package/python-pymupdf/python-pymupdf.mk      | 25 ++++++++
 9 files changed, 170 insertions(+)
 create mode 100644 package/mupdf/0001-Makefile-add-an-install_libs-target.patch
 create mode 100644 package/mupdf/Config.in
 create mode 100644 package/mupdf/mupdf.hash
 create mode 100644 package/mupdf/mupdf.mk
 create mode 100644 package/python-pymupdf/Config.in
 create mode 100644 package/python-pymupdf/python-pymupdf.hash
 create mode 100644 package/python-pymupdf/python-pymupdf.mk

-- 
2.23.0
