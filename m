From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:17:09 +0100
Subject: [Buildroot] [PATCH next] toolchain/buildroot: add comment for
 glibc NaN-2008 headers requirement
In-Reply-To: <20171125151902.502-1-yann.morin.1998@free.fr>
References: <20171125151902.502-1-yann.morin.1998@free.fr>
Message-ID: <20171129221709.68f6867f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 16:19:02 +0100, Yann E. MORIN wrote:
> Commit 4a5140ecf (toolchain/buildroot: glibc requires kernel headers >=
> 4.5 with NaN-2008) added a restriction on kernel hjeaders for glibc when
> the architecture is using naN-2008.
> 
> However, such a restriction is usually associated to a comment explaining
> the restiction, so the user knows what is happening.
> 
> That comment was forgotten in 4a5140ecf. Add it now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> ---
>  toolchain/toolchain-buildroot/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
