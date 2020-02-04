From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 14:31:55 +0100
Subject: [Buildroot] [PATCH 0/2] package/norm: prepare for Python3
Message-ID: <20200204133157.10824-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small series update the norm package to make it possible to compile it
using a Python3 based waf package infrastructure, and changes the download
server to Github to enhance the reliability of the tarball download, because
the original server is quite slow and unreliable.

Titouan Christophe (2):
  package/norm: switch to Github hosted archive
  package/norm: make wscript Python3 compatible

 ...ction-call-for-Python3-compatibility.patch | 29 +++++++++++++
 ...ixed-tabs-spaces-in-protolib-wscript.patch | 41 +++++++++++++++++++
 package/norm/norm.hash                        |  2 +-
 package/norm/norm.mk                          |  4 +-
 4 files changed, 73 insertions(+), 3 deletions(-)
 create mode 100644 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch
 create mode 100644 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch

-- 
2.24.1
