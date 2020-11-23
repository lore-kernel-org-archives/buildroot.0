From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Nov 2020 21:15:27 +0000
Subject: [Buildroot] [Bug 13336] thermald-1.9.1 compilation failure with
 musl 1.2.1
In-Reply-To: <bug-13336-163@https.bugs.busybox.net/>
References: <bug-13336-163@https.bugs.busybox.net/>
Message-ID: <bug-13336-163-xZbQEtKp9p@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13336

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Thanks for the bug report, see [1] for suggested buildroot patch/fix (using the
upstream commit instead of the yocto patch)...

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20201123211248.23828-1-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
