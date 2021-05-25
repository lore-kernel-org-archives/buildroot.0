From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 May 2021 13:25:17 +0000
Subject: [Buildroot] [Bug 13821] New: Wrong url for libnfsidmap package
Message-ID: <bug-13821-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13821

            Bug ID: 13821
           Summary: Wrong url for libnfsidmap package
           Product: buildroot
           Version: 2018.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chenchix at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Seems that citi.umich.edu is not available anymore.


>>> libnfsidmap 0.25 Downloading
--2021-05-25 13:20:26-- 
http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/libnfsidmap-0.25.tar.gz
Resolving www.citi.umich.edu (www.citi.umich.edu)... 141.212.112.111,
2607:f018:600:2:f66d:4ff:fe50:8246
Connecting to www.citi.umich.edu (www.citi.umich.edu)|141.212.112.111|:80...
connected.
HTTP request sent, awaiting response... 403 Forbidden
2021-05-25 13:20:27 ERROR 403: Forbidden.

--2021-05-25 13:20:27-- 
http://sources.buildroot.net/libnfsidmap/libnfsidmap-0.25.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
104.26.0.37, 104.26.1.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2021-05-25 13:20:27 ERROR 404: Not Found.

--2021-05-25 13:20:27--  http://sources.buildroot.net/libnfsidmap-0.25.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37,
104.26.1.37, 172.67.72.56, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2021-05-25 13:20:28 ERROR 404: Not Found.

package/pkg-generic.mk:135: recipe for target
'/mnt/cn98xx-release-output/build/libnfsidmap-0.25/.stamp_downloaded' failed
make[1]: ***
[/mnt/cn98xx-release-output/build/libnfsidmap-0.25/.stamp_downloaded] Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
