From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 20 Nov 2007 15:46:34 -0800 (PST)
Subject: [Buildroot] ImageMagick fails to build because of incorrect version
Message-ID: <13868373.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

1. Imagemagick --> current : 6.3.5 Latest : 6.3.7
toolchain/patch-kernel.sh
/home/guru/project/original/bldrt/buildroot/build_arm/ImageMagick-6.3.5
package/imagemagick/ imagemagick-\*.patch\*
Aborting. 
'/home/guru/project/original/bldrt/buildroot/build_arm/ImageMagick-6.3.5' is
not a directory.
make: ***
[/home/guru/project/original/bldrt/buildroot/build_arm/ImageMagick-6.3.5/.unpacked]
Error 1

Kindly update IMAGEMAGICK_VERSION:=6.3.7

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/ImageMagick-fails-to-build-because-of-incorrect-version-tf4847140.html#a13868373
Sent from the BuildRoot mailing list archive at Nabble.com.
