From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Jun 2014 09:32:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140623093207.AAE3D9D09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #14 from Sven Neumann <s.neumann@raumfeld.com> 2014-06-23 09:32:06 UTC ---
We are seeing the same problem with gcc 4.8.2 on our i586 platform. Code that
uses C++ exceptions and which used to work fine with the buildroot 2014.02
release now aborts when an exception is thrown.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
