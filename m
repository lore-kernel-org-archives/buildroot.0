From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jan 2011 16:24:21 +0000 (UTC)
Subject: [Buildroot] [Bug 3103] make external-deps wants to download
 gcc-.tar.bz2 when using an external toolchain
In-Reply-To: <bug-3103-163@https.bugs.busybox.net/>
References: <bug-3103-163@https.bugs.busybox.net/>
Message-ID: <20110119162421.7CB188B4CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3103

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed a slightly revised version of the patch, which also disables the
unneeded gmp/mpfr/mpc libraries, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
