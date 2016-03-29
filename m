From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-28
Message-ID: <20160329063023.E060D102C3D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-28
===============================

        success : 184
       failures : 140
       timeouts : 3  
          TOTAL : 327

Classification of failures by reason
====================================

                     tcl-8.6.5 | 28
           libimxvpuapi-0.10.1 | 14
                libldns-1.6.17 | 12
                  connman-1.31 | 10
                  boost-1.60.0 | 4 
                    norm-1.5r6 | 4 
host-gdb-6be65fb56ea6694a92... | 3 
                      qt-4.8.7 | 3 
                    yajl-2.1.0 | 3 
                 jack2-v1.9.10 | 3 
       gadgetfs-test-undefined | 3 
      ca-certificates-20160104 | 3 
                 rtptools-1.20 | 2 
          libwebsockets-v1.7.3 | 2 
                   mplayer-1.2 | 2 
        host-gutenprint-5.2.11 | 2 
                   systemd-229 | 2 
                wayland-1.10.0 | 2 
           lksctp-tools-1.0.16 | 2 
  getent-buildroot-2016.05-git | 2 
                    cups-2.1.2 | 2 
   host-python-m2crypto-0.24.0 | 2 
                 libgee-0.18.0 | 2 
                  cairo-1.14.6 | 2 
              gst1-libav-1.8.0 | 2 
                rt-tests-v0.89 | 1 
             lirc-tools-0.9.3a | 1 
                libpjsip-2.4.5 | 1 
               linknx-0.0.1.32 | 1 
       openpgm-release-5-2-122 | 1 
                  trinity-v1.6 | 1 
          libpam-tacplus-1.3.9 | 1 
                       unknown | 1 
                 lvm2-2.02.147 | 1 
                blktrace-1.1.0 | 1 
               valgrind-3.11.0 | 1 
                   redis-3.0.7 | 1 
                     qwt-6.1.2 | 1 
 make[1]: *** [all] Terminated | 1 
                qt5tools-5.6.0 | 1 
              gnuradio-3.7.9.1 | 1 
                 mono-4.2.2.30 | 1 
net-tools-3f170bff115303e92... | 1 
                grantlee-0.5.1 | 1 
                  ffmpeg-2.8.6 | 1 
