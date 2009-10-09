From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Oct 2009 13:46:45 +0000 (UTC)
Subject: [Buildroot] [Bug 655] New: Update sqlite package to version 3.6.18
Message-ID: <bug-655-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=655

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Update sqlite package to version 3.6.18
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://www.sqlite.org/releaselog/3_6_18.html
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=693)
 --> (https://bugs.busybox.net/attachment.cgi?id=693)
Update sqlite package to version 3.6.18

This is a low-priority (minor) update.

SQLite Release 3.6.18 On 2009 Sep 11 (3.6.18)

 * Versioning of the SQLite source code has transitioned from CVS to Fossil.
 * Query planner enhancements.
 * The SQLITE_ENABLE_STAT2 compile-time option causes the ANALYZE command to
collect a small histogram of each index, to help SQLite better select among
competing range query indices.
 * Recursive triggers can be enabled using the PRAGMA recursive_triggers
statement.
 * Delete triggers fire when rows are removed due to a REPLACE conflict
resolution. This feature is only enabled when recursive triggers are enabled.
 * Added the SQLITE_OPEN_SHAREDCACHE and SQLITE_OPEN_PRIVATECACHE flags for
sqlite3_open_v2() used to override the global shared cache mode settings for
individual database connections.
 * Added improved version identification features: C-Preprocessor macro
SQLITE_SOURCE_ID, C/C++ interface sqlite3_sourceid(), and SQL function
sqlite_source_id().
 * Obscure bug fix on triggers ([efc02f9779]). 

SQLite Release 3.6.17 On 2009 Aug 10 (3.6.17)

 * Expose the sqlite3_strnicmp() interface for use by extensions and
applications.
 * Remove the restriction on virtual tables and shared cache mode. Virtual
tables and shared cache can now be used at the same time.
 * Many code simplifications and obscure bug fixes in support of providing 100%
branch test coverage.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
