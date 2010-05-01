From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 May 2010 20:50:53 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20100501205053.AA6FA8B3FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803

--- Comment #8 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Sure about that?
lua/luac just link to liblua.so only when it's built.
When the SHARED option is disabled liblua.so isn't built so they just link
statically against liblua.a ...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
