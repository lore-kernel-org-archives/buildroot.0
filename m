From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 00:01:31 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
 available
In-Reply-To: <55C3D66E.9060707@mclink.it>
References: <55C3A446.8080307@mclink.it>
 <20150806224829.61effbfa@free-electrons.com>
 <55C3D66E.9060707@mclink.it>
Message-ID: <20150807000131.4e9c9aae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Thu, 6 Aug 2015 23:49:34 +0200, Mauro Condarelli wrote:

> AFAIK pango is not mandatory to compile imagemagick, but without this patch imagemagick package would fail compilation if pango is not selected (either directly or because of other dependencies).
> I.e.: to compile without pango it seem mandatory to explicitly pass " --without-pango" to imagemaagick's configure script; so we have two possibilities: either automatically select pango or do something along the lines of my patch (shamelessly adapted from other stances in imagemagick.mk).
> Does this clarify or did I misunderstand You?

Could you please paste the last ~100 lines of the build output showing
the error, as well as post somewhere the config.log from imagemagick?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
