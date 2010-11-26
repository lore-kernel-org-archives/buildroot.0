From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Nov 2010 08:35:50 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] dialog 1.1 needs libtinfo from ncurses
In-Reply-To: <bug-2845-163@https.bugs.busybox.net/>
References: <bug-2845-163@https.bugs.busybox.net/>
Message-ID: <20101126083550.8A4ED8C9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org>  ---
Ok, resolving - thanks.
I have no problem with adding an option to add tinfo to the ncurses build, but
I don't want to add any new features this close to the 2010.11 release.

Could you send a patch adding optional tinfo build (E.G. with a config option)
to ncurses, then I'll apply post-2010.11 - Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
