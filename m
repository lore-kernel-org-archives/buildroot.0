From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Jun 2014 17:32:49 +0000 (UTC)
Subject: [Buildroot] [Bug 7136] ecryptfs-utils needs gettext to run when
 glibc/eglibc is used
In-Reply-To: <bug-7136-163@https.bugs.busybox.net/>
References: <bug-7136-163@https.bugs.busybox.net/>
Message-ID: <20140601173249.8890B9CD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7136

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-06-01 17:32:49 UTC ---
I've already cooked some patches doing that, they were tested by the bug
submitter (on IRC). Will submit them soon as part as a new version of my
gettext related changes.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
