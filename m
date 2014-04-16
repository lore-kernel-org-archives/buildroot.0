From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:24:57 +0200
Subject: [Buildroot] [PATCH] mtd: fix build against recent uClibc 0.9.33
In-Reply-To: <1b34aad19517b03927e0ffd902fe7941ae5eadd3.1397594277.git.baruch@tkos.co.il>
References: <1b34aad19517b03927e0ffd902fe7941ae5eadd3.1397594277.git.baruch@tkos.co.il>
Message-ID: <20140416192457.610d3c20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 15 Apr 2014 23:37:57 +0300, Baruch Siach wrote:
> Commit fae7cc33a1 added a local rpmatch() implementation. However, the
> rpmatch() implementation was backported to the 0.9.33 branch, thus breaking
> the Buildroot default toolchain. Rename the local rpmatch() to avoid
> collision.
> 
> Fixes:
> http://autobuild.buildroot.net/results/51f/51fe39bd942e4d8d0045ac810708719b9459e21f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
