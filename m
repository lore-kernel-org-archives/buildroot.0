From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 13:26:43 +0000 (UTC)
Subject: [Buildroot] [Bug 8286] New: Error with buildroot
Message-ID: <bug-8286-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8286

           Summary: Error with buildroot
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hmidi.slim1 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I followed the instructions mentioned on this link:
http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf
 But when I run make ,I got these error messages:
 >>> linux Downloading /linux-.tar.xz: Scheme missing. --2015-08-10 09:19:10--
http://sources.buildroot.net/linux-.tar.xz Resolving sources.buildroot.net
(sources.buildroot.net)... 176.9.16.109 Connecting to sources.buildroot.net
(sources.buildroot.net)|176.9.16.109|:80... connected. HTTP request sent,
awaiting response... 404 Not Found 2015-08-10 09:19:10 ERROR 404: Not Found.
make: ***
[/home/slim/Downloads/buildroot/output/build/linux-/.stamp_downloaded] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
