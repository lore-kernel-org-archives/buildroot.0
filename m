From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 1 Sep 2020 11:42:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-08-31
In-Reply-To: <20200901071025.BD27486267@fraxinus.osuosl.org>
References: <20200901071025.BD27486267@fraxinus.osuosl.org>
Message-ID: <20200901114207.01340f13@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 01 Sep 2020 07:10:20 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Autobuild statistics for 2020-08-31
> ===================================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  | 25  |  4  |  0  | 29  |
>   2020.05.x  | 19  |  4  |  0  | 23  |
>     master   | 150 | 36  |  0  | 186 |
>      next    | 23  | 24  |  0  | 47  |
> 
[...]
> 
> Classification of failures by reason for next
> ---------------------------------------------
> 
>               host-grpc-1.31.0 | 4 
>                   assimp-5.0.1 | 2 
>               keepalived-2.1.4 | 2 
>                libglib2-2.64.4 | 2 
>       spandsp-3.0.0-6ec23e5a7e | 2 
>      dovecot-pigeonhole-0.5.11 | 1 
>                 easyframes-0.3 | 1 
>                  gnuplot-5.4.0 | 1 
>               gr-osmosdr-0.2.0 | 1 
>                    libcap-2.42 | 1 
>                     mpv-0.29.1 | 1 
>                   ndisc6-1.0.4 | 1 
>                  opencv3-3.4.9 | 1 
>    sofia-sip-1.13.1-d10a3d268c | 1 
>                   uhd-3.15.0.0 | 1 
>                        unknown | 1 
>            wayland-utils-1.0.0 | 1 
> 
> 
> Detail of failures for next
> ---------------------------
> 
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
[...]
>   powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/ff3316109fda13337b0ce43da82aae7b71ef29d3 |     
Fixed (in master branch) by https://git.busybox.net/buildroot/commit/?id=5209123494ccfb91ea802cc7675886c2ac800cc7
[...]
>     arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0cdbf01df174648cf0dfb34d9506eb80570e99c0 |     
missing depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 (boost-thread)
patch send:
http://patchwork.ozlabs.org/project/buildroot/patch/20200901093729.544094-1-gwenj at trabucayre.com/
>    xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/088ac62605792566ceebc1d35cf47ba8abe99f8d |     
>     arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/01116cfc31fc2e54c07541e5eb0ad99050d7cf03 |     
> 
> 
Best regards,
Gwen
> 
> -- 
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
