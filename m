From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Feb 2013 13:52:04 +0000 (UTC)
Subject: [Buildroot] [Bug 5960] fusion.ko driver does not install to target
	rootfs
In-Reply-To: <bug-5960-163@https.bugs.busybox.net/>
References: <bug-5960-163@https.bugs.busybox.net/>
Message-ID: <20130222135204.CC8659AC4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5960

--- Comment #2 from broot at monkster.hopto.org 2013-02-22 13:52:29 UTC ---
Any? config, select kernel to build (dependancy of fusion) and then fusion
package in graphics packages (BR2_PACKAGE_LINUX_FUSION)

fusion.ko would build in
buildroot-2012.11/output/build/linux-fusion-8.10.4/linux/drivers/char/fusion
however fusion.o will be installed to target.

I don't remember which release this started to show in, but some older releases
did it correctly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
