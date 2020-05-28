From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:45:00 +0200
Subject: [Buildroot] make graph-size on Ubuntu 20.04,
 buildroot 2020.05-rc2
In-Reply-To: <CADJjDh9gqQzv_owicJduiXkRJqCsgjRP6DjwnLPZK6A4Gd-YOA@mail.gmail.com>
References: <CADJjDh9gqQzv_owicJduiXkRJqCsgjRP6DjwnLPZK6A4Gd-YOA@mail.gmail.com>
Message-ID: <20200528224500.595b5ffc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 16:12:48 -0400
Todd Sampson <sampsonats@gmail.com> wrote:

> /m9k2/buildroot$ make graph-size
> You need python-matplotlib to generate the size graph
> make[1]: *** [Makefile:904: graph-size] Error 1
> make: *** [Makefile:84: _all] Error 2
> 
> python-matplotlib doesn't seem to be available on Ubuntu 20.04.  Maybe it's
> because 20.04 is trying to pressure everyone to use python 3.

It should work with Python 3, so just install matplotlib for Python 3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
