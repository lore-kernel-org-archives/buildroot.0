From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Sep 2009 18:05:21 +0000 (UTC)
Subject: [Buildroot] [Bug 621] BR2_USE_WCHAR does not seem to enable WCHAR
 support in uClibc
In-Reply-To: <bug-621-163@https.bugs.busybox.net/>
References: <bug-621-163@https.bugs.busybox.net/>
Message-ID: <20090920180521.77D3477783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=621


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-20 18:05:20 UTC ---
Why do you think that it doesn't give you WCHAR support? Please do provide more
details. In particular, please show the relevant part of your uclibc config
(output/toolchain/uClibc-0.9.30.1/.config. It should contain a
UCLIBC_HAS_WCHAR=y line - If not, please provide your buildroot config and
explain how you built it.

Do notice though that you obviously need to recompile everything when you
change BR2_USE_WCHAR, and that it isn't detected automatically (do rm -rf
output; make)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
