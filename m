From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 16:21:59 +0000 (UTC)
Subject: [Buildroot] [Bug 3427] New: New package: nginx
Message-ID: <bug-3427-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3427

           Summary: New package: nginx
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at daccii.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3115
  --> https://bugs.busybox.net/attachment.cgi?id=3115
patch

Add nginx package.

Nginx is a fast and light webserver. While page serving speed is the same of
lighttpd, nginx consumes less resoruces.

NOTE:
actually http_cache and ssl modules are broken: nginx needs to statically
recompile openssl.
If i manually compile nginx from buildroot sources, with the same compilation
command, enabling ssl and openssl, all goes well but if buildroot does it,
compilation fail!
I hope to fix this really soon, i need them.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
