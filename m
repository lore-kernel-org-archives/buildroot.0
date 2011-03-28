From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Mar 2011 19:34:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3511] make busybox-menuconfig does not download
	busybox package
In-Reply-To: <bug-3511-163@https.bugs.busybox.net/>
References: <bug-3511-163@https.bugs.busybox.net/>
Message-ID: <20110328193409.D05C7817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3511

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Fixed it in git by depending on busybox-patch, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
