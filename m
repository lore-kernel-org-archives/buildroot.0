From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 07:01:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-19
Message-ID: <20200920070206.922C920354@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 31  | 13  |  0  | 44  |
  2020.05.x  | 20  | 19  |  0  | 39  |
  2020.08.x  | 18  | 10  |  0  | 28  |
    master   | 151 | 127 |  0  | 278 |

Classification of failures by reason for master
-----------------------------------------------

                libpfm4-4.11.0 | 14
            ghostscript-9.53.0 | 7 
                       iwd-1.9 | 6 
             kismet-2016-07-R1 | 6 
              asterisk-16.10.0 | 5 
                 gnuplot-5.4.0 | 5 
               target-finalize | 5 
               apparmor-2.13.4 | 4 
                   attr-2.4.48 | 4 
                  boost-1.74.0 | 4 
                  zeromq-4.3.3 | 4 
               apcupsd-3.14.14 | 3 
             babeltrace2-2.0.3 | 3 
               capnproto-0.8.0 | 3 
              host-guile-3.0.4 | 3 
host-meson-tools-0a02e2d344... | 3 
                   libnl-3.5.0 | 3 
 Makefile:752: target-finalize | 3 
                   ncurses-6.1 | 3 
                     popt-1.18 | 3 
                       unknown | 3 
                  check-0.15.1 | 2 
                   dav1d-0.7.1 | 2 
                   guile-3.0.4 | 2 
                   libcap-2.42 | 2 
                   libcap-2.43 | 2 
                  luajit-2.1.2 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
                 uclibc-1.0.35 | 2 
              bitcoin-0.19.0.1 | 1 
     dovecot-pigeonhole-0.5.11 | 1 
                 fwts-19.09.00 | 1 
          gstreamer1-mm-1.10.0 | 1 
                harfbuzz-2.7.2 | 1 
              host-grpc-1.31.0 | 1 
               ibrcommon-1.0.1 | 1 
         libcpprestsdk-2.10.16 | 1 
                 libpcap-1.9.1 | 1 
            makedumpfile-1.6.7 | 1 
              micropython-1.13 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                    vlc-3.0.11 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8c364500dbdd020fc9d0d02e7b6e634fbce23c19 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fb567d1f909c847ac4bfed72d76ba70019a74e0e |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a276b03d55db741f2e01c8384da608ea1ab7e75c |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/b509ab4e40e57d7688d54b6d9aa76680e1636503 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/641f54624fc51ed6f9609fe5334587183271b4de |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/46cf191e677c8c15c331713fef25372db9842147 |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/bd4aa0bf77f74b5e0b1fa7b5e6cedad4a282ec6c |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/1ef8a61ab42d2be0372cb8d893677d2d31fd7e43 |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/25eae155b5c0ffd01e843e35d3c5752136871503 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/1e4abd71fc9430dd321e6bbede8d020e961cf940 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/ffd6621b422cfb8ce32ed35d82ffb770d7885e91 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/552663b04b1cf7b7139099451c763a4aaae5092e |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/01a78bfdee593927fa52e5370c5da2bd3c2f1a14 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/4c7829beae91d5b2a79951f380b7f9489c3d7b72 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/a49ede515691078e50f587fc088b1dbc6c129971 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/d727fc31188e872daa40fbedadf5037ae3ab01bf |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/79fc4e416e95817d2bf86ab3de6d210ac25e416a |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/1b8d779ce90a504eda30728a50893aa82b509478 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/7383e945a43678e6f5a1cb1a340a2a06e1e9ead1 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/217ec977a77b65a5e68dbce01f146b504c8ab1f0 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/33127ec396fdd2a5556cf3077b713dd384d48ce2 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9bafd605bafeafae4dd5dbdcf3e97b83cf038424 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/2e757a9f55b4af5fe7876f553ee128eeb15e31dd |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/901ecf9a5887f7f248b720a87f1d1dc71e1c1de7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fa3a5e40560930cf15a762184b5de57fa959f27b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6a9774a1bfe066c2c22b7c8752745e71da43ae62 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f3bd82aa79e108f52b96f7df5b72b17be5fa3376 |     
    arm      |          check-0.15.1          | NOK | http://autobuild.buildroot.net/results/80a2bf39d2f220e7b27e536f0a4ec59c67b590b9 | ORPH
    arm      |          check-0.15.1          | NOK | http://autobuild.buildroot.net/results/e981b17e0591ab2640b461f1fe3215cfbb2c1c3d | ORPH
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/d26716db314ff1ff50cc02b15757ade62ef8fe10 |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/19ee2bdd4c8d14cc1554092594b3721117ca1005 |     
    arm      |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/f1e5afc61994b4dea3369c02b00f18e9ff4342fa |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/83f84a87e65426dd2e84ca5034fc0173d685e154 |     
   x86_64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/9f967bb8bb52dd1bc2a65bbfeeb76e1b1e7c9da6 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/54cd832b097b04928fec795ba99410647c1db08d |     
   x86_64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/b5ab67ce7004069b9fb866e52ee85b0aa5381cd9 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/cdf2e171e259a72626c5295c7d1e93e519d81d21 |     
   xtensa    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/99a00108a8499f98d329d5a5ab5a621298ec1454 |     
  mips64el   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/ff549351b90583b4f45ff8f1f0192375e888edce |     
   mipsel    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/6f0984b4aad1efef96da7a28f796880d683d6f4e |     
    mips     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/60c8039df2fe77c8072948698345b08140407869 |     
   nios2     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/ba0b1ff9360ae47b3272292c231a969f3d538df9 |     
    mips     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/3a156386b5df13db7aaa7eda9c9e8b10234192ca |     
    i686     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/a14b39076048675f18da007d3f2672e91533042f |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/664c59732cf8b3ff38e7f67fa2552446c45644a3 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d2ae2663ae2937e4c3d1162946a8228fb8b40eb4 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6406fa9191452e0d2a97f231408a39c425640d7f | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bab277993146ca47fb226419500b731b39f55c2b | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/be601ebb81e7a4b9608799812cc83d223ac602a6 | ORPH
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ff38334a2bbe24922250db8d4121ea7a4927379c |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/71b452098b4c3ac9226c7a03502961b803daae07 | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/ecd221e9e50ab1072b13939fba569bbb2f1439d8 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a096c88329452cd58598dda4e9c22558bbceaf72 | ORPH
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/113ac942596771982fc9251174a1bf6f092af070 |     
  riscv64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/60941f32a0db2ff68fcc95cbffc59e746f746a46 |     
   x86_64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/bc837d71c0a26b98f6f360944ae5f033f581c05c |     
    arm      |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/a4846863c189f74aa8504978fb5175d344fd592b | ORPH
    sh4      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/06bb399d2ceb55d1276236ab6bd16ee2fe27cf33 |     
   x86_64    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/51257389164eb36d268ee005fa5021b62f3c558a |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/f3032c7c28ff499adda614547131ec5218c4696d |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/7f7d2553f9a5339f0fd1989dc75ac509714a753b |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/84e92eabcfd75f49a5eeec142301b6d259118134 |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/fef2c3ea9785944e791e422d80df9f825280ecd3 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d04ca03b0c358f98d91554e7a43abaec5644c9ea | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c70e7247489ab9b943dc08e54d9d73efbffa87b2 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b166efb5dd5b4a4578294f2dac3a409231b7fbc2 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/35d62773541d599b5dbdd58cb90b780c433e0aa4 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/11cc1cf6c1e177aa64e61896b3fa3e0f83749313 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/9d96b8a4a3e470adcc081ab5d0124aa0971b2211 | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/609ccf2866f10f4d557e48ffc89d7ce5bad13926 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/c8806dfbd622963b9a2f4244c65556f62a667910 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/0f695772a3b92fcd48a0f4118fe526f8b229b982 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/7d63dce2a2a318f7ee3686480389e466076ad672 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9f6d1026a356026a000844448ebcd686c046519a |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/5d4479b7cd817dd4dda0a45f5ff053d3c8d59c02 | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/07f93ef8dc456cd9937badfd16cc875cac3f106f | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/6c970edff3cf8507be23439c2cf9b54d3060883d | ORPH
    arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/056fd1246554fe7def416429620175e86530c0a7 |     
   mipsel    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/d4deddda181f659aa0d92170b26f0b9a2ea7eddd |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/cf28c3df89f5156727ca275f9e79520a96487387 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/4c111bde20882b19a73d6b8a970a87a7d1bef8df |     
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7b1568c692197e94c2778d9f2290f9618f265d26 |     
   mipsel    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/b81adcdc23fb8f4d9597c81f0e109003ccb425b0 |     
