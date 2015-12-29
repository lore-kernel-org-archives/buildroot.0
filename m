From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-28
Message-ID: <20151229073021.6CC24101DA7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-28
===============================

        success : 196
       failures : 137
       timeouts : 0  
          TOTAL : 333

Classification of failures by reason
====================================

                  boost-1.60.0 | 21
               tpm-tools-1.3.8 | 16
                  libffi-3.2.1 | 10
             host-boost-1.60.0 | 10
host-vboot-utils-bbdd62f9b0... | 8 
zbar-854a5d97059e395807091a... | 4 
canfestival-7740ac6fdedc23e... | 3 
              rabbitmq-c-0.7.1 | 3 
                  ffmpeg-2.8.4 | 3 
                 gtkmm3-3.14.0 | 3 
                   glog-v0.3.4 | 2 
               libcap-ng-0.7.4 | 2 
             lttng-tools-2.7.0 | 2 
                  libnl-3.2.27 | 2 
                   erlang-17.5 | 2 
               trousers-0.3.13 | 2 
                   mplayer-1.2 | 2 
                  autofs-5.1.1 | 2 
           libvncserver-0.9.10 | 2 
                moarvm-2015.10 | 2 
             host-nodejs-5.3.0 | 2 
                     rpm-5.2.0 | 1 
                  aespipe-2.4c | 1 
                  prboom-2.5.0 | 1 
                   systemd-228 | 1 
                 mesa3d-11.1.0 | 1 
                     aumix-2.8 | 1 
             iputils-s20121011 | 1 
                iprutils-2.4.5 | 1 
             ipsec-tools-0.8.2 | 1 
          libedit-20150325-3.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
xdriver_xf86-video-openchro... | 1 
                libsepol-2.1.9 | 1 
sconeserver-3b886c3dda6eda3... | 1 
            xlib_libXpm-3.5.11 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              alsa-utils-1.1.0 | 1 
               dvbsnoop-1.4.50 | 1 
                      qt-4.8.7 | 1 
                 opencv-2.4.10 | 1 
           argp-standalone-1.3 | 1 
