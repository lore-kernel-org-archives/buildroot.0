From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:30:17 +0100
Subject: [Buildroot] [git commit] python3: rename patches to the new
	convention
Message-ID: <20150102183036.1C02D80D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c24c874810054cb0185807fe797d92056207bbbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that we don't use completely sequential numbers, because patches
below 100 are used to address cross-compilation issues in Python 3,
while patches above 100 are used to make more Python 3 modules
configurable.

[Thomas: fixup commit log.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ath.patch => 001-remove-host-header-path.patch} |    0
 ...h => 002-properly-detect-if-python-build.patch} |    0
 ...ch => 003-sysconfigdata-install-location.patch} |    0
 ...dlib-cache.patch => 004-old-stdlib-cache.patch} |    0
 ...itional.patch => 005-pyc-pyo-conditional.patch} |    0
 ...o.patch => 006-cross-compile-getaddrinfo.patch} |    0
 ...tensions.patch => 007-disable-extensions.patch} |    0
 ...08-distutils-sysconfig-use-sysconfigdata.patch} |    0
 ...atch => 009-distutils-use-python-sysroot.patch} |    0
 ...t-path.patch => 010-no-termcap-host-path.patch} |    0
 ...> 011-support-library-path-old-compilers.patch} |    0
 ...ath.patch => 012-dont-add-multiarch-path.patch} |    0
 ...les.patch => 013-abort-on-failed-modules.patch} |    0
 ...und.patch => 014-serial-ioctl-workaround.patch} |    0
 ...15-distutils-scripts-dont-adjust-shebang.patch} |    0
 ...ep3147.patch => 016-distutils-no-pep3147.patch} |    0
 ...atch => 017-python-config-include-libdir.patch} |    0
 ...dules.patch => 100-optional-test-modules.patch} |    0
 ...tional-pydoc.patch => 101-optional-pydoc.patch} |    0
 ...optional-2to3.patch => 102-optional-2to3.patch} |    0
 ...onal-sqlite.patch => 103-optional-sqlite.patch} |    0
 ...104-optional-tk.patch => 104-optional-tk.patch} |    0
 ...onal-curses.patch => 105-optional-curses.patch} |    0
 ...tional-expat.patch => 106-optional-expat.patch} |    0
 ...ecs-cjk.patch => 107-optional-codecs-cjk.patch} |    0
 ...8-optional-nis.patch => 108-optional-nis.patch} |    0
 ...dedata.patch => 109-optional-unicodedata.patch} |    0
 ...optional-idle.patch => 110-optional-idle.patch} |    0
 ...al-decimal.patch => 111-optional-decimal.patch} |    0
 29 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
