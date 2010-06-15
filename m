From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Jun 2010 12:59:52 +0000 (UTC)
Subject: [Buildroot] [Bug 2059] busybox fails to link with gcc 4.4.x
In-Reply-To: <bug-2059-163@https.bugs.busybox.net/>
References: <bug-2059-163@https.bugs.busybox.net/>
Message-ID: <20100615125952.942AB80E3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2059

Nazarenko Nikita <nnazarenko@radiofid.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Nazarenko Nikita <nnazarenko@radiofid.ru>  ---
problem disappeared after removing output directory and setting correct config
file for uClibc

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
