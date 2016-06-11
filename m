From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 11 Jun 2016 21:47:35 +0200
Subject: [Buildroot] [Patch v2 0/3] Ninja, Meson: new build systems
Message-ID: <1465674458-31928-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch series provides two new build systems: Ninja and Meson.

v1 -> v2:

 - only provide host variants of ninja and python-meson.
 - document integration of meson-based packages.
 - drop removal of mesongui.py.

Eric Le Bihan (3):
  ninja: new package
  python-meson: new package
  docs/manual: document meson-based packages

 docs/manual/adding-packages-meson.txt          | 84 ++++++++++++++++++++++++++
 docs/manual/adding-packages.txt                |  2 +
 package/ninja/ninja.hash                       |  2 +
 package/ninja/ninja.mk                         | 22 +++++++
 package/python-meson/cross-compilation.conf.in | 19 ++++++
 package/python-meson/meson-exe-wrapper.in      |  3 +
 package/python-meson/python-meson.hash         |  2 +
 package/python-meson/python-meson.mk           | 41 +++++++++++++
 8 files changed, 175 insertions(+)
 create mode 100644 docs/manual/adding-packages-meson.txt
 create mode 100644 package/ninja/ninja.hash
 create mode 100644 package/ninja/ninja.mk
 create mode 100644 package/python-meson/cross-compilation.conf.in
 create mode 100755 package/python-meson/meson-exe-wrapper.in
 create mode 100644 package/python-meson/python-meson.hash
 create mode 100644 package/python-meson/python-meson.mk

--
2.4.11
