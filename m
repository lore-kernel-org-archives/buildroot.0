From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Apr 2011 16:12:44 +0000 (UTC)
Subject: [Buildroot] [Bug 3595] New: patch to add libroxml
Message-ID: <bug-3595-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3595

           Summary: patch to add libroxml
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://libroxml.googlecode.com
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tristan.lelong at blunderer.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3193
  --> https://bugs.busybox.net/attachment.cgi?id=3193
patch to add libroxml to buildroot

libroxml is a C library to read / write XML file.
The stripped binary is about 40Kb, making it very interesting for embedded
targets.
It includes a shell Xpath resolver (roxml).

project homepage http://libroxml.googlecode.com

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
