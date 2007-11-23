From: Hebbar <gururajakr@sanyo.co.in>
Date: Fri, 23 Nov 2007 01:14:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
In-Reply-To: <20071123074016.735F630048@busybox.net>
References: <20071123074016.735F630048@busybox.net>
Message-ID: <13909016.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi ulf,

Can u help me to solve another problem with ImageMagick. While building
ImageMagick , it checks for jpeg & tiff's Library from OS root folder 1st
then from $(STAGING_DIR)/lib/ folder. Because of this i was getting below
errors with both Jpeg and tiff when building ImageMagick.

/usr/lib/libtiff.so: could not read symbols: File in wrong format 
collect2: ld returned 1 exit status 
make[1]: *** [magick/libMagick.la] Error 1 

/usr/lib/libjpeg.so: could not read symbols: File in wrong format 
collect2: ld returned 1 exit status 
make[1]: *** [magick/libMagick.la] Error 1 

When i tried to move the respective libs for Jpeg and tiff from OS root
folder, then ImageMagick properly took libs from $(STAGING_DIR)/lib/ folder
and was successfully built.

Kindly help me to fix this. Thanks in advance

Regards
Gururaja

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-imagemagick-tf4860117.html#a13909016
Sent from the BuildRoot mailing list archive at Nabble.com.
