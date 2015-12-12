From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 16:55:20 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <20151212151023.GA3713@free.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
 <20151212151524.0b711e40@free-electrons.com>
 <20151212151023.GA3713@free.fr>
Message-ID: <20151212165520.6a257c5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 12 Dec 2015 16:10:23 +0100, Yann E. MORIN wrote:

> Because BR2_PACKAGE_LUA is a provider for the virual package
> lua-interpreter, and you should not select a provider of a virtual
> package:
> 
>     https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages
> 
>     If your package really requires a specific provider, then you?ll
>     have to make your package depends on this provider; you can not
>     select a provider.

Ah, yes, right, I forgot that Lua was a virtual package. Then indeed,
we don't have any other option here.

Thanks for the explanation,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
