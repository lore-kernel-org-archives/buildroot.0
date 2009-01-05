From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Jan 2009 21:14:30 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <1231179361.8886.228.camel@linux-yrgm.site> (Ulf Samuelsson's
	message of "Mon\, 05 Jan 2009 19\:16\:01 +0100")
References: <20090105161237.034D977404@busybox.osuosl.org>
	<1231179121.8886.225.camel@linux-yrgm.site>
	<1231179361.8886.228.camel@linux-yrgm.site>
Message-ID: <87tz8dv7bt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Even better is to define it as 

 Ulf> ?U_BOOT_TARGET:=$(PROJECT)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin

But why would we want to do this? We don't add project name, version
number or date to the file system images and so on.

Having a fixed name seems simpler to me (E.G. if you have an update
script in your uboot to tftp a new bootloader and write it to flash,
having a fixed name is a lot easier than typing in the correct
version+date.

-- 
Bye, Peter Korsgaard
