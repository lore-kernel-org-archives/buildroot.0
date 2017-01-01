From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Jan 2017 13:51:20 +0000
Subject: [Buildroot] [Bug 9541] Platform drivers autoloading from info in
 device tree does not work
In-Reply-To: <bug-9541-163@https.bugs.busybox.net/>
References: <bug-9541-163@https.bugs.busybox.net/>
Message-ID: <bug-9541-163-V33VrL4jZC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

--- Comment #4 from Artem Synytsyn <a.synytsyn@gmail.com> ---
Now it works! Really, problem was in BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
option. Thank you very much!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
