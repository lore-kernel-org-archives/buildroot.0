From: ray.kinsella at intel.com <ray.kinsella@intel.com>
Date: Wed,  6 Apr 2016 14:19:27 +0100
Subject: [Buildroot] [PATCH v4 0/3] package/radlib: new package
Message-ID: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ray Kinsella <ray.kinsella@intel.com>

radlib is a rapid application development library for unix$
multi-process applications. It uses SYS V IPC facilities and$
FIFOs to provide an RTOS-like, event-driven, distributed$
framework. Processes may be run as daemons or have a controlling$
terminal.

--------------------------------------------------------------------------------
Ray Kinsella (3):
  package/radlib: kconfig and makefile
  package/radlib: Renamed configure.in to configure.ac
  package/radlib: reworked autotools with pkg-config

 package/Config.in                                  |   1 +
 ...dlib-renamed-configure.in-to-configure.ac.patch | 213 +++++++++++++++++
 ...radlib-reworked-autotools-with-pkg-config.patch | 252 +++++++++++++++++++++
 package/radlib/Config.in                           |  37 +++
 package/radlib/radlib.hash                         |   2 +
 package/radlib/radlib.mk                           |  28 +++
 6 files changed, 533 insertions(+)
 create mode 100644 package/radlib/0001-radlib-renamed-configure.in-to-configure.ac.patch
 create mode 100644 package/radlib/0002-radlib-reworked-autotools-with-pkg-config.patch
 create mode 100644 package/radlib/Config.in
 create mode 100644 package/radlib/radlib.hash
 create mode 100644 package/radlib/radlib.mk

-- 
2.4.11
