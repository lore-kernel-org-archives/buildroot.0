From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 24 Sep 2010 09:39:49 +0200
Subject: [Buildroot] [PATCH 4/4] Add network scripting folders to fs/skeleton
In-Reply-To: <4C9C558A.7050009@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
	<4C9C553E.8040105@visionsystems.de>
	<4C9C558A.7050009@visionsystems.de>
Message-ID: <4C9C55C5.907@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those folders by device_table.txt. If using the dynamic device creation method
these folders will be missing.
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
1.7.1.1
