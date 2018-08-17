From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2018 21:35:49 +0000
Subject: [Buildroot] [Bug 11246] Glibc 2.28 - fails to build host-bison and
 host-m4
In-Reply-To: <bug-11246-163@https.bugs.busybox.net/>
References: <bug-11246-163@https.bugs.busybox.net/>
Message-ID: <bug-11246-163-i3mipGmH2a@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11246

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Separate bugs for bison and m4 would have been better. Indeed, m4 is already
fixed:
https://git.buildroot.org/buildroot/commit/?id=c48f8a64626c60bd1b46804b7cf1a699ff53cdf3,
but Bison is not fixed yet.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
