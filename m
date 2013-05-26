From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 08:46:33 +0000 (UTC)
Subject: [Buildroot] [Bug 5138] Add dropbear config option to allow blank
	passwords
In-Reply-To: <bug-5138-163@https.bugs.busybox.net/>
References: <bug-5138-163@https.bugs.busybox.net/>
Message-ID: <20130526084633.251739A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5138

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 08:45:22 UTC ---
Since https://secure.ucc.asn.au/hg/dropbear/rev/c58a15983808, the compile-time
option to allow blank password no longer exists. It has been replaced by the
runtime option -B.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
