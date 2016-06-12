From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Jun 2016 19:29:32 +0000
Subject: [Buildroot] [Bug 8986] qt5imageformats fails to build on
 aarch64_be-buildroot-linux-gnu
In-Reply-To: <bug-8986-163@https.bugs.busybox.net/>
References: <bug-8986-163@https.bugs.busybox.net/>
Message-ID: <bug-8986-163-YEfDlaEWG9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8986

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the report! However, it seems that it's not limited to AArch64
big-endian: AArch64 little-endian is also affected, see
http://autobuild.buildroot.net/?reason=qt5imageformats-5.6.0.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
