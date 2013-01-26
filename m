From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Jan 2013 22:50:03 +0000 (UTC)
Subject: [Buildroot] [Bug 4237] building shared openssl w/-Os fails due to
	gcc bug
In-Reply-To: <bug-4237-163@https.bugs.busybox.net/>
References: <bug-4237-163@https.bugs.busybox.net/>
Message-ID: <20130126225003.553909A715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4237

Mike Frysinger <vapier@gentoo.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
           See Also|                            |http://gcc.gnu.org/bugzilla
                   |                            |/show_bug.cgi?id=48308
         Resolution|                            |WORKSFORME
            Summary|http://gcc.gnu.org/bugzilla |building shared openssl
                   |/show_bug.cgi?id=48308      |w/-Os fails due to gcc bug

--- Comment #6 from Mike Frysinger <vapier@gentoo.org> 2013-01-26 22:50:25 UTC ---
removing -fPIC is wrong.  it produces bad shared library code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
