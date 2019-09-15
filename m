From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Sep 2019 12:55:20 +0000
Subject: [Buildroot] [Bug 12186] Raspberry Pi Zero-W build fails on newer
 kernel versions
In-Reply-To: <bug-12186-163@https.bugs.busybox.net/>
References: <bug-12186-163@https.bugs.busybox.net/>
Message-ID: <bug-12186-163-ebl0kWER8l@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=fcecfb66d1fb749426306dbea50fdeb37d4706d8.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
