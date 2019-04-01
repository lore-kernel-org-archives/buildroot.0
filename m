From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 01 Apr 2019 06:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-31
Message-ID: <20190401060047.F38C78756C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  48 |   3 |   0 |  51 |
      master | 211 | 318 |   2 | 531 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-python-2.7.15 | 87
      host-gettext-tiny-v0.3.1 | 54
            host-python3-3.7.2 | 45
  host-gettext-tiny-legal-info | 42
             alljoyn-16.04.00a | 18
         alljoyn-tcl-16.04.00a | 10
            host-vim-v8.1.0133 | 9 
                  rygel-0.36.2 | 8 
       gettext-tiny-legal-info | 4 
                  linuxptp-2.0 | 4 
                  ffmpeg-4.1.2 | 3 
                host-go-1.12.1 | 3 
lua-gd-e60b13b7977bb3424d70... | 3 
                   netsurf-3.8 | 3 
               wireshark-2.6.7 | 3 
      host-uboot-tools-2019.01 | 2 
package/gettext-tiny/gettex... | 2 
package/gettext-tiny/gettex... | 2 
           uboot-tools-2019.01 | 2 
                benejson-0.9.7 | 1 
                chocolate-doom | 1 
                cutelyst-2.7.0 | 1 
             dbus-python-1.2.8 | 1 
                     gdb-8.1.1 | 1 
           host-nodejs-10.15.3 | 1 
                  libssh-0.8.7 | 1 
                   mimic-1.1.0 | 1 
             netsniff-ng-0.6.5 | 1 
                     ngircd-25 | 1 
                    ofono-1.28 | 1 
             openjdk-jdk-12+33 | 1 
                    postgresql | 1 
                qt5base-5.12.2 | 1 
              webkitgtk-2.22.6 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

      x86_64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/11735637db730a323d9648b80bf50a7a55a4a7c0 |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e2f3fe7b16c5c863f1dfa984b8cc00506b359c2b |     
 powerpc64le |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c5f302fd9a4d0a8a9c20df1b6e435d84469a863f |     
     riscv32 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b45f9fb69615b80758adeff4571e170c3bd9356b |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b5ab0b3db45853e7c2409a4c9c56003c957117d6 |     
      xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/14c0c884f1c0f11055ca3843951572a7293455cd |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/fa808881ad5d21f7294336f716edb7c02fda7e72 |     
     powerpc |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/aaddafd7e39b1e8075292f3bfc27d24c0640f705 |     
   powerpc64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/955c0e914e4dc01d6360b0ac174c7ee1c13b33c8 |     
      xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/f7aed08c098ba0b465a47ad8e758514f424eb03f |     
        mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8c3b83a44ad847ae5edbb902db1f1f50d23efa1d |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/569a013f22df5533ac8c57b49818f70639df38df |     
      mipsel |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8bc36eafe249186c6418fce3ac76ffd2e7c7ce00 |     
      xtensa |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/d689af21a35ade28f2d8d883b1c861a2c03ab330 |     
        mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/b7173d0a86feca96d07a62b4a52b6b06b43f41a6 |     
        i686 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c356a6b4f911c97a419d5c018d5da3f1589d1520 |     
        m68k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/4dd0a13d863c4dc740248586860c8bcd45227e39 |     
      x86_64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/1fc748fd203abb94a79117632871b2d47b4b3837 |     
        or1k |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/13144a7ebd64ef7889312053f06a14047eea232d |     
       nios2 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/e9b162183a293e6e304530d0e85282773bb03349 |     
  aarch64_be |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/6f25529f4941c92fd87e424485cc8f5c017e65a2 |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/05a7f4846955df096bcd57856e62c6cdffd5f805 |     
      x86_64 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/a552317f5184ee4c45860922e5fbfdd89d3ef3c3 |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/064d8e03941219e571b5b13dfb54d21d075b2a92 |     
        or1k |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/932767c81062e73cf356b08e8a5287aacbe8d4fe |     
     riscv32 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/4406da28621bfca123099e07d8a95d83e1c778b4 |     
      xtensa |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/1338114a3c594648062badd1a255f6585f02978f |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/129d45c4422158d375b5250aa866145d4fd42fff |     
         arc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/bb2ce417f0ab22bd33042721e3d069a404fe2bb6 |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/3b98470a0c5ee070d3b80b2fa0e151a62405a0cd |     
      x86_64 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/09096527e780c3eb8e5b0fcac4c392f0edf3b089 |     
    mips64el |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/fe79c02fd3b37b673913e433f97f2a9efb015154 | ORPH
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/2189280626be6854e45d1d6a7405d7d13c0535bc |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/82c33a7f56fb36ed90b2330f10dfe5c52724c54c |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/6a4e2d9d383abd1ba51b599b51a82938e385bc03 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/a0ca2caeae402279b90b53fa02fb00aed7478ba6 | ORPH
        i586 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/47e434def7c2195675c26f6a22c98da6d7cce1fd |     
         arm |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/deca5e6c66ffb898a29f50678d8213f87cc54682 |     