microblazeel |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/eed6d9d1cf4ddbd1f8c1debe4d8e109bab5db2ef |     
  nds32le    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/5f759f93005339d4efb010a9b5ec2aacca2e0d29 |     
  powerpc    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/ebfc7f0e24d11bafec37bc22384ac96616e3adb1 |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/e71702376acfd6bb595766f8bcae39723700231a |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/c80f25ce2367b0b9d80c6df1435882c8c69d45a5 |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/d87366495d7e90b46ad7156091dd5664ba533f25 |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/ae3100663f66eebf2b7eba32b4272a0f8dfae2c5 |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7898dffdec474511fd83d807b616797aa9328255 |     
    sh4      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/c0acb53a379e5ff28d5288f2de7cde48c9f266a3 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/7e6437b26adedc6083db522d8622f5757cf83977 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/a092b5ae31c733bf6dc60c43ec952b1f5259781d |     
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/65ad55033ff7b49957fa5b3105b4f53ec3f9dcfa |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/b94cc93b0f28f2ac962032899214da5d620f108e |     
    arc      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/bcaaac46ec7338d4edc84a1bb4f78b9cb58d8633 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/c8e52c7b48e5989a19837a20507bd8c0c7fd00d2 |     
    arm      |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/6fe5a5ab91a5d235147e74461bb165ec2cfdc967 |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/fbd30b5c07917a76c74345bb7d0a9707eda3b2f2 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/d4da173af9a8191502cb7a2eead3949ec4158881 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/b553ff1ae877d4e3811785512ced63552102d81d | ORPH
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/9a5f3ec623e44b2afdecba63398d91f0d1f78a36 | ORPH
   x86_64    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/100d5e7263f49ae59ffd57995699d31cd6a5d267 | ORPH
    arm      |           popt-1.18            | NOK | http://autobuild.buildroot.net/results/91b7ce445e504592fa7dadfb7775afe0ed354f18 | ORPH
    arm      |           popt-1.18            | NOK | http://autobuild.buildroot.net/results/27f184af35468941173628e5e847a284c0b80d73 | ORPH
    arm      |           popt-1.18            | NOK | http://autobuild.buildroot.net/results/240fd8512755542cfa22a44437b8397a902906ee | ORPH
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/85d74e4ab3b48820a21c10be35ed233116114d53 |     
   x86_64    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/ab310b4aa2e65fcc3b7b2ccaa502ad107ea46679 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/e375fa7f5847b0ae1ec133a53fb5754248fbcc91 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b361f79fd731ab1805c78e15daf59dfaba74099a |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7086e569be7cf27427f6ebb152697118e864f39e |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b3a79e2f7a0ff045bf5a02350130ab034cfa42be |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7a8e6f0a7cb7c6319bbd1e9407e446d925f07be4 |     
    i586     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6cdd5b14960b0e53e450a9246e90d0bf993f54c2 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/ba3af2e787f251ce4d44b6113d1770be2d49cf0a |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/f6121f69a5dff2e9b26dcc23211ec9b5fe1bfc31 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4d42df1f1d0de24437f14b9d1062e4fca2db1ff5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c7a888b9f9ab2dac39c4ad0ad927c84019316c5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7a0c8b5a52cbb94b89c628659f2cc8cfd90d4744 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/5ea4b0eddb45fce8fa71255cc57c4c938d01812e |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5668ee2a81daba689cc16c520681cfd16a79dbd7 | ORPH
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/ff5d16f50ffe8c6a4cccc85c475dbc200e7bad79 | ORPH
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/17bd4aaa55807e84bc63a84c48f2c3f9725e1dd2 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/31462552fa0da1a624e4eb0a4e5da453d00f3cf0 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c0f7634ed186b0617d2dc8f23b3afa8777e4861c |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/06ac1ee778181972c80cd6de2d230ffe8618c663 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
         libcpprestsdk-2.10.14 | 2 
 Makefile:753: target-finalize | 2 
              ejabberd-19.09.1 | 1 
                   mimic-1.1.0 | 1 
        qt5imageformats-5.12.8 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/4130f01cee3eac53138874644f92d49bdfd1f904 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e47a920600e6f34ec792f2e88b11025bc8d4c384 |     
    m68k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/719d69b7fd7017bb32378c5f6582b963269a5073 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f88f2e05ca10d268e981ed63abbec9e6dd78e80d |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f36f4f7f7b69eec1073f786d92794ce49c702d50 |     
    arc      |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/cf745460194f18caea355a6e3594889e076d5f19 |     
 aarch64_be  |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/bf7f353ce3511dbda5fd46b92286f275f28a365e |     
    mips     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/f96d153bd601920503a43fa8cc40fc9be337acb7 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/fb019926483fed820711372ee1ef44b6f6a3dee1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4d058ad7456aa609e9bf0e97c86fba039dd10030 |     
   nios2     |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/9da3d3c19b1baf065f1c663f53b9c8d1f4e932b0 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/62b1735d33bb7d0f2cb81027d65946c587cfaaca |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f053c24ab800d70f5312c2a26f07467a002be15e |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
              host-grpc-1.25.0 | 3 
            ghostscript-9.53.0 | 2 
                 rocksdb-6.6.4 | 2 
               target-finalize | 2 
               apparmor-2.13.4 | 1 
         libcpprestsdk-2.10.15 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                qt5base-5.14.2 | 1 
                suricata-4.1.8 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/c027d0e3811b1feab22d17ae911bdf08866ac17d |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/afb39a54e48178cc78d57f52b626d10972b765ef |     
    i586     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/8060ce18ceba7b5355b8bcdf7cbb0c4de53d6f36 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9e9859dad20d8229f3d94371fe778f340990d41d |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e75452293331acd64aa3478ced435e35dcd9bf8b |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/78945fe9352899c881102541f6f76e75c085162d |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e70560025d1f0633229052a1134b51ce69bd1f3e |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ddf3a58addc3016a35e4fc3737637a877a86239b |     
    i586     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e48a88a024b895adf3fe51fb34843d7bfcf00cad |     
 powerpc64   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/65b692f000d2d3c2219a3b1885ca8923c9f27af9 |     
   xtensa    |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/6589da49bfe161a4a61946fe918bf11e5cbd8f25 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8c80c89f6c9b2ec52c43a03397c6a5d827680eb4 |     
 aarch64_be  | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/25dce28c2880d656239c6f435511ded423e12a25 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5beb7b56cec003e84871a21307bf1022a1c9eecb |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/dbdee72dd3651dc9e53f4f423c1921cfa621b681 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/8833855faf289de531d67ea15400c2928335dce0 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/089f908fe4ddebd183be1d00762b2ca6d31ee96f |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/831fa6048d5df31df7bccc46ec1034fded804f97 |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/3fdd3c7622f0282c50a7251087cc7ee392575c13 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
                  zeromq-4.3.3 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.3.1 | 1 
                  fbterm-1.7.0 | 1 
            ghostscript-9.53.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
               log4cplus-2.0.5 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0094c0b3fa7a894734810c078f53cffae7e8c594 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f1c1d167594ba2ef4cf989ec4fa0d3c67069be3c |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/b80bab0ccf5eb3bcb6a021f3f55dfd3094c4f161 | ORPH
  powerpc    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/018e2c0f4661b005859c0fbf6401b9629bc9ea14 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/256e64aed51283f25029ee191839c559f6c35aaf |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/795425f887b78d57e08e000b7f3cc7bdb014907a |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/43500eaca43b49a647a678db23b5b9bd47ddd54b |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/cf8792ed4b9dfc72acaf2ab1b01d203b0ca6361f |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/7f519505abbab35b4a81b94be30405184dc5a4a6 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4181520c2d636ed800515e95757500045ed280a1 |     


Gitlab CI results for 2020-09-19
================================


-- 
http://autobuild.buildroot.net
