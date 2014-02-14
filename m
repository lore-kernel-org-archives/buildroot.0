From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Feb 2014 12:06:36 +0000 (UTC)
Subject: [Buildroot] [Bug 6776] systemd error: static declaration of
 'execvpe' follows non-static declaration (uClibc)
In-Reply-To: <bug-6776-163@https.bugs.busybox.net/>
References: <bug-6776-163@https.bugs.busybox.net/>
Message-ID: <20140214120636.3F4B09CA03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6776

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-14 12:06:36 UTC ---
The patch referred to in comment #1 has been merged:
http://git.buildroot.org/buildroot/commit/?id=55ad3cfd3f9809f4a1f0210fe7c7110d147c54f6

This should fix the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
