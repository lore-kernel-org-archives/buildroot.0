From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 12:40:24 +0000 (UTC)
Subject: [Buildroot] [Bug 4796] apply-patches.sh reorders patches given on
 the command line
In-Reply-To: <bug-4796-163@https.bugs.busybox.net/>
References: <bug-4796-163@https.bugs.busybox.net/>
Message-ID: <20130526124024.4BD179A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4796

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 12:39:15 UTC ---
If the path given to the apply-patches.sh script is a directory that contains a
"series" file, then this series file is used to know the order in which patches
should be applied.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
