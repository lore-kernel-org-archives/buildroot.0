From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 22:51:01 +0200
Subject: [Buildroot] [PATCH v2] giflib: remove from the description the
 reference to libungif
In-Reply-To: <1428833637-14667-1-git-send-email-fabio.porcedda@gmail.com>
References: <1428833637-14667-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150506225101.3e79ed4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 12 Apr 2015 12:13:57 +0200, Fabio Porcedda wrote:
> Starting from version 5.0 giflib it's no longer compatible with
> libungif, also the libungif is now deprecated so just remove the
> reference to libungif.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/giflib/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
