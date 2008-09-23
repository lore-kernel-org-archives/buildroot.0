From: Bussmann, Paul <Paul.Bussmann@technidata.com>
Date: Tue, 23 Sep 2008 19:57:05 +0200
Subject: [Buildroot] Buildroot with a custom kernel
References: <ea7358da0809230856u39726ed6k90c06c8cdbb8a2b@mail.gmail.com>
	<2590773a0809231029o75f55b61u58eb59f18d4421fd@mail.gmail.com>
Message-ID: <1B0F60C9E236904CB364F9EF52E0AFD9026139CB@sma10.technidata-ag.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 2) tarball up your custom kernel and place it in the dl dir.  Make
> sure you name is according to what you have in your buildroot config
> for the kernel version.  BR will then assume you've already dl'ed the
> kernel and use your version.

I already tried this with 2.6.17 on ARM. Resulting in everything _looked_ fine at first but my board instantly rebooted when I tried to use TCP stuff. It is indeed related to BR's toolchain, because if I use the manufacture's (Ka-Ro) toolchain to compile the kernel, it works.
So I asked on this mailing list about getting a 2.6.17-supporting Buildroot environment (2008-08-25) with the following answer (2008-08-26):

> 2.6.17 was released around Jun 18  2006. I'd ask those people for a
> vaguely recent kernel. 

So I'd be very interested if you have similar success.

See http://www.nabble.com/Linux-Kernel-2.6.17-support-in-Buildroot-tt19139626.html#a19139626

Best regards,
Paul
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080923/01f99ac1/attachment.htm 
