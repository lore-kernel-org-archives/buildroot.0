From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Jun 2020 08:17:59 +0000
Subject: [Buildroot] [Bug 13031] nodejs: RangeError at new ArrayBuffer()
In-Reply-To: <bug-13031-163@https.bugs.busybox.net/>
References: <bug-13031-163@https.bugs.busybox.net/>
Message-ID: <bug-13031-163-ePwS11YuLA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13031

--- Comment #1 from St?phane Veyret <sveyret@gmail.com> ---
Actually, the issue comes from optimization flag `-Ofast`.

See #13046

-- 
You are receiving this mail because:
You are on the CC list for the bug.
