From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2010 16:13:56 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes1
Message-ID: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f0bdacdb5b8fe0fbc276ed510fc58e9a219f5cf8:
  Peter Korsgaard (1):
        update for 2010.02-rc1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot misc-fixes1

Thomas Petazzoni (3):
      gtk-doc: add gtk-doc.m4 to satisfy aclocal
      Fix dependencies for TrapProto
      Bump TCL version and switch to the autotools infrastructure

 package/automake/automake.mk                       |    6 ++
 package/automake/gtk-doc.m4                        |   61 ++++++++++++++++++++
 .../{tcl-strtod.patch => tcl-8.4.19-strtod.patch}  |    0
 package/tcl/tcl-configure-syntax-error.patch       |   42 -------------
 package/tcl/tcl-strstr.patch                       |   11 ----
 package/tcl/tcl.mk                                 |   56 +++---------------
 package/x11r7/xproto_trapproto/Config.in           |    1 +
 package/x11r7/xproto_trapproto/xproto_trapproto.mk |    1 +
 8 files changed, 77 insertions(+), 101 deletions(-)
 create mode 100644 package/automake/gtk-doc.m4
 rename package/tcl/{tcl-strtod.patch => tcl-8.4.19-strtod.patch} (100%)
 delete mode 100644 package/tcl/tcl-configure-syntax-error.patch
 delete mode 100644 package/tcl/tcl-strstr.patch

Thanks,
-- 
Thomas Petazzoni
