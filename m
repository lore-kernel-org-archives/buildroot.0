From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:38:47 +0200
Subject: [Buildroot] [PATCH 13/83 v2] package/ola: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <62fb636ff3c61aa04623c65b91ba203ca175f52f.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <62fb636ff3c61aa04623c65b91ba203ca175f52f.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233847.3dd6acfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:24 +0200, Yann E. MORIN wrote:
> Since there were multiple sub-menus, their prompts are turned into
> comments.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/ola/Config.in | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
