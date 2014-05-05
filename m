From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  5 May 2014 12:14:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6842] Checking external toolchain for eabihf
In-Reply-To: <bug-6842-163@https.bugs.busybox.net/>
References: <bug-6842-163@https.bugs.busybox.net/>
Message-ID: <20140505121424.C0A2D9CAEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6842

--- Comment #9 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-05 12:14:23 UTC ---
Alternative patch submitted by Stefan S?rensen, updated and tested today by me:
http://patchwork.ozlabs.org/patch/345703/

This patch compiles a temporary object instead of using libm or crt1.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
