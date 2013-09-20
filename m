From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Sep 2013 07:19:39 +0200
Subject: [Buildroot] error when enabling sntp in das u-boot
In-Reply-To: <20130919212548.7cf1911072d53c88c462ee69@lavabit.com>
References: <20130919212548.7cf1911072d53c88c462ee69@lavabit.com>
Message-ID: <20130920071939.12f2978a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear rh_,

On Thu, 19 Sep 2013 21:25:48 -0700, rh_ wrote:

> Using buildroot 2013.08.1
> 
> I added CONFIG_CMD_SNTP to the board config in u-boot and I get this error.
> Look familiar to anyone?
> 
> sntp.c: In function ?SntpSend?:
> sntp.c:40:35: error: ?NetNtpServerIP? undeclared (first use in this function)
> sntp.c:40:35: note: each undeclared identifier is reported only once for each function it appears in
> sntp.c: In function ?SntpHandler?:
> sntp.c:71:40: error: ?NetTimeOffset? undeclared (first use in this function)

This looks like a U-Boot question, so it should be asked on the U-Boot
mailing list rather than on the Buildroot one. While asking, be sure to
tell the U-Boot people which version of U-Boot you're using (they won't
care about the Buildroot version, because that doesn't give any
indication on the U-Boot version you're using).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
