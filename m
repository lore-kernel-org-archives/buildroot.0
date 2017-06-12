From: Guy Benyei <guybe@mellanox.com>
Date: Mon, 12 Jun 2017 08:07:23 +0000
Subject: [Buildroot] [PATCH]Libssp support
In-Reply-To: <1ce3b240-ec5f-4542-0186-adaa8ac95dd7@mind.be>
References: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170607201316.jkzcuamoovnbkcla@tarshish>
 <AM3PR05MB433D9ACAA63A9ED51BBFF7EC9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608121224.vrmjd5zxulhu57h7@tarshish>
 <AM3PR05MB4333F3A6ACA381824BCE787C9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170608231505.0ab8924c@free-electrons.com>
 <AM3PR05MB433129DCBFFC30EBA0588EBC9CC0@AM3PR05MB433.eurprd05.prod.outlook.com>
 <1ce3b240-ec5f-4542-0186-adaa8ac95dd7@mind.be>
Message-ID: <AM3PR05MB433B586F6B9C1364B2E57B6C9CD0@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On June 11, 2017 11:48 PM Arnout Vandecappelle wrote:
>  Hi Guy,
> 
>  [Please don't top-post, but reply in-line, like I do now.]

Will do.

> 
>  It's a little more complicated than that - BR2_TOOLCHAIN_HAS_SSP should be
> set when -fstack-protector works with this toolchain. In other words, if you make
> a patch that uses gcc's libssp, then this symbol should be selected.
> 
>  So you need to introduce a new symbol (e.g. BR2_LIBC_HAS_SSP) that is set by
> the libc, and use gcc's libssp if it is not set. The internal toolchain should then
> always set BR2_TOOLCHAIN_HAS_SSP.
> 
>  All in all, a fairly complicated patch, I'm afraid. When you post something we'll
> provice feedback on how it should be improved.

Thanks for your feedback. Sending new patch right away.

Thanks
      Guy
