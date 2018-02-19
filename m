From: Valentin KORENBLIT <valentin.korenblit@smile.fr>
Date: Mon, 19 Feb 2018 13:38:20 +0100
Subject: [Buildroot] [PATCH 0/4] llvm for mesa3d
In-Reply-To: <1518908435329-0.post@n4.nabble.com>
References: <20180216083606.6472-1-valentin.korenblit@smile.fr>
 <0d3785ce-032b-330c-d7ff-fb92bcc07f1d@carallon.com>
 <5fb32f7a-205d-07a9-07bd-f8110259ea2a@smile.fr>
 <1518908435329-0.post@n4.nabble.com>
Message-ID: <bcb3d4f4-d6c3-c257-81cd-d1b9986f2a0e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2018 00:00, nimaim wrote:
> Hi, thank you for your contribution. I've been manually building and using
> llvmpipe w/ mesa3d based on Romain's RFC series in patchwork (ignoring the
> clang, clc stuff), but it would be nice if we can get it officially added.
>
> Out of curiosity, have you tested this with mesa3d 17.3.x? Those versions
> broke llvm for me w/ Romain's older patches ... mesa fails to find and link
> against the libs. I had to downgrade to the latest 17.2.x (17.2.8 at the
> time of this posting).
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Hi,

I'm using mesa3d 17.3.4 and it works correctly. You should also consider 
that the RFC series uses llvm 4.0.1.

Regards,

Valent?n
