From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 22 Feb 2020 10:31:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-02-21
In-Reply-To: <20200222092458.9B3D587762@hemlock.osuosl.org>
References: <20200222092458.9B3D587762@hemlock.osuosl.org>
Message-ID: <CAGm1_kt3eWivm7fauG11t9wLQkLwQfsHbSBFiM47Aq5n5u2XxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 22, 2020 at 10:25 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2020-02-21
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  |  7  |  5  |  0  | 12  |
>   2019.11.x  |  8  |  2  |  0  | 10  |
>     master   | 74  | 37  |  0  | 111 |
>      next    | 21  | 16  |  0  | 37  |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                     brltty-6.0 | 7
>                        unknown | 5
>                       bash-5.0 | 3
>                libglib2-2.62.4 | 3
>                  augeas-1.12.0 | 2
>                  opencv3-3.4.9 | 2
>                 oprofile-1.3.0 | 2
>                  rocksdb-6.6.4 | 2
>                   apitrace-9.0 | 1
>                 host-go-1.13.8 | 1
>            host-nodejs-12.16.0 | 1
> host-python-setuptools-scm-... | 1
>                    libnss-3.50 | 1
>                libupnpp-0.17.2 | 1
>                  mesa3d-19.3.4 | 1
>                   monkey-1.6.9 | 1
>                     mpv-0.29.1 | 1
>                   pango-1.44.6 | 1
>                   zeromq-4.3.2 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/3f7b940c31ee8dac92a0f1659be9c4f2641f47a5 |
>     m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e29d1aa3e4f11b02d02b7eb10e4359a9387d3274 |
>     m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/c95f82f95ce50e1f5b7ae236f9717f7ad312e26c |
>     arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/20aaba60df80708aa058d4e019d1370163fa238c | ORPH
>   powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7978e1649cffab600bac22c2dd7a1f22a8005c7c | ORPH
>     arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/aa74b0b324d3c36a71c6c90d6e7e78cf4c3a4db4 | ORPH
> microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bd47016f60c67314d95d291d452e4ee11b24665d |
>    mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/66840aa26e495bb97307bbf720e362e5c6f2a2b5 |
> microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3471891b203291ad3eb1131ee50e432efd53c321 |
>    x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/66408c604546080fa6ea4d64e1c6c944e3c786af |
>    xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0c6a095d27ee40fbaec400b707c340187fafff81 |
>     arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a5583385e13aa4a26d6c8a1a549573ba0cf7c4d2 |
>    xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e0afb3969c1548b85b21a7c28d173f34115f4576 |
>   mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/88f251c6d0f9433d50bf04deac3da3fa34a14f87 |
>   aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/31992b866fcb2d9446e504dd5cfaa1b12a2c7aee |
>    nios2     | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/dcec5ab65032ae0100deb3fb40cf36d00e117d2b |

Fixed in https://patchwork.ozlabs.org/patch/1233755/

Yegor

