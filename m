From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Jun 2009 14:13:45 +0000 (UTC)
Subject: [Buildroot] [Bug 383] New: gst-plugins-good: Allow soup plugin to
	be configured
Message-ID: <bug-383-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=383

           Summary: gst-plugins-good: Allow soup plugin to be configured
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=383)
 --> (https://bugs.busybox.net/attachment.cgi?id=383)
Allow soup plugin to be configured

This patch adds support for configuring the soup plugin as part of
gst-plugins-good. The soup plugin uses the libsoup library to access http
streams.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
