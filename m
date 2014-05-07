From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  7 May 2014 07:22:28 +0000 (UTC)
Subject: [Buildroot] [Bug 6230] Cannot compile gcc without threads
	(uClibc-based)
In-Reply-To: <bug-6230-163@https.bugs.busybox.net/>
References: <bug-6230-163@https.bugs.busybox.net/>
Message-ID: <20140507072229.00CAC9CB20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6230

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-05-07 07:22:28 UTC ---
I recently got my hand on an EFM32 development board, which has a Cortex-M3
capable of running a mainline Linux kernel. Using this, I'm hoping to
progressively improve the support for ARM noMMU in Buildroot. Probably a topic
for the next release cycle, though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
