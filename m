From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2016 20:02:51 +0000
Subject: [Buildroot] [Bug 9291] perl: SysV message queues not configured,
 even if available
In-Reply-To: <bug-9291-163@https.bugs.busybox.net/>
References: <bug-9291-163@https.bugs.busybox.net/>
Message-ID: <bug-9291-163-xpyEcfwJvV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9291

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fran?ois Perrad, who takes care of the Perl packaging in Buildroot, has
reported the issue upstream: https://github.com/arsv/perl-cross/issues/41. A
fix has already been committed in perl-cross upstream, we need to backport it
in Buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
