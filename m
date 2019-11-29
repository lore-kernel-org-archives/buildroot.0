From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Nov 2019 07:35:21 +0000
Subject: [Buildroot] [Bug 12146] Oprofile runtime issue
In-Reply-To: <bug-12146-163@https.bugs.busybox.net/>
References: <bug-12146-163@https.bugs.busybox.net/>
Message-ID: <bug-12146-163-44iRTmFcvT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12146

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report. This seems like a kernel configuration issue. Did
you had CONFIG_OPROFILE=y in your kernel configuration?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
