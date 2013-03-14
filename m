From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Mar 2013 20:45:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6122] iconv.h missing for charconv.c build
In-Reply-To: <bug-6122-163@https.bugs.busybox.net/>
References: <bug-6122-163@https.bugs.busybox.net/>
Message-ID: <20130314204524.230989B0B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6122

--- Comment #1 from Mike Quinn <mike@mquinn.org> 2013-03-14 20:46:07 UTC ---
Never mind - toolchain must have WCHAR support turned (it would be nice if the
menuconfig figured this out for you and warned you).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
