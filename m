From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 19 Jun 2020 09:03:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-06-18
In-Reply-To: <20200619065116.3112286EDC@fraxinus.osuosl.org>
References: <20200619065116.3112286EDC@fraxinus.osuosl.org>
Message-ID: <20200619090324.681c9cb4@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On Fri, 19 Jun 2020 06:51:09 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Autobuild statistics for 2020-06-18
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  | 22  |  4  |  0  | 26  |
>   2020.05.x  | 23  |  9  |  0  | 32  |
>     master   | 103 | 163 |  0  | 266 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                        unknown | 66
>                 iproute2-5.7.0 | 16
>               gnuradio-3.8.1.0 | 12
[...]
>                      qwt-6.1.4 | 1 
[...]
> 
> Detail of failures
> ------------------
> 
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
[...]
>    mipsel    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/a026b0a33e19d02f15ac5cd33aa59a989f64c731 |     
>    xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/17b5afee21a6954427d111caa0aaa7a666fe4aa3 |     
>    nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/28bfa0480525e5bd661682dfb1307679b7e5beb9 |     
>   aarch64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/c8a64b2575a68f3d03a6435de23444cee7ee3343 |     
>    nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/307bbd816e1bdaca4c54ade2d1ddd5e111581475 |     
>   sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/f1589c11104a15eeb509bffcb41a5d3bb4662ab4 |     
>   mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/011ececa3605c4df5ab563d3d41ff739ed153b19 |     
>  aarch64_be  |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/1e1be93bbde42347591273bbb9d4ad1fe9eb4d19 |     
>   sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d80a1c7d453f3dca2f68336f4bf1f12915a03084 |     
>    sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/056a540ba2447ee2fc68bea1e03c27ad4997c10f |     
>     arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3d1b271deaf2b78f7dc53368506a8e8e84766c21 |     
>    nios2     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8e96e3633408e583d4391b0d5e7c68edebcb5e56 |     
I have just send a patch to fix these.
http://patchwork.ozlabs.org/project/buildroot/list/?series=184416
[...]
>    mipsel    |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/fdc3b6dd1f6498e9531d42bd0e075cb842038287 | ORPH
Fixed by http://lists.busybox.net/pipermail/buildroot/2020-June/284622.html
but strange this patch is not shown in patchwork...
[...]
> 

Gwenhael
> -- 
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
