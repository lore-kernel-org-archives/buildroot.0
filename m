From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:10:04 +0000 (UTC)
Subject: [Buildroot] [Bug 6320] Fix kernel compile issue if
 BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION/BR2_LINUX_KERNEL_SOURCE_DIR and
 BR2_LINUX_KERNEL_INTREE_DTS_NAME are defined
In-Reply-To: <bug-6320-163@https.bugs.busybox.net/>
References: <bug-6320-163@https.bugs.busybox.net/>
Message-ID: <20131114001004.D52F69BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6320

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:10:04 UTC ---
Where is BR2_LINUX_KERNEL_SOURCE_DIR coming from? We don't have this
configuration option in mainline Buildroot, it seems.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
