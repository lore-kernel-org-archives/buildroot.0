From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-29
Message-ID: <20160330063024.0B8E910345C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-29
===============================

        success : 178
       failures : 143
       timeouts : 2  
          TOTAL : 323

Classification of failures by reason
====================================

                     tcl-8.6.5 | 24
                linphone-3.6.1 | 20
                libldns-1.6.17 | 10
           libimxvpuapi-0.10.1 | 10
tvheadend-cd9f07fb865e57001... | 7 
                  boost-1.60.0 | 5 
   host-python-m2crypto-0.24.0 | 4 
freerdp-2ac195e8eb2c5fbbe8f... | 4 
               linknx-0.0.1.32 | 4 
                   erlang-18.3 | 3 
                  connman-1.31 | 3 
                    cups-2.1.2 | 3 
                   mplayer-1.2 | 2 
                    norm-1.5r6 | 2 
        lttng-babeltrace-1.2.4 | 2 
                   systemd-229 | 2 
        host-gutenprint-5.2.11 | 2 
                 mesa3d-11.1.2 | 2 
                collectd-5.5.1 | 2 
      ca-certificates-20160104 | 2 
                    mosh-1.2.5 | 1 
                wayland-1.10.0 | 1 
             lirc-tools-0.9.3a | 1 
                 omniorb-4.2.1 | 1 
                 libgee-0.18.0 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                   taskd-1.1.0 | 1 
              gnuradio-3.7.9.1 | 1 
              gst1-libav-1.8.0 | 1 
                qt5tools-5.6.0 | 1 
        ltp-testsuite-20160126 | 1 
 make[1]: *** [all] Terminated | 1 
                     vlc-2.2.2 | 1 
               iptraf-ng-1.1.4 | 1 
                  ffmpeg-2.8.6 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                 libdrm-2.4.67 | 1 
               opencv-2.4.12.3 | 1 
                 igmpproxy-0.1 | 1 
                grantlee-0.5.1 | 1 
              libsoup-2.54.0.1 | 1 
                   nginx-1.8.1 | 1 
                pinentry-0.9.4 | 1 
               tcpreplay-4.1.1 | 1 
        gst1-plugins-bad-1.8.0 | 1 
                libgtk3-3.20.1 | 1 
