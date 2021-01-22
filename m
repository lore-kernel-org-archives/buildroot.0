From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Jan 2021 09:14:56 +0000
Subject: [Buildroot] [Bug 13211] buildroot 2020.02.6 systemd segment fault
 after cross compiled
In-Reply-To: <bug-13211-163@https.bugs.busybox.net/>
References: <bug-13211-163@https.bugs.busybox.net/>
Message-ID: <bug-13211-163-QJciYrmFNm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13211

--- Comment #2 from Jeff WANG <wdqfirst@163.com> ---
This issue is fixed, it's caused by a bug of our customized toolchain.

(In reply to Peter Korsgaard from comment #1)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
