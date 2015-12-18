From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 16:09:56 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-uRcgv1Kkcj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
If it tries to build fakeroot 1.20.2, then surely you're not using Buildroot
2015.11, but the master branch, right ?

And if that's the case, can you update your master branch, to make sure you
also have commit
https://git.busybox.net/buildroot/commit/package/fakeroot?id=c994c3db1f7d76b5dfe79e3b1133d66fdd06212c
?

Also, you should not use Buildroot using the root user on your machine.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
