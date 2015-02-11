From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 11 Feb 2015 22:59:33 +0100
Subject: [Buildroot] gold linker usage in Qt5
Message-ID: <E2933C5B841843C6955365DBD20D5D5A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear;

Should the qt5base-5.4.0/mkspecs/common/gcc-base-unix.con be altered too ?
I believe this is for compiling our qt projects ?

Grepping :
....output/build# grep -R -H  'ld.gold' qt5*

qt5base-5.4.0/mkspecs/common/gcc-base-unix.conf:QMAKE_LFLAGS_USE_GOLD   = -fuse-ld=gold 


Regards

Sagaert Johan


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150211/c868b75a/attachment.bin>
