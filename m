From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Dec 2009 14:24:29 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20091215142429.965BB7780C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803





--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-12-15 14:24:28 UTC ---
Could you add -DLUA_USE_DLOPEN to MYCFLAGS?
That way we'll enable the extension loader for shared objects which we most
definitely want.
Otherwise it's working good now for me.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
