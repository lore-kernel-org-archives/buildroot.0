From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 25 Dec 2009 10:31:16 +0000
Subject: [Buildroot] [pull request] Pull request for branch rpm-update3
Message-ID: <cover.1261737062.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 9400c73582326c543fae82120af3904836145655:
  Gustavo Zacarias (1):
        Bump mtd-utils to 1.2.0

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot rpm-update3

Nigel Kukard (1):
      Bumped rpm

 package/rpm/Config.in                             |   27 ++-
 package/rpm/rpm-5.1.6_exclude-some-tools.patch    |   12 -
 package/rpm/rpm-5.1.6_magic-file-fix.patch        |   40 ----
 package/rpm/rpm-5.2.0_depends-fix.patch           |   19 ++
 package/rpm/rpm-5.2.0_exclude-some-tools.patch    |   30 +++
 package/rpm/rpm-5.2.0_ignore-shared-mutexes.patch |   12 +
 package/rpm/rpm-5.2.0_no-parentdirs.patch         |   14 ++
 package/rpm/rpm-5.2.0_ordering-fix.patch          |   45 ++++
 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch |   37 ++++
 package/rpm/rpm-5.2.0_short-circuit-c99.patch     |  235 +++++++++++++++++++++
 package/rpm/rpm.mk                                |   25 ++-
 11 files changed, 431 insertions(+), 65 deletions(-)
 delete mode 100755 package/rpm/rpm-5.1.6_exclude-some-tools.patch
 delete mode 100755 package/rpm/rpm-5.1.6_magic-file-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_depends-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_exclude-some-tools.patch
 create mode 100644 package/rpm/rpm-5.2.0_ignore-shared-mutexes.patch
 create mode 100644 package/rpm/rpm-5.2.0_no-parentdirs.patch
 create mode 100644 package/rpm/rpm-5.2.0_ordering-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
 create mode 100644 package/rpm/rpm-5.2.0_short-circuit-c99.patch

Thanks,
-- 
Nigel Kukard
