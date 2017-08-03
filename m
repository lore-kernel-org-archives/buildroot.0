From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 11:26:01 +0000
Subject: [Buildroot] [Bug 10156] glibc compilation fails for X86 32bits
	(i386)
In-Reply-To: <bug-10156-163@https.bugs.busybox.net/>
References: <bug-10156-163@https.bugs.busybox.net/>
Message-ID: <bug-10156-163-AIipH1Nkgq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10156

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. Since the regression was introduced between
2017.02.3 and 2017.02.5, could you do a "git bisect" to find where the problem
is ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
