From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 16:07:10 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: use git formatted patches
In-Reply-To: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150720160710.4707d820@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Sat, 16 May 2015 21:04:37 +0200, Thomas Petazzoni wrote:
> Using Git formatted patches makes it easier to adjust the patches when
> needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Since you are the de-facto maintainer of the OpenSSL package, could you
give your opinion about the two patches in this series. I believe PATCH
1/2 is OK, but what do you think about PATCH 2/2 ?

Back in November 2014, Bernd also submitted some patches to enable
parallel build of OpenSSL, see
http://lists.busybox.net/pipermail/buildroot/2014-November/112183.html.
Peter and I rejected them because they were a bit big. My proposal
relies on downloading Gentoo patches instead, but I don't now if it's
really any better, since those patches may cause some problems in the
future to bump OpenSSL.

What do you think? Should we simply wait for OpenSSL upstream to see
the light and support parallel build?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
