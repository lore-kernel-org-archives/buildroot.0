From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:15 +0100
Subject: [Buildroot] [PATCH 44/55] Add network scripting folders to
	fs/skeleton
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0de22121b72a0f2b6e8998510883a44150f67e81.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegor_sub1@visionsystems.de>

Those folders are currently created using makedevs according to the
specifications in device_table.txt. However, as makedevs is no longer
executed when dynamic device creation methods are selected (devtmpfs,
udev, mdev), those folders must be created differently. We choose to
put them directly into the default filesystem skeleton.

Signed-off-by: Yegor Yefremov <yegor_sub1@visionsystems.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
