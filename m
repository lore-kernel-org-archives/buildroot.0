From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 20:18:26 +0200
Subject: [Buildroot] [PATCH] pckages/sconeserver: fix build with gcc-6
In-Reply-To: <1472060335-3229-1-git-send-email-yann.morin.1998@free.fr>
References: <1472060335-3229-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160824201826.797eac88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Typo in the commit title: pckages -> package

On Wed, 24 Aug 2016 19:38:55 +0200, Yann E. MORIN wrote:
> We simply bump the version rather than backport the patch, as there has
> been only very few, minor commits in-between.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
>     http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sconeserver/sconeserver.mk | 2 +-

No update to the hash file?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
