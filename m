From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Aug 2009 19:27:25 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090803192725.B7E1F77812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527





--- Comment #10 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-08-03 19:27:25 UTC ---
My mistake, DNSMASQ_INSTALL_TARGET_OPT is required since it doesn't understand
install-strip.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
