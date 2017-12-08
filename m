From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Dec 2017 19:13:37 +0000
Subject: [Buildroot] [Bug 10566] New: php.mk is missing option --with-pgsql
Message-ID: <bug-10566-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10566

            Bug ID: 10566
           Summary: php.mk is missing option --with-pgsql
           Product: buildroot
           Version: 2017.02.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: Peter.Pashkov at utas.utc.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When tried to install zabbix server using PostgreSQL database the setup page
gave an error message "At least one of MySQL, PostgreSQL, Oracle or IBM DB2
should be supported."
This pointed out to that php was configured without "--with-pgsql". The php.mk
file that is in charge of setting different configuration options to
"configure" script doesn't have the option at all.

The version of buildroot in use is: buildroot-2017.02.6

-- 
You are receiving this mail because:
You are on the CC list for the bug.
