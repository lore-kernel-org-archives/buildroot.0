From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Aug 2014 21:50:38 +0200
Subject: [Buildroot] [PATCH 0 of 3 v2 for 2014.08] Manual improvements part 4
Message-ID: <patchbomb.1409341838@localhost>
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
- reworking the 'Customizing the generated target filesystem' section to
  emphasize the recommendations of rootfs-overlay + post-build
- rework the rest of the chapter as there is some duplicate and inconsistent
  information.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (3)
  manual/user guide/customization: expand introduction text
  manual/user guide/customization: add section with recommended dir structure
  manual/user guide/customization: rework section on BR2_EXTERNAL

 docs/manual/customize-directory-structure.txt |  59 ++++++++++++
 docs/manual/customize-outside-br.txt          |  90 ++++++------------
 docs/manual/customize.txt                     |  39 ++++++-
 3 files changed, 121 insertions(+), 67 deletions(-)
