From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Aug 2014 21:39:51 +0200
Subject: [Buildroot] [PATCH 0 of 3 for 2014.08] Manualimprovements part 3
Message-ID: <patchbomb.1408563591@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a third series of manual improvements, to be applied on top of the
second series (currently not yet applied).

Additional changes I'm planning but may not be ready in time for the
release:
- Rework the 'General Buildroot usage' chapter
- Rework the 'Project-specific customization' chapter.
- Revive the 'Beyond Buildroot' rework patch that has been sent to the list
  a long while back. This will certainly not be ready before the release.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (3)
  manual/user guide: rework 'Configuration of other components' chapter
  manual: file organization: avoid unnecessary indirection
  manual: file organization: rename files to match new section title

 docs/manual/configure-other-components.txt |  52 ++++++++++++++++++++++
 docs/manual/configure.txt                  |   9 ---
 docs/manual/customize-busybox-config.txt   |  26 -----------
 docs/manual/customize-kernel-config.txt    |  15 ------
 docs/manual/customize-uclibc-config.txt    |  33 -------------
 docs/manual/developer-guide.txt            |  12 -----
 docs/manual/manual.txt                     |  26 +++++++++-
 docs/manual/using.txt                      |   0 
 docs/manual/get-involved.txt               |   0 
 docs/manual/starting-up.txt                |   9 ---
 docs/manual/working-with.txt               |  11 ----
 11 files changed, 74 insertions(+), 119 deletions(-)
