From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Aug 2013 14:44:29 +0000 (UTC)
Subject: [Buildroot] [Bug 6446] New: eglibc doesn't install ldconfig to
	target
Message-ID: <bug-6446-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6446

           Summary: eglibc doesn't install ldconfig to target
           Product: buildroot
           Version: 2013.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bluemrp9 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5030
  --> https://bugs.busybox.net/attachment.cgi?id=5030
install ldconfig to target

I am not 100% sure this is a bug.  I noticed that when using the new
experimental eglibc package, ldconfig does not get installed to the target. 
Attached is a patch.  I'm also not sure if anything else needs installed as
well (like ldd).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
