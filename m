From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:39:20 +0200
Subject: [Buildroot] [PATCH 10/83 v2] package/ncftp: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <d263bff3c1e8642610ed59ca47588e7386f89434.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <d263bff3c1e8642610ed59ca47588e7386f89434.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233920.7a632566@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:21 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes RFC -> v1:
>   - drop the comment  (Arnout)
> ---
>  package/ncftp/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

I've replaced this by a commit that removes the menu ... endmenu and
simplifies the prompt of the sub-options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
