From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 14:46:40 +0100
Subject: [Buildroot] Buildroot compilation blocks on LZO package
In-Reply-To: <4975D32E.7020602@free.fr> (Cyril HAENEL's message of "Tue\,
	20 Jan 2009 14\:35\:42 +0100")
References: <4975D32E.7020602@free.fr>
Message-ID: <87bpu2w0n3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> Hi all,
 Cyril> I try to build a rootfs based on 
 Cyril> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc1.tar.gz

 Cyril> After unpacking, I done make menuconfig and done very small things :

 Cyril> - Put Target Architecture to Arm
 Cyril> - Put Target Architecture variant tp generic_arm
 Cyril> - Put Filesystem for target device to jffs2, and not ext2

 Cyril> After that, a make the build works well until it reach the LZO package.
 Cyril> The configure script blocks on this line :

 Cyril> checking whether we are using the GNU C++ compiler...

Strange, it works here (powerpc):

checking for g++... g++
checking whether we are using the GNU C++ compiler... no
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking how to run the C++ preprocessor... g++ -E

Please send you .config file.

-- 
Bye, Peter Korsgaard
