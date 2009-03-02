From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2009 16:42:30 +0000 (UTC)
Subject: [Buildroot] [Bug 73] Bump openssl package to the latest version
In-Reply-To: <bug-73-163@https.bugs.busybox.net/>
References: <bug-73-163@https.bugs.busybox.net/>
Message-ID: <20090302164230.C93247656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=73





--- Comment #10 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-03-02 16:42:30 UTC ---
Looks ok, though it still leaves openssldir pointing to /usr/lib/ssl rather
than the common approach of /etc/ssl.
Being mostly a configuration directory it should really reside in /etc/ssl.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
