From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jan 2016 12:04:44 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-GzVXCXlQHs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #4 from Luca Ceresoli <luca@lucaceresoli.net> ---
I confirm the bug on current master. It triggers only if libcap-dev in
installed on the build host.

Patch sent: http://patchwork.ozlabs.org/patch/562348/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
