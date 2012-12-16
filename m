From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 23:19:26 +0100
Subject: [Buildroot] [PATCH 12/19] package/libseccomp: new package
In-Reply-To: <caac6f2b10b2b3a3d473e552c106e9e748243cf9.1355676845.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 16 Dec 2012 17:56:19 +0100")
References: <cover.1355676845.git.yann.morin.1998@free.fr>
 <cover.1355676845.git.yann.morin.1998@free.fr>
 <caac6f2b10b2b3a3d473e552c106e9e748243cf9.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <87licxbpxt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/Config.in                                  |    1 +
 Yann>  package/libseccomp/Config.in                       |   13 +++++++++++
 Yann>  ...ibseccomp-use-system-headers-from-sysroot.patch |   17 +++++++++++++++
 Yann>  package/libseccomp/libseccomp.mk                   |   22 ++++++++++++++++++++

There seem to be some arch dependent issues on atleast powerpc:

http://autobuild.buildroot.net/results/1742dfc07c27cfa91e1b253a2b16142206413b6b/build-end.log

Care to have a look?

-- 
Bye, Peter Korsgaard
