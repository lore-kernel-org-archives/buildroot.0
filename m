From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Jul 2010 18:22:34 +0000 (UTC)
Subject: [Buildroot] [Bug 729] sstrip creates corrupted headers
In-Reply-To: <bug-729-163@https.bugs.busybox.net/>
References: <bug-729-163@https.bugs.busybox.net/>
Message-ID: <20100713182234.AF6BD82927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=729

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Quite likely fixed by
http://git.buildroot.net/buildroot/commit/?id=c0e307b848d8de23e6f10a179c4f240c023c8b82

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
