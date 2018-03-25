From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:37:21 +0200
Subject: [Buildroot] [PATCH v4 2/9] pkg-cmake: install CMake files as
 part of a package
In-Reply-To: <20180324142008.10375-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:01 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-3-thomas.petazzoni@bootlin.com>
Message-ID: <87sh8ow4i6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Currently, the toolchainfile.cmake and Buildroot.cmake files are
 > installed outside of any package, just triggered by the toolchain
 > target.

 > As part of the per-package SDK effort, we are trying to avoid anything
 > that installs to the global $(HOST_DIR), and this is one of the
 > remaining files installed in $(HOST_DIR) outside of any package. We
 > fix this by installing such files as part of the toolchain package
 > post-install staging hooks.

 > Yes, a post-install staging hook to install things to $(HOST_DIR) is a
 > bit weird, but the toolchain infrastructure is made of target packages
 > only, and they all install a lot of stuff to $(HOST_DIR) already.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes since v3:
 >  - Added Reviewed-by from Yann
 > Changes since v2:
 >  - None
 > Changes since v1:
 >  - New patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
