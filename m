From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Aug 2015 10:16:43 +0200
Subject: [Buildroot] [PATCH] minidlna: fix static linking
In-Reply-To: <1439362191.22945.8.camel@embedded.rocks>
References: <20150812043257.GA13454@waldemar-brodkorb.de>
 <1439362191.22945.8.camel@embedded.rocks>
Message-ID: <20150812101643.5727f761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 12 Aug 2015 08:49:51 +0200, J?rg Krause wrote:

> This is an almost identical patch to what Bernd Kuhls sent two weeks
> ago [1]. Are there any updates for this patch?
> 
> Best regards
> J?rg Krause
> 
> [1] http://patchwork.ozlabs.org/patch/501844/

If you read this link, I said:

"""
Would it be possible to stop hacking this to death? What about instead
taking the saner approach of switching minidlna configure.ac to use
PKG_CHECK_MODULES(), which will remove a lot of crap from it, and make
it work properly for cross-compilation.
"""

and I've got no further comment. So my comment still stands.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
