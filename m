From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 28 Jan 2018 22:38:05 +0000
Subject: [Buildroot] [Bug 10116] Could not allocate block in ext2 filesystem
 while writing file "aoe.ko"
In-Reply-To: <bug-10116-163@https.bugs.busybox.net/>
References: <bug-10116-163@https.bugs.busybox.net/>
Message-ID: <bug-10116-163-xntud6ITOd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10116

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
You can increase the size of the ext2 filesystem by setting
BR2_TARGET_ROOTFS_EXT2_SIZE (filesysystem images->ext2/3/4->exact size) to a
bigger value.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
