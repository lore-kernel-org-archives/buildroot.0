From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:28:46 +0100
Subject: [Buildroot] [git commit] package: fix alphabetical ordering after
	libevdev addition
Message-ID: <20131226222904.5BC439C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9ddd28bb1247f4b9e2ee6557c27f8739cc58d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bcbaea1..8033b16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,8 +706,8 @@ source "package/libcofi/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libev/Config.in"
-source "package/libevent/Config.in"
 source "package/libevdev/Config.in"
+source "package/libevent/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
