From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Dec 2020 09:33:42 +0000
Subject: [Buildroot] [Bug 13366] make pkg-stats: unrelated CVEs linked to
 linux package
In-Reply-To: <bug-13366-163@https.bugs.busybox.net/>
References: <bug-13366-163@https.bugs.busybox.net/>
Message-ID: <bug-13366-163-SLIxGmDRYV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13366

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks for your feedback. This sorting is just doing alphabetic sorting I
believe, so it doesn't make much sense for CVEs. It's a bit like sorting the
"Current version" or "Latest version" columns: it doesn't do anything useful.
We should perhaps disable the sorting on some columns.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
