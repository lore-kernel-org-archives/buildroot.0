From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 21:07:44 +0100
Subject: [Buildroot] [PATCH 04/21] docs/manual: document usage of
 BR2_TOOLCHAIN_HAS_SYNC_x
In-Reply-To: <20160125183837.GE3386@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125183837.GE3386@free.fr>
Message-ID: <20160125210744.2e8f47e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 25 Jan 2016 19:38:37 +0100, Yann E. MORIN wrote:

> > +* Gcc +__sync_*+ built-ins used for atomic operations. They are
> > +  available in variants operating on 1 byte, 2 bytes, 4 bytes and 8
> > +  bytes. Since different architectures support atomic operations on
> > +  different sizes, one dependency symbol is available for each size:
> > +** Dependency symbol: +BR2_TOOLCHAIN_HAS_SYNC_1+ for 1 byte,
> > +   +BR2_TOOLCHAIN_HAS_SYNC_2+ for two bytes,
> > +   +BR2_TOOLCHAIN_HAS_SYNC_4+ for 4 bytes, +BR2_TOOLCHAIN_HAS_SYNC_8+
> > +   for 8 bytes.
> > +** Comment string: no comment to be added
> > +
> > +* One byte +__sync_*+ gcc built-in for atomic instructions
> > +** Dependency symbol: +BR2_TOOLCHAIN_HAS_SYNC_1+
> 
> I don't see why you specifically documment BR2_TOOLCHAIN_HAS_SYNC_1
> separately. Did I miss something, or is it a stray attempt?

It's a stray attempt :-/ Will fix in v2, thanks for spotting!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
