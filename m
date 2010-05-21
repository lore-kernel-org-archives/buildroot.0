From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 16:29:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch fltk-fix-bug-1729
Message-ID: <cover.1274452131.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This commit fixes bug #1729 by fixing the FLTK build.

Thomas

The following changes since commit f3122259e2cbbc0be0fc02820a146b4e4f48bef6:
  Peter Korsgaard (1):
        mtd-utils: buildsystem is broken with parallel make (regarding libubi)

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fltk-fix-bug-1729

Thomas Petazzoni (1):
      fltk: fix build

 package/fltk/fltk-1.1.7-bail-out-on-error.patch |   54 +++++++++++++++++++++++
 package/fltk/fltk-1.1.7-disable-test.patch      |   17 +++++++
 package/fltk/fltk-1.1.7-scandir-fix.patch       |   20 ++++++++
 package/fltk/fltk-1.1.7-tests.patch             |   11 -----
 4 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100644 package/fltk/fltk-1.1.7-bail-out-on-error.patch
 create mode 100644 package/fltk/fltk-1.1.7-disable-test.patch
 create mode 100644 package/fltk/fltk-1.1.7-scandir-fix.patch
 delete mode 100644 package/fltk/fltk-1.1.7-tests.patch

Thanks,
-- 
Thomas Petazzoni
