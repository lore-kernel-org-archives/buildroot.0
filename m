From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 27 Aug 2014 21:40:09 +0200
Subject: [Buildroot] [PATCH 0 of 2 for 2014.08] Manual improvements part 4
Message-ID: <patchbomb.1409168409@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This short series starts improving the 'Project-specific customizations'
chapter in the manual. Subsequent patches are planned (even for 2014.08) but
since the release is almost there I'm sending out patches as soon as they
are available, to give enough time for review.

Further changes planned:
- streamline explanation on BR2_EXTERNAL after the addition of the new
  section on directory structure.
- reworking the 'Customizing the generated target filesystem' section to
  emphasize the recommendations of rootfs-overlay + post-build
- rework the rest of the chapter as there is some duplicate and inconsistent
  information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (2)
  manual/user guide/customization: expand introduction text
  manual/user guide/customization: add section with recommended dir structure

 docs/manual/customize-directory-structure.txt |  58 +++++++++++++++++++
 docs/manual/customize.txt                     |  31 ++++++++-
 2 files changed, 83 insertions(+), 6 deletions(-)
