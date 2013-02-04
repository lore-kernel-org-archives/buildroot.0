From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Feb 2013 22:31:19 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system ...
In-Reply-To: <bug-5900-163@https.bugs.busybox.net/>
References: <bug-5900-163@https.bugs.busybox.net/>
Message-ID: <20130204223119.BC4109A946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-02-04 22:31:41 UTC ---
They are in fact not necessarily present on the command line because since you
use the internal backend, we build gcc to generate armv4t code by default, so
it's not useful to pass -march=armv4t all the time.

Is Xenomai actually checking the presence of those command line flags directly?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
