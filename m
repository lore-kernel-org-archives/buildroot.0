From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 20:32:02 +0200
Subject: [Buildroot] [PATCH 04/11] elftosb: fix build forcing g++
 compiler
In-Reply-To: <1342963719-1810-5-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20120722203202.06137639@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Jul 2012 15:28:32 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Thanks, applied with the CC usage instead of CXX we discussed on IRC.

I've also applied two other patches: one renaming the patches without a
version number, and one that uses HOST_CONFIGURE_OPTS instead of
HOST_MAKE_ENV when doing the make invocation to build elftosb. This
allows to pass the correct CC, CXX, CFLAGS, CXXFLAGS and al. to the
build process, which for example, allows to use ccache when building
elftosb.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
