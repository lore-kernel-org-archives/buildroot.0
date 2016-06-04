From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  4 Jun 2016 15:34:01 +0200
Subject: [Buildroot] [PATCH 0/2] Ninja, Meson: new build systems
Message-ID: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series provides two new build systems: Ninja and Meson.

Eric Le Bihan (2):
  ninja: new package
  python-meson: new package

 package/Config.in                              |  2 +
 package/ninja/Config.in                        | 11 ++++++
 package/ninja/ninja.hash                       |  1 +
 package/ninja/ninja.mk                         | 39 ++++++++++++++++++
 package/python-meson/Config.in                 |  9 +++++
 package/python-meson/cross-compilation.conf.in | 19 +++++++++
 package/python-meson/meson-exe-wrapper.in      |  3 ++
 package/python-meson/python-meson.hash         |  1 +
 package/python-meson/python-meson.mk           | 55 ++++++++++++++++++++++++++
 9 files changed, 140 insertions(+)
 create mode 100644 package/ninja/Config.in
 create mode 100644 package/ninja/ninja.hash
 create mode 100644 package/ninja/ninja.mk
 create mode 100644 package/python-meson/Config.in
 create mode 100644 package/python-meson/cross-compilation.conf.in
 create mode 100755 package/python-meson/meson-exe-wrapper.in
 create mode 100644 package/python-meson/python-meson.hash
 create mode 100644 package/python-meson/python-meson.mk

-- 
2.4.11
