From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 May 2010 08:45:04 +0000 (UTC)
Subject: [Buildroot] [Bug 1747] external toolchain does not include mtd-util
	headers
In-Reply-To: <bug-1747-163@https.bugs.busybox.net/>
References: <bug-1747-163@https.bugs.busybox.net/>
Message-ID: <20100511084504.E7AFF8F5F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1747

--- Comment #2 from Matthias Brugger <mensch0815@gmail.com>  ---
(In reply to comment #1)
> What would you want Buildroot to do in this case ?

I think it should put the necessary headers in the toolchain folder, or add a
include statement so that the program builds without manually copying the
files.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
