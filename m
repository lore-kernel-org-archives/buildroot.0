From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Jun 2015 08:30:26 +0000 (UTC)
Subject: [Buildroot] [Bug 8151] x86-64 make fails with ncurses 5.9
In-Reply-To: <bug-8151-163@https.bugs.busybox.net/>
References: <bug-8151-163@https.bugs.busybox.net/>
Message-ID: <20150602083026.600D7801D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8151

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> 2015-06-02 08:30:26 UTC ---
Please try with the final 2015.05 release instead of RC3, as I merged a fix for
this shortly before the release:

http://git.buildroot.net/buildroot/commit/?id=4297e7298edbef6dde75d8bf468441c6a242da5c

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
