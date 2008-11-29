From: Alexander Voropay <alec@sensi.org>
Date: Sat, 29 Nov 2008 22:52:54 +0300
Subject: [Buildroot] BUGREPORT: fakeroot version 1.9.6
Message-ID: <347d9b1b0811291152j89fbf69l55053f78054da2d5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Trying to build current snapshot I've got following error:

====
wget --passive-ftp -nd   -P /home/alec/buildroot-20081129/dl
"http://ftp.debian.org"/debian/pool/main/f/fakeroot/fakeroot_1.9.6.tar.gz
--21:14:04--  http://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.9.6.tar.gz
          => `/home/alec/buildroot-20081129/dl/fakeroot_1.9.6.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
21:14:06 ERROR 404: Not Found.

make: *** [/home/alec/buildroot-20081129/dl/fakeroot_1.9.6.tar.gz] Error 1
====

There is no such version on the fakeroot page:

http://ftp.debian.org/debian/pool/main/f/fakeroot/


Can anyone correct this ?



P.S. There is fakeroot-ng and most distributives use it.

http://sourceforge.net/projects/fakerootng

--
-=AV=-
