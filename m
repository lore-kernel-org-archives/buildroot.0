From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Aug 2018 14:02:51 +0300
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add mender to Mirza Krak
In-Reply-To: <20180822105449.23909-1-mirza.krak@northern.tech>
References: <20180822105449.23909-1-mirza.krak@northern.tech>
Message-ID: <20180822110250.3d643cpx5jtva2ag@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mirza,

On Wed, Aug 22, 2018 at 12:54:49PM +0200, Mirza Krak wrote:
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
> 
> Update of:
> 
> http://lists.busybox.net/pipermail/buildroot/2018-August/228604.html
> 
> Changed title and that is why it is not a v2

When you send an update patch it would be nice if you change the status of the 
previous patch in patchwork to something other than 'New', as appropriate. 
Your previous patch is at http://patchwork.ozlabs.org/patch/960825/. The 
current list of pending Buildroot patches is at 
http://patchwork.ozlabs.org/project/buildroot/list/. You can either use the 
patchwork web interface, or the pwclient script for that.

baruch

>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 215506c71c..a6d76dd9c4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1437,6 +1437,9 @@ F:	package/libfribidi/
>  N:	Min Xu <xuminready@gmail.com>
>  F:	package/shadowsocks-libev/
>  
> +N:	Mirza Krak <mirza.krak@northern.tech>
> +F:	package/mender/
> +
>  N:	Morgan Delestre <m.delestre@sinters.fr>
>  F:	package/monkey/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