microblazeel |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/26eee4d8b502e81e78c85d15171b6ccffadbf52b |     
        m68k |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/d604187d27608f3b1de3812545e536f9dfb17a70 |     
        i686 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/e42cfa52d993484cdecb6bc824f503789ae2c33c |     
      xtensa |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/28ad472b7f8efb4e6de5599ea6fa19347f41a0ac |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/c5959275af81399276b310077ade74d7905563fa |     
      x86_64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/55a732a87c464e0d7cae7ea51e710da2ca047485 |     
microblazeel |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/267e073c60de6be99e1e163bc10c023cd96411ff |     
     sparc64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/711f8528df335a1edc1f02fec6911caa1d624fe9 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/03e445b49822839c716f9fc366ec7012474bf950 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/372d41d2cc4bb291f1fb9d862b641fab59df225d |     
       nios2 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/6f9a0188e9b1c68fda90b7bb47aba79c516ccb9e |     
       sparc |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/df669f8196862d6827c0adfa2ccb17e64ec7af26 |     
        mips |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4f01491c3f8ce5b7d641f3a175cc4cce0859fc6f |     
     aarch64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/a2eb407e4957bc52ffc179262660f2658b561e3c |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/ed42e7d6806e09053d6d9bc5e6723b2647e7996c |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/3016a619d2bf65125671320ee5ab5f513072dde2 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/578bb4af9a9ed9d3692c73703e71b3489a31bf7d |     
         arc |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/04c99bdd54bad7ac78958f1219f3009f99102076 |     
     riscv64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/23753e4fafb0b256dca1b5477e1a2975b1921b97 |     
       nios2 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/405458855997cb98bca85af25874b29e146b132d |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/f0107b55785e950ef6a3b9e6403ca1963440f986 |     
      x86_64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/e0748544fe74f9a26ffb9ce234e006a0cec8564d |     
        m68k |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/9302a491c808aa3f05aa7ab3d2a324b9e92cacee |     
      x86_64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/965f5881e8acf3bd39d8b59d52c65689a11ea465 |     
         arc |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4078a2b98f7f203c892038202866bce0b0bfd7e8 |     
        mips |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/16c97d9376c3b8803af088152f0838c69720a192 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/c2377667d6d4ab5d7ada97027e548ec4a44ce8e0 |     
      xtensa |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/c3261432212e6c42831ebb8aae632f0637906aa9 |     
     aarch64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/7ce474fda326de6641389f2308779c40549f8c38 |     
    mips64el |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/e9c4595a00273e83af295945a582bb503ef65d7c |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/98b029bde5e21fbfa99b2dd3224567078cd36e7d |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/69a1e5035a05fee1bb94d8116a2447459f5a8371 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4022569b4283cbf5b7bb709a963995bb188ca9e4 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4c5c91a83a3e8a053f8ce00a6ff2b8a4e376dc89 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/74be940e5757d18452b0eb97b9973c278be20345 |     
        m68k |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/3b870558fa0408288c2945c92fa99ecf580e7c35 |     
        i686 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4b6243fb8e76508be19bd26e96dcca6a9b747795 |     
      x86_64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/b6cb182a15c813f92dc1bb83ab75567f03b33d8b |     
      x86_64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/89ff392bd96c19b033c574341be8462245fa0515 |     
      mipsel |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/ae261fa522ede6095d12c2a3fec60c8cae82f177 |     
      mipsel |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/66763223fa55feb62cac6301f11d5effb03ae672 |     
     aarch64 |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/48dfd3a19f940d4a4030e5abb444b377f50f6623 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/44a68a24dd1de13f6704cf140f05579afc842270 |     
         arm |   host-gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/2f9b82b3f10463f4dc543b68fbfbab879f389c15 |     
         sh4 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/fcb851fd7ad3b748d2a0a65f97e279e7387dd552 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/491e25bc7bf34a99294aabc9a94e0dd6d9c77447 |     
      mipsel |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/fab703f98b8bc2913bc2fb801425b07cf8790a36 |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/4e289f30bc6e58ad81611e8e04779134dcbe1241 |     
     riscv64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/713a38a6e65ab8edf86ab815eb4fdf9b4c3395fe |     
       nios2 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/d1f03f67ad27ed97057b208e110e8e42389e2bb0 |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/7e6f494267e845d98b648c3e11df6b26339d260b |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/cfbaf77284e67466bb7a72215ea58d7c8aa16709 |     
      mipsel |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/1dbfe32c4dcbb7cea7fc88b40eb3d244b5476c5c |     
 powerpc64le |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/cb6204350d18792076261df5936beda10cd5e9d4 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6ba70d48955e936ec743d08c98a9f27e99f729d9 |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/dc8de718d30f9da53319aac3af316020e063f4e7 |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a75640cff4332dfa4db1fda27e4ee63142c6e10b |     
    mips64el |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/751ba5cef8120add98a9e28b0827663947e644b1 |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/24a92117d8fd54a89e6427991b156b4628e4132c |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/e829139519852c9536a3af2ea006bf19d4172542 |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5794c0e4bf67bd774a3ddb49330be7e5e96393a5 |     
      x86_64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/9dbfeff81a4f515afefac64385dbfb9974e5d0c6 |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/70f6f00d5656a51d1e6bc1803fafea9618f62574 |     
       nios2 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/89d8bbd0b3c5ab4d90b73bf3d0519c792176a58a |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/443c5f3513e54321c9cfd21a4af1ca88d66f93c7 |     
        mips |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/b41da431f14d372cdc3b89b11d09c46ee737d4ce |     
       sparc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/4dd1d0ee467889f5ff790fd50f1f608e8d034533 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/59316a672638febd71c84fc230b2c08344afb250 |     
         sh4 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/0f9ab8a60730f0414079377f2ec7f3a2175f370c |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/b86a3b5f835851cd080b1e22d8d452cb2063c8a3 |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/053f5aefffd381453ea1b20a48b728661826a0f0 |     
      x86_64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/598d5d6b7ee57356eaac5bdc9bf6a72277df15d5 |     
        m68k |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/8ae20e8ca65c7bbf6bb7b2899429c6ac84e807a3 |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/1637e47f2574a5a2fe90f2bdc89f281ba24b5dff |     
       nios2 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/622cb2342eb5410eebfb47b1403b4b47596257df |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6e519445e1be544a9be6ad9829c3ae2a78638e92 |     
