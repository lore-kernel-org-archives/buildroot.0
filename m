From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 21:01:14 +0000
Subject: [Buildroot] [Bug 10551] PowerPC SPE and Musl
In-Reply-To: <bug-10551-163@https.bugs.busybox.net/>
References: <bug-10551-163@https.bugs.busybox.net/>
Message-ID: <bug-10551-163-9kTbBm7qCi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
PowerPC SPE support has been dropped from gcc, so there's no real interest in
fixing that further. See
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b31d0348ddada49453e3edaaf93a423fdc61dc79.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
