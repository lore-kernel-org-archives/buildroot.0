From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Jun 2017 13:18:52 +0000
Subject: [Buildroot] [Bug 9951] New: SCANCPAN failure
Message-ID: <bug-9951-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9951

            Bug ID: 9951
           Summary: SCANCPAN failure
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rajthilak.btech at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

After the shutdown of METACPAN v0 API page, we are unable to download the perl
packages using SCANCPAN script. The scancpan script still points to the v0
link, which needs to be updated with v1 link as mentioned in webpage
http://api.metacpan.org/

=====================================================================

Error:
======

[root at FADL062 buildroot]# /root/perl5/perlbrew/perls/perl-5.24.0/bin/perl 
support/scripts/scancpan Net-Telnet

fetch Net-Telnet

Failed to fetch 'http://api.metacpan.org/v0/release/Net-Telnet': Gone at
support/scripts/scancpan line 573.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
