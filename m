From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 30 Nov 2006 14:57:00 +0100
Subject: [Buildroot] [PATCH] SDL_image, SDL_ttf & Pygame support
In-Reply-To: <20061130091236.GB31471@aon.at>
References: <1164844483.23643.33.camel@dv> <20061130091236.GB31471@aon.at>
Message-ID: <1164895020.456ee32c83277@imp3-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

here is a (preliminary?) patch to add SDL_image, SDL_ttf & Pygame support to
Buildroot (20061111).
I was only able to test it on my ARM platform so if some other people are able
to say if it's working by them too, I would be very recognizing.

I noticed a strange behaviour when compiling SDL_image (/usr/lib/libpng12.so is
used by the linker instead of the $(STAGING_DIR) one) and I don't know if it's
related to my devt environment or not. At that time renaming
"/usr/lib/libpng12.so" on my devt system was the only way to patch that... so
any
advise is welcome !

regards
Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.diff
Type: text/x-patch
Size: 8904 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061130/f645b9c6/attachment.bin 
