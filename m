From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 06:45:58 +0000 (UTC)
Subject: [Buildroot] [Bug 7166] hostapd: segfault when using RT5370
In-Reply-To: <bug-7166-163@https.bugs.busybox.net/>
References: <bug-7166-163@https.bugs.busybox.net/>
Message-ID: <20140604064558.1BFA99CE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7166

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2014-06-04 06:45:57 UTC ---
I don't know much about hostapd, but from the looks of it that patch seems
trivial to backport to the 2.1 release, so we could add it as a patch in
buildroot until the next hostapd release.

Care to send a patch doing that?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
