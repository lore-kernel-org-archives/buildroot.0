From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:13:22 +0100
Subject: [Buildroot] [PATCH v2 1/2] tcl: update package disabling
In-Reply-To: <1415052730-28740-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Mon, 3 Nov 2014 23:12:09 +0100")
References: <1415052730-28740-1-git-send-email-ps.report@gmx.net>
Message-ID: <87h9y9tmz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Update package disabling (removing pkgs subdirectories) after
 > latest tcl version update:

 > $ ls tcl8.6.1/pkgs/
 >  itcl4.0.0
 >  sqlite3.8.0
 >  tdbc1.0.0
 >  tdbcmysql1.0.0
 >  tdbcodbc1.0.0
 >  tdbcpostgres1.0.0
 >  tdbcsqlite3-1.0.0
 >  thread2.7.0

 > $ ls tcl8.6.2/pkgs/
 >  itcl4.0.1
 >  sqlite3.8.6
 >  tdbc1.0.1
 >  tdbcmysql1.0.1
 >  tdbcodbc1.0.1
 >  tdbcpostgres1.0.1
 >  tdbcsqlite3-1.0.1
 >  thread2.7.1

 > Fixes:
 >  http://autobuild.buildroot.net/results/07ae8e42acf62fef99de70c8099ec5a0ca89a817/

 > Could not reproduce the build failure, but disabling pkgs/sqlite3.8.6 should
 > prevent all build failures in this directory...

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - use wildcards (as suggested by Arnout Vandecappelle)

Committed, thanks.

-- 
Bye, Peter Korsgaard
