From: RainerB <berns@BEKA-Elektronik.de>
Date: Wed, 11 Mar 2009 11:12:30 -0700 (PDT)
Subject: [Buildroot]  fontconfig 2.6.0 fails
Message-ID: <22461265.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

i have used the latest svn revision and try to build it.
The configuration is a modified at91sam9263ek_defconfig.


I got the following error:

Making all in doc
make[3]: Betrete Verzeichnis
'/home/rainer/Entwicklung/buildroot/build_arm/fontconfig-2.6.0/doc'
/usr/bin/gcc 
-I/home/rainer/Entwicklung/buildroot/build_arm/staging_dir/usr/include/freetype2 
-L/home/rainer/Entwicklung/buildroot/build_arm/staging_dir/lib
-L/home/rainer/Entwicklung/buildroot/build_arm/staging_dir/usr/lib
--sysroot=/home/rainer/Entwicklung/buildroot/build_arm/staging_dir/ -o
edit-sgml edit-sgml.o
/usr/bin/ld: this linker was not configured to use sysroots

(Revision 25468 works)

Regards

Rainer
http://www.nabble.com/file/p22461265/config config 
-- 
View this message in context: http://www.nabble.com/fontconfig-2.6.0-fails-tp22461265p22461265.html
Sent from the BuildRoot mailing list archive at Nabble.com.
