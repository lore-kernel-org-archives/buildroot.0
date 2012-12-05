From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Dec 2012 07:59:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5750] buildroot-2012.11 while building X11 for ARM,
 errors on  xlib_libX11-1.4.2
In-Reply-To: <bug-5750-163@https.bugs.busybox.net/>
References: <bug-5750-163@https.bugs.busybox.net/>
Message-ID: <20121205075957.00AEA99A07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5750

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-12-05 07:59:54 UTC ---
For some complicated reason, using Buildroot in a directory stored under /usr
doesn't work. We will work on fixing that, but in the mean time, please build
from /home/something, /opt or anything else, but not from a subdirectory of
/usr.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
