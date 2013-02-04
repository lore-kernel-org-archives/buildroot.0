From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Feb 2013 21:57:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system ...
In-Reply-To: <bug-5900-163@https.bugs.busybox.net/>
References: <bug-5900-163@https.bugs.busybox.net/>
Message-ID: <20130204215716.C59759A936@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-02-04 21:57:38 UTC ---
If you select the proper armv4t core in "Target Architecture Variant" and have
the BR2_SOFT_FLOAT option enabled, then we are normally already passing those
two flags to Xenomai ./configure script.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
