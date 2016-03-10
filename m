From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 13:53:30 +0000
Subject: [Buildroot] [Bug 8751] make fail
In-Reply-To: <bug-8751-163@https.bugs.busybox.net/>
References: <bug-8751-163@https.bugs.busybox.net/>
Message-ID: <bug-8751-163-cUVYF5Oh5i@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8751

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
If all you need is gdb, why do you enable fio in your configuration, which is
completely unrelated?

fio indeed doesn't build for SuperH, I think we are simply going to disallow
the selection of fio on SuperH.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
