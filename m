From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Mar 2012 20:59:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120323205926.67B8596946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

Christoph Schulz <develop@kristov.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #4154|0                           |1
        is obsolete|                            |

--- Comment #4 from Christoph Schulz <develop@kristov.de> 2012-03-23 20:59:25 UTC ---
Created attachment 4190
  --> https://bugs.busybox.net/attachment.cgi?id=4190
changes the core build system to correctly include host-make into the build
process

The updated version of the patch now also works on a freshly unpacked archive;
it uses $(MAKEORIG) instead of $(MAKE) when building the targets
'silentoldconfig' and 'external-deps'.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
