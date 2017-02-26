From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 20:15:10 +0000
Subject: [Buildroot] [Bug 9251] Shared C++ libraries for Microblaze results
 in Segmentation Fault
In-Reply-To: <bug-9251-163@https.bugs.busybox.net/>
References: <bug-9251-163@https.bugs.busybox.net/>
Message-ID: <bug-9251-163-pyOn59Ivd0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9251

mail at waldemar-brodkorb.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #5 from mail at waldemar-brodkorb.de ---
I checked with master on x86_64 host.
With gcc 5.x and binutils 2.25.1/2.26.1/2.27.
I couldn't reproduce the segfault anymore.

So may be reopen it with exact version of buildroot, gcc, binutils and
C library used. And if it is happening on x86 or x86_64 host.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
