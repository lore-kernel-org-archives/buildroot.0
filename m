From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 9 Apr 2020 18:59:15 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-04-08
In-Reply-To: <20200409062758.CB4D186A4F@fraxinus.osuosl.org>
References: <20200409062758.CB4D186A4F@fraxinus.osuosl.org>
Message-ID: <CALFsTFUhF1wPJ4uJJUMCeRP94HRCOAifE38d0yvef7zAUpbSzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 9, 2020 at 9:28 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2020-04-08
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  | 13  |  0  |  0  | 13  |
>   2019.11.x  | 15  |  1  |  0  | 16  |
>   2020.02.x  | 15  |  5  |  0  | 20  |
>     master   | 142 | 69  |  0  | 211 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
> psplash-fd33a9b3d68c89fa22f... | 14
>                 libtirpc-1.2.5 | 6
>                libglib2-2.64.1 | 4
>                   boinc-7.16.6 | 3
>              kismet-2016-07-R1 | 3
>                    mimic-1.1.0 | 3
>                    cegui-0-8-7 | 2
>               gnuradio-3.8.0.0 | 2
>                    gupnp-1.2.2 | 2
>            host-nodejs-12.16.1 | 2
>                   pango-1.44.6 | 2
>          python-markdown-3.2.1 | 2
>                  rocksdb-6.6.4 | 2
>                      avahi-0.8 | 1
>               bitcoin-0.19.0.1 | 1
>                    bullet-2.89 | 1
>       dovecot-pigeonhole-0.5.9 | 1
>               ejabberd-19.09.1 | 1
>       gst1-plugins-base-1.16.2 | 1
>                  haproxy-2.1.2 | 1
>               host-grpc-1.25.0 | 1
>                   libgta-1.0.8 | 1
>                libgtk2-2.24.32 | 1
>               libsecret-0.20.1 | 1
>                libtheora-1.1.1 | 1
> make: *** wait: No child pr... | 1
>                  mesa3d-20.0.4 | 1
>                     mpv-0.29.1 | 1
>                   ndisc6-1.0.4 | 1
>          qt5declarative-5.12.7 | 1
>               qt5script-5.12.7 | 1
>                   rygel-0.38.3 | 1
>                target-finalize | 1
>                        unknown | 1
> xdriver_xf86-video-amdgpu-1... | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e935bdddbdcbfe841e77e4ad7715b69a73fb12bf | ORPH
>     arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/889d216b12a9fb8deae04dc857085fa95878dc93 |
>    nios2     |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/0ae3420fc12baada59f838a7e3316eb738e2d09d |
>     m68k     |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/909301d80a7af65beda4e1c91cef9ae8804b98b6 |
>    sparc     |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/cea0864d877cc0b9b53c1c52224ce010704a615a |
>     arm      |          bullet-2.89           | NOK | http://autobuild.buildroot.net/results/2b621a0948c51325d1977aa563074ae9c5222463 |
>   powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/2dfac0ae67dc1aa88548da25a351e2c5283de166 |
>     arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/52d532b4fbdc3e01950ff91426f52f1ac9bbffd9 |
>    nios2     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/e1d638c62bab91173a5b62f889f6128fc4e7b3a3 |
>    mipsel    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/e3d6ab97594b511a9169902a362b0da262c80d2b |
>   mips64el   |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/333fd49196d71ea68f64ad046c38e480593f127e |
>   mips64el   |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/832a2ca8633b85bcc7ad471644072c153a772161 |
>     sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/9e2d73af60ca741cd8d779b4ef60f33172db4328 |
>     arm      |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/75f64312f275c76781bc277233bd42b9aadde930 |
>     arm      |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/f4f43632628f260df2edd380ba493233bda2f00d |
>     m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/2b9c571877fc2f52e3060896689148ed294dce09 |
>   riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/46858442c84c6490522c373bf2ceb1bdf04c10ee |
>     arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c87bbd7bdcd88f8761d8b4fde5bc42276698cc41 |
>    x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/747fa30e5f05a9d2c7290134706c78637bb74566 |
>     arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ec9239ab9d9d9b327f6656a6369b131a3fa2c0e9 | ORPH
>     or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1c25d329e8652c6d835c669f24b90d8101cbed09 | ORPH
>     arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/85f7c746ae1cc19f8839f892f0c280dcb0444ea9 | ORPH
>     arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f6affd5519ef67e72f6013ef86ca4cfbcb28ec6d |
>     i686     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/82850b15755ebeeaeac2d8e33a9c5186306eae90 |
>     arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/435881eb1ab9e7b0d9b54516c3c9a815f4dc03ef |
>     arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/5a92a354120393047553b4ac30fee655736bb80d |
>     arm      |          libgta-1.0.8          | NOK | http://autobuild.buildroot.net/results/56bd79f070bd6f4e5006b98e54a3a50d150b9dbe |
>  powerpc64   |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/0d9b7bbb73f1afd2bfe361e883954d233b03b723 |
>   riscv32    |        libsecret-0.20.1        | NOK | http://autobuild.buildroot.net/results/bfaeb684d4e8111425ac2cceaa10e017dcc084da | ORPH
>     or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d75c070a14fdb59b3c76a078e0bc1fff6e2b62c0 | ORPH
>   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6aa80e645eff4f62bffe10d507652a88fa44d289 |
>   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4abf9fc8f53b8e25344520e9a8add41625833cb9 |
>     arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/635d5a700132427fa00da3cc5b63125a1c6a5e81 |
>   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c690a464fc89cd9862830bada0495f4fcc1f7ba4 |
>   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cc9f0d6229e60864babefae640195ade5cf37a10 |
>   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/9c6d3f56f7c7e4bc1c21bd675b02a9072a3b952e |
> microblazeel | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/fa5b8b84f883668a591ab8159a746d249fa3bcfa |
>     arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/340e1706e08a00ffa4700bbf78813324415e88c1 |
>   powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c06d7a526cab6be27ed53b0da94cfabfe9666d44 |
>   powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/cafff268f1ff0406c6aa73d7d1bc3f9984051f90 |
>   powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/88e306292d8c09f8f20400904be36ee5483e0b9c |
>     arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f504d86a331f9b23b73c3adbeab69e2c4ce5aed1 |
>     arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6db453a720fd353e760045408a81cd986af33f6b | ORPH
>    xtensa    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/ad5f014c349f5340bff54ab7144222d6d0e7bcae | ORPH
>     arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/663ed74af861fc00f565c5a9a08d18ebead5124b | ORPH
>   riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9d68acd868e840bd7ffb8a7d935e306403ea309b |
>     arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1457e2af146dce5138f46bc1676794c6d1560a1d |
>     sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e803ecfa18e210bfdf70795e65128f4f5701691b |
>    x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e9ff9feaf1c5b975187d3012a127c39862aa264a |
>     m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5d2562c3d9d31c0f812bfc0c5e2b689b69c7b2f0 |
>   riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d4df1994997d47df7e7560229d54bf06e846d79b |
>     or1k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5642b817a7a14f245ca8468a1c54273c6708332a |
>     arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c1979e569b4a83f159bb48ee969fd72e0324d152 |
>    x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b872e57805e0423a215f471a4c4bb3675ed12fe4 |
>   mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b9df1232d9f731711be6fef45010ee71282c694f |
>    x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/fce6dfede057fbf42ae6d429012a6a7af1a08779 |
> microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/38918ca1f540198d8317ceb81357444da9936494 |
>   powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/cb5fb7689960379cb15e9cd3a4e472d222ca5ff4 |
>  powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2601c67dcbd589880907b22cf646e6edd5cd6c16 |

