From: Guy Benyei <guybe@mellanox.com>
Date: Wed, 14 Jun 2017 11:35:48 +0000
Subject: [Buildroot] [PATCH] gcc: add option to build and install gcc's
 libssp
In-Reply-To: <8e502eb9-e14f-ae20-ec6a-4cc8c2b052c5@mind.be>
References: <AM3PR05MB433F8CD5087964A86E0CECCC9C30@AM3PR05MB433.eurprd05.prod.outlook.com>
 <8e502eb9-e14f-ae20-ec6a-4cc8c2b052c5@mind.be>
Message-ID: <AM3PR05MB43364CEBB0DDCE7D5B757B0C9C30@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On  Wednesday, June 14, 2017 2:27 PM Arnout Vandecappelle wrote:


>  So you withdraw this patch?

Yes, apparently the overhead in using uClibc SSP support is not an issue for me, so I withdraw the patch. I've also updated patchwork.

Thanks
       Guy

> 
>  If so, please mark it as Rejected in patchwork [1]. If you create an account with
> the same e-mail address with which you submitted the original patch, you can
> modify its state.
> 
>  Or if you can't be bothered creating a patchwork account, I can do it as well.
> I just want to be sure you indeed intend to withdraw the patch.
> 
>  Regards,
>  Arnout
