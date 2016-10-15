From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 13:19:34 +0200
Subject: [Buildroot] [PATCH 1/2] core/legal-info: save empty string when
 no license file
In-Reply-To: <4fdb0d67c86204e0a3048df9eaa86f9da98a4d12.1476519329.git.yann.morin.1998@free.fr>
References: <cover.1476519329.git.yann.morin.1998@free.fr>
 <4fdb0d67c86204e0a3048df9eaa86f9da98a4d12.1476519329.git.yann.morin.1998@free.fr>
Message-ID: <20161015131934.149dd8a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 10:15:53 +0200, Yann E. MORIN wrote:
> This is stored in the manifest file; it is perfectly possible to have
> empty fields in there.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
