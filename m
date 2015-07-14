From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 14 Jul 2015 10:45:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-13
In-Reply-To: <20150714063019.9B1D2100F7F@stock.ovh.net>
References: <20150714063019.9B1D2100F7F@stock.ovh.net>
Message-ID: <CAGm1_kv_LCqx1phhQ31WqYok5GqS74H9B01vM0wncLhnL2XPoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 14, 2015 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2015-07-13
> ===============================
>
>         success : 259
>        failures : 117
>        timeouts : 0
>           TOTAL : 376
>
> Classification of failures by reason
> ====================================
>
>                 libtirpc-0.3.1 | 10
>              qpid-proton-0.9.1 | 8
>                openswan-2.6.43 | 8
>                   ffmpeg-2.6.3 | 6
>              btrfs-progs-4.1.1 | 5
>              util-linux-2.26.2 | 5
> make: *** [flite-legal-info... | 5
>                  empty-0.6.19b | 4
>                libglib2-2.42.2 | 4
>                   boost-1.58.0 | 4
>           c-icap-modules-0.3.2 | 3
>                 busybox-1.23.2 | 3
>                    audit-2.4.1 | 3
>                   zeromq-4.0.5 | 3
>            host-heimdal-1.6rc2 | 2
>                upmpdcli-0.11.0 | 2
>                 iproute2-4.1.1 | 2
>                libsigsegv-2.10 | 2
>            modem-manager-1.4.8 | 2
>              lttng-tools-2.6.0 | 2
>                     mono-4.0.0 | 2
>                  setools-3.3.8 | 2
>            aircrack-ng-1.2-rc1 | 1
> can-utils-0eb1e3db2e20b0d89... | 1
>                    erlang-17.5 | 1
> libatomic_ops-libatomic_ops... | 1
>                   opencv-3.0.0 | 1
>                      mtr-v0.86 | 1
>                harfbuzz-0.9.41 | 1
>                  libebml-1.3.1 | 1
>                   libv4l-1.6.3 | 1
>                  clapack-3.2.1 | 1
>                     ruby-2.2.2 | 1
>              expect-2014-05-02 | 1
>                    atftp-0.7.1 | 1
>                  cdrkit-1.1.11 | 1
>                  libpcap-1.7.4 | 1
>                linux-pam-1.1.8 | 1
>             libnfnetlink-1.0.1 | 1
>               xmlstarlet-1.5.0 | 1
>                   guile-2.0.11 | 1
> ltrace-be0c6870e08a3be43b3a... | 1
>                   cppcms-1.0.4 | 1
>             host-nodejs-0.12.7 | 1
>                     ustr-1.0.4 | 1
>                 openntpd-5.7p4 | 1
>       gst-plugins-ugly-0.10.19 | 1
>                       qt-4.8.7 | 1
>                  rsyslog-8.9.0 | 1
>                 beecrypt-4.2.1 | 1
>                libpthsem-2.0.8 | 1
>                alsa-lib-1.0.29 | 1
>
> Detail of failures
> ===================
>
>          arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/424d4ab39bca8faf16b5a97197e08dd871a0b416/
>          arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/bc1f1a76b01a57bc0947176b2364393916b9c5ec/
>          arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/762bce2bbc1f994cc796f0442bfa73b7ad64e272/
>          arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/4534f70dab194c043213a1ab2f694aa4fa93df15/
>          arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/48904036cbbc774d3a3fc15730c543ad187d439b/
>          arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/9464f081c6a33fbee7e9bd614e75f524e6d26c8b/
>          arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1e583599a574a7c1cab06f69cf898768c3dada47/
>      powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7cc3370382fbe26d28293a518315febad9c8303e/
>          arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/973fba18dd24afe0b6e2c81f39e7225017739d01/
>      powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/34b55b2cd83fd5d87af4a9c15d05094b16ef3960/
>        sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b63b3d55e56f4eccd110024d8cff8061ae443a9e/
>          arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/e650617344f944b43ac9fd9b213205449c06eb66/
>          arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/86376d2ee6ce6fe47dcd3cfcfe700ebcdebcf2df/
>          arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/8897aa7403987b09e6489ba9a0173b4ede9f9b0d/
>          arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/0409eb734be93494b7743a37039bd04d05c83921/
>          arc |              btrfs-progs-4.1.1 | NOK | http://autobuild.buildroot.net/results/65a3301905c07c4a38fba0deaaff4e6b1a9c339f/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7cffa8f97a30be5656b9fc6cd8fc06abd0befd34/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c35cc618a2d7504e053e126fd0cf89f078f44346/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/994f111c17175d996ebb7c3d21780479e2ccfb4f/
>      powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/a674d1678bc9e1ec162df178ff6475725887f1a2/
>         i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/98eefc695dd87dae4a5f308fc55971e7e58b76c3/
>          arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/d467cdd2e255ef34a9ec58d4a3ad4ae45897d440/
>          arm | can-utils-0eb1e3db2e20b0d89... | NOK | http://autobuild.buildroot.net/results/0ddb5a70358bdbb491fbee670c7843c15217e78d/

I'll take care of can-utils. timeval requires "sys/time.h" after that
there is another error, so I have something to work with ;-)

