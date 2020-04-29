From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2020 20:06:32 +0000
Subject: [Buildroot] [Bug 12826] nodejs-12.16.1: error: 'uv_sleep' was not
 declared in this scope
In-Reply-To: <bug-12826-163@https.bugs.busybox.net/>
References: <bug-12826-163@https.bugs.busybox.net/>
Message-ID: <bug-12826-163-n5z3EunHvq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for testing! I have reported the issue back to the develop who
contributed the libuv update that broke nodejs. Hopefully we will have a
solution soon.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
