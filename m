From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 08:43:58 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090807084358.C1E03774E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #3 from Will Newton <will.newton@gmail.com>  2009-08-07 08:43:57 UTC ---

gtkdocize is attempting to run, it's just not in the path, see "Warning: not
running gtk-docize."

Should we depend on host-libgtk2 to make sure gtkdocize is available?

For now installing gtkdocize in your host system should let you build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
