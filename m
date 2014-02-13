From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 12:26:08 +0000 (UTC)
Subject: [Buildroot] [Bug 5852] [2012.11] usb_modeswitch should depends of
 "BR2_PACKAGE_TCL_SHLIB_ONLY is not set"
In-Reply-To: <bug-5852-163@https.bugs.busybox.net/>
References: <bug-5852-163@https.bugs.busybox.net/>
Message-ID: <20140213122608.93F509C9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5852

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-13 12:26:08 UTC ---
The creation of the tcl symlink has been added with commit
8d0413fd370f47014287976f195dc745b95e49d3 (part of buildroot 2013.08).

The other problem that you describe, being that usb_modeswitch should not be
selectable when BR2_PACKAGE_TCL_SHLIB_ONLY is set, is covered with commit
d3e4db4e34927bff16c2ef06033304a068f46292 (also part of buildroot 2013.08).

Therefore, I am closing this bug as Resolved.
Please reopen if the problem persists, in which case you should provide more
information.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
