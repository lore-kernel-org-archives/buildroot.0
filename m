From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:36:47 +0100
Subject: [Buildroot] [PATCH] package/glibc: do install locale unless
 other utils are installed as well
In-Reply-To: <20191126145903.12234-1-p.debruijn@unilogic.nl>
References: <20191126145903.12234-1-p.debruijn@unilogic.nl>
Message-ID: <20191126223647.1889ea78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 15:59:03 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Fixes: fb1ee93ca4378456774e1ae24fcf370417733a38
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/glibc/glibc.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
