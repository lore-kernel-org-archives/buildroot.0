From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2019 23:28:42 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-2Iq7JPNCgl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

--- Comment #7 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Thomas Petazzoni from comment #6)

Considering that devmem2 is abandoneware and that after commits 2f6e3eae55 and
559856480b6 it is not used by any package or board in Buildroot I think we can
either leave it as is or simply drop the package. It can be resurrected later,
if necessary.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
