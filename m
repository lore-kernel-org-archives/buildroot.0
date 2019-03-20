From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 14:43:52 +0100
Subject: [Buildroot] [PATCH] package/gesftpserver: bump version to
 latest stable
In-Reply-To: <20190320123654.10985-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 20 Mar 2019 13:36:54 +0100")
References: <20190320123654.10985-1-yann.morin.1998@free.fr>
Message-ID: <87a7hpek4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > By default, gesftpserver wants to treat al warnings as errors, but there
 > is an actual warning in the release, so we quiesce that by not treating
 > warnings as errors.

 > We also backport a patch from upstream, to fix the ordering of some
 > fields when sending file attributes.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Result of test-pkg -a (with the reason):
 >                 br-arm-basic [ 4/43]: SKIPPED   (no wchar)
 >        br-arm-cortex-m4-full [ 7/43]: SKIPPED   (no MMU)
 >         br-arm-full-nothread [ 9/43]: SKIPPED   (no thread)
 >            br-m68k-5208-full [13/43]: SKIPPED   (no MMU)
 >    br-powerpc-603e-basic-cpp [22/43]: SKIPPED   (no wchar)
 > 43 builds, 5 skipped, 0 build failed, 0 legal-info failed

Committed, thanks.

-- 
Bye, Peter Korsgaard
