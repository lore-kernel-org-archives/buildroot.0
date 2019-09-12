From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Sep 2019 20:52:21 +0000
Subject: [Buildroot] [Bug 12186] Raspberry Pi Zero-W build fails on newer
 kernel versions
In-Reply-To: <bug-12186-163@https.bugs.busybox.net/>
References: <bug-12186-163@https.bugs.busybox.net/>
Message-ID: <bug-12186-163-2hq8W3V7ED@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

Grzegorz Blach <grzegorz@blach.pl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|INVALID                     |---
             Status|RESOLVED                    |REOPENED

--- Comment #4 from Grzegorz Blach <grzegorz@blach.pl> ---
I'm sure it's a bug. Yesterday I tried to build SD image for RPi0W using master
branch and this failed. I've must applied a small patch to build RPi0W image
correctly.

Earlier I built RPi0W image on 30 August and this worked without the patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
