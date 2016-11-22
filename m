From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:41:21 +0100
Subject: [Buildroot] [PATCH] audit: add an explanation of musl disable
In-Reply-To: <5b3db07898a54d858d2064be3d43fcf34227b9e5.1479368851.git.baruch@tkos.co.il>
References: <5b3db07898a54d858d2064be3d43fcf34227b9e5.1479368851.git.baruch@tkos.co.il>
Message-ID: <20161122104121.6e7d4166@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 09:47:31 +0200, Baruch Siach wrote:
> Based on commit c17af71d2c2 (package/audit: not available for musl) add a
> comment that explains why audit is disabled for musl.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/audit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
