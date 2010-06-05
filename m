From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Jun 2010 15:31:10 +0000 (UTC)
Subject: [Buildroot] [Bug 1813] xkeyboard-config fails to build because of
 intltool problem
In-Reply-To: <bug-1813-163@https.bugs.busybox.net/>
References: <bug-1813-163@https.bugs.busybox.net/>
Message-ID: <20100605153110.D9A8F12F672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1813

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This is a missing dependency on host-intltool. A patch, proposed by Paul Jones,
is being discussed on the list.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
