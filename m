From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 21:01:55 +0100
Subject: [Buildroot] [PATCH 01/13] pkg-infra: DOWNLOAD is never called
 with two arguments
In-Reply-To: <9eef3379eac2949fdf344b49b605a30aef49340c.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <9eef3379eac2949fdf344b49b605a30aef49340c.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <20140302210155.6b3ea272@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  2 Mar 2014 18:51:34 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, the DOWNLOAD helper accepts one or two arguments:
>   - the source URI
>   - the source filename; if missing, it is derived from the URI
> 
> But we have no caller of DOWNLOAD that passes a second argument.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-download.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
