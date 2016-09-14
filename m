From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Sep 2016 19:07:22 +0000
Subject: [Buildroot] [Bug 9251] Shared C++ libraries for Microblaze results
 in Segmentation Fault
In-Reply-To: <bug-9251-163@https.bugs.busybox.net/>
References: <bug-9251-163@https.bugs.busybox.net/>
Message-ID: <bug-9251-163-u7w4raTjVw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9251

--- Comment #1 from scotttimothye at johndeere.com ---
If you follow up the previous steps by defining "static-only" libraries, then
the C++ app works:

1) make menuconfig
2) Build Options > Libraries > static only
3) make clean
4) (See previous steps for build steps)
5) ./hello
-> No seg fault

-- 
You are receiving this mail because:
You are on the CC list for the bug.
