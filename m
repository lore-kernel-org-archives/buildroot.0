From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 10:36:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7178] New: NTPd package cannot sync time without a
 proper ntp.conf
Message-ID: <bug-7178-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7178

           Summary: NTPd package cannot sync time without a proper
                    ntp.conf
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: angelo.compagnucci at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


NTPd cannot sync time without proper ntp.conf file.

This patch provides a minimal configuration file for correct time syncing, it
adds the -g flag to ntpd to adjust time also with big offsets and remove the
deprecated use of ntpdate command for initial time syncing because unnecessary.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
