From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Jul 2012 07:50:13 +0000 (UTC)
Subject: [Buildroot] [Bug 5366] New: can't login (root or default)
Message-ID: <bug-5366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

           Summary: can't login (root or default)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: anton at fit.com.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4424
  --> https://bugs.busybox.net/attachment.cgi?id=4424
config file for the buildroot

After building the rootfs it seems that i can't login.
For instance, after the login prompt i type 'root', then it asks for the
password (from what i understand it should have skipped that and show the shell
prompt).

"
Welcome to Buildroot
buildroot login: root
Password: 
Login incorrect

buildroot login: default
Password: 
Login incorrect

buildroot login: 
"

The corresponding config file is included in the attachment.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
