From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 28 Sep 2011 12:04:06 +0200
Subject: [Buildroot] Build a single package with -j1
In-Reply-To: <CANdC7UHvpjbqS0uvuUXURjYGBAe+TajZZOGi5zmCqXbHpthndA@mail.gmail.com>
References: <CANdC7UHvpjbqS0uvuUXURjYGBAe+TajZZOGi5zmCqXbHpthndA@mail.gmail.com>
Message-ID: <4E82F116.1030504@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Allan,

> Is it possible to specify that a single package must be build in one thread only?

Yes, it is. See package/libnl7libnl.mk:

LIBNL_MAKE = $(MAKE1)

Best regards,
Yegor
