From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Jun 2009 15:16:45 +0000 (UTC)
Subject: [Buildroot] [Bug 333] Bump sqlite package to 3.6.14
In-Reply-To: <bug-333-163@https.bugs.busybox.net/>
References: <bug-333-163@https.bugs.busybox.net/>
Message-ID: <20090619151645.D9836775F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=333


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #363 is|0                           |1
           obsolete|                            |




--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-06-19 15:16:44 UTC ---
Created an attachment (id=411)
 --> (https://bugs.busybox.net/attachment.cgi?id=411)
Bump sqlite package to 3.6.15

Now up to 3.6.15:

    * Refactor the internal representation of SQL expressions so that they use
less memory on embedded platforms.
    * Reduce the amount of stack space used
    * Fix an 64-bit alignment bug on HP/UX and Sparc
    * The sqlite3_create_function() family of interfaces now return
SQLITE_MISUSE instead of SQLITE_ERROR when passed invalid parameter
combinations.
    * When new tables are created using CREATE TABLE ... AS SELECT ... the
datatype of the columns is the simplified SQLite datatype (TEXT, INT, REAL,
NUMERIC, or BLOB) instead of a copy of the original datatype from the source
table.
    * Resolve race conditions when checking for a hot rollback journal.
    * The sqlite3_shutdown() interface frees all mutexes under windows.
    * Enhanced robustness against corrupt database files
    * Continuing improvements to the test suite and fixes to obscure bugs and
inconsistencies that the test suite improvements are uncovering. 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