microblazeel |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f5f3ca7b8881fcc82151224add7b0ab33032adcb |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/931483e803e3b7599754f2db0b08c1c033a943bc |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/ada14961b7f8667e00b90614436bf3e87d900cf6 |     
     aarch64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/d56e1d28e3a6b4ddd93fac136891d07685b81373 |     
       nios2 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f41ddfeeff3497f33160171137ac39b35b988087 |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5904dba4c3fc2ea28d71ddeff48cb1d6bfae1005 |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6c4bd0451d487e9ea63ee21c9d99cf11c40d4872 |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/8497ea8b286a6fe816634fa4d06384bf0891d209 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/90a427762fbac430b4a084bb32bbb541d9ea8a13 |     
         arc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5ac64f426619bf9ec7f32fb7f1025c0e6dafe6f9 |     
        m68k |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f1aa461c4426d5a7361201903a532dc7a4a26095 |     
      x86_64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/2d94250a967c709e7c8ecf985b85b138f71a3b31 |     
     riscv64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/e00a250f1e4d60b1fae4b156297a536f50ec2525 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/58c2fd53677e8eb29239196be5d42f4be77344e0 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/118d0e207a858913e3adec1f7e450baac9062ae3 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/8b4ed88a99b44aa7189fd885715c9e4b76a9ba91 |     
     sparc64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5007f27ff29cbadebdcbd2645d848b1dbb2a1a2d |     
      x86_64 |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/dc97114953c31bb81c6626529d8037592eef517c |     
        or1k |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/ec1e4435fd604e133ad9c43724acddd59cc14a83 |     
         arm |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/cbca523f77ec4dcf9cf7b4a59af2c1800b711b88 |     
      xtensa |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/b5e66ef83e621e802cece58908ef17a26e54ae39 |     
     powerpc |       host-gettext-tiny-v0.3.1 | NOK | http://autobuild.buildroot.net/results/eab1b054eecd3a88a2adfa4c8dc278c57d35e5fa |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/6b464829c43bc77a9fd5d79af1f4bdffa7f181e6 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d32c34dca8804d580f820fd92c6a631eb5908e59 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/e00107cd50d238c8274f0a6ec72ec6e35072908d |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/4c130dd76f8d91787d25ece5f7372e2ca6251f62 |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/27de6ece7a44ed22b2ba7b87e90ebb95f6f3509b |     
      xtensa |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/36d48206e5c905f66be640166c2a4edaecd2a82b |     
        i586 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/9886340e771f59dae9d152c9598a4d25b8039856 |     
