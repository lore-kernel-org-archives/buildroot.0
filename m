From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 10:26:50 +0200
Subject: [Buildroot] [PATCHv2] pckages/sconeserver: fix build with gcc-6
In-Reply-To: <1472111153-14215-1-git-send-email-yann.morin.1998@free.fr>
References: <1472111153-14215-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160825102650.0acafa05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 09:45:53 +0200, Yann E. MORIN wrote:
> We simply bump the version rather than backport the patch, as there has
> been only very few, minor commits in-between.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
>     http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2;
>   - update hash file  (Thomas)
> ---
>  package/sconeserver/sconeserver.hash | 2 +-
>  package/sconeserver/sconeserver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied after fixing the typo in the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
