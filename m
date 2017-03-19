From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Mar 2017 20:49:40 +0000
Subject: [Buildroot] [Bug 9756] glibc fails to build on
 buildroot-sh4*-buildroot-linux-gnu
In-Reply-To: <bug-9756-163@https.bugs.busybox.net/>
References: <bug-9756-163@https.bugs.busybox.net/>
Message-ID: <bug-9756-163-HK0gA5T8J8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9756

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I was able to reproduce Uwe's problem, and the patch proposed by Waldemar
indeed fixes it.

Waldemar, will you send a patch adding this to our glibc package ? Is it also
needed for glibc 2.23 ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