microblazeel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/381ec5d64938fccf15de4f4263cce4a43d95c83c |     
     aarch64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/933f2e5ca79b5305f680da579a93687ac0ac2f91 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/b6d08e1569c487b9a142c509786b6044de745e32 |     
     sparc64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/25c029aefff445f44cf2db8fe15f92c21757452d |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/b668976452999c6bd0d22d129c3a95455c13fa6d |     
     aarch64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/6c3e4ba6fd56bf5798cb65032b44bba27e58e498 |     
     riscv64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/5970860a30a3472e8c20e9bf212dbbcdae247030 |     
     riscv32 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/ddeb2989cf00d7688a016f87445a8a537e755aa1 |     
     powerpc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/5f68cf403624b70728b2ae31b7e711e7cdb3949f |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/e1a40cd947b4852ece2308292790a51daceb7613 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/fe32acb20fed02d3e64ffd01c2d7f1decc211ab0 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/d75879a3ac50f43aa1f3f777e3139806e2756fa4 |     
        i686 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/be562dc08e7565806fb511644615d66a01c60748 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/31fc30f6caa010edee88d35484fbe5c9c7ae948a |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/76ebafb3773009b2a390339e9bccda212269b169 |     
  aarch64_be |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/0f5f810c7766d1ca395f03edff80ea156bf69d59 |     
      mipsel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/bfe23f52798aa3039a603b5dcf840bcf6bcd40e6 |     
     aarch64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/74ce40fbc1b18c6108b1414f721a1dcc55c88be7 |     
     riscv64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/c4db828c48bb0d6677f948e874a90ddf304650a6 |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f67f565efdfd71221c642d50f296870bd30a52b7 |     
     riscv32 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/1457d710d5d7ff8b333a5cc3292aab900ae40ebb |     
        mips |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/dc32d58a29ae8b1939cd7dab57a459e712985079 |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/fef2548b60bfc8bfdd748c6d74a90c7dfd67e9be |     
    mips64el |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/73230fc3fae6501ba14b9a8ecd285381829d80c1 |     
      xtensa |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/06fceb49e53b7346e6dc095cf27310ce71bb97d2 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/b84eb9b0afe882b534855862de2e6d687cd6c64f |     
     riscv32 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/318ad7bd549b040e61f38d446001e09a7d576c92 |     
       sparc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/255bf78f7c2d1c7758d4dea1781823eda2a10f03 |     
