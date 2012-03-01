From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Mar 2012 13:44:32 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120301134432.B621A90BEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-03-01 13:44:32 UTC ---
Sorry, it should have been

HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
