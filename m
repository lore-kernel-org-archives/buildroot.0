From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 13:12:20 +0200
Subject: [Buildroot] [PATCH 2/2] core/legal-info: don't generate big
 file with all license texts
In-Reply-To: <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
References: <cover.1476519329.git.yann.morin.1998@free.fr>
 <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
Message-ID: <20161015131220.02e0dd8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 10:15:54 +0200, Yann E. MORIN wrote:
> By aggregating all the license files into a single big text-only file
> means we have no way to use license files that are binary blobs (e.g.
> pdf, rtf...).
> 
> Just do not generate that big file; if the user still wants it, it is
> very easy to create it afterwards.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Makefile               |  2 --
>  package/pkg-generic.mk |  1 -
>  package/pkg-utils.mk   | 12 ------------
>  3 files changed, 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
