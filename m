From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:57:41 +0100
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Marcin Niestroj for
 netdata
In-Reply-To: <20191028161418.163056-3-m.niestroj@grinn-global.com>
References: <20191028161418.163056-1-m.niestroj@grinn-global.com>
 <20191028161418.163056-3-m.niestroj@grinn-global.com>
Message-ID: <c6c7fc2c-177f-0811-4b54-7c26afb59ccd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 17:14, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f41ac5f096..8658686023 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1457,8 +1457,10 @@ F:	package/lua-flu/
>  F:	package/lua-stdlib/
>  F:	package/luaossl/
>  F:	package/murata-cyw-fw/
> +F:	package/netdata/
>  F:	package/rs485conf/
>  F:	package/turbolua/
> +F:	support/testing/tests/package/test_netdata.py

 These DEVELOPERS changes should be together with the patches adding the
respective files.

 Only when you add yourself as a developer for an already existing package it
should be a separate patch, because in that case the addition to DEVELOPERS will
be backported to the stable branches. For new packages (or tests), they don't
exist on the stable branches, so backporting makes no sense.

 I normally would have fixed that up while applying, but since Matt asked for
changes, I thought you could include that as well.

 Regards,
 Arnout

>  
>  N:	Marcus Folkesson <marcus.folkesson@gmail.com>
>  F:	package/libostree/
> 
