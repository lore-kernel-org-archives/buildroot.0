From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2016 19:59:00 +0000
Subject: [Buildroot] [Bug 9251] Shared C++ libraries for Microblaze results
 in Segmentation Fault
In-Reply-To: <bug-9251-163@https.bugs.busybox.net/>
References: <bug-9251-163@https.bugs.busybox.net/>
Message-ID: <bug-9251-163-hDDb9rYcL0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9251

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Waldemar has identified that this is a regression between binutils 2.25 and
binutils 2.26. I.e, with binutils 2.25, C++ programs linked dynamically work
fine on Microblaze. Starting with binutils 2.26, they no longer work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
