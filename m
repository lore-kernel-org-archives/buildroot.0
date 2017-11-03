From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:00:12 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "libiio: Disable IIOD on
 Blackfin"
In-Reply-To: <20171103103034.24937-1-s.martin49@gmail.com>
References: <20171103103034.24937-1-s.martin49@gmail.com>
Message-ID: <20171103220012.31af82f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 11:30:33 +0100, Samuel Martin wrote:
> This reverts commit 53996bee433f09a91b12aa53b2be0f7d22c0acbe.
> 
> Commit 93a86b4dec9e73fbe0e186cdde8fb04a36a44762 fixes accept4 support
> in uclibc on Blackfin, so re-enable iiod on this target.
> 
> Cc: Paul Cercueil <paul.cercueil@analog.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/libiio/Config.in | 5 -----
>  1 file changed, 5 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
