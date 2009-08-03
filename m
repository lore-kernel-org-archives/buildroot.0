From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Aug 2009 18:36:22 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090803183623.1B19777812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527





--- Comment #7 from Daniele Salvatore Albano <d.albano@gmail.com>  2009-08-03 18:36:22 UTC ---
Hi,

i've converted the package to new autotools format, actually it works with and
without dbus with my external toolchain.

Can someone check if it works with buildroot toolchain?

The attached file isin't a patch but he entire .mk file


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
