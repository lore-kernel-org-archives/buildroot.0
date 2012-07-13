From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Jul 2012 18:21:34 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] New: buildroot fails when building
 "host-libglib2 2.30.2 Building"
Message-ID: <bug-5360-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

           Summary: buildroot fails when building "host-libglib2 2.30.2
                    Building"
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


Created attachment 4406
  --> https://bugs.busybox.net/attachment.cgi?id=4406
configuration file buildroot

Hello,

I have attached the config file that reproduces this bug (basically i think to
reproduce this bug what you need to do is try to build the libglib2).

The following final error is given:
SyntaxErrorSyntaxError: : Non-ASCII character '\xd0' in file
../../gio/gdbus-2.0/codegen/gdbus-codegen on line 36, but no encoding declared;
see http://www.python.org/peps/pep-0263.html for detailsNon-ASCII character
'\xd0' in file ../../gio/gdbus-2.0/codegen/gdbus-codegen on line 36, but no
encoding declared; see http://www.python.org/peps/pep-0263.html for details

Anton

PS
This is a very strange bug.
Honestly i was expecting that such standard libraries are building correctly by
now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
