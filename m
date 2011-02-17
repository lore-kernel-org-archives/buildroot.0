From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Feb 2011 21:23:10 +0000 (UTC)
Subject: [Buildroot] [Bug 3265] After enabling IPv6 support in the master
 configuration, uClibc has IPv6 disabled
In-Reply-To: <bug-3265-163@https.bugs.busybox.net/>
References: <bug-3265-163@https.bugs.busybox.net/>
Message-ID: <20110217212310.CA9338F5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3265

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Ok, with uClibc 0.9.31 it also works here. Does it really not work for you?

make O=test menuconfig, toolchain->Enable IPv6 support, save
make O=test uclibc-menuconfig, Networking support, check that IPv6 is enabled

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
