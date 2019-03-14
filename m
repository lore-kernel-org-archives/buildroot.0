From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:38:12 +0100
Subject: [Buildroot] [git commit] package/systemd: fix patch series order
Message-ID: <20190314213514.BA1938ED40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8085b9eaa4ad172f1a8de0696b917bd8b2c1b9be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the removal of old patches, 0018 should be 0002 and 0019 should be 0003.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch} | 0
 ...ch => 0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch b/package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
similarity index 100%
rename from package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
rename to package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
diff --git a/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch b/package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
similarity index 100%
rename from package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
rename to package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
