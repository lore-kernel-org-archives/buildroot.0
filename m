From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 18:30:16 +0000
Subject: [Buildroot] [Bug 11836] Embedded Shell Scripts in BusyBox
In-Reply-To: <bug-11836-163@https.bugs.busybox.net/>
References: <bug-11836-163@https.bugs.busybox.net/>
Message-ID: <bug-11836-163-fF2N7Vonie@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11836

--- Comment #2 from Max <br-max@re-gister.com> ---
Beside the benefit of additional free space on the target filesystem (due to
the compression of the scripts), another advantage is that it is not necessary
to take care about script file permissions (there is no need to set
execute-permissions when the scripts are embedded into the BusyBox binary).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
