From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 15:18:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] make performs library lookup in the build
 and host library directores and not in the staging area
In-Reply-To: <bug-5006-163@https.bugs.busybox.net/>
References: <bug-5006-163@https.bugs.busybox.net/>
Message-ID: <20130526151840.49AF89A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 15:17:31 UTC ---
As per the discussion in #4922, we really don't want to be building a host
make, so the problem discussed in this bug should be solved upstream with the
GNU make developers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
