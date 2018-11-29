From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:24:26 +0100
Subject: [Buildroot] [PATCH 0/3 v2] golang: fix build with oldish
 codesourcery amd64 toolchain (branch yem/go-west)
In-Reply-To: <cover.1543137559.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 25 Nov 2018 10:19:47 +0100")
References: <cover.1543137559.git.yann.morin.1998@free.fr>
Message-ID: <8736rj7htx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > That toolchain seems to suffer from bug #20006
 >     https://sourceware.org/bugzilla/show_bug.cgi?id=20006

 > So, like bug 19615, introduce a config option for 20006, and mask away
 > all golang packages.

 > Additionally, make golang packages abide by the number of CPUs to use.

 > Changes v1 -> v2:
 >   - drop per-package dependency, move it to BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 >     (Thomas)


 > Regards,
 > Yann E. MORIN.


 > The following changes since commit ea5280b889782e28b6bdf43e28b0e6a3a610f921

 >   package/samba4: fix install of systemd files (2018-11-25 09:37:07 +0100)


 > are available in the git repository at:

 >   git://git.buildroot.org/~ymorin/git/buildroot.git

 > for you to fetch changes up to d64c03d07584a8f48ab309fff66d2ee5661d5ee3

 >   package: hide golang packages for toolchains with binutils bug 20006 (2018-11-25 09:54:23 +0100)


 > ----------------------------------------------------------------
 > Yann E. MORIN (3):
 >       infra/pkg-golang: enforce number of parallel jobs
 >       toolchain: CodeSourcery AMD64 affected by PR20006
 >       package: hide golang packages for toolchains with binutils bug 20006

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