>          arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/5221edd18fd5ddffd6cc3aa2d3936d1c0fa1d90f/
>       x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/123e0d3685788273eeb84cb4447bbc546fcbd34c/
>          arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/3ed8d0ff51e1bb5d10542c15ab05c8c2bd1e645d/
>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/72508d19f4dbd0e14582f5084ffb28844df17253/
>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/bdd77b56ae9da4de216921062c1baa42b5ddbb9b/
>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/2c75b536a408b8826849342676ff805346b3eac9/
>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/e13264f5ff0a1a4162ddd0f8faa760dd0e095c7d/
>          arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/148681c111e0e37456831ecdfcbdcf03ae040f1b/
>          arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/71f977bf5ec302b28efc5616742ed79d2754be8f/
>          sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/f48b86c216a055a946259b789d24d9b3c580118c/
>          sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/43060c9e1458f077354de019f684d23e2ee91bba/
>          sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/b644f8749e6e5d64691641b6af1278325ea7452d/
>          sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/5eb05b09078b23d5d978092dd0fdac092c8f6acb/
>        nios2 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/4b5ca393f20a299b29e1a964d17315595fe7336c/
>          sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/f94e19f90ea8e46441bd66f9445e5b7899ee280f/
>      powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/7629af6ff24edb79ef50cf29b87be81b93f48af7/
>          arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7962c0b8a4b1ed7257d8a20573de2f2b34ee006f/
>          arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/75ed87bce73bd08885158cf026696fca526521b7/
>       x86_64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/190563a74e3bf13986aa2a073b3cb15b8d2ecc46/
>     mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/c07a34cc98a52f946887366799146131847d4558/
>       x86_64 |             host-nodejs-0.12.7 | NOK | http://autobuild.buildroot.net/results/7f339fc6437ac6194a9a9130d64a4724d63282c5/
>      powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/15ca69362baafa1595b417ca333b8746f59665bd/
>      powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b3d9bb7615f71a72cc08c654647983c93cc6cea8/
>        sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/405c346d6d4808cf56fa8bae14481e03a9700e26/
>      powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/11ec6f6baf57ee9e0024fec0059c961fd03a098f/
>        sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/ca18703888ace8b7f411c1bbac19c0ff7896170d/
>        sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/b83d438c2bec2c1e834e942eea7a2f3f6fba59e8/
>        sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/021a9b3955def81492f6b3fb354272768dffbe1e/
>        sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/8791cd2b8e15936ae8da8ee1c745ea4377ad078d/
>          arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/f541e3cb4a9d5a38fd7edd223d0e349e034bb75a/
>          arc |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/7f5b393f8b99172a5b9cd1a4aee7e94b755f4ce7/
>          arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/c9f679e337ee17320bfe55c01b0835788e3d1cb0/
>      powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/13c3117bcfad51a4f8ef2ef3d80a19cf5b5dc415/
>          sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/0025c599ea12ce97ddb9a2e0a2a3bba591d773a2/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/94ea50da80a11b1dd5255c8b9a2bd78dcc6ebcae/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/ed933c747bd34be22ac37deb6062500eeba3e42c/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/52fa9b5b9b57dda0cf707caaed53c9110c84490d/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/af5c8ae133ab0468084c79f40d06ae96e65163f3/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/51a93f0c8aeefada5ba12bb9eb32fdead80403db/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4035524635079460b8cedb5f1254839ad58e7b7e/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d7351a0f5a12ae55d64c1f1356b2d9f705d1d43a/
>          arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/3ca027f9f9369cd6015de08d04b343e60e01c1a9/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4d8f3e382838112da4efaf89311b312408dd8b13/
>       x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/eac2ab5b7c5c2f73af75ec11579eae49f18c94da/
>       xtensa |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/752cda64e3a4a73adfd9b383d5f42b61e4a1e641/
>          arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/b9228c061d34885ce6ba8d602147800926665c03/
>         mips | ltrace-be0c6870e08a3be43b3a... | NOK | http://autobuild.buildroot.net/results/833f18eccdd5481f14805b373dfd7b001f73641d/
>          arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/180a5c1b841468867b92873d19582d62262e8724/
>          arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/8c20bbcc46ad5b227351159a27e6a52789496718/
>     mips64el | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/15403a01c6f299f92b92d22db9b5cb917ef8c7f8/
>          arm | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/7da6eb8ac3ccead4dc3f1b5fc2a407d763d6ed21/
>     mips64el | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/7d24dc308eaf047a54ccf96b12fb00dc55f405dd/
>          arm | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/f9719278dae8b8886a9e85e2dabd10d3d2950207/
>       xtensa | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/81d196570b765a5a833c9d8d63318dbf3c122dbf/
>          arm |            modem-manager-1.4.8 | NOK | http://autobuild.buildroot.net/results/17d984d96e9a3e822482839c6387493de67a4e07/
>          arm |            modem-manager-1.4.8 | NOK | http://autobuild.buildroot.net/results/f60d6b0e8b7337baf930d4140a3eca47201d67d6/
>          arm |                     mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/4e0f9630d1c0f90eb254b34239784ae34be1750c/
>          arm |                     mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/1622215e3ff8fbed965c5bffca6ac51b6f7870e6/
>          arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/046a6737060f862c48cedbce1b4a265ba83fbcfd/
>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/1a9f8b7df16c7aa39007b87821653a304c25e1b5/
>          arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/e941b27b9112044c5bb8a1c8f4463d7f14138af0/
>     mips64el |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/697e4dc92df72ccac62a003156658655c831f07d/
>       x86_64 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/9cc2ee71f544ee7c1d8c14fae454d7c015ac2fd1/
>     mips64el |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/746fc556d6e4777e48e089eaadab2dae7902cc76/
>       mipsel |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/dc4ff9c4973ce32656e949ff7e2daf25e2306124/
>     mips64el |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/84d4229e71d923e4ea3117fe20d0b6bb6f4ae4e3/
>     mips64el |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/2e6e4143ab41c92ed56c9fd18f2a408a2ebee506/
>          arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/963c4578fd8cb2d0c72ca3c7e9a58a9134750735/
>        nios2 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/f067365080fd5c08552bb124815f3da3257632be/
>         sh4a |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/efca9534bceed1030d92e6568bf1870dbfc56a8d/
>       mipsel |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/e84a3cd00ca9c2124ef7a46446a5e694366e7d81/
>     mips64el |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/91d4c2b09c392b2a58f34f7aedab1406aaa8d735/
>          arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/d91d6c1faa4ebec2869d342313512db8bfc2fc59/
>         bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/911e6b243c61134fe252869f60b01bcb088124f7/
>     mips64el |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/ffff557663c748e75b96d780236213f2fe941981/
>      powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/6c978646e510b9c471321e72a5c3b67c02e70df6/
>         i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/c7497decf30368303fb132fdb7169ee17ff1ff73/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4902c9d147dff5ed14aaf07301d08e03972a10b9/
>     mips64el |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/2082f4e8dc5768b03c951f571b9aca976703f952/
>         mips |                     ruby-2.2.2 | NOK | http://autobuild.buildroot.net/results/822b069a5521bbf58d248170eee6aaaddf2a2fa8/
>        nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e285539aa0127bc3f6b28d0455cde09f2156ada9/
>         bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/0fb3004f6f477d1bf9a924fb3d3ffb6c0071bd12/
>      powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/a776001dae51c4dae1f25b3a9bf9a9fe2ca69003/
>      powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f19e843cdcc968a72919ca3792a90dd40552bd59/
>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/46052bf427c23c76d5396a0238c4dbe6024ec5c4/
>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/c9e19aa5536f3a81af2519f7d58902fe8587913b/
>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/e8fba158c50ebe806962412a64c218dd7445c398/
>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/479f9d9b8366043b61e9b3fee77949559e2b498d/
>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/c9f99b2aeab9dfc7db2a6980e9008d29daa708c5/
>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/7bf52f427515f32acebde6082b958e42c27391a2/
>          arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/951da8721fc34144a73990907c0aaccb79f5cbc8/
>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/72c81c4780a4f926f139d7e23ea3604360b617e7/
>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/77ae01363097623827af9b2e9da65ec3a1f1fd83/
>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/69a8b92e789167cde0afef640b3aea2dd369fdec/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
