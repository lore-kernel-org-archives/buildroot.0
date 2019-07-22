From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jul 2019 21:07:18 +0000
Subject: [Buildroot] [Bug 12051] Build succeeds but leaves a temporary
 libtool wrapper script for dhcp in the rootfs
In-Reply-To: <bug-12051-163@https.bugs.busybox.net/>
References: <bug-12051-163@https.bugs.busybox.net/>
Message-ID: <bug-12051-163-D2Mytgj8Bc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12051

--- Comment #2 from jakobcornell at gmail.com ---
Created attachment 8176
  --> https://bugs.busybox.net/attachment.cgi?id=8176&action=edit
dhcpd wrapper script

This is the libtool wrapper script that ends up at
`output/target/usr/sbin/dhcpd` in place of an executable. Gzipped.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
