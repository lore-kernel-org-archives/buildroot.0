From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 09:50:06 +0200
Subject: [Buildroot] [git commit] ARC: update folders with patches for
	arc-2015.06-rc1 release
Message-ID: <20150701075016.1CE66817E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=837654c2bfd564fba47857caf7cacbb2cb737082
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In buildroot we maintain a couple off-the-tree patches.
In particular for binutils and gcc packages.

Because we have many versions of mentioned packages patches for each
particular version reside in a folder which name matches full version
name of the package.

For example we used to have patches for binutils distributed as part of
arc-2014.12 tools in folder ""package/binutils/arc-2014.12". Now with
bump of ARC tools version we need to rename folder with patches to
"arc-2015.06-rc1".

The same applies to gcc.

Should fix http://autobuild.buildroot.net/results/2b2/2b27a4a64c0b225ae479ecfccf7a97f5ea95598c/
As discussed before it's not possible to reproduce reported problem on recent
Fedora 21/22 distros (at least we know about them) but I may confirm that
patches were applied fine and everything was built well. Hopefully reported
build failure goes away now.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-PR-other-56780.patch                      |    0
 .../600-poison-system-directories.patch            |    0
 .../100-libstdcxx-uclibc-c99.patch                 |    0
 .../851-PR-other-56780.patch                       |    0
 .../910-gcc-poison-system-directories.patch        |    0
 5 files changed, 0 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
