From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jun 2018 23:05:56 +0000
Subject: [Buildroot] [Bug 11121] statfs call corrupts memory struct statfs
 too small
In-Reply-To: <bug-11121-163@https.bugs.busybox.net/>
References: <bug-11121-163@https.bugs.busybox.net/>
Message-ID: <bug-11121-163-ftCB4j2vVM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11121

--- Comment #2 from Geoff Levand <geoff@infradead.org> ---
I reported the problem on the uclibc-ng ML:

  https://mailman.uclibc-ng.org/pipermail/devel/2018-June/001702.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
