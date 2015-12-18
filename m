From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 18 Dec 2015 08:32:53 -0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-12-17
In-Reply-To: <20151218073022.58EAD102409@stock.ovh.net>
References: <20151218073022.58EAD102409@stock.ovh.net>
Message-ID: <CANu7NGtPxDk0_hut1qD9nf3Xx-WtbhStzPfPZteLA3XQio+ztw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netbsd-queue package failed because it couldn't download the source from
http://cvsweb.netbsd.org/.

http://autobuild.buildroot.net/results/b67/b67334da34901745a2fae5f202b9ae19fcaa7d12/build-end.log

Since it is a critical package because every musl toolchain depends on it,
should we put a copy in sources.buildroot.net?

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-12-18 5:30 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Build statistics for 2015-12-17
> ===============================
>
>         success : 243
>        failures : 87
>        timeouts : 1
>           TOTAL : 331
>
> Classification of failures by reason
> ====================================
>
>                  libeet-1.7.10 | 14
>                   boost-1.59.0 | 11
>                  mesa3d-11.0.7 | 4
>                   ffmpeg-2.8.3 | 3
>         ltp-testsuite-20150903 | 3
>                arptables-0.0.4 | 2
> host-gdb-6be65fb56ea6694a92... | 2
>                 elfutils-0.161 | 2
>               squeezelite-v1.8 | 2
>                     ustr-1.0.4 | 2
>                 moarvm-2015.10 | 2
>                dvbsnoop-1.4.50 | 1
>                    tinc-1.0.24 | 1
>                 libvips-7.42.2 | 1
>                    glog-v0.3.4 | 1
>        openpgm-release-5-2-122 | 1
>                   apitrace-7.0 | 1
>                      tslib-1.1 | 1
>                    erlang-17.5 | 1
>                     faifa-v0.1 | 1
>                 collectd-5.5.0 | 1
>                 iprutils-2.4.5 | 1
>                libbluray-0.8.1 | 1
>                    redis-3.0.5 | 1
> flann-04b4a56533faf8c8228d0... | 1
>                     vpnc-0.5.3 | 1
>            bcache-tools-v1.0.7 | 1
>                    perl-5.22.0 | 1
> canfestival-7740ac6fdedc23e... | 1
>          qt5connectivity-5.5.0 | 1
>                       qt-4.8.7 | 1
>                  opencv-2.4.10 | 1
>                      lxc-1.1.4 | 1
>              util-linux-2.27.1 | 1
> net-tools-3eb367aedf1280f35... | 1
>   xdriver_xf86-video-ati-7.5.0 | 1
>             netsniff-ng-v0.5.9 | 1
>              host-nodejs-4.2.3 | 1
>  make[1]: *** [all] Terminated | 1
>                 rtorrent-0.9.6 | 1
>                 pinentry-0.9.4 | 1
> libbroadvoice-f65b0f50c8c76... | 1
>              netbsd-queue-1.70 | 1
> xdriver_xf86-video-openchro... | 1
> tstools-08f6be304040e7b8476... | 1
>                    mplayer-1.2 | 1
>        python-webpy-legal-info | 1
>                valgrind-3.11.0 | 1
>                 directfb-1.7.7 | 1
>             libopenh264-v1.4.0 | 1
>                  openal-1.17.1 | 1
>                 rt-tests-v0.89 | 1
>
> Detail of failures
> ===================
>
>       x86_64 |                   apitrace-7.0 | NOK |
> http://autobuild.buildroot.net/results/1c6a7280ecf6be715d53d118571c58a21f001069/
>          arm |                arptables-0.0.4 | NOK |
> http://autobuild.buildroot.net/results/65cee8f13a47ccea1494b6ef67d92f2af7042b4d/
>       x86_64 |                arptables-0.0.4 | NOK |
> http://autobuild.buildroot.net/results/65d389a3a55f9cffbb7e45c0f408d678447cf036/
>          arm |            bcache-tools-v1.0.7 | NOK |
> http://autobuild.buildroot.net/results/019a37de03c1ec3adc592cc80992c2186cb2e60d/
>      powerpc |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/956187b7c1ea29dfd47078f869c89cbabdae109d/
>       xtensa |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/401bb905bbfb135cd4ebe0587e6cadc90694b00d/
>          arm |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/5920a9fd79740011b237fba40bcd3c0302f1308b/
>       x86_64 |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/d1d90e75352e29c05f2081b428275e1986383116/
>          arc |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/27a420f1a6d0d37128447d8ab186842faaa5106a/
>      powerpc |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/dd3fd03e9cd7932345384e412f8a8131bb6f2c09/
>          sh4 |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/4eaacaea2a90bbda20425fb13d2ab0217013e0e0/
>       mipsel |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/ee42c557253569ad20af9b06a291ae66bc58dca0/
>       x86_64 |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/cfbf4e41d526711b994e55fe239f03f72b58e9da/
>       mipsel |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/1d59e57f142f4f1b18efd4694fbb7c16796268ee/
>     mips64el |                   boost-1.59.0 | NOK |
> http://autobuild.buildroot.net/results/2067a3566ad4bc23aff1a5ac78b41bddba6bbb9e/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK |
> http://autobuild.buildroot.net/results/0918cdb3443a18dc082be451e49ee813dbe5d945/
>        nios2 |                 collectd-5.5.0 | NOK |
> http://autobuild.buildroot.net/results/f6b25bfe46c97e4f1262e7d9f5e28e2b329a1646/
>         i686 |                 directfb-1.7.7 | NOK |
> http://autobuild.buildroot.net/results/385fd92dd0d9740a9e2c38bced65e5f549387876/
>       x86_64 |                dvbsnoop-1.4.50 | NOK |
> http://autobuild.buildroot.net/results/2b20d563f7e452dbe1ed6e367d7bb2e4ce3bb357/
>        nios2 |                 elfutils-0.161 | NOK |
> http://autobuild.buildroot.net/results/4cd9dc886d8927eede9cac1b45180069de42dfcc/
>        nios2 |                 elfutils-0.161 | NOK |
> http://autobuild.buildroot.net/results/32623ba2f9fce25aa742f4c37e18e349b6d3d496/
>          arm |                    erlang-17.5 | NOK |
> http://autobuild.buildroot.net/results/888883eee4111720d134f6513cf25d1ccfc2ebb0/
>       x86_64 |                     faifa-v0.1 | NOK |
> http://autobuild.buildroot.net/results/9e52b8d778f5653502e54dd515aa9edd3f8e8a54/
>     mips64el |                   ffmpeg-2.8.3 | NOK |
> http://autobuild.buildroot.net/results/895451effce11c4f44015e8347a85975f00c8dd2/
>     mips64el |                   ffmpeg-2.8.3 | NOK |
> http://autobuild.buildroot.net/results/76ba13a1a3e828056cf6f8692b366732b657630c/
>         mips |                   ffmpeg-2.8.3 | NOK |
> http://autobuild.buildroot.net/results/b838e923b88bf806dd80e67690c5affa3e05e4df/
> microblazeel | flann-04b4a56533faf8c8228d0... | NOK |
> http://autobuild.buildroot.net/results/3f85ac47eed23fb316992251ecf33ab0004fc6d4/
> microblazeel |                    glog-v0.3.4 | NOK |
> http://autobuild.buildroot.net/results/ae528434ee3e53aae917d4a79c3a0fc839ffa323/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK |
> http://autobuild.buildroot.net/results/aafec1162e0ba90a479452efc2597d4f9053c87e/
> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK |
> http://autobuild.buildroot.net/results/23391905f5677ab31ac50dd6dc2cec397a2aa3c7/
>       mipsel |              host-nodejs-4.2.3 | NOK |
> http://autobuild.buildroot.net/results/1c0e055cee1e013a942311187754ec6210d68dd8/
>       x86_64 |                 iprutils-2.4.5 | NOK |
> http://autobuild.buildroot.net/results/8df37b609d9fd2e0d57cfb2e51dc6b2b4f9a5c1d/
>        nios2 |                libbluray-0.8.1 | NOK |
> http://autobuild.buildroot.net/results/8b50ba2a71949755da5bffafe8ba8ac8981f3c38/
>          arc | libbroadvoice-f65b0f50c8c76... | NOK |
> http://autobuild.buildroot.net/results/e7aeeb4e23ee74149826e334d0299be34867b668/
> microblazeel |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/409bc8db25784cdec1d91a80cadf39794d843211/
>          arm |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/003f2592d01a09b8a61239305c80a82a4ffb6db4/
>         sh4a |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/8b7a1e6054512a576eb5eb20b46d6920e82ec316/
>          sh4 |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/37b8389d4a93e216db412d01c347f5e7c64f6433/
>          arm |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/557559dd2e7b7a83930100a5362bbde409770f6d/
>      sparc64 |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/416b13b7d585dc5bb0ddd004b7dbd68ee0aad77c/
>          arm |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/e420aa6d4a304134f3903bc9b3b64ce900d5e10d/
>      sparc64 |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/00a4911ce1d5294d9bf27335d1181024a32118b0/
>          arm |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/b402af746d39ae4328f83c3e9ff0457b987b6fbc/
>         i686 |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/eb04ffed3276d51fd7472b18892b531aceeda855/
>     mips64el |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/1845cbc2d426e26812e3e34ea9ac435f613ec00d/
>       xtensa |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/5f155bff3d102d1a9639eff32f4428990fdf1617/
>      powerpc |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/de153c92d2052ade6bc65f1f81a68b6ddd3155a1/
>      powerpc |                  libeet-1.7.10 | NOK |
> http://autobuild.buildroot.net/results/5b4c104d2257f7b0ea67a34809aac9d63d453ece/
> microblazeel |             libopenh264-v1.4.0 | NOK |
> http://autobuild.buildroot.net/results/c7c296f6a6b579179a8358ca1e95835e78a16b81/
>      sparc64 |                 libvips-7.42.2 | NOK |
> http://autobuild.buildroot.net/results/392b46aa47ba60b9244bdea5576fe7e7db4d5e9d/
>        sparc |         ltp-testsuite-20150903 | NOK |
> http://autobuild.buildroot.net/results/5f1b3a1fba8956ea48b8e3352c0e27a13de1e22c/
>      sparc64 |         ltp-testsuite-20150903 | NOK |
> http://autobuild.buildroot.net/results/913d689eebf60c7223847adfa640fe88d6c3354c/
>      sparc64 |         ltp-testsuite-20150903 | NOK |
> http://autobuild.buildroot.net/results/5ff9df37b694a1b3fc8ea9f85fff9d6e7e2c53d1/
>       x86_64 |                      lxc-1.1.4 | NOK |
> http://autobuild.buildroot.net/results/6b5c57cbd95fb4387db0d059c9e92c47b18174f6/
>     mips64el |  make[1]: *** [all] Terminated | TIM |
> http://autobuild.buildroot.net/results/ab6c428b5ae820e83dd1ccdebe82a5a5de52e9ad/
>         mips |                  mesa3d-11.0.7 | NOK |
> http://autobuild.buildroot.net/results/a89c0c94ea6a6e673cc51336391f1956f9bdfef7/
>        sparc |                  mesa3d-11.0.7 | NOK |
> http://autobuild.buildroot.net/results/e07812df948b6cfdad387af246a333dc7e56e219/
> microblazeel |                  mesa3d-11.0.7 | NOK |
> http://autobuild.buildroot.net/results/84e029d0468a2805434ddf2f9eaee253300d5c7e/
>         mips |                  mesa3d-11.0.7 | NOK |
> http://autobuild.buildroot.net/results/088f813cc3bbbe3171ecce7bac0f5b0e26a54580/
>      sparc64 |                 moarvm-2015.10 | NOK |
> http://autobuild.buildroot.net/results/05a0b1ff5edea8d97d4ead9645e586369ef1ddc6/
>      sparc64 |                 moarvm-2015.10 | NOK |
> http://autobuild.buildroot.net/results/b4bd090597502213dfc16ca57e3c299c60ea2571/
>      aarch64 |                    mplayer-1.2 | NOK |
> http://autobuild.buildroot.net/results/70631001cfad30184f382308ab7bb75adb6e4c3d/
>          arm | net-tools-3eb367aedf1280f35... | NOK |
> http://autobuild.buildroot.net/results/3c73059c700fde654b4a9ebabdf2664055a64b76/
>          arm |              netbsd-queue-1.70 | NOK |
> http://autobuild.buildroot.net/results/b67334da34901745a2fae5f202b9ae19fcaa7d12/
>      powerpc |             netsniff-ng-v0.5.9 | NOK |
> http://autobuild.buildroot.net/results/d31aabdf6e4029b3f6f1995f420018512533111f/
>      sparc64 |                  openal-1.17.1 | NOK |
> http://autobuild.buildroot.net/results/7e4b8d43b56c7b9731a2255158169c4e673721aa/
>      sparc64 |                  opencv-2.4.10 | NOK |
> http://autobuild.buildroot.net/results/c6759c09c9e5c47285e8f6dac6d467b540a77778/
>       x86_64 |        openpgm-release-5-2-122 | NOK |
> http://autobuild.buildroot.net/results/fc8e787485d6bae056de81e0c0368a6968047a50/
>          arm |                    perl-5.22.0 | NOK |
> http://autobuild.buildroot.net/results/ebaa3f39eddf9a43a02643fd8797c371f7d7ec30/
>       mipsel |                 pinentry-0.9.4 | NOK |
> http://autobuild.buildroot.net/results/e5f284b561838566bd729e1f5dd7889b197abe06/
>          arm |        python-webpy-legal-info | NOK |
> http://autobuild.buildroot.net/results/62ed7cc55c8b787a3f10c6ac082c2c60ba8b7358/
>        nios2 |                       qt-4.8.7 | NOK |
> http://autobuild.buildroot.net/results/b7d3b137f3fc3e9832a3b4d297c5e43d0726ee48/
>      powerpc |          qt5connectivity-5.5.0 | NOK |
> http://autobuild.buildroot.net/results/90e982ae930aaa5aeb7e14a61d2b4aab17740758/
>        sparc |                    redis-3.0.5 | NOK |
> http://autobuild.buildroot.net/results/10b4fd98745c0c65a87581a5c0291fe2b36b0b54/
>          arm |                 rt-tests-v0.89 | NOK |
> http://autobuild.buildroot.net/results/8a75e046cfa7f1d0b56805957d89b19220cce58b/
> microblazeel |                 rtorrent-0.9.6 | NOK |
> http://autobuild.buildroot.net/results/40a62582579ee41e651e4ec9df7988ee792a245a/
>          arm |               squeezelite-v1.8 | NOK |
> http://autobuild.buildroot.net/results/d6322febcbd3961cd6af67a4ec81aa230a0f1b27/
>       xtensa |               squeezelite-v1.8 | NOK |
> http://autobuild.buildroot.net/results/6dcb13ca2858b4cde578067f808eb8629a48d4d4/
>          arm |                    tinc-1.0.24 | NOK |
> http://autobuild.buildroot.net/results/82bc3f1bfefbe5ef622400fcdee3e7ae8dda572e/
>          arm |                      tslib-1.1 | NOK |
> http://autobuild.buildroot.net/results/f8a99058e36c2b33dc7fe3ea72fb10b289d36bef/
>          arm | tstools-08f6be304040e7b8476... | NOK |
> http://autobuild.buildroot.net/results/50b43f64a6effd692b63d74523aa2ad0305bb20c/
>         bfin |                     ustr-1.0.4 | NOK |
> http://autobuild.buildroot.net/results/4968a0b3c1281125752f3ab92f8905c500f61db9/
>          arm |                     ustr-1.0.4 | NOK |
> http://autobuild.buildroot.net/results/3578dad106828d98d31fa2fd686251cb3ce61fb6/
>          arc |              util-linux-2.27.1 | NOK |
> http://autobuild.buildroot.net/results/ea4f6d0b91a91d507de1b20e58d560eea44eba7c/
>     mips64el |                valgrind-3.11.0 | NOK |
> http://autobuild.buildroot.net/results/03b2728abfce47a616876c0616ad9d78bbbbee24/
>          arm |                     vpnc-0.5.3 | NOK |
> http://autobuild.buildroot.net/results/139e5ea986455f13b24679fd955d6c6b77f958b6/
>       xtensa |   xdriver_xf86-video-ati-7.5.0 | NOK |
> http://autobuild.buildroot.net/results/e7d54d6111cabbf1ef36aae5433aec54ddc359c6/
>      powerpc | xdriver_xf86-video-openchro... | NOK |
> http://autobuild.buildroot.net/results/b912bb482194d4ac97e4a7f3869fd3d2ae810362/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151218/82a70a10/attachment.html>
