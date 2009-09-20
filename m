From: Will Newton <will.newton@gmail.com>
Date: Sun, 20 Sep 2009 22:08:26 +0100
Subject: [Buildroot] [pull request] Miscellaneous fixes and additions
Message-ID: <87a5b0800909201408o33dc19f8m8c644c227fcc86f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This tree contains a number of small fixes to various packages that
I've been using in my local tree for some time. The first three have
been posted to the list and the latter two are in bugzilla.

The following changes since commit 1fe7bbb34df56d532e1057696bd73f081ca6c9bf:
  Olaf Rempel (1):
        iptables: fix disable-ipv6 option

are available in the git repository at:

  git://github.com/willnewton/buildroot.git master

Will Newton (5):
      autoconf: Bump version to 2.64.
      package/Makefile.autotools.in: Add $(PKG)_AUTORECONF_OPT variable.
      package/Makefile.in: Use appropriate paths for host pkg-config.
      libmicrohttpd: New package.
      python: Don't delete .py files unless asked.

 package/Config.in                      |    1 +
 package/Makefile.autotools.in          |    5 ++++-
 package/Makefile.in                    |    9 ++++++---
 package/autoconf/autoconf.mk           |    2 +-
 package/libmicrohttpd/Config.in        |    7 +++++++
 package/libmicrohttpd/libmicrohttpd.mk |   14 ++++++++++++++
 package/pango/pango.mk                 |    2 +-
 package/python/python.mk               |    1 -
 8 files changed, 34 insertions(+), 7 deletions(-)
 create mode 100644 package/libmicrohttpd/Config.in
 create mode 100644 package/libmicrohttpd/libmicrohttpd.mk
