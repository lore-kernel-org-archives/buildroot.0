From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Oct 2014 07:05:55 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] elfutils on Blackfin doesn't build
In-Reply-To: <bug-7088-163@https.bugs.busybox.net/>
References: <bug-7088-163@https.bugs.busybox.net/>
Message-ID: <20141021070555.47FECAF488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-21 07:05:54 UTC ---
Well, it does build with uClibc apparently, maybe thanks to some of the patches
that we have in Buildroot against elfutils.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
