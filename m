From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Dec 2010 16:04:39 +0000 (UTC)
Subject: [Buildroot] [Bug 2935] New: Ntpdate isn't installed
Message-ID: <bug-2935-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2935

           Summary: Ntpdate isn't installed
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2797
  --> https://bugs.busybox.net/attachment.cgi?id=2797
ntp-install-ntpdate.patch

You can select ntpdate via buildroot-config but it isn't installed on target.

ntpd is installed without considering the config-value.

The attached patch resolves this issue.

Frederik Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
