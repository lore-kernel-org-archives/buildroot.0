From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Nov 2013 12:28:16 +0000 (UTC)
Subject: [Buildroot] [Bug 6626] procps Unknown HZ value! (XX) Assume 100.
In-Reply-To: <bug-6626-163@https.bugs.busybox.net/>
References: <bug-6626-163@https.bugs.busybox.net/>
Message-ID: <20131116122816.31AB89BCE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6626

--- Comment #4 from Cassiano Martin <cassiano@idbinfo.com.br> 2013-11-16 12:28:15 UTC ---
Patch provided.

Working fine with no more patches on x86, x86_64 and mips64.

I''l leave to the buildroot devs find out why configure script concatenates
exec-prefix, resulting in a bogus path. As a workaround I had to set
--exec-prefix=/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
