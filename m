From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:08:33 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: don't display "foo
 Downloading" when there's no source
In-Reply-To: <20180503201757.10822-1-yann.morin.1998@free.fr>
References: <20180503201757.10822-1-yann.morin.1998@free.fr>
Message-ID: <20180503230833.6f2b7b8d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 22:17:57 +0200, Yann E. MORIN wrote:
> Commit ea55e1323 (core/pkg-infra: don't enforce site-method for extra
> downloads) forgot to account for those packages that have nothing to
> download, like the skeleton, or like virtual packages...
> 
> The side effect is that the message "foo Downloading" is thus
> displayed when it should not be.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
