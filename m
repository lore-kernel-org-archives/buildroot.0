From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Mar 2021 21:09:02 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-PIrduroNbf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

--- Comment #8 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Geert Lens from comment #7)

No other advise at the moment as avoid the buggy (?) pre-build toolchains,
change to a buildroot build ones (and/or avoid/fix uclibc?), or patch openssh
according/specific to your toolchain/openssh failure (see suggested patch
above),
or disable seccomp-filter for openssh (did not investigate yet if or how it is
possible)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