This can be solved by: https://patchwork.ozlabs.org/patch/1253230/

>   mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/e1127f1204014de6fbe1838da3be86925ea1534b |
>    x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/f0f2e6988ca773ba995d89a7c3d968ef046a92c6 |

And this can be solved by https://patchwork.ozlabs.org/patch/1252123/

>     arm      |     qt5declarative-5.12.7      | NOK | http://autobuild.buildroot.net/results/8f4485f3180890bd2fce955aaf03672df535e7f4 |
>     i586     |        qt5script-5.12.7        | NOK | http://autobuild.buildroot.net/results/9b9682a44fa2b32328256635d5ff0546c5ecc9c5 |
>   powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/909699ced02afd14ec8b32b717702b89b7d43ff8 |
>   powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/745ee71f1a886f30d6d74f654a7470ee5b3c1c72 |
>     arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/06f11c2814f186b128a9330ce4dc920fc087e344 |
>    xtensa    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a09d9571ae8d87f964813be846f3935c5b476178 |
>   powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf979f5ddbb0afd9848dca064c0ab808efc1b8d5 |
>    mipsel    | xdriver_xf86-video-amdgpu-1... | NOK | http://autobuild.buildroot.net/results/4da87d30e6f5a10aafae60abce1b89ed92204a4e |
>
>
>
>
> Results for branch '2019.11.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>           gstreamer1-mm-1.10.0 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ff7b1bf3dcd44f43ad41535761b7f23a55d4f232 |
>
>
>
>
> Results for branch '2020.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                   boinc-7.16.3 | 1
>               gnuradio-3.8.0.0 | 1
>                     mpv-0.29.1 | 1
>                 qt5base-5.12.7 | 1
>                 suricata-4.1.5 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     i586     |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/7343042611d0f2b0c945e78c4e234fecbccdfa07 |
>    x86_64    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/62289400f9b8bd28bcb80574f91d48ec68942714 |
>     arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/aba2ea8d8f49759ce6ed0fc40a736959b587efcd |
>    xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/cb48d1ce70d96526722de9864f1adbb2e8e11b50 |
>     m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/466ca6ae126ea0d3ebe886afcebfa3837c1fe7bb |
>
>
>
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Asaf.
