From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:37:53 +0200
Subject: [Buildroot] [PATCH 20/83 v2] package/sdl_image: use
 'menuconfig' instead of 'config'+'menu'
In-Reply-To: <4dd96f27f85bfc61b46043668e56b1e9c7f79a31.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <4dd96f27f85bfc61b46043668e56b1e9c7f79a31.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233753.46e24529@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:31 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/sdl_image/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to master, thanks. In addition, I have changed the prompts of
the sub-options to be less verbose.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
