From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jun 2012 14:25:16 +0200
Subject: [Buildroot] New package
In-Reply-To: <CAHQn0kiM__pOsi3MXC58JW0hFQHX-rj-P-1LZ05o3fRBrGL70A@mail.gmail.com>
References: <CAFYZmWjqLdemKVbdGQ=s2WGNGjtpVF1hvfpmqFeaQShyUokRzA@mail.gmail.com>
 <20120618085754.5a6fb1b8@skate>
 <CAHQn0kiM__pOsi3MXC58JW0hFQHX-rj-P-1LZ05o3fRBrGL70A@mail.gmail.com>
Message-ID: <20120619142516.22f158c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 19 Jun 2012 14:20:16 +0200,
Daniel Nystr?m <daniel.nystrom@timeterminal.se> a ?crit :

> > BAR_SITE = http://$(BR2_SOURCEFORGE_MIRROR)/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz
> 
> I think it's even:
> BAR_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/clpbar/clpbar/bar-1.11.1/bar_1.11.1.tar.gz

Oops, indeed, sorry. I did the $(BR2_SOURCEFORGE_MIRROR) replacement
manually... and did it incorrectly.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
