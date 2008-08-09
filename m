From: Brian Beattie <beattie@beattie-home.net>
Date: Fri, 08 Aug 2008 17:00:51 -0700
Subject: [Buildroot]
	target/device/KwikByte/kb9202/kernel-patches/linux-2.6.26-rc3-at91.patch.gz
Message-ID: <1218240051.6306.23.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on upgrading kb9202 support to the 2.6.26 kernel and have
found that this patchfile has a slight problem against the 2.6.26 kernel
sources in that it contains a patch of drivers/mmc/host/at91_mci.c that
does not apply as the fix it contains has already been made.  I have a
modified copy of the patchfile with that patch removed.  I don't know if
anybody is interested.
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
