From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:21:04 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <20160319233342.GI3426@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
 <20160319152307.765e1bad@free-electrons.com>
 <56ED7967.8050200@mind.be> <20160319233342.GI3426@free.fr>
Message-ID: <20160320142104.31bc0c99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Mar 2016 00:33:42 +0100, Yann E. MORIN wrote:

> >  I disagree. This may be slightly shorter in lines of code, but I think the
> > shell script is much more readable.
> 
> And as explained in the commit log, it does not work if any of the
> argument needs shell-level expansion (see my other reply to Thomas).

What about the pure make based implementation?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
