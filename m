From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jun 2014 09:05:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140616090528.0CBC09D00B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #9 from Krzysztof Wrzalik <kwrzalik@gmail.com> 2014-06-16 09:05:27 UTC ---
IMHO a good solution would be to make patches conditional in some cases, e.g.
only use 900-musl-support.patch if C library is selected to musl. I guess it
would require quite amount of work thought...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
