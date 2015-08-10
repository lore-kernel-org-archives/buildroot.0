From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 16:16:01 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
 available
In-Reply-To: <20150807000416.27a356c2@free-electrons.com>
References: <55C3A446.8080307@mclink.it>
 <20150806224829.61effbfa@free-electrons.com>
 <55C3D66E.9060707@mclink.it>
 <20150807000416.27a356c2@free-electrons.com>
Message-ID: <20150810161601.02d44c15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Since I've got no further feedback from Mauro, I've marked this patch
as Rejected for now. Mauro, once you can provide more details, we can
revisit this as needed. Thanks!

Thomas

On Fri, 7 Aug 2015 00:04:16 +0200, Thomas Petazzoni wrote:
> Dear Mauro Condarelli,
> 
> On Thu, 6 Aug 2015 23:49:34 +0200, Mauro Condarelli wrote:
> 
> > AFAIK pango is not mandatory to compile imagemagick, but without this
> > patch imagemagick package would fail compilation if pango is not
> > selected (either directly or because of other dependencies).
> 
> Imagemagick without pango selected builds just fine here, and it's
> using pkg-config to detect pango, so I'm not quite sure how it could
> misdetect a host-installed pango on your system.
> 
> So, we'll really need the build output and config.log.
> 
> Thanks,
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
