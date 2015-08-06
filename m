From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 00:04:16 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
 available
In-Reply-To: <55C3D66E.9060707@mclink.it>
References: <55C3A446.8080307@mclink.it>
 <20150806224829.61effbfa@free-electrons.com>
 <55C3D66E.9060707@mclink.it>
Message-ID: <20150807000416.27a356c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Thu, 6 Aug 2015 23:49:34 +0200, Mauro Condarelli wrote:

> AFAIK pango is not mandatory to compile imagemagick, but without this
> patch imagemagick package would fail compilation if pango is not
> selected (either directly or because of other dependencies).

Imagemagick without pango selected builds just fine here, and it's
using pkg-config to detect pango, so I'm not quite sure how it could
misdetect a host-installed pango on your system.

So, we'll really need the build output and config.log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
