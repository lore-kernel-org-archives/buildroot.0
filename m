From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Feb 2011 22:40:24 +0000 (UTC)
Subject: [Buildroot] [Bug 3205] Failing chmod when running "make" in
 buildroot (openssl). /usr/lib should have been /usr/lib64
In-Reply-To: <bug-3205-163@https.bugs.busybox.net/>
References: <bug-3205-163@https.bugs.busybox.net/>
Message-ID: <20110223224024.2BC898F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3205

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed fix by Gustavo, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