libubox-e88d816d6e462180f03... | 1 
                libtirpc-1.0.1 | 1 
                busybox-1.24.1 | 1 
                numactl-2.0.10 | 1 
                alsa-lib-1.1.0 | 1 
                    zlib-1.2.8 | 1 
                    iperf3-3.1 | 1 
                pinentry-0.9.4 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                      gsl-1.16 | 1 
                 qt5base-5.5.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                   slang-2.3.0 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/1c2691ed876b24b266877d6cac71a91f03e21037/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/63403de7b1ea7530d4d3c932038c0cc912c8bc23/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/666f2e321743066d144ae9eb58686d4989468742/
     powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c5a7f1572b2553c086779a65e3ddb793e2ffa521/
      x86_64 |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/67e6d29e6d6f8d4967a74ec70a754a5b24afc0ce/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/2f2dcf8d2af961c0401a4b39f96cefe691a4479b/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/1d1c69d16ddc04f4448d353c82756d6884566ff5/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9bea773db8f2f80840aabd7077353f0cc81aa3ae/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1a1cecc60ec4af88862db950d9df4b99623ac888/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d0876d85fcc649e696da1ab2091b053ab524771c/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0df814c7ace00c641e39bbdfb0feb02924b99715/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ec9559d83d4d0e8f3ae6447a4edb5338efb0b95e/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dae6e2047912192c45befd528e4f80092c26904a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/42c73ccd07af6f1ab1ace3586144eb42fe096213/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e0cc0be329064afd18ec64ee193e2c5ae1e34bd0/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9eede436dfd6076018bfaf20ceb6b522804ae41d/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/67b584890d5594c479a182599b759f5b4d034bdf/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/069cc255004d733f26dc4f54440788769e18be4e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/16a24b5dfa3e51e339f19ee9124734cb6909e07f/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a0d0a77dd9b6ca26bbb361a6237d46bc817981ce/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dfaa12b46653be0e92a351d972696bec1e931a19/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d7cc185dde094450b9af30efb6a71202d9667a8c/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/367596f1bc7b80ce580c5c0887e5809462154527/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b158ce29b6d4af419f08dea9c4fd17a69dae572/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b667fcbb8d139a9e8bdc6327007c66d696a85590/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b1e688679d2479db051c70a7fd6841710236648e/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d4f69058e11fa6a637e348c035338233ebe8ba2a/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7a44465fb2f25cc61e77a46a2be0790654cc6ce6/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/a394696e0e9450ce84d1ad0f17d8f8cc4f4fb6ac/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4e1313e68e5f5b2df2386ec89a1ca413f3914526/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4c3da035d93adbe66b42eaad872c4db9be8b28c9/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/51d50729af11d67d36e1caec2d2fd24eecdc2524/
     powerpc |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/ea11c11394d6e601c8b94b861b095ffd65face71/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/11ffbe3bf6522c3e8f36c066492c6e99c4e9c8d2/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/70d5ca58363fb7ce4f075cefb9e4ad24b516e70e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/4006fb111790586ab6896fa12fc94351ee6377be/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/867cd3486d70377dc9af9d9b331e502257b0f3b5/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/a231e9ff79023419d56926c76f02c89594cedb82/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/8c3b25b8891f95bd2cc088fc9431240de4eb3181/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/46b6ad557a47dfee59c15a6a5b38762aef536ebb/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a9d264d55525a3890dbd93d1d540535a5c374e4f/
     powerpc |                       gsl-1.16 | NOK | http://autobuild.buildroot.net/results/4cc48c15a5d3058f057b65f26d81fcd99a5da06d/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/3e2ad2de03b5e9f181332d06dcf860e51fcd47f8/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/2c5b9c968d3b02fdd675a5a060a3520c38e34757/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/add1903ab338e2988a2618b5cd30d5a80d6e8d35/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09e169b861f5b506403b88891e57ebbdc0078512/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/025f970344c13fcdf0824f14977d0d58a09e926c/
        bfin |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f92186f43b060c561a141536a9e492b33d7d5041/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2bfbca155dd01cd8119327f21ce72f9e9d75bf91/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ec2472a40adb3cf25b5850ef0ba83b6e386f46e4/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4010cb29040074790e53aed9a841327dd10d2244/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fa1aed313fd6818311b5c230081ff670a8183508/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0260c0bcb41d7e3ef0e521fe50250456a3aa3e75/
     powerpc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aaf4ee182f109a3ad29538e8415257ddcf196cdf/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/713022c1b0dcd2d47213986262627f6d3aeb9de9/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/99ab462f8cd97c21aad788c9d758c8a115807a90/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/7a88bc137d606031a146d8e26692cbd0b9b5d596/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/e3147c0d9c9eb9f58773b75c8cb4ea49df483611/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b2728f253dc0414dabe60971e714bbcae99f47d6/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a66da29adfdcec62dccd48e23bf914a9a0a72fa7/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/18840e1faad4aac7abc9cb413081634a1379a59a/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/881b7b86da30d53bfdd907291cc2c818e34df051/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f4b211abe9b0a9e14c2dabde3fb9bc2f15b52ab1/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cf45f191427e6f6755f654623afcc9f7653d5b53/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bbc59079ebf92925fd43444448f82b42e5052d09/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/257fa2b44504d47c5d3c11a143c4294f8a17dfc7/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/3704cf472f17d1041d9c528632440242ff92879d/
      x86_64 |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/41b449768600adf957f6cb1982f215840ffad9e8/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5e58fab884cc65c6220337ea32552fffbd362d53/
     powerpc |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/d3441da2e07e9b58fec2a9497599b99de0ea9084/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/7ab743b8e925ab02234e9c85d5a1fc530bf79bf4/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2326ffa9f763a6907bf5c2f71673fbb2f723d1ff/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c8f666f70b59de4619f9cad5122b92c8cef4f116/
     powerpc |           libedit-20150325-3.1 | NOK | http://autobuild.buildroot.net/results/b92f7e2b86ffa575d8a8a0b91fbdd9bcb0f231de/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e10be1c38f01aabe6f567cd2c485610df031dbc6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3a869a3bf8170fd310fbad27fe7d6ba3d8d773d5/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a8081d5cc8a58d3b3559b42138846273e816a115/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/55c5d93859a98d4ef967f52c6c12f62041450512/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d98581a0c1600153a74c075b18bb7efbefe7b0b7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/254792bf0f44b9d6e2b4276203d656de198f3f9a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ce2fba61d7433bc3c719758cef794d5725e895bd/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4454a4ca7c73eb2c44601251d007c1dfd0b29a65/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7cc2966d8fee9fbf655fc895fc7ad2278259d5fe/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9a4668fb1207f3e5930514e5bb32592eab00563c/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/2014e4b889f105cc11bbea33cb4d842a423cf88a/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/406dccec4253c79568bc0f3607b419158750d597/
     powerpc |                 libsepol-2.1.9 | NOK | http://autobuild.buildroot.net/results/6b8196d7e46142b0d4e6e5558567c1e82c936039/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/3daa8eda0a1554228e467383eef4132155515c4e/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/a058ed3b47c80cbd6d4017d9b1cd1ee62e037ea7/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e28bb35f4f382cfa075bd38536fa117caac26300/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/5ed2143ecce9fda56ee288e464e26f4853fbb323/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/ad99061d1133d5cd0a104fa999905feb1530ee84/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e021e0e5d7964b311b27e2e2612f0543fa3c11d7/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/78e04bfd635fb8ba413886bc05e6d5abf3f81a19/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/63427a198e3e5ecfade50f5751c128a814c190b8/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/f5569e9e4596e7e86ac9e6c5a23dc3ec646d71a6/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/6eafcd8bb119ed2db4dbe9d13f449fc472a1ce46/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/29ba94cf925ffcd08269d5c820bd37ee26999a0a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/94f57429c1f7e4126efbb0fafb13033c046d026e/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/3555cd0abe68b6f0e2b2089af5ce26dbc4c73df6/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/64bd6080e71757c5f2c911883a1039a9afbdb798/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5fa65669f802d7685785a43c679aebe1c3391e30/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ab8d4cb5cb7f06d1eab086bf5f6434a63f7d9481/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/77dff15d76e7ba9a2236e75304bab021be463b3e/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/1a61018f39a5dd18f6445412510724d16c86e275/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/c20764bc088830958a3b115de96986c2631171b4/
         sh4 |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/fe1600a9ba50222a90f2bae395002f77e71748d9/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/a18122fd8d03a83c81e195d8310a0e0214921de6/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5dda5153f6aff00d71a3c3db67c968cdd34f873c/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/dc171af0cad60d21573e107d47b6004522bdd2b7/
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/61346f111b4ea5bbd818121b17338e93dc2cf62a/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/b617814d73e5ccf8d8d9cd68b7b6dbc4c71fe395/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/44c8d33c0c19a2dd6e0d718ab624971f0c2fda51/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d7f17c512b4ceb8fa7ddc8fc70f4cade5b1d1c83/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6a9d9f67d6f1eb554292d74d5ba68693e4394381/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2d2c655429df62da2b8746a564fc064609e96001/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ce7d971c1e590b39a3e457ee59c3031817a3c969/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/17fc6ca79765fd9ecdacec4f5a2b58caa554d48d/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2b210dd20e195219940e95e24f17faa37b046da3/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/11cb0d1e51459e75e5f376cb07ce0188f8f050c4/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8b64143d7c35cb1ab91af636efb22b0c9b9136fa/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2f8bd534e6fcd9d356fe9087cb1394b9b2c4192c/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/bad9a97b4fff00732f2efb043bbb76a99963c491/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d5259b83e7a269bca019d024366aa201f5a174fd/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c3b75979c1860d627bc34897c572388a243ed1d4/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/19ed5575a1c228cf109502eeed51d34bd07e2085/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/266ad6a66b53441ed5a85487822007948f91e6d4/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dcf3145a191869108b07844f35e5690e6821d46c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ac6f83053f69ca615dd9a3d416695db42cc5ab14/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3bf650f432cb402f87d9298e3cc1ded5ae1f1fdf/
      mipsel | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/39db1628f7791bcb231d8fe822c0f54bedc8bb3f/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/c78e73b7b7cb58b85ca30874077151f5bb14ddf2/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/d7dbe961cb7db05298c90c5724ca66060431580d/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/835c061eb085c6f2090d145e396cdc8cb8c6a8e8/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/331c3c3f07dfc3bc569d0b52496789d6bd588305/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a5e92417a3c17a634a848877b7619872e2ec1ab4/
     powerpc |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/8c346bc9ecbb0cb1e4cf639b5b8688de804c066c/


-- 
http://autobuild.buildroot.net
