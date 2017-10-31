From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:10:20 +0100
Subject: [Buildroot] [PATCH] libgpiod: bump version to v0.3.2
In-Reply-To: <20171031100206.1785-1-brgl@bgdev.pl> (Bartosz Golaszewski's
 message of "Tue, 31 Oct 2017 11:02:06 +0100")
References: <20171031100206.1785-1-brgl@bgdev.pl>
Message-ID: <87375zi15v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <brgl@bgdev.pl> writes:

 > Bug fix release:
 > - correctly handle signal interrupts when polling in gpiod_simple_event_loop()
 > - fix the linking order when building with static libraries
 > - pass the correct consumer string to gpiod_simple_get_value_multiple() in
 >   gpioget
 > - fix a line test case: don't use open-drain or open-source flags for input
 >   mode
 > - fix the flags passed to ar in order to supress a build warning
 > - set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
 >   can't be found

 > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
