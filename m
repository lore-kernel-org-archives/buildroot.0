From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Dec 2011 12:16:28 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] libXfont and libXft building failed,
 cross-compilation error
In-Reply-To: <bug-4592-163@https.bugs.busybox.net/>
References: <bug-4592-163@https.bugs.busybox.net/>
Message-ID: <20111212121628.895298F916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

--- Comment #8 from Mario <marioabajo@gmail.com> 2011-12-12 12:16:28 UTC ---
Hi,
Ok, setting LD_LIBRARY_PATH to none solves the problems. I,m sorry for the
inconveniences. Maybe a note in the FAQ about this would be fine.
Thanks for everything :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
