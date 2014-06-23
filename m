From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Jun 2014 11:40:02 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140623114002.97F939D08A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #15 from Sven Neumann <s.neumann@raumfeld.com> 2014-06-23 11:40:01 UTC ---
(In reply to comment #14)
> We are seeing the same problem with gcc 4.8.2 on our i586 platform. Code that
> uses C++ exceptions and which used to work fine with the buildroot 2014.02
> release now aborts when an exception is thrown.

I have now verified that the problem goes away if I revert the commit that
introduces musl support to gcc 4.8.2.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
