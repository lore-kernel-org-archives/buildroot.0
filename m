From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 4 Jun 2007 23:04:06 +0200
Subject: [Buildroot] Update to mpg123
In-Reply-To: <46647757.6030306@teamboyce.co.uk>
References: <46616A78.7000804@teamboyce.co.uk>
	<878xb0gkel.fsf@sleipner.barco.com>
	<46647757.6030306@teamboyce.co.uk>
Message-ID: <20070604210406.GF2853@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 04, 2007 at 09:34:31PM +0100, Rod Boyce wrote:
>Peter Korsgaard wrote:
>>Thanks - A few commments:
>>
>>RB> -MPG123_VERSION=0.59r
>>RB> +MPG123_VERSION := 0.65
>>
>>In the mean time 0.66 got released.
>>
>>RB> -MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
>>RB> -MPG123_CAT:=$(ZCAT)
>>RB> -MPG123_SITE=http://www.mpg123.de/mpg123
>>RB> -MPG123_DIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
>>RB> +MPG123_SOURCE := mpg123-$(MPG123_VERSION).tar.bz2
>>RB> +MPG123_CAT := $(BZCAT)
>>RB> +MPG123_SITE := http://www.mpg123.de/download
>>RB> +MPG123_DIR := $(BUILD_DIR)/mpg123-$(MPG123_VERSION)
>>
>>What's with all those white space changes? Could you please send an
>>updated patch without those and with the version bumped to 0.66?
>>  
>Peter & All,
>
>Attached is another mpg123 patch with the version number bumped to 
>TODAY's new released version number.  I have made no other changes to 
>this patch is considering the changes I had to make for the previous 
>version so minor which space changes are more than allowable in my 
>opinion.  You are welcome to submit your own change that makes the code 
>harder to read, but I'll stay with a few more spaces and a slightly 
>prettier looking makefile fragment.

We are asking you, politely, to adhere to the established style of
*not* using spaces there, once again.

There is no sensible argument for makeing the sources bigger and less
readable in my eyes.

>Regards,
>Rod Boyce
