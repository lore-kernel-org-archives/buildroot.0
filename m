From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 23:06:41 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/qt5webkit: fix bison-3.7.1
 related compile failure
In-Reply-To: <20200915180004.2335-3-ps.report@gmx.net>
References: <20200915180004.2335-1-ps.report@gmx.net>
 <20200915180004.2335-3-ps.report@gmx.net>
Message-ID: <20200917230641.05a6ac65@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 20:00:04 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add gentoo patch to fix bison-3.7.1 related compile failure and
> an additional one doing a similare change for another bison call
> in Source/WebCore/DerivedSources.pri.
> 
> Fixes:
> 
>   generated/XPathGrammar.tab.c:124:10: fatal error: XPathGrammar.tab.h: No such file or directory
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Here as well, it would be good to understand if this is also happened
on 5.15.0 or only with 5.15.1. I assume the former, and I've started a
test build to confirm it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
