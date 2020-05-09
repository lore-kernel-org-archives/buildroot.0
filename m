From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 09 May 2020 09:58:43 +0000
Subject: [Buildroot] [Bug 12866] should we be disabling bash executable path
 caching?
In-Reply-To: <bug-12866-163@https.bugs.busybox.net/>
References: <bug-12866-163@https.bugs.busybox.net/>
Message-ID: <bug-12866-163-Z5q1kCHvvV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12866

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I don't quite follow what Buildroot can do here, i.e how would we disable this
bash caching functionnality from the system-provided bash? I'm not even sure it
makes sense for us to do this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
