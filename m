From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 19:56:43 +0100
Subject: [Buildroot] [PATCH v2] util-linux: bump version to 2.29.1
In-Reply-To: <20170124181402.37530-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 24 Jan 2017 18:14:02 +0000")
References: <20170124181402.37530-1-Vincent.Riera@imgtec.com>
Message-ID: <87h94oguc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > 0001-build-sys-prefer-pkg-config-for-ncurses.patch already included:
 >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=3f7429fd2d539c7f948f72bd829404b55ac19d9f
 > 0002-build-sys-cleanup-UL_NCURSES_CHECK.patch already included:
 >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=862326451184bb0fe9c2b2b110fcfc986f9b1734
 > 0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch already
 > included:
 >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 >  - Removed autoreconf.
 >  - Removed MKINSTALLDIRS workaround since it was there due to
 >    autoreconf.

Committed, thanks.

-- 
Bye, Peter Korsgaard
