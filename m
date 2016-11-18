From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Nov 2016 05:43:39 +0000
Subject: [Buildroot] [Bug 9431] New: A misspelling
Message-ID: <bug-9431-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9431

            Bug ID: 9431
           Summary: A misspelling
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: xichao at sina.cn
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6806
  --> https://bugs.busybox.net/attachment.cgi?id=6806&action=edit
Look at the red circle marked place.

I found a misspelling in file: package/quagga/Config.in

Here is my comparison after the change:

xxx:~/buildroot-2016.08/package/quagga$ diff Config.in Config.in-ok 
28c28
<       bool "BPGv4+ protocol"
---
> 	bool "BGPv4+ protocol"
30c30
<         Build bpgd daemon.
---
> 	  Build bgpd daemon.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
