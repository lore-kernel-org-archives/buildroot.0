From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 20:53:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add patch to compile
 with glibc >= 2.28
In-Reply-To: <CANu7NGvq9K-KD4=3RbdB4fXAZp-_kR3be-zNw83zR6rOBuUgyw@mail.gmail.com>
References: <20180912083447.5169-1-F.LaRoche@pilz.de>
 <20180912105228.1c0ec200@windsurf>
 <OF8D5A4992.EF086515-ONC1258306.004559C1-C1258306.00459A8D@local-dmz.de>
 <CANu7NGvq9K-KD4=3RbdB4fXAZp-_kR3be-zNw83zR6rOBuUgyw@mail.gmail.com>
Message-ID: <20180912205302.306f087f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergio,

On Wed, 12 Sep 2018 15:06:18 -0300, Sergio Prado wrote:

> I'll work on the mongodb update in the next days.
> 
> One thing I notice is that since version 3.4 mongodb no longer supports
> 32-bit x86 platforms [1].
> 
> What should we do in that case? Just update to the newest version and stop
> supporting 32 bits systems, or create a new recipe and maintain both
> versions?

I'd say, just update to the newest version and stop supporting 32-bit
platforms. That's upstream choice, if people are unhappy with it, they
should bring this up to upstream or fork the project.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
