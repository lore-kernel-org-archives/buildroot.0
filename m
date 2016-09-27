From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-26
Message-ID: <20160927063047.7729D102C90@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-26
================================

      successes : 171
       failures : 115
       timeouts : 7  
          TOTAL : 293

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 25
               wvstreams-4.6.1 | 13
               libglib2-2.50.0 | 10
                     vlc-2.2.4 | 6 
                  libcdio-0.93 | 5 
                libsigc-2.10.0 | 5 
                    mpfr-3.1.4 | 4 
       host-erlang-rebar-2.6.4 | 3 
                    cups-2.1.4 | 2 
                   efivar-0.23 | 2 
                     gpsd-3.16 | 2 
                 lvm2-2.02.165 | 2 
                     lzop-1.03 | 2 
                    mpv-0.20.0 | 2 
                    ola-0.10.2 | 2 
              ptpd2-ptpd-2.3.1 | 2 
qt5webkit-b889f460280ad98c8... | 2 
                acpitool-0.5.1 | 1 
                alsa-lib-1.1.2 | 1 
                apr-util-1.5.4 | 1 
               audiofile-0.3.6 | 1 
                  cc-tool-0.26 | 1 
filemq-e59951489045825d6fc5... | 1 
                    hans-0.4.4 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-0b04ed061003... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
           libvncserver-0.9.10 | 1 
                  lshw-B.02.18 | 1 
                     lzip-1.15 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
                    mosh-1.2.6 | 1 
                 opencv3-3.1.0 | 1 
                    php-7.0.11 | 1 
                 php-zmq-1.1.3 | 1 
