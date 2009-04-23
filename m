From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 23 Apr 2009 19:36:39 +0000 (UTC)
Subject: [Buildroot] [Bug 283] add taglib
In-Reply-To: <bug-283-163@https.bugs.busybox.net/>
References: <bug-283-163@https.bugs.busybox.net/>
Message-ID: <20090423193639.6E59576454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=283


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-04-23 19:36:38 UTC ---
It looks like it's written in C++, so you need to depend on
BR2_INSTALL_LIBSTDCPP (E.G. like iperf)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
