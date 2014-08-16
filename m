From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Aug 2014 13:44:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140816134418.48B389D471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-08-16 13:44:17 UTC ---
Proposed patch was applied as commit
http://git.buildroot.net/buildroot/commit/?id=85448febb3c9f21e6e4082fc344b3ef46261c782.
Closing bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
