From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 09:10:30 +0100
Subject: [Buildroot] [PATCH v4] package/i2c-tools: bump to version 4.0
In-Reply-To: <CA+_SqVZSDmxW=LN5=+Vy4TbOLmKd1yUVt2Yr7xfh769+Hx9uFw@mail.gmail.com>
References: <1513013922-14269-1-git-send-email-angelo@amarulasolutions.com>
 <20171213085328.2b225b86@windsurf.png.is.keysight.com>
 <CA+_SqVZSDmxW=LN5=+Vy4TbOLmKd1yUVt2Yr7xfh769+Hx9uFw@mail.gmail.com>
Message-ID: <20171213091030.087168c0@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 08:56:51 +0100, Angelo Compagnucci wrote:

> > Perhaps it's time to convince the i2c-tools maintainer to switch to a
> > reasonable build system, rather than providing a hand-written Makefile
> > that doesn't work ?  
> 
> Mmm, sounds rasoneable. Suggestions?

Well, you will have to discuss this with the i2c-tools maintainer, he
might have some preference. (Though I'm sure his preference will be to
keep his non-working hand-written Makefile, but I'd be happy to be
proven wrong on this).

Obvious choices are autotools or CMake. meson is becoming popular too.
At least doing an autotools based build system should be relatively
easy.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
