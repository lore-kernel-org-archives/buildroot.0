From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 14:32:14 +0000 (UTC)
Subject: [Buildroot] [Bug 8126] New: exim lacks plaintext and cram-md5 auth
Message-ID: <bug-8126-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8126

           Summary: exim lacks plaintext and cram-md5 auth
           Product: buildroot
           Version: 2015.02
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pud at nerdpunx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


they're disabled by default, and so it's impossible to forward mails to another
mailserver which needs authentication

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
