From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 20:23:00 +0000 (UTC)
Subject: [Buildroot] [Bug 1141] BusyBox based initramfs generation
In-Reply-To: <bug-1141-163@https.bugs.busybox.net/>
References: <bug-1141-163@https.bugs.busybox.net/>
Message-ID: <20100607202300.101ED8B8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1141

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, so I'm closing this bug, marking as WONTFIX. The rationale is that we don't
want to enter into the game where Buildroot would build two separate
filesystems.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
