From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 2 Mar 2020 09:33:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-02-27
In-Reply-To: <CALFsTFVgFyK1_gE8pUcWtvZLaAEF+4Dj=An_A_hJB-HWNg0vEg@mail.gmail.com>
References: <20200228072557.C96F22044A@silver.osuosl.org>
 <CALFsTFVgFyK1_gE8pUcWtvZLaAEF+4Dj=An_A_hJB-HWNg0vEg@mail.gmail.com>
Message-ID: <CAGm1_kts-ZBieLXXhmJ4hV02H9rnct=zmsV0cwTGjVyQjdeTZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

On Fri, Feb 28, 2020 at 8:40 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Hello,
>
> On Fri, Feb 28, 2020 at 9:26 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Autobuild statistics for 2020-02-27
> > ===============================
> >
> >       branch |  OK | NOK | TIM | TOT |
> >   2019.02.x  | 19  |  2  |  0  | 21  |
> >   2019.11.x  | 13  |  2  |  0  | 15  |
> >     master   | 123 | 40  |  0  | 163 |
> >      next    | 22  | 26  |  0  | 48  |
> >
> > Results for branch 'master'
> > ===========================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >                       bash-5.0 | 4
> >                        unknown | 4
> >                  binutils-2.32 | 2
> >               host-grpc-1.25.0 | 2
> >                libglib2-2.62.4 | 2
> >                    libnss-3.50 | 2
> >                  mesa3d-19.3.4 | 2
> >                     mpv-0.29.1 | 2
> >                      vlc-3.0.8 | 2
> >                acpica-20191018 | 1
> >           gstreamer1-mm-1.10.0 | 1
> >                host-flex-2.6.4 | 1
> >                host-llvm-9.0.1 | 1
> >            host-nodejs-12.16.0 | 1
> > host-python-setuptools-scm-... | 1
> >                 libgdiplus-5.6 | 1
> >                libupnpp-0.17.2 | 1
> >                linknx-0.0.1.37 | 1
> >                      lxc-3.2.1 | 1
> >                    mimic-1.1.0 | 1
> >                   monkey-1.6.9 | 1
> >                   ndisc6-1.0.4 | 1
> >                  opencv3-3.4.9 | 1
> >                 oprofile-1.3.0 | 1
> >                    perl-5.30.1 | 1
> >                       tio-1.32 | 1
> >  xdriver_xf86-video-ati-19.1.0 | 1
> >
> >
> > Detail of failures
> > ------------------
> >
> >     arch     |             reason             | OK? |                                       url                                       | orph?
> > -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> >     m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/c97a2a85fcccdb64392bcc85a17fab787e61eba8 |
> > microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/f24009e0ea9f3d0b27cf7e8b88069f74baace257 | ORPH
> >   powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/f635d15201bf3342abbbb43c42937edf0b9e05bc | ORPH
> > microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b49876b80ef72d9c940539d20794c8946e30aa40 | ORPH
> >   powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/26f8d72b273843ab7cf27de266d1b0bf54824270 | ORPH
> >     m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/b24ba2916c17b0636df7fa103d18777af6c400e7 |
> >     m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/cf9391fa6a7fe9c2d4d097407f1398e4fa565561 |
> >   mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/daf0a0305fbb6458036e84aafdff94ad376383c6 |
> >     arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/506d66a69a3d953ef81e696c19f7b397671a25a7 | ORPH
> >     arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/827cb3e1c1927435cd91f87634aa604dcf3a6423 |
> >     arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6a8fb17b265433d5629b564d2a59232f5e60c916 |
> > microblazeel |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/25f9821700a1a557d10c7c2f38efce18462fcddd |
> >     arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/07e7e7769e9573f13dc63c38a28652d336defefb |
> >     mips     | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/5626e1998e2a9fd7731a48d3c661c9d3d3c70232 |
>
> This can be fixed by the patch Yegor sent:
> https://patchwork.ozlabs.org/patch/1233755/

Could you add your reviewed-by tag?

Thanks.

Yegor

