From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Thu, 20 May 2021 00:26:00 +0000
Subject: [Buildroot] [External] [PATCHv2] package/libopenssl: md5 is not
 optional
In-Reply-To: <20210519204935.2712775-1-yann.morin.1998@free.fr>
References: <20210519204935.2712775-1-yann.morin.1998@free.fr>
Message-ID: <DM2P110MB0105BD71DA630F1588BA5F99F22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> From: Yann E. MORIN <yann.morin.1998@gmail.com> on behalf of Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Wednesday, May 19, 2021 3:49 PM
> To: buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Subject: [External] [PATCHv2] package/libopenssl: md5 is not optional
> ?
> Commit a83d41867c8d (package/libopenssl: add option to enable some
> features) made md5 an optional feature.
>
> However, md5 has not been optional since 1.1.0, released in 2016.
>
> Drop that option.
>
> Fixes:
> ?? - https://urldefense.com/v3/__http://autobuild.buildroot.net/results/9d79c9f313ff989449e9b47c1ff0afd3a167fd2d/__;!!MvWE!RY0bSNYdJto6Lnp3Tbm2f2uTOCTzcZbp5PNRphs92QsVIPB4iNkG1L8p0F6Rc1RZM1Nd$
>
> Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Reviewed-by: "Matthew Weber" <Matthew.Weber@collins.com>