> microblazeel |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/94001d703a2ae6aeb78434c89331039d13bc5615 |
>     arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/29ce69a31161dca617fc764c39696d2f28760bcf |
>     arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/7f3fdb9417f32981887371a78a60967add0fb154 |
>   powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/e9d467e2607374489bba7803f2bf18bdfa44539f |
>     arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f2328c358e689babbc590184ee5e3c2d9920d506 |
>  aarch64_be  |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/a14f329560f8022f7ba8ec43ad8eed84e005d226 |
>     m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/5c80f4b1f84b7ec0be4a13e5c12f9e6690c2509f | ORPH
>   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9867b096c844f856fe32bb07ad10588d85c64473 |
>   mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3acb2e42e9701ad1d327e3fef253a6f14e65fcf4 |
>     arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b6ebc6024afa53d58be4d3f989630045851733ad |
>     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f588ffd1f64ef1d0bcfa42fe3356fed3a548b1f7 |
>     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/72da2c5dd63f13106264fd38e9c5210a5dc2fa13 |
>     arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/cb72eb07e9567078a15f664237191aab0a7e02f0 | ORPH
>     arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/7898423ba590a9d85d01c29764dd011b36fb383e |
>     arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/de5775fce059486c829baa3ae06a6cf32bdba9fd |
>   aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/37b664d3a7324d6d319a8904e4de4e860730eac0 |
>     or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/37ae26d3af202a8578497cc1b17b12c86e1f870c |
>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/33abfd55d094d1ccb214b21c7cbfc94ed53cc83d |
>    sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/28af6e9a516eeaa73a5bd76b5d3ad4b70a0b14fa |
>    mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/59ca84225f217f689308250fadd988dd2df3a9ea |
>     m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0f8e4ed50925a7c65ba882c0341536f72b2ac15b |
>
>
> Results for branch 'next'
> =========================
>
> Classification of failures by reason
> ------------------------------------
>
>                    erlang-22.2 | 3
>                     brltty-6.0 | 2
>                    gupnp-1.0.4 | 1
>               host-grpc-1.25.0 | 1
> host-sdbusplus-4212292bcf13... | 1
>              libopenssl-1.1.1d | 1
>                   luv-1.34.1-1 | 1
>                     mpv-0.29.1 | 1
>                   ndisc6-1.0.4 | 1
>                 oprofile-1.3.0 | 1
>                protobuf-3.11.0 | 1
>                 suricata-4.1.5 | 1
>                       tio-1.32 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/245917aa7172f997b0e0f032d2bf85a1dbc36af8 |
>     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b4227b40d559416cecc6a378972bbd9494f71e87 |
>     arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b9cad3c5b55961111ad855a855bf4402d8fadb6c |
>     arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/edb340738bd816af7876e3f67f168c08f5856567 |
>   powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2686780a95d12465478dd2a510ac43cc094e4c39 |
>     arm      |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/bd387f84ee9d58693a80584e300e2fd4800e2e39 |
>    mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/13ce80ec50d3f1f2635a80f8523be8ebbfe8cd4f |
>   aarch64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/e436b14f72d5de5f369b2fbc9e0a41d30db2a998 |
>     m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/5bc9654b98e04618136c11c8eae2faf4591810ab |
>     arm      |          luv-1.34.1-1          | NOK | http://autobuild.buildroot.net/results/bb6bca9d5a02ddc0a069264973eed4092b290edc |
>   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7107de722d732b135da65198e1a682f45d11ca28 |
>     arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4e4c881ee37a89df06a6bf74b6d0aeedf49bb4b3 | ORPH
>     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/eb59bd4d5a43782b78cfa5056905fdd0450bd607 |
>     or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/3d197bf0d81e0dcfd87c24155ceecf49bbf94446 |
>     m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/c5995ec07e11f06529154fe76d56094394be6062 |
>   sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d73a96822c9a96e9fe7c82de98d8a646fc1f1d6f |
>
>
> Results for branch '2019.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                    glm-0.9.8.4 | 1
>                       gzip-1.9 | 1
>              host-grpc-v1.16.1 | 1
>          host-ti-cgt-pru-2.2.1 | 1
>               spandsp-20180108 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/78f7e6255ff8cd7b255a714e5f0dd9a17e46ecf0 | ORPH
>     arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/86b7b2a1a875686f6bd47cdf77608fd8339eb36d | ORPH
>  powerpc64   |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/3da97ba2391c82a38b2225478208c6733303cbf4 |
>     arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/736702c07eb9fcdacb4d4a6508a538c01c1ca5b8 |
>     i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/a382dcea8a1722ba4f155b758d4561350275ffa5 |
>
>
> Results for branch '2019.11.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                   gmpc-11.8.16 | 1
>               host-grpc-1.23.0 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/1d9f0e29faaa8c3570ae2e2849db774704241120 | ORPH
>    x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/8077d2babb87fa4fd524577afdf46dfbda1f2c56 |
>
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