microblazeel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/59e8d18dc3bccd8dfd4f567adabb94c458fa038b |     
     riscv32 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/eaed57b8bdae2d0eee4854c0bf496e9384be1567 |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/3c201f6166693ae0d5e0855e4109ede15833db67 |     
      mipsel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/22515f1a1a0718557079c9ccd86e50825006ed1f |     
     powerpc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/813b80ddbb13d4be97305da9edb0fd195709a663 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/313a62d1e551ab8e2b155cedc7331aabdc83aae3 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/07433122849704a1c5ad717ddf3be8fb51d02385 |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/62acaecbd652c8858e6bd7209ea841bdb206a977 |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/37d7ae86caaf4ed3fe63d92512bcd3c544cec4f1 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/54881a6e8bd164332a2b5248213115cf444990bd |     
  aarch64_be |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/4bc3a4896a7767a802487e630caa35efe4e4a4ee |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/6166944b2cabfc1a271c8317df306ab5a81d0e2a |     
      xtensa |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/6f9dc9270cd929acff7a79b3b2708eafe7c72414 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/3ce8b813151d0e0cdf762fad9406975bf5021434 |     
     sparc64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/4e2edee90b10544dfeb2ee795cb4a81a0ce0e302 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/06e0059ad83cd80edacd607dd7b3fdb76bc731dd |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/1e2045f8491fd47aaeacd61bef6b61c0c7c660db |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/9917a309c8ecaa1708de5ba076e1f7a9d35c3ad4 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/3ed427d2828ac0f8a09df4995ef9395fce71ee38 |     
     powerpc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/659dbc5b9cc3b7d77d3636758dc010f617180613 |     
      mipsel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/422dc62b3ba06948fcc18d4c7f72551e913bba21 |     
      xtensa |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f834d9e5cea2160d6fc219b89ad310746cc4d5a0 |     
        mips |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/5dc313d02c934be6efd4e6a7d047c06e695c504f |     
     powerpc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/b3e327bc443ba9e984004ab536cede95396100f4 |     
        i686 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/33cce80eca890463e7caf3fe3cb9d8f49518b81e |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/682496c9b54304280765b4e4cf53def435cd9bae |     
  aarch64_be |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/9f894313fd404148da13abe408edb7ea7526c2d3 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/a7e3fa6c73036a55dfbc893978b379392ff769c1 |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/38b0c6328ba9872cbdd104d61e9964166601f9e7 |     
        or1k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/da444d847940e05cd033e1f227311c0e382982e3 |     
 powerpc64le |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/226c42a0485a28aaf51a3fef3fa283e720504964 |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/fb6f231745c21c3f83559ef02d76d1c97f67973f |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/269755b91eefb21e6a6c84a6a7f03ececcc3c13f |     
      x86_64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/629c847902d1a30e02be8525764d7ad67f06ab2f |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f6e7ab12f6642aa18e0956ea7415f0ee65ec0fe8 |     
microblazeel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/a3800fd4ef2536cc2b82d38ea752baa2b227bc64 |     
     powerpc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/e4ced01614f5c99e0a1ea083a021b6f7cb5e93ed |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f2a20aaeb899958c2d143b93beaf03959208ccc0 |     
microblazeel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/13da71faf8ab6751f9e59a0200dae205401eb1f0 |     
        mips |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/bdb1347c4ca8563ff09e4fb18d65db159b34f88b |     
 powerpc64le |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/77af93f1a6db692a28118ce851cc5b3976e00cdc |     
  aarch64_be |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/76eb8136f36f0c6649ce6f32f9d07dd37cde5117 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/57c44ac9a32eeca8262592cbfd8de25d0f8f52a9 |     
      mipsel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/97dd65817e98e50c902367c3eaa2d2bc7541742a |     
         arc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/bfd5b3291e2f2df0fd3e83c8ccd36dec74a05b6b |     
   powerpc64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/537922a41f716e3e17cfef861e8db1dd2f9d8ebc |     
       sparc |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/ed63b5f72e4904a4b47905dbf2d7fec46d320560 |     
      mipsel |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/7aa6f9058c14b525959db64ef283a67c88cc39a2 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/756c408b4fd851d12d8478b11914c7ded56c98f9 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f2d3f51baffd48a6e8e9e42fcd8b2dc3b51c61e6 |     
    mips64el |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/27138cf20bfbafb5e8250bf57fe9582d9216062c |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/8dcff343329be60b41dd78615633e376a43e8374 |     
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/5aadcbd4bb03852c0c599bc0484cb95afbfcf5d2 |     
   powerpc64 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/a985aaad16f6a3abb9cd43a9ee8f7fdf35cf1b16 |     
 powerpc64le |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/57dae7091680a5a2fc995c8d936586df71df86cb |     
         sh4 |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/a9b2a6d91ced18e7503c30108523ca26a4bba84f |     
    mips64el |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/39c444419842b769fca24fbe140b0035288f05f4 |     
       nios2 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/72ed3d6179ef6937cb4a4ddb86ae1790a4190a9d |     
        i686 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/4844266c9894246000daf6c6b3f67a29373dc039 |     
