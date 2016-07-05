From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:57:41 +0200
Subject: [Buildroot] [PATCH 01/24 v2] package/skeleton: remove useless
 .empty file
In-Reply-To: <ff7368e61707c220a37c746a171c68300445f834.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <ff7368e61707c220a37c746a171c68300445f834.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705155741.6ce60e3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:23 +0200, Yann E. MORIN wrote:
> We now have a real file in that directory, so we do not need a .empty
> placeholder.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  system/skeleton/etc/network/if-pre-up.d/.empty | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  delete mode 100644 system/skeleton/etc/network/if-pre-up.d/.empty

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