> >     arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/e154416b2812d68fb2df265aefc8fea1eb05b7b2 |
> >     or1k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/01554a56ece9ce3bbdad32e70325c843ecfdb6ea |
> >     arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/9c091e069c737151a7f6cc976ca389d60ea9ee34 |
> >   powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/078b9ab066d24c173d338cd6662c23d7b4cc02eb |
> >   powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/9d3d11c7b84aef0f26c489e7ecc9c36075172405 |
> >     arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/913551072e9cc6282157425c357cb5366057a7da |
> >    mipsel    |        linknx-0.0.1.37         | NOK | http://autobuild.buildroot.net/results/cfda0ce53165bb22b691b5b6510f0ab096a41e17 | ORPH
> >   sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/73048cabf64486c7e6132eda7592a0d24115a22d |
> >     arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/a69fc25f5426fae043504828c0de0e049acbe4f0 |
> >     arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/cc9e16173fe9fc4942b0db3d5f56e00cc9dedecc |
> >   powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ca5e1293786366cf6adb5889aa664a5689f31ba0 |
> >     m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/84cc615c206d3c3b815e6dc4fe2422581775ac9d | ORPH
> >   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/506d9b31d4cfd7db248b3167014296f06e4722ea |
> >   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e688baa02fa46ef094a2f554cfb8dbc485c5bbb5 |
> >     arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/287eadc2cdf5f3577a7f4e23eb74c0d811782949 | ORPH
> >    x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/70d3faf7f6ce93132903f3460331199f52d9c9ed |
> >     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/d790ad8b5f81e5e541acbf1f0aa5bfef5b5a7434 |
> >   riscv64    |          perl-5.30.1           | NOK | http://autobuild.buildroot.net/results/4830d47455ff9db63e198d16195b890dfe1f6df5 |
> >   sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/e7e63407b9d22ec7debf58588746879cadf0f982 |
> >     arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/eacfc2eaa8cc8e1f5e9452b0175ffead556d7216 |
> >   aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7a059111d48b421060f96698d977a57976e67144 |
> >   aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f68aac341fa947ca613acee49c32b8eccf6575e |
> >    mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0f69836e3c397498c877a5d92285d244effdbcd5 |
> >     arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/210424bd33f660aa0757f62a558e1e03faf0f371 |
> >     i686     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/7d5f5980f1ba248a1d95b380d422eaeeaca265f8 |
> >    nios2     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/07afe5fed314d243c9e809417e83287f996714ef |
> >
> >
> > Results for branch 'next'
> > =========================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >                    erlang-22.2 | 3
> >                 linphone-3.6.1 | 3
> >                   gensio-1.5.2 | 2
> >                 libtirpc-1.2.5 | 2
> >        linux-firmware-20200122 | 2
> >                     brltty-6.0 | 1
> >              fontconfig-2.13.1 | 1
> >                    gupnp-1.0.4 | 1
> > host-sdbusplus-4212292bcf13... | 1
> >                 libgdiplus-5.6 | 1
> >              libopenssl-1.1.1d | 1
> >      linux-firmware-legal-info | 1
> >                  mesa3d-20.0.0 | 1
> >            oracle-mysql-5.1.73 | 1
> > psplash-fd33a9b3d68c89fa22f... | 1
> >           python-jinja2-2.11.1 | 1
> >                        unknown | 1
> >              xscreensaver-5.43 | 1
> >                   zeromq-4.3.2 | 1
> >
> >
> > Detail of failures
> > ------------------
> >
> >     arch     |             reason             | OK? |                                       url                                       | orph?
> > -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> >     arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d3e79cde09d30d63f60e477e0925623c224d170a |
> >   sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b7eb3a02343769fed56c86531e85ab645a51dc5e |
> >     i586     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/00ec62152f85c816ed998a80b4c20c5594c63569 |
> >    x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/77ab044930e6f76eec822162fac21987a23fc67a |
> >     arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9eaaa7c98f59ae8e625d2323cf3ae11db002b241 | ORPH
> >     i586     |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/b86e74871fa0d1d434c318c87a8ef7bb77625882 |
> >     arm      |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/d33c6cc6154607c6f1f8fdde3569cfcc4b9d2330 |
> >   riscv64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/3a414cdccdcce145e607fc587ef3d540e77d0a1f |
> >   mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/a32f62b37e5ab1708b7460993bb244ec68179f87 |
> >   sparc64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/307714a72ce7a99cbf878ed6e32de568dbf5ec33 |
> >     m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/aba92623bda0a9baa9003c260a15ed8b91d54092 |
> >   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a334f774e95fb7805568fc3868d5cf1d790a6e73 |
> >   riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/9cf80bdd4d329788c89596b56205ef215ee09c35 |
> >     arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ed8bdcbfb7d453ed7d436bada35417ee305e6ac9 | ORPH
> >  aarch64_be  |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/bbed2e722bdc81c24ccfd366c63c13529e168425 | ORPH
> >    xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/495fb5a5993f436ffee3abae026c421542d73651 | ORPH
> >   sparc64    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/59c4a8ea46d1e06ef0f6c73db1be41885044065a |
> >    x86_64    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/657f89f60d82eddb54f7a45aaddcdba79d184652 |
> >   powerpc    |   linux-firmware-legal-info    | NOK | http://autobuild.buildroot.net/results/4d5d2e0e2ba4a394e263a5e69b5a1192663545de |
> >     arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/59be11ce2ec3c6c6209ef935919faf4d9b55e23b |
> >     i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/fc5794a43188477e6b6d6bc3b523bec9850d80a0 | ORPH
> >     m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/90fe8f58246e8c8700c8c706dde0282838aa357a |
> >    xtensa    |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/b9c777f0c6361ada9e47fd4a2143467059cfdb19 |
> >   aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/383b1adbe3768bebb6107321f41bcd3a27d570c6 |
> >    nios2     |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/54741206afcaad4a67da820748daa43b1215d254 |
> >     or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/042ab2198f65436c45e82915d4fa49e82ccd9ba3 |
> >
> >
> > Results for branch '2019.02.x'
> > ==============================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >            host-mfgtools-v0.02 | 1
> >                      vlc-3.0.8 | 1
> >
> >
> > Detail of failures
> > ------------------
> >
> >     arch     |             reason             | OK? |                                       url                                       | orph?
> > -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> >     arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/33f8e4054f2b9b9b4f0ff21a7016b4fa44b58ff0 |
> >   powerpc    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a018cb7bcb3ee0458834d640f338aa5ff3417961 |
> >
> >
> > Results for branch '2019.11.x'
> > ==============================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >                   gmpc-11.8.16 | 1
> >                 oprofile-1.3.0 | 1
> >
> >
> > Detail of failures
> > ------------------
> >
> >     arch     |             reason             | OK? |                                       url                                       | orph?
> > -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> >   riscv32    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/677492c917f5dd18fee73a475287b14ac8e0e116 | ORPH
> >     arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e9c60cf5e01eee7f0e6e5eff1d80ce322a1aa66c |
> >
> >
> >
> > --
> > http://autobuild.buildroot.net
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> Thanks,
> Asaf.