microblazeel |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/84b703c9b5f93a8fabab29c635c3bfe2a61daac0 |     
     aarch64 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/7e8874245c06282a9a86d9528a942eb417f156d2 |     
 powerpc64le |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/a7736be280d285d21d3c1ab14e6574fa2ae425cd |     
      xtensa |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/ad611f9c9b87346bc4134cffa6eaa9056ffd1f68 |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/27038de4e19c9868aa725f78713631903e0d0514 |     
         arc |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/fa4614b0e6d89fc66302325e0b820d953cca8358 |     
        or1k |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/5c6ac1ecc5daeb932b2c49fadb66d6793bbb24b2 |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/d06837581199d0333b859ba674e0112524135e39 |     
         sh4 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/9533d614e50800c2f1bd73deba9162f63a6318fa |     
      xtensa |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/2fee1f37b84c231c84beec8aadf2ad2fe8d4a800 |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/683fee96ca6d6196ad1f76919aa6c5a4cb98c9f9 |     
        or1k |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/a84c9f1774f91e711d5cec9831974148d736819b |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/5c59d6c2548c6041632ca80f0d4cba56cb6329f5 |     
        m68k |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/0e7e980da4fb555718f0d50ec35cae5af75ed613 |     
     riscv64 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/7e5d88d49739e8f3c51b03e7fe150ee2f72ee34e |     
      mipsel |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/244fd119fe121d9f97cec7cd363e87c57ced4931 |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/286a2120f6fb952e092dcfa4061420f986f5ff90 |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/50684cbccd274fcc02f34f63fe02a1ec74e06dde |     
         arc |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/806ea940bacdbdf6d463d556bd4f027b86fb9d74 |     
    mips64el |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/b96e5095a1e335fe075719cd4eb464a655f08076 |     
 powerpc64le |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/b8d23e9f757301e68dba8171269f723d98e74608 |     
      xtensa |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/a67faac6c5f34c402baf9fb5a87e9e67760bd76c |     
       nios2 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/657fce7c7615bba0907218b981db95d02bccd8f2 |     
       nios2 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/5a579d61e93adf6f4ebc27a2c3b7613eddef9b8b |     
     riscv32 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/bc32794eedf15a11e68e715e3affff4cddf9be55 |     
         arc |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/d94aabd14812bdd9ae0db807c3d816175037df7f |     
      x86_64 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/7a75e3af444a54760445aba0e93f6935ba978b4a |     
         arm |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/673188b7e62ba4d5aa3601ebf496827e6a62e384 |     
      x86_64 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/aaf5232446bc58e4a01632840a5396c36a68426c |     
