From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Feb 2013 22:56:59 +0000 (UTC)
Subject: [Buildroot] [Bug 5918] Linux Kernel Headers Wrong Version
In-Reply-To: <bug-5918-163@https.bugs.busybox.net/>
References: <bug-5918-163@https.bugs.busybox.net/>
Message-ID: <20130212225659.224A29AAD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5918

Matt Ihnen <mihnen@mecmidwest.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Matt Ihnen <mihnen@mecmidwest.com> 2013-02-12 22:57:20 UTC ---
This was due to using a codesourcery toolchain that was compiled against newer
kernel headers than my kernel version.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
