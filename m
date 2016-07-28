From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:28:11 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
	yem/libudev-4)
In-Reply-To: <XnsA653E00AA3B69ID313208userindividu@bernd-kuhls.de> (Bernd
 Kuhls's message of "Thu, 28 Jul 2016 22:01:27 +0200")
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <20160716154736.19dd42fb@free-electrons.com>
 <20160718175241.GA3738@free.fr> <87twfawymj.fsf@dell.be.48ers.dk>
 <XnsA653E00AA3B69ID313208userindividu@bernd-kuhls.de>
Message-ID: <87shuttsmc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 >> > But then you would not have libudev if you use mdev or a static /dev.
 >> 
 >> Is that a common use case? I wouldn't expect anybody to use static /dev
 >> any more

 > the fli4l (http://www.fli4l.de/en/home/news/) distro uses buildroot to build 
 > its binaries and has BR2_ROOTFS_DEVICE_CREATION_STATIC=y

 > in both the development branch

 > https://ssl.nettworks.org/repo/browse/fli4l/branches/4.0/trunk/src/packages/s
 > rc/src/fbr/buildroot/.config-x86?hb=true#to309

 > and the stable branch

 > https://ssl.nettworks.org/repo/browse/fli4l/branches/3.10/trunk/src/packages/
 > src/src/fbr/buildroot/.config-x86?hb=true#to255

Ok, but why? Devtmpfs has been available in the kernel since ~2.6.32 or
so.


-- 
Bye, Peter Korsgaard
