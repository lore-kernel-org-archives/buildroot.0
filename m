From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jan 2012 09:10:11 +0100
Subject: [Buildroot] Error installing  udev  : frugalware ??
In-Reply-To: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7> (Sagaert Johan's
 message of "Thu, 12 Jan 2012 00:32:35 +0100")
References: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7>
Message-ID: <87ipkh8hp8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> Using 2011.11 :

 Sagaert> make[1]: Leaving directory `/home/johan/buildroot-2011.11js/output/build/udev-173'

Looks to be the end of 'make install'

 Sagaert> /usr/bin/install -m 0755 package/udev/S10udev /home/johan/buildroot/output/target/etc/init.d

This is UDEV_INSTALL_INITSCRIPT

 Sagaert> /usr/bin/install -m 0644 /home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*
 Sagaert> /home/johan/buildroot/output/target/etc/udev/rules.d
 Sagaert> /usr/bin/install: cannot stat `/home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*': No such file or directory
 Sagaert> make: *** [/home/johan/buildroot/output/build/udev-173/.stamp_target_installed] Error 1

But this isn't. Do you have any local modifications related to this?

-- 
Bye, Peter Korsgaard
