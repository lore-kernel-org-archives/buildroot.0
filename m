From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 21:25:46 +0000
Subject: [Buildroot] [Bug 10136] can't compile systemd with GCC 7.X when
 optimization is on
In-Reply-To: <bug-10136-163@https.bugs.busybox.net/>
References: <bug-10136-163@https.bugs.busybox.net/>
Message-ID: <bug-10136-163-VrLl8Pddao@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is in systemd upstream by commit
https://github.com/systemd/systemd/commit/fb1b58820fc4622a3b7f54b4096943e4768505cb,
which is in systemd >= 235.

We are currently using version 234 of systemd in Buildroot, but we already have
a patch in patchwork updating it to version 236. Once this patch gets merged,
this bug will be fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
