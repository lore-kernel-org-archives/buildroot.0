From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 19:28:39 +0000
Subject: [Buildroot] [Bug 13671] New: openSSH server closes connection
 before authentication is finished
Message-ID: <bug-13671-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

            Bug ID: 13671
           Summary: openSSH server closes connection before authentication
                    is finished
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: g.lens at livetech-systems.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

After updating from v2019.02.09 to v2021.02, I am not able to connect to my
board via SSH. The OpenSSH server on my device closes the connection abruptly
and exits with 255 before the keys can be exchanged. I have tried to use a
password, but this gave the same result. I am using the default sshd_config as
this was working with v2019.02.09.

I attached the server and client logs as well as the defconfig for more
information.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
