From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Dec 2013 16:35:24 +0100
Subject: [Buildroot] [PATCH 2/3] qt5: version bump
In-Reply-To: <1387288651-47952-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 17 Dec 2013 13:57:30 +0000")
References: <1387288651-47952-1-git-send-email-Vincent.Riera@imgtec.com>
 <1387288651-47952-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87a9fwonur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > -bump version to 5.2.0
 > -remove unneeded patches
 > -remove invalid configure options

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/qt5/qt5.mk                                 |    4 +-
 >  ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   32 ----
 >  .../qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch   |   36 -----

This patch is still needed.

 >  package/qt5/qt5base/qt5base-0008-qatomic-ppc.patch |   29 ----

And so is this.

It also needs a new patch to build on uClibc, which I've submitted
upstream:

https://bugreports.qt-project.org/browse/QTBUG-35742

Committed series with those changes, thanks.

-- 
Bye, Peter Korsgaard
