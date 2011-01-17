From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jan 2011 12:16:50 +0000 (UTC)
Subject: [Buildroot] [Bug 3103] make external-deps wants to download
 gcc-.tar.bz2 when using an external toolchain
In-Reply-To: <bug-3103-163@https.bugs.busybox.net/>
References: <bug-3103-163@https.bugs.busybox.net/>
Message-ID: <20110117121650.4A09C8B382@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3103

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Created attachment 2869
  --> https://bugs.busybox.net/attachment.cgi?id=2869
Disable gcc fetch when not internal toolchain

This is an old bug that's been lingering for some time now.
Try the attached patch, it should solve the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
