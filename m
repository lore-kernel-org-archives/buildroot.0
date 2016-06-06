From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:28:34 +0200
Subject: [Buildroot] [PATCH 02/10] gst1-imx: bump to version 0.12.1
In-Reply-To: <CAAMH-yucxbR7vdu5mF=m5q=6btK1UzHjfa8=obVnuD0J90Wttw@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <1acf85bcc2a25fa6282c6057699b20e26548d905.1464958470.git.awebster@arcx.com>
 <CAAMH-yucxbR7vdu5mF=m5q=6btK1UzHjfa8=obVnuD0J90Wttw@mail.gmail.com>
Message-ID: <20160606222834.31fb8471@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Jun 2016 16:33:13 +0200, Gary Bisson wrote:

> Since the switches to wscript configuration are brought by this
> update, my opinion is that it should be done in one patch. I can take
> care of it if you don't want to.

Well, I would suggest to do the opposite: do the bump, and then make
improvements to the package that are made possible by the bump.

Of course, if it's impossible for some reason to separate these in two
patches, it should be done in only one patch.

But if the bump can be done without these additional improvement, they
should be separate changes.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
