From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 20:16:41 +0000 (UTC)
Subject: [Buildroot] [Bug 427] webkit: Update to WebKit svn r44552.
In-Reply-To: <bug-427-163@https.bugs.busybox.net/>
References: <bug-427-163@https.bugs.busybox.net/>
Message-ID: <20090802201641.5502A777C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=427


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-02 20:16:40 UTC ---
Committed, thanks.
Maybe we should simply let webkit depend on libgtk2 and use the libgtk2
dependencies to know if it should build for directfb or X, but that can wait.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
