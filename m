From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2015 09:52:10 +0200
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <55A8311B.30503@mind.be>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
 <20150716231142.6486d101@free-electrons.com>
 <55A8311B.30503@mind.be>
Message-ID: <20150717095210.223e90bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Ed,

On Fri, 17 Jul 2015 00:32:59 +0200, Arnout Vandecappelle wrote:

> > Thanks for your patch. However, following Gustavo's comment, I've
> > marked your patch as "Changes Requested" in our patch tracking system.
> > Can you resubmit a new version that takes into account Gustavo's
> > comments?
> 
>  Since it anyway is not compatible and upstream changed name, perhaps it's
> better just to create a new package called mbedtls? When we remove polarssl we
> can make a legacy entry to point to mbedtls.

Why would we remove polarssl? Is the project dead? Or is mbedtls its
replacement?

Other than that, yes: if mbedtls is like a new library that is
incompatible with polarssl, then a separate package is the best option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
