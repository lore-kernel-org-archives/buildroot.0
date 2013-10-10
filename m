From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Oct 2013 13:28:59 +0200
Subject: [Buildroot] [PATCH 5/9] package/weston: fix configure.ac for
	fbdev compositor
In-Reply-To: <ed39c3ca66c380b924f2e2dca9daf8255a480304.1381354867.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 9 Oct 2013 23:44:21 +0200")
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <cover.1381354867.git.yann.morin.1998@free.fr>
 <ed39c3ca66c380b924f2e2dca9daf8255a480304.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <87iox5weis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Apply patch from upstream.

Are there any other pending fbdev patches upstream? A quick test seems
to show that the fbdev backend isn't working:

 CC       weston_subsurfaces-subsurfaces.o
  CC       weston_simple_shm-simple-shm.o
  CC       weston_simple_shm-os-compatibility.o
subsurfaces.c:37:23: fatal error: GLES2/gl2.h: No such file or directory
compilation terminated.
make[4]: *** [weston_subsurfaces-subsurfaces.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory `/home/peko/source/buildroot/output/build/weston-1.2.2/clients'

-- 
Bye, Peter Korsgaard
