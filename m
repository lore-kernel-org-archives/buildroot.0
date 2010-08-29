From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Aug 2010 09:23:12 +0000 (UTC)
Subject: [Buildroot] [Bug 1747] external toolchain does not include mtd-util
	headers
In-Reply-To: <bug-1747-163@https.bugs.busybox.net/>
References: <bug-1747-163@https.bugs.busybox.net/>
Message-ID: <20100829092312.699848A2DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1747

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I've tried to build U-Boot fw_printenv utility in Buildroot using a internal
Buildroot toolchain and it just works. Could you post the Buildroot
configuration that fails for you ?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
