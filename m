From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:42:07 +0100
Subject: [Buildroot] [PATCH 05/21 v2] core: remove .br-external on
 distclean
In-Reply-To: <84027326a9f437b9c829a3a6f1e7c4616bf1ae1e.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <84027326a9f437b9c829a3a6f1e7c4616bf1ae1e.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <20151103234207.753e70bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 22 Oct 2015 22:34:00 +0200, Yann E. MORIN wrote:
> distclean is supposed to return the current directory, whether in-tree
> or out-of-tree, into pristine conditions, which means we should also
> forget about any br2-external tree on distclean.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
