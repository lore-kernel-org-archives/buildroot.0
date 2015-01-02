From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 19:16:52 +0100
Subject: [Buildroot] [PATCH 4/4] python: rename patches to the new
 convention
In-Reply-To: <1419800095-7808-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419800095-7808-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150102181652.GJ4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-28 21:54 +0100, Thomas Petazzoni spake thusly:
> Now that we don't use completely sequential numbers, because patches
> below 100 are used to address cross-compilation issues in Python,
> while patches above 100 are used to make more Python modules
> configurable.

I'm not sure this is a proper sentence. ;-)

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...01-remove-host-header-path.patch => 001-remove-host-header-path.patch} | 0
>  .../{python-002-fix-get-python-inc.patch => 002-fix-get-python-inc.patch} | 0
>  ...ta-install-location.patch => 004-sysconfigdata-install-location.patch} | 0
>  ...python-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} | 0
>  ...ross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} | 0
>  .../{python-007-disable-extensions.patch => 007-disable-extensions.patch} | 0
>  ...ls-use-python-sysroot.patch => 008-distutils-use-python-sysroot.patch} | 0
>  ...thon-009-no-termcap-host-path.patch => 009-no-termcap-host-path.patch} | 0
>  .../{python-010-fix-python-config.patch => 010-fix-python-config.patch}   | 0
>  ...on-011-remove-python-symlink.patch => 011-remove-python-symlink.patch} | 0
>  ...h-old-compilers.patch => 012-support-library-path-old-compilers.patch} | 0
>  ...13-dont-add-multiarch-path.patch => 013-dont-add-multiarch-path.patch} | 0
>  ...14-abort-on-failed-modules.patch => 014-abort-on-failed-modules.patch} | 0
>  ...-sqlite-without-threads.patch => 015-fix-sqlite-without-threads.patch} | 0
>  ...16-serial-ioctl-workaround.patch => 016-serial-ioctl-workaround.patch} | 0
>  ...just-shebang.patch => 017-distutils-scripts-dont-adjust-shebang.patch} | 0
>  ...on-100-optional-test-modules.patch => 100-optional-test-modules.patch} | 0
>  .../python/{python-101-optional-pydoc.patch => 101-optional-pydoc.patch}  | 0
>  .../python/{python-102-optional-2to3.patch => 102-optional-2to3.patch}    | 0
>  .../{python-103-optional-sqlite.patch => 103-optional-sqlite.patch}       | 0
>  package/python/{python-104-optional-tk.patch => 104-optional-tk.patch}    | 0
>  .../{python-105-optional-curses.patch => 105-optional-curses.patch}       | 0
>  .../python/{python-106-optional-expat.patch => 106-optional-expat.patch}  | 0
>  ...python-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} | 0
>  package/python/{python-108-optional-nis.patch => 108-optional-nis.patch}  | 0
>  ...thon-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} | 0
>  package/python/{python-110-optional-db.patch => 110-optional-db.patch}    | 0
>  package/python/{python-111-optional-ssl.patch => 111-optional-ssl.patch}  | 0
>  .../python/{python-112-optional-bzip2.patch => 112-optional-bzip2.patch}  | 0
>  .../python/{python-113-optional-zlib.patch => 113-optional-zlib.patch}    | 0
>  .../{python-114-remove-idle-editor.patch => 114-remove-idle-editor.patch} | 0
>  31 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/python/{python-001-remove-host-header-path.patch => 001-remove-host-header-path.patch} (100%)
>  rename package/python/{python-002-fix-get-python-inc.patch => 002-fix-get-python-inc.patch} (100%)
>  rename package/python/{python-004-sysconfigdata-install-location.patch => 004-sysconfigdata-install-location.patch} (100%)
>  rename package/python/{python-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} (100%)
>  rename package/python/{python-006-cross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} (100%)
>  rename package/python/{python-007-disable-extensions.patch => 007-disable-extensions.patch} (100%)
>  rename package/python/{python-008-distutils-use-python-sysroot.patch => 008-distutils-use-python-sysroot.patch} (100%)
>  rename package/python/{python-009-no-termcap-host-path.patch => 009-no-termcap-host-path.patch} (100%)
>  rename package/python/{python-010-fix-python-config.patch => 010-fix-python-config.patch} (100%)
>  rename package/python/{python-011-remove-python-symlink.patch => 011-remove-python-symlink.patch} (100%)
>  rename package/python/{python-012-support-library-path-old-compilers.patch => 012-support-library-path-old-compilers.patch} (100%)
>  rename package/python/{python-013-dont-add-multiarch-path.patch => 013-dont-add-multiarch-path.patch} (100%)
>  rename package/python/{python-014-abort-on-failed-modules.patch => 014-abort-on-failed-modules.patch} (100%)
>  rename package/python/{python-015-fix-sqlite-without-threads.patch => 015-fix-sqlite-without-threads.patch} (100%)
>  rename package/python/{python-016-serial-ioctl-workaround.patch => 016-serial-ioctl-workaround.patch} (100%)
>  rename package/python/{python-017-distutils-scripts-dont-adjust-shebang.patch => 017-distutils-scripts-dont-adjust-shebang.patch} (100%)
>  rename package/python/{python-100-optional-test-modules.patch => 100-optional-test-modules.patch} (100%)
>  rename package/python/{python-101-optional-pydoc.patch => 101-optional-pydoc.patch} (100%)
>  rename package/python/{python-102-optional-2to3.patch => 102-optional-2to3.patch} (100%)
>  rename package/python/{python-103-optional-sqlite.patch => 103-optional-sqlite.patch} (100%)
>  rename package/python/{python-104-optional-tk.patch => 104-optional-tk.patch} (100%)
>  rename package/python/{python-105-optional-curses.patch => 105-optional-curses.patch} (100%)
>  rename package/python/{python-106-optional-expat.patch => 106-optional-expat.patch} (100%)
>  rename package/python/{python-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} (100%)
>  rename package/python/{python-108-optional-nis.patch => 108-optional-nis.patch} (100%)
>  rename package/python/{python-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} (100%)
>  rename package/python/{python-110-optional-db.patch => 110-optional-db.patch} (100%)
>  rename package/python/{python-111-optional-ssl.patch => 111-optional-ssl.patch} (100%)
>  rename package/python/{python-112-optional-bzip2.patch => 112-optional-bzip2.patch} (100%)
>  rename package/python/{python-113-optional-zlib.patch => 113-optional-zlib.patch} (100%)
>  rename package/python/{python-114-remove-idle-editor.patch => 114-remove-idle-editor.patch} (100%)
> 
> diff --git a/package/python/python-001-remove-host-header-path.patch b/package/python/001-remove-host-header-path.patch
> similarity index 100%
> rename from package/python/python-001-remove-host-header-path.patch
> rename to package/python/001-remove-host-header-path.patch
> diff --git a/package/python/python-002-fix-get-python-inc.patch b/package/python/002-fix-get-python-inc.patch
> similarity index 100%
> rename from package/python/python-002-fix-get-python-inc.patch
> rename to package/python/002-fix-get-python-inc.patch
> diff --git a/package/python/python-004-sysconfigdata-install-location.patch b/package/python/004-sysconfigdata-install-location.patch
> similarity index 100%
> rename from package/python/python-004-sysconfigdata-install-location.patch
> rename to package/python/004-sysconfigdata-install-location.patch
> diff --git a/package/python/python-005-pyc-pyo-conditional.patch b/package/python/005-pyc-pyo-conditional.patch
> similarity index 100%
> rename from package/python/python-005-pyc-pyo-conditional.patch
> rename to package/python/005-pyc-pyo-conditional.patch
> diff --git a/package/python/python-006-cross-compile-getaddrinfo.patch b/package/python/006-cross-compile-getaddrinfo.patch
> similarity index 100%
> rename from package/python/python-006-cross-compile-getaddrinfo.patch
> rename to package/python/006-cross-compile-getaddrinfo.patch
> diff --git a/package/python/python-007-disable-extensions.patch b/package/python/007-disable-extensions.patch
> similarity index 100%
> rename from package/python/python-007-disable-extensions.patch
> rename to package/python/007-disable-extensions.patch
> diff --git a/package/python/python-008-distutils-use-python-sysroot.patch b/package/python/008-distutils-use-python-sysroot.patch
> similarity index 100%
> rename from package/python/python-008-distutils-use-python-sysroot.patch
> rename to package/python/008-distutils-use-python-sysroot.patch
> diff --git a/package/python/python-009-no-termcap-host-path.patch b/package/python/009-no-termcap-host-path.patch
> similarity index 100%
> rename from package/python/python-009-no-termcap-host-path.patch
> rename to package/python/009-no-termcap-host-path.patch
> diff --git a/package/python/python-010-fix-python-config.patch b/package/python/010-fix-python-config.patch
> similarity index 100%
> rename from package/python/python-010-fix-python-config.patch
> rename to package/python/010-fix-python-config.patch
> diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/011-remove-python-symlink.patch
> similarity index 100%
> rename from package/python/python-011-remove-python-symlink.patch
> rename to package/python/011-remove-python-symlink.patch
> diff --git a/package/python/python-012-support-library-path-old-compilers.patch b/package/python/012-support-library-path-old-compilers.patch
> similarity index 100%
> rename from package/python/python-012-support-library-path-old-compilers.patch
> rename to package/python/012-support-library-path-old-compilers.patch
> diff --git a/package/python/python-013-dont-add-multiarch-path.patch b/package/python/013-dont-add-multiarch-path.patch
> similarity index 100%
> rename from package/python/python-013-dont-add-multiarch-path.patch
> rename to package/python/013-dont-add-multiarch-path.patch
> diff --git a/package/python/python-014-abort-on-failed-modules.patch b/package/python/014-abort-on-failed-modules.patch
> similarity index 100%
> rename from package/python/python-014-abort-on-failed-modules.patch
> rename to package/python/014-abort-on-failed-modules.patch
> diff --git a/package/python/python-015-fix-sqlite-without-threads.patch b/package/python/015-fix-sqlite-without-threads.patch
> similarity index 100%
> rename from package/python/python-015-fix-sqlite-without-threads.patch
> rename to package/python/015-fix-sqlite-without-threads.patch
> diff --git a/package/python/python-016-serial-ioctl-workaround.patch b/package/python/016-serial-ioctl-workaround.patch
> similarity index 100%
> rename from package/python/python-016-serial-ioctl-workaround.patch
> rename to package/python/016-serial-ioctl-workaround.patch
> diff --git a/package/python/python-017-distutils-scripts-dont-adjust-shebang.patch b/package/python/017-distutils-scripts-dont-adjust-shebang.patch
> similarity index 100%
> rename from package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
> rename to package/python/017-distutils-scripts-dont-adjust-shebang.patch
> diff --git a/package/python/python-100-optional-test-modules.patch b/package/python/100-optional-test-modules.patch
> similarity index 100%
> rename from package/python/python-100-optional-test-modules.patch
> rename to package/python/100-optional-test-modules.patch
> diff --git a/package/python/python-101-optional-pydoc.patch b/package/python/101-optional-pydoc.patch
> similarity index 100%
> rename from package/python/python-101-optional-pydoc.patch
> rename to package/python/101-optional-pydoc.patch
> diff --git a/package/python/python-102-optional-2to3.patch b/package/python/102-optional-2to3.patch
> similarity index 100%
> rename from package/python/python-102-optional-2to3.patch
> rename to package/python/102-optional-2to3.patch
> diff --git a/package/python/python-103-optional-sqlite.patch b/package/python/103-optional-sqlite.patch
> similarity index 100%
> rename from package/python/python-103-optional-sqlite.patch
> rename to package/python/103-optional-sqlite.patch
> diff --git a/package/python/python-104-optional-tk.patch b/package/python/104-optional-tk.patch
> similarity index 100%
> rename from package/python/python-104-optional-tk.patch
> rename to package/python/104-optional-tk.patch
> diff --git a/package/python/python-105-optional-curses.patch b/package/python/105-optional-curses.patch
> similarity index 100%
> rename from package/python/python-105-optional-curses.patch
> rename to package/python/105-optional-curses.patch
> diff --git a/package/python/python-106-optional-expat.patch b/package/python/106-optional-expat.patch
> similarity index 100%
> rename from package/python/python-106-optional-expat.patch
> rename to package/python/106-optional-expat.patch
> diff --git a/package/python/python-107-optional-codecs-cjk.patch b/package/python/107-optional-codecs-cjk.patch
> similarity index 100%
> rename from package/python/python-107-optional-codecs-cjk.patch
> rename to package/python/107-optional-codecs-cjk.patch
> diff --git a/package/python/python-108-optional-nis.patch b/package/python/108-optional-nis.patch
> similarity index 100%
> rename from package/python/python-108-optional-nis.patch
> rename to package/python/108-optional-nis.patch
> diff --git a/package/python/python-109-optional-unicodedata.patch b/package/python/109-optional-unicodedata.patch
> similarity index 100%
> rename from package/python/python-109-optional-unicodedata.patch
> rename to package/python/109-optional-unicodedata.patch
> diff --git a/package/python/python-110-optional-db.patch b/package/python/110-optional-db.patch
> similarity index 100%
> rename from package/python/python-110-optional-db.patch
> rename to package/python/110-optional-db.patch
> diff --git a/package/python/python-111-optional-ssl.patch b/package/python/111-optional-ssl.patch
> similarity index 100%
> rename from package/python/python-111-optional-ssl.patch
> rename to package/python/111-optional-ssl.patch
> diff --git a/package/python/python-112-optional-bzip2.patch b/package/python/112-optional-bzip2.patch
> similarity index 100%
> rename from package/python/python-112-optional-bzip2.patch
> rename to package/python/112-optional-bzip2.patch
> diff --git a/package/python/python-113-optional-zlib.patch b/package/python/113-optional-zlib.patch
> similarity index 100%
> rename from package/python/python-113-optional-zlib.patch
> rename to package/python/113-optional-zlib.patch
> diff --git a/package/python/python-114-remove-idle-editor.patch b/package/python/114-remove-idle-editor.patch
> similarity index 100%
> rename from package/python/python-114-remove-idle-editor.patch
> rename to package/python/114-remove-idle-editor.patch
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