microblazeel |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/cbf95ccbd26b1d4b31bca19dc28c86faafb7bec8 |     
        i586 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/4afa86b4951e0cc00b598db1bb0416960ad06c7b |     
  aarch64_be |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/9c3dda10bfb8a8f86ac901825d04cc55098a7493 |     
         arc |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/b318d4200d77993256c4a3b924d2e554a27305fb |     
        m68k |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/0854a356b495d33df727d49d68830a0624339763 |     
        or1k |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/60ab2513eb223709b35f1b2b741718b621534758 |     
        mips |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/0dabfa7397c7297d708e2f5e90e8499c03b42241 |     
        i686 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/52af646362a3909feffa6a5c726825b6ae43391d |     
    mips64el |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/336cb599236b561d4cce25cedb38f985d346a2e0 |     
        i686 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/052dddbbd9021f731b991447d86a3406d69cd759 |     
      xtensa |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/af3f64a09258219fcf2153758839cfe057ae3fd4 |     
      x86_64 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/dc059a4bc8c8369f9e573969dfb1f05cc5d4e9d0 |     
     riscv32 |             host-python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/97257f4b975f7fe3f6694964077a572049d3faa6 |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4560ebcdb348a5157deea4b8db63bd6e0f6e3663 |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5ab50d0f40318ad80a0b625f7494a8875cda56eb |     
      xtensa |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/0948ab6fd959940c836e06f5b632b36443a53451 | ORPH
     aarch64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/cfa6f78caea012ea4423e807ce8ceb997bc1f908 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/6d417ab6a0e369b6c7023ce7d40d9b31fa0adeaf | ORPH
      x86_64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/4369725cdea72b168dfa760d54ac038f2e0506de | ORPH
     riscv64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/a9b72f138595e39be51b37d93bc43e0e8a39e5f6 | ORPH
     riscv32 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/dadf5e71942b807bb4d18108c043ce81b349781c | ORPH
     sparc64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/05d48cc5ef1068537d45169a4930927060e1cd7a | ORPH
      xtensa |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/993392c1213889e4e2bb9c06235d2f2f16a5cafe | ORPH
     aarch64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/314acaa9e87e8e896a6af7d49ee0e59643ced500 | ORPH
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/e3c8f341a992db552cc0d04f86136a0b39f7fda1 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/6057db89ec2c7f92307eb1c29866ea885b060568 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e0b7866fdfb6bcf0045f704b9fc19e290006001e |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3a9c70a1137a0e91e1718f58f8aaa2a1b2eb2386 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8bd44326231fca838aa067ee0080ad97772a22ed |     
microblazeel | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/b138b02f3f719d88c5b63f5227ec6ba899550a13 |     
     riscv32 | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/b5d9fda835f5e6657b495993638f50b8c331d511 |     
         arc | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/8a9a288807e28fade8fc66c3ce21315c2a5f85c3 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/14ff4df19e68344ce71d08ff32160c626d20ac0e |     
     powerpc |              netsniff-ng-0.6.5 | NOK | http://autobuild.buildroot.net/results/b0fdcaf9366b7bcdc3b589d87f99fb619f1d1ad8 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c1d84650dfad107cd10442e75986bac677302573 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f97b7c7f0921b837e3d2c8984e0715232b54a8a4 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5a7eb7e2091b82452cb59d6f1f9cdbf169cd9434 |     
       sparc |                      ngircd-25 | NOK | http://autobuild.buildroot.net/results/72345ebd144bed824329618e66721a98eba3be22 | ORPH
    mips64el |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/9ec8012f0caf3144f9e5d84efb3a8fdf7e0cbdfc |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/b156077782201353a0c1443269dbbc01b236f6cc |     
        m68k | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/5724b246cf411d95702fcff6dbf2b809b899108c |     
      x86_64 | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/814f672b5e2c7a0ce94c6febe004b785cb96225f |     
        m68k | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/8a7fcfe906a4f6856c40ea4bb936672bd2c7a43e |     
         arm | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/258071b6565a1a7ed759437fa6053730dc8fe43a |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/6f516918d8e3601de204feb40a3523d8870b8e21 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/1d37faf869316d1a65db00190c440c84cf765074 |     
        i686 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/5222003a351c67c71db9af8a7116493091593cde |     
        or1k |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/2934cb072c699565988ed3f00a299f61bc252b76 |     
      mipsel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e5e038ca9030c7a97ad1a18ecec6fcef6e95f959 |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/c5180b21df4ae111de3ef6983b1bc7feed693a7b |     
     sparc64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/7afb9575c35663664acca4e2b0381b14699c19b0 |     
         sh4 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/dc45fc8bbad3fff63bb8e248ece85e10e5a4c82a |     
      xtensa |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/8bacc602894f903f23bc476a918c4dbf31206495 |     
 powerpc64le |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b4e112ff1409e297e3aa57268e1d1138c190ca0a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b49ae4977b605ed24783161618f383551f1662b8 |     
microblazeel |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6126848e08d9273911e7d5b0151847aa2293ed87 |     
    mips64el |               webkitgtk-2.22.6 | NOK | http://autobuild.buildroot.net/results/c2563e92d95dfc9cecb721d550ee06d31c06f7a8 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/2f22784a0015e35a13ec70669756e8b4dfd075b6 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/5d9640c72efc3052e719a57324306bf5284af319 | ORPH
       nios2 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/433fd200a4825a048e4c5c8810807e0be2624175 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/4f02b91f6ffffd194e09ed18c917b4f678b1a52d |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                grantlee-5.1.0 | 1 
                   netsnmp-5.8 | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

      mipsel |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/f3a0c560d309ae171f4d29c9309debb3fd3b57a3 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/3246367e014db918e68a20613fddb9909a845cdd | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/076e574e4e61167d939edc98e72c7edd75975579 |     


-- 
http://autobuild.buildroot.net
