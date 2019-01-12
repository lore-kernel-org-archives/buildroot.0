From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 12 Jan 2019 09:21:22 +0000
Subject: [Buildroot] [Bug 11616] 2018.02.09 fails to build libzlib with full
 RELRO protection
In-Reply-To: <bug-11616-163@https.bugs.busybox.net/>
References: <bug-11616-163@https.bugs.busybox.net/>
Message-ID: <bug-11616-163-bSDIQsHtIO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11616

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Matt: the bug is reported against 2018.02.9, i.e the LTS branch and not 2018.11
or master. Back in 2018.02.x, the support in the wrapper for RELRO was not
there.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
