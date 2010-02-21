From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 19:03:54 +0000 (UTC)
Subject: [Buildroot] [Bug 729] sstrip creates corrupted headers
In-Reply-To: <bug-729-163@https.bugs.busybox.net/>
References: <bug-729-163@https.bugs.busybox.net/>
Message-ID: <20100221190354.80FA877766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=729





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 19:03:53 UTC ---
Does the resulting file runs properly on the target or not ?

I'm not sure what sstrip does compared to strip, but it might be that sstrip
strips things that confuse tools such as "file" while still allowing the
program to run properly.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
