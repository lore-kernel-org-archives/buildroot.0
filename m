From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 14:49:54 +0200
Subject: [Buildroot] [PATCH 08/11] toolchain-external: bump musl
	external toolchains to 1.1.1
In-Reply-To: <1401619668-28062-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 1 Jun 2014 12:47:45 +0200")
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k38ldle5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > And while we're at it, factorize the definition of the musl version,
 > since it's common to the definition of the tarball names for the
 > various supported architectures.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  toolchain/toolchain-external/Config.in             |  2 +-
 >  toolchain/toolchain-external/toolchain-external.mk | 23 +++++++++++-----------
 >  2 files changed, 13 insertions(+), 12 deletions(-)

 > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 > index 8fca01a..527ff04 100644
 > --- a/toolchain/toolchain-external/Config.in
 > +++ b/toolchain/toolchain-external/Config.in
 > @@ -804,7 +804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 >  	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 >  	select BR2_INSTALL_LIBSTDCPP
 >  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 >  	help
 >  	  Toolchain based on the Musl C library, provided by the
 >  	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and

This is no longer valid. Committed with this fixed up, thanks.

-- 
Bye, Peter Korsgaard