python-libconfig-b271c3d9da... | 1 
                rsyslog-8.19.0 | 1 
                smcroute-2.1.1 | 1 
              strongswan-5.4.0 | 1 
               tcpreplay-4.1.1 | 1 
                  thrift-0.9.2 | 1 
                    ustr-1.0.4 | 1 
               wireshark-2.2.0 | 1 
                 xenomai-2.6.4 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/6fc568228b7c5c5be9e35aae73fb09b431896325
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/ce1748fa01897c9b54ca74b9f0b64a538d1f735a
       nios2 |                 apr-util-1.5.4 | NOK | http://autobuild.buildroot.net/results/6cf4b7f6e79497d9f77fe51c91cad716a750e490
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/62a1631320a5d9d6c8a3553cdd023bbf2921e0de
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d6e43f196ab9bc1f12b041abc06d35670934149d
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/e48d932ce0b9b58017be710a096adf9a974a26bf
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/b191803962be9115e972a0c2aa3d89ec2f618739
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4425950535420d4933d412d3dbdc1b1d946134dd
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/44fa28aa63f77363346429cd5f190bace6892894
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/1269c0d99eef903ad8fdc499eb8877ec45a4daa6
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e2f981154c9d97c13b1f7e4ce15ea04498581ee2
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7e997e5a7a158feac5cd2f26a383962a2cc5b252
        m68k |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/fc09e3327e9ea368e81b55533dfe1b8893894fdd
      mipsel |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/dbc961e97efe25a82c36a455abfc5dc58da2b44d
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/d70f9e124126ccedec76973ae19b3a2ce56e95c8
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/b56d06752da952e108f569b754be050ff71eaef0
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/49a17965482ec7d2e5dc00976952d5e3917111d0
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/043381c3ded9733eee5db5258a98129354abe11f
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/272e2128f0efde936198c99952df2ae13158a558
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/2039ca150db9731c81a68307ff2809bc9fd2dcdb
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/14ae0524d70aff34b309bf432572279747e496c9
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/30ebe560ffc0d391fd0bdfc04a9234e5c5b1fc0c
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/04fed934ab6bd77295df866567683c9b40fa1e19
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/d2a60d77ff2fb54ddf2a202432ffa5e6e63af0cb
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/5dc60120107581ab894c5ea832551612b6a55712
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/3b886f68147b4afd39612ad30b998836dd4271e6
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0ce64e135ac943980fddec5fcab5307e0a304751
        i586 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/eb573c31dc8a3f9c9753ed1cd35a722a9fed7b65
     powerpc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/58a2bec039034bb99168510be8ec57d90a7a689a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/757e9869b42e58bb4e906bc9c720e2c16c4dc70d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3cdb7991dd6fed17bfae51760f3e0505c4793c60
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c342a97782bc003939d39c88f1f1eafd0e7eda58
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/922aac0e7f16dcc326e3271bbb56009993dfa3ab
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a6cbbba8025749f34867b9c2bd9887b34bc5dd51
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/69a2a4b6ed811ef131d59f946e2ff67b9885f13d
        i586 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/da57ab349b4faff5a704b0bf18e181f610894a37
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/34edbc57191f78b3bc13188bc93160bddcaf71b8
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/c8c92c1754c8634076909615625e5230107b2cc0
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/29088370686d6eabf595de073dcf1e5e886e6040
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/4f1bd66fc5f33599c3f140de4be13687dc850229
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/88861ec30b3ad6429932e2ea1d79efc13d45aa9d
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/9ea723881c28a49a01258e9611f88dc15ad36e09
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/3202ddc17daa1c7ae632b19f5a62645b53b2fd44
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/f67b81b3ef72e9f4ab974ce6ca88f2c616442780
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/a13e6933219f03f1a2c8cfc2174ef04959ea9053
         arm |                      lzip-1.15 | NOK | http://autobuild.buildroot.net/results/21deb167b487435577b75cdf3c7fac65af599853
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/ff94396a9c874c4306c095c0e8644600e243d27e
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/dae207cca91428960afeb61d4b5a8ec5508172db
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/597877a0d6c08048db0ee55043d8cbf5a1427cd7
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/c688bc50465d144c07fce87736f161c8f37762fb
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/0a8e7e2c1021df91475469bb54cba1e61ae707bd
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ebb591bc1444be42a95c8d99f7fb26c90bb0aa65
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/37c57c7dd84e355f02fbb926f116b7e506647422
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/e7d096406f55a877278768683b89c1f9feef2d18
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/b65bbb13823809297f936efd64a04630ace27fd9
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/f640b7864e29a989e01a9a69ee24c28b4e013c49
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/e1f2f431202508befc4894c92bb1e13cf1ec2146
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/01e7efa706da982b2759ac51ada0ca99e8bc6891
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b028d34e5c15186ea6f9b8b491af40226d4acaa3
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/c6ee9866d3965c03786c4c4c2f33c037463ab168
       sparc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/64c27ffb6e5ce04c112a885974e805bc9faf0c84
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/5be8e2d46a0464a4c7d90b5fc6cca5eef0db87fa
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/d733cfd359bc1b49ee9f72bf6b222a24bfaa7b5c
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/9cf87fcdc919f2c388cbc9998b68848b5fb45ed3
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/372b7f632e9c66771929ba01af205bc0fab49f39
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cf621f7d4ae50c21cc1a066d659537cadbff47ad
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/a1f60de41f1f45c4275968af5d4f639382413906
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/e948f96912808658a9e6401269441f8c4b927775
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/a99d354da363fb4ad48a930fa5f8d131525dcc41
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/3b84f2208c338494540fbff21a4d5f4647c0da1d
        m68k |                 smcroute-2.1.1 | NOK | http://autobuild.buildroot.net/results/ae76bb3ac3e896f76aa7f4776468aa906983e6f1
         arm |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/f1e4e08fb78e23a9d62423bb55151accb4400f1b
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/f61c3457fbfc00daaad9dbc864b8b10bc1424f46
        m68k |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/248dbf92230e3ca99cbb939b9f017e11355e07b0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1be78aecea12bf60e5682b1e3fdefc146a89872f
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d0028cce2ab678b90745b10d75c734e3bfbd9353
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/072a4e31f239da06a1a2f74b7f3b0a867aa07da3
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bd1c2b0433353c9eb4283d820f8ddb3386f35e1f
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8b4a390429997a09c6a43050db5c46c09f5609a0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/95179bf79f35150960490a36ff22df212fd1cead
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/feb784031a2b25f417f5b224b9d76a980825e134
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9febc5dded0224acdd0fac994b2e5ae8600b36d6
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2236ef43bfe982c415bc73613878125fec3b98f4
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/31ada849e5d398d7b63cac5b9c5fc08e619bf848
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/55846002ec714ed3c0ef59537944af279db1e8c7
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/27ef91bf13812dbb4d9ceaf1ac6d26db36e185b7
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cee465ddd8592e9ffc43418a6add20d4b7b7d70d
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/71a9da9643c42376613a1e762346437c8d849287
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4f9ed512872a3a4c193c41d07190ae389a849a2d
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d6dc18bf72b6d1c9eba974b7ed089293f1e7937a
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/77e4ca11fdf44a8fea0f8f224cf124b411af675e
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7b935f9f80efcfdeba2f333a95f25296adfdb419
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f0378ce69642d6322eda6eedecac9b375bb0bd0a
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/eaaee32b43ee5c3143cf66b01364e192f97c2e4c
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b5d75c7bd1c25284578e981f0bf894d1a21a309d
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7d205adc18534fd508b6ea6446384fd110fba5a5
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4d22eafe16bb8d0321e9496c0883e071e03488a2
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8ecdb5c71933ae16b0b76ff98eac1d044ae1aa1b
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0da531acfe09ceaeb63dbae4d0e4ae291e8aae04
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/963141370a9b127f473a7fae161656a6b0a4f33b
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f6bedb6263720d6fc11899344ec85ecc90589089
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c45561f3dedf0b97039ef55757f72605f028ef7f
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/973a81f53cb881a445340fdd95275dee5f51fb0a
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a2f26532d019591be247837c37afdc7d6c39484c
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/93e7e6a2a14d3f4d8b9ca30dc789def822a79beb
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/80243a5f0224bb33192e6bb32a83a60eeb385ab0
    mips64el |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/d75efd8d10e98f499b1475c8752bd4113620799e
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/927e1e24f3ee6858f069ce354afdf8d45e9d7a24
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a4ec4faf4fb1f89619d49c4feb4921a52e2ed5e8
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/92731b4c23230eb11c88633d28e2bb7557a707da
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5428994b9aa475b86efb8f522769b968415914e0
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f1f4a523a905891f5f670ad3ae523784bbcb6111
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9d8e3425ac9f3460f0b5893fa3b233f0d77123c8
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/30dea86d4dda3b02df28118d2670f703ac380111
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/cecfc214b538d47c81c36a2bb820f92446473b2c
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/3bbf99a967f6c13266676f41772e398d74509c59
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a1ec2e191e2be292744c4385d1d81be3c0e7525b
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/29953643cc1edd6c495a23f39153d83ecfb07930
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ac60a7c38e3fb1142d45a4a14283b503afa0420d
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/90a419fdba4e5807d108d19f0f37713550c0e20c
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/9be34c3dc57e5849ccad9ecaab1a5b0dc279dd56
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/0d864a5041b189533707a82c2706f78b3bd075a9

-- 
http://autobuild.buildroot.net
