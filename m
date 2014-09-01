From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Sep 2014 09:56:37 +0000 (UTC)
Subject: [Buildroot] [Bug 7346] New: [2014.08rc3] vim-8ae50e3ef8bf.tar.gz
 can not be downloaded, 404 not found
Message-ID: <bug-7346-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7346

           Summary: [2014.08rc3] vim-8ae50e3ef8bf.tar.gz can not be
                    downloaded, 404 not found
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: joymarquis at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Please help to close if this is not the place for Release Candidate bugs.

Version affected: 2014.08-rc3

Brief: vim-8ae50e3ef8bf.tar.gz can not be downloaded, 404 not found

Tried: Tried the printed download URL manually, the URL is mostly invalid.

Error log:

>>> vim 8ae50e3ef8bf Downloading
abort: error: Network is unreachable
--2014-08-27 18:41:58--  http://sources.buildroot.net/vim-8ae50e3ef8bf.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2014-08-27 18:42:00 ERROR 404: Not Found.

make: ***
[/home/houqing1/top/buildroot/buildroot-2014.08-rc3/output/build/vim-8ae50e3ef8bf/.stamp_d
ownloaded] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