make[2]: *** [code/CMakeFil... | 1 
iputils-3a86a2542c6fe29413c... | 1 
          chocolate-doom-2.2.1 | 1 
                 raptor-2.0.15 | 1 
                     qwt-6.1.2 | 1 
                  gamin-0.1.10 | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a017a0bbc2b77344353b42f1d8e6c29a434edad6/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/506b3b1b4087318a4247456782ac9e4f128d5db6/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1d69448f27df04c3d0d5ed034cd604951688f4c5/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5f2a8fb5cb823160542ee721591867b34bd25de6/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/177525066effabc8dd985959c9b0b612d5ccf30a/
      x86_64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1f6d536ebd3b9886817aaf08816a2cfd1f05b07b/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/d589a83b3b45a5a11b25c8e79e871d7c30e139ec/
        i686 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/b0501f3a967f6a44d00242c1875b8dd437ca101b/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/6eb513295019727ddbd6483ededadfd6213118e9/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ab86fac26e6be3a7fa7b1c81e771e106f4c5f5cd/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bd70be5b64860b8c15db24d3dd3e814a6641ef34/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4d733b1cfa26c6777f152834d5d5eb70852e60b6/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a649d9fe691866da55bb3865a9d081066601bfec/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9756a4b12b25906923cd1bc2808f5d1d611e2b76/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/bc00ff740beac826c46de71e463afe1d02191f15/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/46c6d1cadecbf9dfa07b52272bc4c219d1f1faed/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/ab696846ed49fa390cd023342a4e73a99d466e6f/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/1237121a1f14934185c4a9aaba86025db9a0f538/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b939eb4e9da8c85dbba96cecf765c73962d88c94/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/59899b199d2c32ae171e2aa067c71bf7f661a938/
    mips64el | freerdp-2ac195e8eb2c5fbbe8f... | NOK | http://autobuild.buildroot.net/results/0efd39115a631c409eb809b38ab64604d1de99ca/
         arm | freerdp-2ac195e8eb2c5fbbe8f... | NOK | http://autobuild.buildroot.net/results/7aac3f970dd1fbc0d25f268f32844bec7e49f4af/
      xtensa | freerdp-2ac195e8eb2c5fbbe8f... | NOK | http://autobuild.buildroot.net/results/1abc713a58d21c71678aab9b21ac1cfac23684f5/
         arm | freerdp-2ac195e8eb2c5fbbe8f... | NOK | http://autobuild.buildroot.net/results/396401bd6eb5f95364a32456a274da185e081541/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/3c7b90db0c934d7177586a434b2e849652983580/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/0e94044b689ffbc8e2f3ad8fa7975c923eef5a81/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/63802edbc75ed824bc6b56c407e800a65ecbdd66/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1f69b1942ad9bab63f8c12ba4f286222536277aa/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/042ed926b8ec9d2221fbaad90016486f11602ed4/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/87b6809b5ea6d12c58159564291a8c3583792800/
      xtensa |         gst1-plugins-bad-1.8.0 | NOK | http://autobuild.buildroot.net/results/1fee1a14d2ddcd0cd2860c8dda3a438943584e90/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/8daa90a2d9647e4eea037903aa9820198d775b9a/
      x86_64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/81d5163c001af3d9b427e7b5928fbe691c1e74f9/
      x86_64 |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/d2f2592f8dfb0612c94df241b93caf702c4148e1/
      x86_64 |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/a2e7f59ccfe3ca449d629de95143212717b556a5/
      mipsel |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/09c23f2f9758bd87ee5f9c980c1a2d051f506453/
         arm |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/8ffbf6082b7a69c54a50f079db56b32d98d07d35/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/9f8e2b2b7aef2e4479e55b82f080c48606a0a326/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/8bc5db35c6db25de09867e011214cb5aaa9a06a0/
      x86_64 | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/587d68e8091758e70886831811760e091b858e1b/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/2eb45d2b3a35c4fa555dfc57a8b0b1aea43e61a5/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/564c39adf94b893be6593a51ef78075386125d7d/
        i686 |                 libgtk3-3.20.1 | NOK | http://autobuild.buildroot.net/results/473fb2f416311ee8a8a8719e3fb3689d9226f451/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b4afab0c1c6c78a0ca4200073493b86acfdbe48c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d663c22c7fb8573ac3b453c069f632e51fb99326/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d474360c3ca53c0c591b5b2ba245b30c0cc9a6f0/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e434f951d05433d453164dc26f1134bc3cee5f40/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/fa8052f1f6103edafde4a2d929183bc0534e8b88/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c3a91e16567b50f528a08de696ffda02f81fa5de/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/61e07809a718396d3616ebd5a22fae0ca085620b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/bc6affdc23617b5e0462663a4d38222170d9d951/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5c7376256044762497c46ac36d65dd300d0b7a16/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/91717218d0677b4d095a1a2e7ac5c0d19d34b867/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/d5e861eed0658df0073254dd0b6253e28ba0b306/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/29aa347e15ce5f6afc690309d2cc0f0c69753b25/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/88c39729a191cc9ddd245fb998f01d52554b160c/
      xtensa |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/0d0264ca3b3996271c6834ef39e276903717cb8d/
         sh4 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/bc6326e0f8f1bcbfbd1f4086a1bd338d63f47c52/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/8452a4bf52676250a2d1b2237822fa2b667b3a0b/
     sparc64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/18732fa156d32a820852a1a7b4412ddb14078941/
      x86_64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/c8da759398d824aac1cc7af61138ccadcd7f42fa/
      mipsel |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/e12a083800019380a64417d802576e5853319d67/
     sparc64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/4b3d3a313583d4255da8b38870acec32157ace1d/
         arm |               libsoup-2.54.0.1 | NOK | http://autobuild.buildroot.net/results/d43a91a6fabb8b4bdb7a76834f1691c4cb8121aa/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f5e67c0b180818521504ce41f771a775cd607c5f/
       nios2 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/329685f61a62a51d08548fc85eba3adeb2b5a2ca/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6167f6505cc3ab7d70c7b16139e6a109b1281b51/
      mipsel |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/5e9399c68a071e4972404ff3abeb1748b98a42f8/
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/fb78277a8220cedc7e6950aad03dc81344ac27a2/
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/eb8edcb6c96fdd09eed49ce63ffddc1d292dab26/
        sh4a |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b5f15bd43ace1aea42a955502ead440d2baaf805/
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ae226eb8881e6e0b273b818f9dc0eac58512a31d/
        i686 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ed508ac3509be8c46670198da8eb0a2ba74835e6/
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/99f2a211ff6b979894a6176e28069a1244605fd9/
       nios2 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/c0b4cedb96338ab0ab7f6f5ffebfbf7d4e8dbf62/
        mips |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/f1680c9b173baa51660d91334907e4fb1681c56d/
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4882c29fc0194f8fa520372d532c59de763f7bfc/
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/826b42c8209a3f01d9a9e51620f3a9c49f820d0a/
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/8ee2cdc390a121b2b588cc378b6702997610909f/
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/bbbbf986dade950a35e4d6c02d7c82b085d8a45a/
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/bc0bdd480ccbd92debd7f2c645c7a7d3428960b8/
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/00a3eca7af2d0e9feefe27a04e5c769c0cb45bc1/
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ab397a1a73dad07bf44a4ca8564f6130267f16ba/
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d767fb896f01bcda7a1f2df5708f5ecc203acedf/
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/45e605de0488e9e961a536f4d232235c5282522b/
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/2c92f1f8ab0c08caba94abfda2972aa7c3ad3405/
     aarch64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/05cbd7338fa49b72ee884cbb34c17e738ea34c31/
     sparc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e1a61e29e5c01a5aefb9c3b2442584786c400104/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/e91fb7eb328d73269d53e56b6765354aef3f8979/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/c0944a71736b302a82120e6cba38b26fcc36e6e3/
     powerpc |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/c70c29a99f2c4c33a97f2003ad2e636492e3385b/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/cfb93ef02c95699e5eda8aa71aa758feee275e79/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/723677bab59f3b88c2bdc31324c87a008b75e3a6/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/2dd45276a9d2061318fcb0491bd83d2c47ba8b30/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/833b2ac3de2ce635ff517f76660131e35be0e513/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/e49e62de85dc77635e0238608a66dd62aa72054c/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/1b9599acdfdfbbe2acae479644947055b4c14fa8/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/89cf4391bdd40797016bf247489b7876df383402/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/af50bf9016d3fc0d7f41f00c5618c2e6edcdc267/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/ecc72d3d2dc691dc2cf4360396413ae85c2cd649/
     powerpc |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/948d42df91a670f52c8a2f2ef661fd4331d0b437/
     powerpc |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/66807bd887d678225abe5911b334d873d5dfe371/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/d7fb24058decf668baa0fd02fb16633ff4632cdb/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/55bbfa038a7da87bac38dec22d1e6773c2e1b399/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/67d11952652a261b64ad442b43458055961c3d7a/
         arc |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/805fba54468d2e3f1ddbb7a465e5e6df3df8e5e2/
         arc |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/c5aba70c89afe0757f27f4d36e50ccb9abdc2997/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/3123d856c92dc805dd97dd2bd450077b54663585/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/0805de30c9f4298e4127e4f668feef88ed12d5bd/
     aarch64 |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/1fd6193ff33250565c95e53614f5aa7fc6f4581c/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/04b1c743c2867ef22b534bca5d51641ea7a47123/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c86d1623ffff69270ac52f5839747f6ed3b3bf71/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5c67cf7b7eab6fb13bbd5f810b236b5a25f7f8e5/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0eddd9d8dc78f3717eec13e97782dbc3e3652a4c/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d8d1d6d442700d9b602c14d36b8e1fa48d837fa3/
     aarch64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a3bfe8a9c1c0129256a106a3a3872dc80107f825/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a21d52438c2b64f26f9b68cf7e4f5280ee782dcf/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/900f6200794e306242742931654b5049ebfaf562/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/02296f8624d3406a63d3a179f53862f245c56dc1/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1e2eea45d800b0bba32c806df9cc210635a82b93/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/78d6a19ef4b79fb43ac5d104caa731f3757e739a/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/bb1804030b4c097e7fdfb391eb6f3c7feff166ed/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d07d0a6cefc288573914c358dedde33789a8b8ad/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2ff17e897b6e2bf28df4acfd69d8f755d9c15c88/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d746fa30eaf392c0bc01ca9ad91e6d6dba036f46/
        sh4a |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c1a80c284043059987173c44ed3d662ccd0a9a21/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/405ec5dd959d93c9cf44e24ded982b88afad071e/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d0825a06937772a469d93af48a2d02a4a3161a67/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/64af16305ba22c494d315826c49ea49bfaf819df/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7ece678d2c10774e34305559a6eaefc39d9a0db7/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9fd9c24898c4b08da14e4cfebfb329e2c4367872/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f0681006271fc66afa4d8c1abb568fbe411c2042/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e1fc3f7a68e9fcfb2348f950c43893be040b3e21/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c83bbbe917cd2cbb53ef4e93f4e23902f96c2f0d/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/36a3cbc8b642cdb675ef54175f750acf8ed5b4ea/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/74bf95e5537c2e6254e4cfdbf9261a0f69ed7686/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/32c6e6eece7e3b4f428524114f92e9a8999568e4/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d38bf1076240d13c9f81f62cbad4702741f7abd2/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f9ca48bedf32aff10ad2b1c3c84584371cc5cbb8/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2fbb66bdced6d49cc94671574ec69a632dd13013/
microblazeel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/97d26992ee99397306ca80155f7a9e8983e6315e/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c149befea10a01a3ef85c2fc4e88bc2bfabad0af/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/19e6de7a6bd489c824d6b243ac08d19d704ab43e/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/3b5885d1965400321830cf3188ddb6d16868ecc3/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/fbf594b1bcdcf3135898dc39c7cff213714ab2e3/


-- 
http://autobuild.buildroot.net
