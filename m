From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 19:43:52 +0000 (UTC)
Subject: [Buildroot] [Bug 1231] (sparc) Linux kernel fails to build
In-Reply-To: <bug-1231-163@https.bugs.busybox.net/>
References: <bug-1231-163@https.bugs.busybox.net/>
Message-ID: <20100718194352.ED5A482B92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1231

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Can you still reproduce the issue with Buildroot 2010.05 ?

It seems to be either a toolchain bug or a kernel bug (more likely a toolchain
bug). Sparc support in Buildroot isn't widely used, as Sparc isn't used much in
the embedded space.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
