From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Jul 2010 09:22:59 +0000 (UTC)
Subject: [Buildroot] [Bug 583] build fails with external x86_64 toolchain
In-Reply-To: <bug-583-163@https.bugs.busybox.net/>
References: <bug-583-163@https.bugs.busybox.net/>
Message-ID: <20100715092259.308A08295F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=583

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=914f19ca1ea648d451bfa2ab232dbf1cc1fed351.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
