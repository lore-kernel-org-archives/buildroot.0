From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Mar 2010 13:58:18 +0000 (UTC)
Subject: [Buildroot] [Bug 1453] OpenSSL0.9.8n fails to compile
In-Reply-To: <bug-1453-163@https.bugs.busybox.net/>
References: <bug-1453-163@https.bugs.busybox.net/>
Message-ID: <20100331135818.44ACE8A6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1453





--- Comment #1 from Nazarenko Nikita <nnazarenko@radiofid.ru>  2010-03-31 13:58:17 UTC ---
Workaround:
Add UCLIBC_SUSv3_LEGACY=y string to output/toolchain/uClibc-0.9.30.3/.config


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
