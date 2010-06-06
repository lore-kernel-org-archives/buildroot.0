From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  6 Jun 2010 18:57:39 +0000 (UTC)
Subject: [Buildroot] [Bug 1903] Bump tn5250 to 0.17.4 and migrate to
	autotargets
In-Reply-To: <bug-1903-163@https.bugs.busybox.net/>
References: <bug-1903-163@https.bugs.busybox.net/>
Message-ID: <20100606185739.8F28F8D1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1903

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, committed. I had to add --without-ssl when openssl isn't enabled to
stop it from detecting my host openssl though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
