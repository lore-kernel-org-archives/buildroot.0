From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:59:35 +0100
Subject: [Buildroot] [PATCH] gcc: add patches for or1k specific gcc
	version
In-Reply-To: <1487628739-3679-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 20 Feb 2017 23:12:19 +0100")
References: <1487628739-3679-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871suspiy0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a number of patches from package/gcc/5.4.0 to
 > package/gcc/musl-5.4.0, so that they apply to the or1k specific gcc
 > version. All patches from package/gcc/5.4.0 that are not architecture
 > specific and not related to the musl C library have been added to
 > package/gcc/musl-5.4.0/.

 > Note that doing a symbolic link does not work, as some patches from
 > package/gcc/5.4.0 do not apply as-is to the or1k gcc version.

 > The most important patch is 850-libstdcxx-uclibc-c99.patch, which fixes
 > a number of build issues.

 > Fixes:

 >   http://autobuild.buildroot.net/results/eebf4ce5ecb896e54912cfa21268e81ff5fb6593/
 >   (alljoyn)

 >   http://autobuild.buildroot.net/results/8dbf406898a59e36ac6a1e16f543b6260da775c8/
 >   (jsoncpp)

 >   http://autobuild.buildroot.net/results/206fbd5473c8c6840489990cb2552566c62ef3c8/
 >   (dawgic)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
