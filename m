From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 29 Jun 2007 00:50:13 +0200
Subject: [Buildroot] ARM EABI builds
References: <20070626133327.GA5989@trinity.fluff.org><468182D7.30509@gmail.com><20070626222500.GP31791@trinity.fluff.org><20070627081954.GR31791@trinity.fluff.org><4682A1F7.3020402@gmail.com>
	<20070628103443.GT31791@trinity.fluff.org>
Message-ID: <019801c7b9d6$ba07ed10$ebba820a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> The problem with buildroot is that it gives you a choice of ARM cpus.
> If you select ARM920T, then you have an expectation of being able
> to run the binaries produced on an ARM920T, which currently if EABI
> is also selected is impossible.
> 

So should we not just make EABI depend on !ARM920T

Best Regards
Ulf Samuelsson
