From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Mar 2012 10:04:24 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120316100424.AE69990E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

Christoph Schulz <develop@kristov.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #4136|0                           |1
        is obsolete|                            |

--- Comment #3 from Christoph Schulz <develop@kristov.de> 2012-03-16 10:04:24 UTC ---
Created attachment 4154
  --> https://bugs.busybox.net/attachment.cgi?id=4154
changes the core build system to correctly include host-make into the build
process

This patch corrects a bug where making a noconfig_target failed due to missing
MAKEORIG: use always original $(MAKE) in main Makefile which is overridden only
for buildroot packages to be built.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
