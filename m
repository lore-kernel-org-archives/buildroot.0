From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  4 Mar 2015 23:31:15 +0100
Subject: [Buildroot] [PATCH 0/2] Change the name of variable <PKG>_MAJOR to
	<PKG>_VERSION_MAJOR
Message-ID: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We usually use a name <PKG>_VERSION_MAJOR so do it for Buildroot consistency.

Jerzy Grzegorek (2):
  lockdev: change the name of variable LOCKDEV_MAJOR to
    LOCKDEV_VERSION_MAJOR
  swig: change the name of variable SWIG_MAJOR to SWIG_VERSION_MAJOR

 package/lockdev/lockdev.mk | 8 ++++----
 package/swig/swig.mk       | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.9.1
