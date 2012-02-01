From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Feb 2012 08:45:48 +0000 (UTC)
Subject: [Buildroot] [Bug 4303] Toolchains qmake causes DEBUG builds with -O2
In-Reply-To: <bug-4303-163@https.bugs.busybox.net/>
References: <bug-4303-163@https.bugs.busybox.net/>
Message-ID: <20120201084548.257009095C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4303

--- Comment #2 from Will Wagner <will_wagner@carallon.com> 2012-02-01 08:45:47 UTC ---
(In reply to comment #1)
> Why should we make a special case for Qt here ? If you tell Buildroot to use
> -O2, then it sounds quite logical to have -O2 in the qmake CXXFLAGS, no ? If
> you don't want -O2 in the qmake CXXFLAGS, then tell Buildroot to not use -O2,
> and you're all set.

The reason Qt is different from other packages is that there is a menu option
on whether you want to build debug or release. If you were to select debug it
doesn't seem unreasonable that it should be built with -O0.

That said, I'm not too bothered about seeing this fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
