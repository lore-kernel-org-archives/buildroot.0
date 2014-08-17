From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Aug 2014 07:43:26 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140817074326.80F429D44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #21 from Peter Korsgaard <jacmet@uclibc.org> 2014-08-17 07:43:23 UTC ---
The patch series fixing this has now been applied:

http://git.buildroot.net/buildroot/commit/?id=fea35ce67317aa0eee678fb9440814d1346fb2fb

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
