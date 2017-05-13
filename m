From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:17:32 +0200
Subject: [Buildroot] [PATCH 2/9] package/mke2img: check nb_blocks is
 specified
In-Reply-To: <aaa50531bc8d795818d2c4aa8955ad366342e0e4.1493654310.git.yann.morin.1998@free.fr>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
 <aaa50531bc8d795818d2c4aa8955ad366342e0e4.1493654310.git.yann.morin.1998@free.fr>
Message-ID: <20170513151732.141be5ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 17:58:37 +0200, Yann E. MORIN wrote:
> Since we do not have autocalculation anymore, the user must specify the
> exact number of blocks.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/mke2img/mke2img | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
