From: Sergey Gusarov <laborer2008@gmail.com>
Date: Thu, 07 Jul 2011 15:38:55 +0400
Subject: [Buildroot] Note on the large files support in sqlite(as part
	of Qt)
In-Reply-To: <87iprft86n.fsf@macbook.be.48ers.dk>
References: <4E14BBEC.40908@gmail.com> <87iprft86n.fsf@macbook.be.48ers.dk>
Message-ID: <4E159ACF.7030508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

07.07.2011 01:23, Peter Korsgaard writes:

 >> Patch from qt bugtracker already included in the upstream, at least 
it is in the Qt 4.7.3 release.
 > Really?
 > $ grep -rls SQLITE_DISABLE_LFS qt-everywhere-opensource-src-4.7.3
 > qt-everywhere-opensource-src-4.7.3/src/3rdparty/sqlite/sqlite3.c
 > $

Oh, i was wrong. My Qt 4.7.3 sources were already patched. The patch is 
not yet included. Nevertheless, it seems correct errors in upsteam 
project more accurately.

 >Did you try it?
Yes. I compiled qt with uclibc-based toolchain without LFS. You also can 
try to do this.

Regards, Sergey
