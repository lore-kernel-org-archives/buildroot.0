From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Mon, 04 Jun 2007 11:04:50 +0200
Subject: [Buildroot] Update to mpg123
In-Reply-To: <46616A78.7000804@teamboyce.co.uk> (Rod Boyce's message of "Sat, 
	02 Jun 2007 14:02:48 +0100")
References: <46616A78.7000804@teamboyce.co.uk>
Message-ID: <878xb0gkel.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "RB" == Rod Boyce <buildroot@teamboyce.co.uk> writes:

RB> All,

RB> Attached is an update to mpg123 this brings the build-root package up
RB> to the latest version of mpg123 version 0.65 I have only tested this
RB> with my 386 target others will have to test as well.  I have also
RB> attach a patch that conditionally uses ALSA when it is added to
RB> build-root and a patch that does not use ALSA.

Thanks - A few commments:

RB> -MPG123_VERSION=0.59r
RB> +MPG123_VERSION := 0.65

In the mean time 0.66 got released.

RB> -MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
RB> -MPG123_CAT:=$(ZCAT)
RB> -MPG123_SITE=http://www.mpg123.de/mpg123
RB> -MPG123_DIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
RB> +MPG123_SOURCE := mpg123-$(MPG123_VERSION).tar.bz2
RB> +MPG123_CAT := $(BZCAT)
RB> +MPG123_SITE := http://www.mpg123.de/download
RB> +MPG123_DIR := $(BUILD_DIR)/mpg123-$(MPG123_VERSION)

What's with all those white space changes? Could you please send an
updated patch without those and with the version bumped to 0.66?

-- 
Bye, Peter Korsgaard
