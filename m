From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Apr 2011 19:52:55 +0000 (UTC)
Subject: [Buildroot] [Bug 3643] popt source url is not responding
In-Reply-To: <bug-3643-163@https.bugs.busybox.net/>
References: <bug-3643-163@https.bugs.busybox.net/>
Message-ID: <20110424195256.08BF382A0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3643

Michael J. Hammel <mjhammel@graphics-muse.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |INVALID

--- Comment #4 from Michael J. Hammel <mjhammel@graphics-muse.org>  ---
Ugh.  This is my own fault.  I've been using OpenDNS for some time and now
their redirection to "search results" on failed lookups has bitten me.  I
switched my DNS server to Google Public DNS and sure enough after the failure
the backup download from Buildroot's archives worked.

FWIW, with OpenDNS the search results gets downloaded as a file and Buildroot
attempts to unpack it.  Not sure you can do anything to mediate this response
from a download attempt within Buildroot.

So this is a non-bug.  Apologies for not investigating better.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
