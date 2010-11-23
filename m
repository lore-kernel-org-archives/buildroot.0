From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 23 Nov 2010 16:48:13 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
Message-ID: <1290548893-12915-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit d8de970bae3744fe830e96a1ae0c4aff6ce47ba1:

  uClibc: sys/ptrace.h fix for 0.9.31 / powerpc so ltrace builds (2010-11-22 10:53:09 +0100)

are available in the git repository at:
  git://sources.blackfin.uclinux.org/git/users/vapier/buildroot.git vapier

Mike Frysinger (5):
      m4: version bump to 1.4.15
      xz: version bump to 5.0.0
      u-boot: version bump to 2010.09
      auto remove empty /usr/share dir
      rsh-redone: new package for rsh/rlogin clients

 Makefile                                          |    1 +
 boot/u-boot/Config.in                             |    6 +++-
 package/Config.in                                 |    1 +
 package/m4/m4-1.4.15-uclibc-sched_param-def.patch |   19 +++++++++++
 package/m4/m4.mk                                  |    2 +-
 package/rsh-redone/Config.in                      |   31 ++++++++++++++++++
 package/rsh-redone/rsh-redone.mk                  |   36 +++++++++++++++++++++
 package/xz/xz.mk                                  |    2 +-
 8 files changed, 95 insertions(+), 3 deletions(-)
 create mode 100644 package/m4/m4-1.4.15-uclibc-sched_param-def.patch
 create mode 100644 package/rsh-redone/Config.in
 create mode 100644 package/rsh-redone/rsh-redone.mk
