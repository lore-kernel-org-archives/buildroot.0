From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Add network scripting folders
	to fs/skeleton
Message-ID: <20101217160205.0176A8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32a8c0119fce072ea9c91bcf40dcd5c912662fb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those folders are currently created using makedevs according to the
specifications in device_table.txt. However, as makedevs is no longer
executed when dynamic device creation methods are selected (devtmpfs,
udev, mdev), those folders must be created differently. We choose to
put them directly into the default filesystem skeleton.

Signed-off-by: Yegor Yefremov <yegor_sub1@visionsystems.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 fs/skeleton/etc/network/if-down.d/.empty
 create mode 100644 fs/skeleton/etc/network/if-post-down.d/.empty
 create mode 100644 fs/skeleton/etc/network/if-pre-up.d/.empty
 create mode 100644 fs/skeleton/etc/network/if-up.d/.empty

diff --git a/fs/skeleton/etc/network/if-down.d/.empty b/fs/skeleton/etc/network/if-down.d/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/fs/skeleton/etc/network/if-post-down.d/.empty b/fs/skeleton/etc/network/if-post-down.d/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/fs/skeleton/etc/network/if-pre-up.d/.empty b/fs/skeleton/etc/network/if-pre-up.d/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/fs/skeleton/etc/network/if-up.d/.empty b/fs/skeleton/etc/network/if-up.d/.empty
new file mode 100644
index 0000000..e69de29
-- 
1.7.2.2
