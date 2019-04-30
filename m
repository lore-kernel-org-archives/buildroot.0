From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Apr 2019 12:56:35 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-qZTrUdZkj7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #3 from Pete Morici <pmorici@dev295.com> ---
Do systemd and eudev only need libblkid from util-linux? Can that be broken out
into a separate package that they depend on?  It looks like you can select to
only build libblkid  using the configure line, "./configure
--disable-all-programs --enable-libblkid" for util-linux

-- 
You are receiving this mail because:
You are on the CC list for the bug.
