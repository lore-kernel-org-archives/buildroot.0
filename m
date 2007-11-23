From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 23 Nov 2007 14:24:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
References: <20071123074016.735F630048@busybox.net>
	<13909016.post@talk.nabble.com>
Message-ID: <018d01c82dd7$20f9a7b0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Hi ulf,
> 
> Can u help me to solve another problem with ImageMagick. While building
> ImageMagick , it checks for jpeg & tiff's Library from OS root folder 1st
> then from $(STAGING_DIR)/lib/ folder. Because of this i was getting below
> errors with both Jpeg and tiff when building ImageMagick.
> 
> /usr/lib/libtiff.so: could not read symbols: File in wrong format 
> collect2: ld returned 1 exit status 
> make[1]: *** [magick/libMagick.la] Error 1 
> 
> /usr/lib/libjpeg.so: could not read symbols: File in wrong format 
> collect2: ld returned 1 exit status 
> make[1]: *** [magick/libMagick.la] Error 1 
> 
> When i tried to move the respective libs for Jpeg and tiff from OS root
> folder, then ImageMagick properly took libs from $(STAGING_DIR)/lib/ folder
> and was successfully built.
> 
> Kindly help me to fix this. Thanks in advance
> 
> Regards
> Gururaja


This is a collaborative project.
I.E: you are expected to fix problems you find,
not ask anyone else to fix it.

Please modify the package/imagemagick/imagemagick.mk
and test it so it works and send in a patch.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
