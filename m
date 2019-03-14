From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 14 Mar 2019 17:31:31 -0400
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix patch series order
Message-ID: <20190314213131.85663-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

With the removal of old patches, 0018 should be 0002 and 0019 should be 0003.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...02-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch} | 0
 ...03-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/systemd/{0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch => 0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch} (100%)
 rename package/systemd/{0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch => 0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch} (100%)

diff --git a/package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch b/package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
similarity index 100%
rename from package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
rename to package/systemd/0002-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
diff --git a/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch b/package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
similarity index 100%
rename from package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
rename to package/systemd/0003-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
-- 
2.20.1
