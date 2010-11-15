From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Nov 2010 16:25:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2821] New: [PATCH] Patch for JavaScriptCore in
	QtWebKit module.
Message-ID: <bug-2821-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2821

           Summary: [PATCH] Patch for JavaScriptCore in QtWebKit module.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel.nystrom at timeterminal.eu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2671
  --> https://bugs.busybox.net/attachment.cgi?id=2671
Patch for JavaScriptCore in QtWebKit module

Even though the Qt package already contains a JavaScriptCore patch, it will
only patch the JSC source QtScript.

WebKit does also contain the source of JavaScriptCore which also needs about
the same patching to compile on uClibc.

Since the two files do look similar, it could diverge anytime so please keep
these patches separated in two files.

Patch attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
