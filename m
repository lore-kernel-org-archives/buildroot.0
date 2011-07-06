From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Jul 2011 23:23:28 +0200
Subject: [Buildroot] Note on the large files support in sqlite(as part
	of Qt)
In-Reply-To: <4E14BBEC.40908@gmail.com> (Sergey Gusarov's message of "Wed, 06
 Jul 2011 23:47:56 +0400")
References: <4E14BBEC.40908@gmail.com>
Message-ID: <87iprft86n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Gusarov <laborer2008@gmail.com> writes:

 Sergey> Hi all,
 Sergey> In git i saw a
 Sergey> http://git.buildroot.net/buildroot/commit/?id=7e4d47593850851d6fcaa6068258c16cc8761ab5
 Sergey> commit, but it seems it is no longer necessary.
 Sergey> Look at this page http://bugreports.qt.nokia.com/browse/QTBUG-15395
 Sergey> Patch from qt bugtracker already included in the upstream, at least it
 Sergey> is in the Qt 4.7.3 release.
 Sergey> This means that the qt build system itself conveys the desired
 Sergey> flag(-DSQLITE_DISABLE_LFS) for sqlite.

Really?

$ grep -rls SQLITE_DISABLE_LFS qt-everywhere-opensource-src-4.7.3
qt-everywhere-opensource-src-4.7.3/src/3rdparty/sqlite/sqlite3.c
$

Did you try it?

-- 
Bye, Peter Korsgaard
