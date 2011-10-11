From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Oct 2011 07:56:22 +0000 (UTC)
Subject: [Buildroot] [Bug 4231] libneon.so: undefined reference to
	`SSL_SESSION_cmp'
In-Reply-To: <bug-4231-163@https.bugs.busybox.net/>
References: <bug-4231-163@https.bugs.busybox.net/>
Message-ID: <20111011075622.A0D6E8E2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4231

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed in git by updating libneon package (8ece8e2775cb18987)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
