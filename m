From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Jul 2010 18:21:56 +0000 (UTC)
Subject: [Buildroot] [Bug 955] Grub fails to build with External Toolchain
In-Reply-To: <bug-955-163@https.bugs.busybox.net/>
References: <bug-955-163@https.bugs.busybox.net/>
Message-ID: <20100713182157.0691382927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=955

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
The grub.mk file has been completely rewritten during the bootloaders-cleanup
work, and here Grub compiles properly with an external toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
