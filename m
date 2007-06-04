From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Mon, 04 Jun 2007 21:34:31 +0100
Subject: [Buildroot] Update to mpg123
In-Reply-To: <878xb0gkel.fsf@sleipner.barco.com>
References: <46616A78.7000804@teamboyce.co.uk>
	<878xb0gkel.fsf@sleipner.barco.com>
Message-ID: <46647757.6030306@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Thanks - A few commments:
>
> RB> -MPG123_VERSION=0.59r
> RB> +MPG123_VERSION := 0.65
>
> In the mean time 0.66 got released.
>
> RB> -MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
> RB> -MPG123_CAT:=$(ZCAT)
> RB> -MPG123_SITE=http://www.mpg123.de/mpg123
> RB> -MPG123_DIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
> RB> +MPG123_SOURCE := mpg123-$(MPG123_VERSION).tar.bz2
> RB> +MPG123_CAT := $(BZCAT)
> RB> +MPG123_SITE := http://www.mpg123.de/download
> RB> +MPG123_DIR := $(BUILD_DIR)/mpg123-$(MPG123_VERSION)
>
> What's with all those white space changes? Could you please send an
> updated patch without those and with the version bumped to 0.66?
>   
Peter & All,

Attached is another mpg123 patch with the version number bumped to 
TODAY's new released version number.  I have made no other changes to 
this patch is considering the changes I had to make for the previous 
version so minor which space changes are more than allowable in my 
opinion.  You are welcome to submit your own change that makes the code 
harder to read, but I'll stay with a few more spaces and a slightly 
prettier looking makefile fragment.

Regards,
Rod Boyce

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpg123-0.66_alsa.patch
Type: text/x-patch
Size: 2696 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070604/90b29083/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpg123-0.66_noalsa.patch
Type: text/x-patch
Size: 2524 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070604/90b29083/attachment-0001.bin 
