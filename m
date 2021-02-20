From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Feb 2021 16:45:34 +0000
Subject: [Buildroot] [Bug 13541] 2021.02.rc2: irqbalance: Daemon couldn't be
 bound to the file-based socket
In-Reply-To: <bug-13541-163@https.bugs.busybox.net/>
References: <bug-13541-163@https.bugs.busybox.net/>
Message-ID: <bug-13541-163-RyWiFSWgck@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13541

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Thanks for the bug report and suggested fix, suggested patches can
be found here [1] (sysv) and [2] (systemd).

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20210220163349.25244-1-ps.report at gmx.net/
[2]
https://patchwork.ozlabs.org/project/buildroot/patch/20210220163349.25244-2-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