make[1]: *** wait: No child... | 1 
                 qt5base-5.6.0 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                moarvm-2016.01 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
        lttng-babeltrace-1.2.4 | 1 
                pinentry-0.9.4 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b7082ce14b3c1dad0ecb3e72d5767e71f0f8e311/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/057f8c2fc3153800c50e3b94f516efd946b8b57c/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c9255d246101a62082c555f44651d0e0ecbb11f6/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c59f7630c5056871d64905b59f3d2b7af2167aaf/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b5a61ce3f7cb807f967ca6812d15d2cf01ed4bd6/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/4ab3bbf757a53cf526c57e67b73a3bed2e3ffe0b/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/0817e1b709e027f593fd32e087ff23a27278df7c/
      mipsel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/29cf76c301404bb4a310bc5a3ce635551c366878/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/6f6da1bc15f8439e4e5faf77d313fd2107acfd45/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/3d1a3e2c7aa710b03bd28e869d40bab322630abc/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/25f789572d03615b23c458dfa698c0e9833bba7d/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9c9f25b3c95f4837e088126f61984c09a491c83a/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/381710380ef0503896bf14365ff72f84aa8ce6fc/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f4b6e62042abd1f9c962f2a06332f0b8cfea06c4/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b0eea1c258185655af8c56cc3b6cd955613dc0db/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/276de6ab577bf05729693203ca125989e5131eee/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c06e043cd48ff80f32c77876e94c64b4ed9580fc/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/66d5766759442a6209e3a80ca8466e9bf5734180/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/45d254ef27df964beb33346defae0f3c67e2fd05/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/12b2e032cea86651d9369c0b2674bf4005e97d91/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/3067aa071cd5737b86f3bdfaf7a2989967d3eee4/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/16aa3da91b1ec68c47b94208a65c9ed44aaf86bb/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/3e9eac236ee92647b0e2d37d337884b5ca8aa065/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/db0eb68c1cc413fed6e22ca5ff265adb738ba8db/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/e3b2256cee916316cf99f37604c3a044264c2a8f/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/63b063808b5c03c69bb6ee6cf2d77834a2208f4a/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/9c0ee836021553319f166f9de88750535aee0a58/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/b69649a373f28cd1d824bd51f61bafc1b4623426/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a80b4cdf800c215da99cddee188a99e3c7e09153/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/1e5ce952a67f15da2427f0a5ea8416d92600efb8/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/f713a58fcba8074152fd896f52727b2f6879f7d3/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/25ffd9c3ee7c1ef2475d901bf4d71c43dc94901c/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9ae6a7f30c18d3a4c4989f620c013ec64a59c5fc/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/eca3c5026f4b0338901db8d372ff9b28d47d5ce1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/6ef94898364d900b023b184b1b101b7c0431ac2f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/59ab6fe24602fee1a130be0719065b4c7f40aeaa/
         arc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/cfc8ca079e8db0f100ddfcda9f2b0439a7cf31f9/
        mips |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/b705bb994b285d9fd81d9bdb1044a4cf6af5f5de/
      mipsel |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/5247184b15b33627c3aab8b2a99de860a1abb337/
    mips64el |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/2ff45776539ca6371e33e9e660e80dc7692b7caa/
      mipsel | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/aba522aa164267993fb1f1bbc57733be0cbea680/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/227568b1716cc944eaf1ac58742328079404849a/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/665fea35a7ba878b4b9381819a4a8899a6cfa3cf/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/607fd109da101a55cf4e664c4bddacb77b7ccf1d/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/2c462b21f29e731d679fef0a62d60bb4776a622e/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/cdc930859ca342c4764551e9dd52e9f85551872c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/32ce90d35720cbd62ecbc1d041d3d1fb8140b8e3/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ee8d787288f77ab116a06b0ddc7fad5514d20134/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/113c44ff4cd68661ae672930ddccdf1577ee8809/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e7ea09416f430245c7a4ed072efe5560285e1f15/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/f2b66c5896025eb92717c7ef2511ed77337dea3b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/eef5011f09a16d83d16fae75a95c5934cd3623d5/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/55657630574a784ee29ecd6769b39c842e2537e5/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1a492da30692da734f634e48401e422e5542b819/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e42dab782076e81d2b284492494d74497aefd95a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8b46ff5d35b54351ee240d1ad47cae8233efa017/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3924429c8a402fd27bc19c0dac40fc610d0411fb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8896575f60d741af317bfc5832c6b9bac0c3173d/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ab10c7a4f5abbffc712230f2fe13d4c98715ce88/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2e1a3ee2385d3e9c6a86a184357d651d4095bb61/
      mipsel |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/e977c46877ea29e1ff151ae78074e6605b3a2400/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/de9a7d829a95e2d007fb29e9bcd0e580d573f7a4/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/1b7682c0621942b16edcdcba1a621d669d6e22c9/
      mipsel |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/468a4f21d00b1aecb8233f1d102c24a827952f66/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/0f508295537d1d0b80492291ebb7007ae8c3831e/
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/51f79284cad8834a4693d2481131b4e4d764f15b/
microblazeel |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/887d0038f3f58ce850e1f58e3840f6d8ff9916c5/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/914b040f9ff19b45d45b797705b6344daef68b58/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/822079fd47f1023175c0315a66a4583b58c0f500/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/f09b62d3bace1153b0677d21f5957ff6d7ef3596/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/9d60f2b7633a7499305d8c6ba518dbe8e954cc99/
        i686 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/c2e3c1cdde1870d0102fbbfb2d4f8d27afa9b006/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/c7f96470ac0142966759bb9de03973196b0001b2/
         arc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/d6bff569bc9238cdf07970e11b5535d570be59bf/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/dbf45a52b9aef602fd62ad1ca10957bafe656923/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/564675be0d4fbfa113a0f2e52874e0dce2d5ba5e/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/67cc64f29594c5129f10aa2ef428244b24e0d666/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/04c9a22bf873b134176e913d2859798a92f97660/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/24d9b80291bbaaddab2c6516ecfcb86bb574cf7d/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/48c2a8db78b02428af74958af11108dd90803080/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/ef9fd530b6966754136adc7b80d33d490ed703be/
      x86_64 |                  lvm2-2.02.147 | NOK | http://autobuild.buildroot.net/results/b78f83aa32fe339184a3d643760394969eb1cf4a/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/5b5203169f86b01b743f8066a69b6e066397362e/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/990c2c5f492bafd8b4dd2bf7f58028dd0aa2cc1d/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b8f2a906358c24250751ba8a1909c9075d8e6743/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/6c52286bddc49f54ded7a0e73d4a904a133a0fa1/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fbd065c0a64d4c286fc9541eb4ca0c262f7af967/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/828b08377e2fd13f9dee3d1becb3dcaa3bcf0223/
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ac96b309f1c1c147798f71ba9d340d371c308db8/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/900aba2f64126665c5f9f9588509c0e3833e5303/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/0f0cdc79cc47c042b331680a405e5b4ee6c941ac/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c1e0aba702a45d5c8b13217e41b3cc0927a7b42f/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/57729d1a3ccbd8961af8fe1c8aa5642ea9d6b54f/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/c151bc205d4ab1b38ad450d19534b539e556624b/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/66031ab2af79650830b6dba4f6d9999c7cedf1a2/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/94b9ff698124173c4e1ab627ea0ec4d0684a79c4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/241a4749aafe8ddf1aea60ddcb99357a9ab65992/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/92e0bd1d7b130419d31b5c4ff2a88cb491b16e46/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/d32e840158300d65b0f78254dc6754df8dc01a26/
        i686 |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/b0a5641beae14ff79a9d5a628bb41957826eb623/
        i686 |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/b9adbc61922c89ad7a0e5dd13cd2ce3bde864ede/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/77e4d105f2a70e9f5f3a94115775c4151d05ab45/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/d3af10d43497d0e44cfc7692589196dc10eba647/
         arm |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/066d0462e9acac826a0d2b1499ab22dd94fee059/
     aarch64 |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/d81b27ecad5aafba0e509a5e4f54dd524517947a/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/2573172206e11fccef9a7e70759732a391d94df8/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/66bdf3131b33e5546aca4b807ac4dc0a06108add/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/33e8a6562ef105c7e872fefc38177dfb9fad072c/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ed2cf10535031533b86589711f80dd0e911219b6/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f369813b67fa95b15b1b57291a35a55d1988bc0f/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/752cf02b55608ddbc40848d615b2429924c9287f/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c329bc9f4a263f2d422af419f70e809b261470ac/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e238fab91488fe1b244a35a7dd6e959edefa3ac9/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7cbbf92cce8e0b9b2898e97103e9c317f3ae4145/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8158284fdf531405b62d075e2638bbb5c810cd2a/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/bc1e028dd2dff858f6930eb1040056d43e631f00/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5a6f1ef640bee113d25d0508db59202ece81e6d0/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/cad188a2434b46f4e06616db1020f7cfbcb5dc30/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/47022c9070168915d835b1459e91dafdf195695f/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ed112818f48e5f35b1675b6052632d02cf43d688/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/55eb74d1deeebae3638f7e4b4bd731396a604e16/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5c7f23eefb720c82f5368201fd2992a31dfd20e7/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/076232fe1eeb31c159da16567645d8dacc6db516/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f326bc4e83d7647439f996d6036f38be347cd3a3/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f53011c9ca13881db3530db259d05b7c47019ee2/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/cbdc8f0fbb9c4f08de3690298a2aa9c79cdaa031/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/59e88ada7df21f0a58762da6a76d27cb59b7f64b/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8c5aa39b569e487d926181bcac9a0145f3c48c26/
       sparc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9c9ea94b2370640ccd785626cdb1b3490f8ccb17/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c5d8f78ca26fdd3461b98d2db6d49348319208ef/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6eb777985eadd263a2ef29dc3917997608928be9/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/87b5d27d8e6656939da5991145fdf49d4b8bfe4c/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/01e393f32d30786a0e2ffc2e7822f9e3dcbaa228/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f495fa087a47a6c7d84036fb97609014eff3bf08/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/657317f4e0e6815e99a2c1353215fb10d22a2183/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/8d8788e2d0a127f6681932f8633cb9ed68740361/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d361a324cc620a1ec6477ef3ae46156ca9f3e8c4/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/9f204a09925d159b479f0e9c5e0759ecbde40a96/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/d80bc640f0bb222ebd9d3cc3dc238bc664dd7669/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/55df698ab53f7d94235166e8576eb681ed68668e/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b92a9c84b71a8a2d022d307245ca6be36a000e6c/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/808acca0cfed93465845c2aa055a7a4fc56a8a17/


-- 
http://autobuild.buildroot.net
