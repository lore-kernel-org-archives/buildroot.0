From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Jun 2016 21:03:58 +0000
Subject: [Buildroot] [Bug 8971] build for beaglebone fails
In-Reply-To: <bug-8971-163@https.bugs.busybox.net/>
References: <bug-8971-163@https.bugs.busybox.net/>
Message-ID: <bug-8971-163-ySk9k7rxjH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8971

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Tested:

$ tar -xvjf buildroot-2016.05.tar.bz2
$ cd buildroot-2016.05
$ make beaglebone_defconfig
$ make

..and works (aborted after 'silentoldconfig Config.in' finished and
binutils-2.25.1.tar.bz2 download started), please try again (or with
the downloaded package instead of git?)...

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
