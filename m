From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jun 2018 19:33:49 +0000
Subject: [Buildroot] [Bug 11121] statfs call corrupts memory struct statfs
 too small
In-Reply-To: <bug-11121-163@https.bugs.busybox.net/>
References: <bug-11121-163@https.bugs.busybox.net/>
Message-ID: <bug-11121-163-x9MBlAGIZt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11121

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report. However, this doesn't look like a Buildroot bug,
but instead a uClibc-ng bug. Could you report it to uClibc-ng instead ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
