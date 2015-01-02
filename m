From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:30:25 +0100
Subject: [Buildroot] [git commit] python: rename patches to the new
	convention
Message-ID: <20150102183036.395A880D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=897d07c313104ddb54fcf9c538acb0ca65e1a687
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that we don't use completely sequential numbers, because patches
below 100 are used to address cross-compilation issues in Python,
while patches above 100 are used to make more Python modules
configurable.

[Thomas: fixup commit log.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ath.patch => 001-remove-host-header-path.patch} |    0
 ...thon-inc.patch => 002-fix-get-python-inc.patch} |    0
 ...ch => 004-sysconfigdata-install-location.patch} |    0
 ...itional.patch => 005-pyc-pyo-conditional.patch} |    0
 ...o.patch => 006-cross-compile-getaddrinfo.patch} |    0
 ...tensions.patch => 007-disable-extensions.patch} |    0
 ...atch => 008-distutils-use-python-sysroot.patch} |    0
 ...t-path.patch => 009-no-termcap-host-path.patch} |    0
 ...on-config.patch => 010-fix-python-config.patch} |    0
 ...mlink.patch => 011-remove-python-symlink.patch} |    0
 ...> 012-support-library-path-old-compilers.patch} |    0
 ...ath.patch => 013-dont-add-multiarch-path.patch} |    0
 ...les.patch => 014-abort-on-failed-modules.patch} |    0
 ....patch => 015-fix-sqlite-without-threads.patch} |    0
 ...und.patch => 016-serial-ioctl-workaround.patch} |    0
 ...17-distutils-scripts-dont-adjust-shebang.patch} |    0
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
 ...110-optional-db.patch => 110-optional-db.patch} |    0
 ...1-optional-ssl.patch => 111-optional-ssl.patch} |    0
 ...tional-bzip2.patch => 112-optional-bzip2.patch} |    0
 ...optional-zlib.patch => 113-optional-zlib.patch} |    0
 ...e-editor.patch => 114-remove-idle-editor.patch} |    0
 31 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
