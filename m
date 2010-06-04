From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  4 Jun 2010 13:22:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1957] New: Bump sqlite to 3.6.23.1
Message-ID: <bug-1957-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1957

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump sqlite to 3.6.23.1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1903
  --> https://bugs.busybox.net/attachment.cgi?id=1903
Bump sqlite to 3.6.23.1

Bump sqlite to version 3.6.23.1.

3.6.23.1 changes
----------------
*  Fix a bug in the offsets() function of FTS3
* Fix a missing "sync" that when omitted could lead to database corruption if a
power failure or OS crash occurred just as a ROLLBACK operation was finishing. 


3.6.23 changes
--------------
* Added the secure_delete pragma.
* Added the sqlite3_compileoption_used() and sqlite3_compileoption_get()
interfaces as well as the compile_options pragma and the
sqlite_compileoption_used() and sqlite_compileoption_get() SQL functions.
* Added the sqlite3_log() interface together with the SQLITE_CONFIG_LOG verb to
sqlite3_config(). The ".log" command is added to the Command Line Interface.
* Improvements to FTS3.
* Improvements and bug-fixes in support for SQLITE_OMIT_FLOATING_POINT.
* The integrity_check pragma is enhanced to detect out-of-order rowids.
* The ".genfkey" operator has been removed from the Command Line Interface.
* Updates to the co-hosted Lemon LALR(1) parser generator. (These updates did
not affect SQLite.)
* Various minor bug fixes and performance enhancements.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
