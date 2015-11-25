From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Nov 2015 13:56:36 +0000 (UTC)
Subject: [Buildroot] [Bug 8336] Default systemd configuration fails to boot
 correctly in 2015-08
In-Reply-To: <bug-8336-163@https.bugs.busybox.net/>
References: <bug-8336-163@https.bugs.busybox.net/>
Message-ID: <20151125135636.BCA2A7FC61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8336

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-25 13:56:36 UTC ---
The patch pointed by Vicente has been merged as of commit
http://git.buildroot.net/buildroot/commit/system?id=c5bd8af65e50a51735eb112fed9cbe6337f14e06.
This should fix this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
