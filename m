From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 20:24:03 +0200
Subject: [Buildroot] [git commit] Clean up naming of old GENTARGETS
	infrastructure
Message-ID: <20120717183720.4F28196A8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2359e1223f622c8984f235fd8ddfb40a8e1cdc7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the renaming of XXXTARGETS to xxx-package, the names of the
pkg-xxx.mk files is inconsistent, as well as some internal names in
the documentation.  These inconsistencies are cleaned up here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 ...kages-autotargets.txt => adding-packages-autotools.txt} |    4 ++--
 ...packages-cmaketargets.txt => adding-packages-cmake.txt} |    4 ++--
 docs/manual/adding-packages-directory.txt                  |   12 ++++++------
 ...packages-gentargets.txt => adding-packages-generic.txt} |    4 ++--
 docs/manual/adding-packages.txt                            |    6 +++---
 package/Makefile.in                                        |    6 +++---
 package/{pkg-autotargets.mk => pkg-autotools.mk}           |    0
 package/{pkg-cmaketargets.mk => pkg-cmake.mk}              |    0
 package/{pkg-gentargets.mk => pkg-generic.mk}              |    0
 9 files changed, 18 insertions(+), 18 deletions(-)
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...totargets.txt => adding-packages-autotools.txt} |    4 ++--
 ...-cmaketargets.txt => adding-packages-cmake.txt} |    4 ++--
 docs/manual/adding-packages-directory.txt          |   12 ++++++------
 ...-gentargets.txt => adding-packages-generic.txt} |    4 ++--
 docs/manual/adding-packages.txt                    |    6 +++---
 package/Makefile.in                                |    6 +++---
 package/{pkg-autotargets.mk => pkg-autotools.mk}   |    0
 package/{pkg-cmaketargets.mk => pkg-cmake.mk}      |    0
 package/{pkg-gentargets.mk => pkg-generic.mk}      |    0
 9 files changed, 18 insertions(+), 18 deletions(-)

Patch is too large, so refusing to show it
