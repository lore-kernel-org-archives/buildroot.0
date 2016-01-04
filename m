From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jan 2016 18:43:21 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-BDbi2nVbhc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #5 from Ricardo Martincoski <ricardo0y-buildroot@yahoo.com.br> ---
(In reply to Vicente Olivert Riera from comment #2)
I propose a different approach: disable the detection of sys/capability.h
provided by libcap-dev.
https://patchwork.ozlabs.org/patch/562657/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
