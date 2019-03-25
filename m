From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:27:47 +0100
Subject: [Buildroot] [PATCH 1/3 v3] package/pkg-generic: mark some rule
 PHONY
In-Reply-To: <fff0f5edad2cf9c48a7a78ec0cf2cc62dda44ad9.1553288807.git.yann.morin.1998@free.fr>
References: <cover.1553288807.git.yann.morin.1998@free.fr>
 <fff0f5edad2cf9c48a7a78ec0cf2cc62dda44ad9.1553288807.git.yann.morin.1998@free.fr>
Message-ID: <20190325192747.57a3030c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Mar 2019 22:07:05 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The %-graph-rdepends should be marked PHONY, as the %-graph-depends is.
> 
> The %-show-dependency-tree should also be a PHONY rule, because it does
> not actually create a file. Furthermore, to avoid the "Nothing to be
> done for .." message, give that rule an actual recipe that just does
> nothing.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
