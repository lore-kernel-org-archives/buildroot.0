From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Jan 2018 22:28:43 +0000
Subject: [Buildroot] [Bug 10551] PowerPC SPE and Musl
In-Reply-To: <bug-10551-163@https.bugs.busybox.net/>
References: <bug-10551-163@https.bugs.busybox.net/>
Message-ID: <bug-10551-163-QBMfpWv70i@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Your patch only makes uses of those options for PowerPC SPE. The musl
documentation doesn't mention this to be SPE specific. This is what confuses
me.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
