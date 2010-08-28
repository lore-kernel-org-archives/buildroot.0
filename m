From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Aug 2010 22:15:45 +0000 (UTC)
Subject: [Buildroot] [Bug 2449] Minor fixes for squashfs makefile and
 correct PowerPC e500 setting in uclibc config
In-Reply-To: <bug-2449-163@https.bugs.busybox.net/>
References: <bug-2449-163@https.bugs.busybox.net/>
Message-ID: <20100828221545.C5A7687345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2449

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
thanks, committed squashfs and uclibc e500 fix. I'm not convinced about the
uclibc config workaround (atleast this close to a release)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
