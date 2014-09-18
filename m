From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:23 +0200
Subject: [Buildroot] [PATCH 00 of 13] manual: improvements in
 'Project-specific customization' section
Message-ID: <patchbomb.1411069163@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series makes improvements to the Project-specific customizations
chapter in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (13)
  manual: move 'Creating your own board support' from User to Developer guide
  manual/developer guide: minor rework of 'adding board support' section
  manual/user guide/customization: move section on storing configuration
  manual/user guide/customization: rework section on storing configuration
  manual/user guide/customization: re-order introduction
  manual/user guide/customization: add section on device/permission tables
  manual/user guide/customization: add section on users tables
  manual/user guide/customization: rename section 'Customizing packages'
  manual/user guide/customization: change recommendation for package paths
  manual/user guide/customization: add section on project-specific packages
  manual/user guide/customization: refer to dir structure from rootfs section
  manual/user guide/customization: rework 'step-by-step instructions'
  manual/user guide/customization: add section on layered customization

 docs/manual/adding-board-support.txt               |   38 +++
 docs/manual/customize-configuration.txt            |   62 +++++
 docs/manual/customize-device-permission-tables.txt |   30 ++
 docs/manual/customize-directory-structure.txt      |   64 ++++-
 docs/manual/customize-outside-br.txt               |   12 +-
 docs/manual/customize-packages.txt                 |  139 ++++------
 docs/manual/customize-patches.txt                  |   51 +---
 docs/manual/customize-quick-guide.txt              |  158 ++----------
 docs/manual/customize-rootfs.txt                   |    8 +
 docs/manual/customize-users-tables.txt             |   18 +
 docs/manual/customize.txt                          |   39 ++-
 docs/manual/makeusers-syntax.txt                   |    2 +-
 docs/manual/manual.txt                             |    2 +
 docs/manual/patch-policy.txt                       |    2 +-
 14 files changed, 349 insertions(+), 276 deletions(-)
