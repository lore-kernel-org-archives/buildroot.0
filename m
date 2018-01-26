From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Jan 2018 14:17:41 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-P8CgJA8rhD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #8 from Arnout Vandecappelle <arnout@mind.be> ---
Good catch! Can you try updating ccache, check if that fixes things for you,
and if so send the patch to the list with a reference to this bug in the commit
log?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
