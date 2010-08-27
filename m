From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Aug 2010 15:11:55 +0000 (UTC)
Subject: [Buildroot] [Bug 2461] New: wireless_tools: install shared library
	if needed
Message-ID: <bug-2461-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2461

           Summary: wireless_tools: install shared library if needed
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2395
  --> https://bugs.busybox.net/attachment.cgi?id=2395
Patch

I need the wireless_tools-library (libiw.so) to be on the target (and in
staging-dir).

The appended patch make this selectable via config.

This is my first patch for a "generic"-package. Feel free to modify the patch
if needed.

Simon Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
