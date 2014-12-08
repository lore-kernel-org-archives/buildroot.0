From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:21:47 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix check-musl
In-Reply-To: <1418073423.2353.13.camel@posteo.de>
References: <1417648439-10146-1-git-send-email-jkrause@posteo.de>
 <20141208203200.4ca75210@free-electrons.com>
 <1418073423.2353.13.camel@posteo.de>
Message-ID: <20141208222147.002c438a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 08 Dec 2014 22:17:03 +0100, J?rg Krause wrote:

> > Do you want to have a look into this?
> 
> I'm not a toolchain expert, but I will have a look at it.

It might either be that we need --prefix=/ in musl.mk, or maybe
--prefix=/usr --libdir=/lib or something like that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
