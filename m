From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Feb 2009 09:38:00 +0000 (UTC)
Subject: [Buildroot] [Bug 101] New: update gstreamer packages
Message-ID: <bug-101-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=101

           Summary: update gstreamer packages
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=63)
 --> (https://bugs.busybox.net/attachment.cgi?id=63)
update gstreamer packages

I have successfully updated the GStreamer packages in my tree. Attaching the
patch here so that it can be applied upstream after the buildroot release. The
patch updates gstreamer to version 0.10.22, gst-plugins-base to 0.10.22,
gst-plugins-good to 0.10.13 and gst-plugins-ugly to 0.10.10. It also removes
two patches which are not any longer needed as they have been applied upstream.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
