From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2015 11:17:38 +0000 (UTC)
Subject: [Buildroot] [Bug 8381] make manuconfig problem in opensuse 13.2
In-Reply-To: <bug-8381-163@https.bugs.busybox.net/>
References: <bug-8381-163@https.bugs.busybox.net/>
Message-ID: <20150930111738.844B681D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8381

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-09-30 11:17:38 UTC ---
(In reply to comment #0)

> even when ncurses with development packages are installed.
> 
> The solution is adding -ldl in file /usr/lib64/pkgconfig/ncursesw.pc section
> Libs.
> 
> after that make menuconfig is working.

That sounds like a bug in the ncursesw.pc file your distribution in using. 
Does menuconfig work for other packages (Linux kernel, busybox, barebox, ..)?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
