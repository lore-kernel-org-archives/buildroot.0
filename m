From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Apr 2019 13:57:44 +0200
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <CAKON4Ozg+dp1j5BwTOVemKmpL-e+Hmw9E+MPeM7n+drqaiV53g@mail.gmail.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf>
 <1554412249.27243.12.camel@impinj.com>
 <20190405094919.40f655c2@windsurf>
 <1554487021.27243.30.camel@impinj.com>
 <CAKON4Ozg+dp1j5BwTOVemKmpL-e+Hmw9E+MPeM7n+drqaiV53g@mail.gmail.com>
Message-ID: <20190406135744.747367a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jon,

On Fri, 5 Apr 2019 15:29:03 -0400
"jonsmirl at gmail.com" <jonsmirl@gmail.com> wrote:

> I managed to get libp11 working with this makefile. The previous problems I
> encountered were fixed by a full rebuild of my tree. I needed libp11
> because we are using the ATECC608A for securely accessing with AWS IOT. It
> also works with Google and Azure.
> https://github.com/MicrochipTech/cryptoauthlib/wiki/PKCS11-Linux-Setup

There is already a libp11 package in Buildroot, I merged the patch that
was contributed by Trent Piepho a few days ago:

  https://git.buildroot.org/buildroot/commit/package/libp11?id=c4fc706f556c80046bf5cba93b1964c376c71208

> ################################################################################
> #
> # cryptoauthlib
> #

However, we don't have this package in Buildroot. Could you submit a
proper patch adding it, so that we can do a review and hopefully merge
it ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
