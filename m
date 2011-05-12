From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 May 2011 16:21:17 +0000 (UTC)
Subject: [Buildroot] [Bug 3715] bunzip2 is forcefully selected by some
 packages no matter if busybox already provides it
In-Reply-To: <bug-3715-163@https.bugs.busybox.net/>
References: <bug-3715-163@https.bugs.busybox.net/>
Message-ID: <20110512162117.53ED583490@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3715

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Maybe the bzip2 package should provide a separate option for the installation
of bzip2 tools, so that even if packages depends on bzip2 library are selected,
the bzip2 tools are not necessarily installed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
