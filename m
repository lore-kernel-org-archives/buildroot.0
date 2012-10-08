From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Oct 2012 11:05:58 +0200
Subject: [Buildroot] [PATCH] fb-test-app: new package
In-Reply-To: <5072801F.1030907@atmel.com>
References: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
 <20121006210338.GA3850@tarshish> <5072801F.1030907@atmel.com>
Message-ID: <20121008110558.4c9dd19f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 8 Oct 2012 09:26:23 +0200, ludovic.desroches wrote:

> Hi Baruch,
> 
> Le 10/06/2012 11:03 PM, Baruch Siach a ?crit :
> > Hi Ludovic,
> >
> > On Fri, Oct 05, 2012 at 03:31:39PM +0200,
> > ludovic.desroches at atmel.com wrote:
> >> +define FB_TEST_APP_INSTALL_TARGET_CMDS
> >> +	$(INSTALL) -D -m 0755 $(@D)/perf
> >> $(TARGET_DIR)/usr/bin/perf
> >
> > This might collide with the Linux kernel's perf utility.
> >
> 
> I can add fb-test prefix to to the binary names, isn't it?

Sounds good, yes. So you would have:

	fb-test-perf
	fb-test
	fb-test-rect
	fb-test-offset

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
