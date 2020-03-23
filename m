From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Mar 2020 00:27:11 +0000
Subject: [Buildroot] [Bug 12691] host-rust build fails
In-Reply-To: <bug-12691-163@https.bugs.busybox.net/>
References: <bug-12691-163@https.bugs.busybox.net/>
Message-ID: <bug-12691-163-M0sE8tAlzD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

--- Comment #2 from eyalroyee at gmail.com ---
I'm using arm, little endian, cortex a7 for raspberrypi2 and uclibc.
When I tried to use glibc over uclibc the build was successful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
