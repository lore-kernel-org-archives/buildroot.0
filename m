From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Aug 2009 20:58:15 +0000 (UTC)
Subject: [Buildroot] [Bug 573] BR2_DEFAULT_KERNEL_HEADERS is undefined with
 external toolchain
In-Reply-To: <bug-573-163@https.bugs.busybox.net/>
References: <bug-573-163@https.bugs.busybox.net/>
Message-ID: <20090826205815.5322777714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=573


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID




--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-26 20:58:14 UTC ---
This shouldn't happend with the official BR tree, as we don't display the
BR2_KERNEL_LINUX option when an external toolchain is used.

Is there any specific reason why you are using Bernhard's tree instead of the
official one?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
