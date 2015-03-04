From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Mar 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-03
Message-ID: <20150304073018.16E8F1018BC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-03
===============================

        success : 260
       failures : 58 
       timeouts : 2  
          TOTAL : 320

Classification of failures by reason
====================================

                  uclibc-1.0.0 | 16
                   perl-5.20.2 | 8 
               batctl-2014.4.0 | 4 
                  thrift-0.9.2 | 3 
freerdp-b21ff842ef3de583751... | 2 
                       kmod-20 | 2 
             host-thrift-0.9.2 | 2 
dvb-apps-3d43b280298c39a67d... | 2 
             fxload-2008_10_13 | 1 
              host-cmake-3.1.3 | 1 
                 qt5base-5.4.0 | 1 
                libgtk3-3.14.5 | 1 
           libmemcached-1.0.18 | 1 
                 cdrkit-1.1.11 | 1 
              host-perl-5.20.1 | 1 
                 libssh2-1.4.3 | 1 
                  zeromq-4.0.5 | 1 
                     vlc-2.1.6 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
          sane-backends-1.0.22 | 1 
                    strace-4.9 | 1 
                oprofile-1.0.0 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                      qt-4.8.6 | 1 
         lua-periphery-1.0.4-1 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                  python-2.7.9 | 1 
          host-gcc-final-4.8.4 | 1 
                host-ola-0.9.4 | 1 

Detail of failures
===================

        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/b024793d474484684091c238f27e3e89205160cf/
     powerpc |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/1779e08dc3477a843d77326cd597b6d0936b2027/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/a15ff1c18480d04235e9ec234aa9b9ba0baca55e/
     powerpc |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/13625a3e9add4816be235910ef9bdffb5e4a2980/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c6e5fd43a97ff69ce809f13518ff5d8a9083cf44/
        bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ea0beef8a5dad6833a324f7a3a49b2a06bf715aa/
        bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/660a3b754bf35e136c0903f4c3b79cb406dd243d/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/75e5d56ae95ff79db9a6d74256e355b3117448fb/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/ffb40863c682336542cf93b5ed9021874ef1d2bd/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/e4b932a0d5a33f12278543eb5d79584ba4a3eb9e/
      x86_64 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e5b829b2a6ac12dfbb3c4af830d395097a9b2d5f/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ecaa0227249207b5450519832a193c1585ac8177/
      xtensa |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/ed283f295f6e08ff1cd465256c79ff15467b3274/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/8c3606cf02ee6ae2d118e85c853372f7e2a1853c/
      x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/dcd51e63d87ca724631c4d0189c0c8fecabfe757/
      mipsel |               host-perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/03d5c8fed300274f35d97c085d1beefc03532085/
        sh4a |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/07cda1acd547f15f4dac2b97b3a27ad9bae862a9/
         sh4 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/53c0f089858dfc02b9d38081ade1e2c90074cb49/
         arm |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/f662d9230e4bc2da7dc56a2ffd493cc37254d377/
         arm |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/233ec8ee346e15d41658cffc6bbb4a6c9dd46746/
     powerpc |                 libgtk3-3.14.5 | NOK | http://autobuild.buildroot.net/results/89623f9278404bba2777fb38b71ac30f79af6646/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/20e7a213352fea006a4290181b437f6359766017/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/60be11673212891d1a1b9f1cf9d1beec98f0928f/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/802a94db75ebe30d5786bb928f883fe91bb3fe03/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/a7cd55be102eb3ef30fa085ae5f2f4b27292a26f/
        sh4a |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/b68be1f14fb2bf722d9a36e47518109432a3d577/
     powerpc |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/5f55b43f1e62fa1a472bce469c943a27ca41f27f/
     powerpc |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/2c8ec1ed8324f06da9d06e0c6a855c6ccbfe8d8f/
         arm |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/1c261b09f5a4a314d5dcbc1e5811af9c7d18658a/
        mips |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/3a602cb01ed36fad52d8dd0caf2a8e6381b8b55d/
         arm |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/a8c77f1598bd9e1c4d49ab8ae1357cc7d0a5a248/
      x86_64 |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/8da261f64f2f2998d8ed0d56efc6942fae853ea7/
      mipsel |                    perl-5.20.2 | NOK | http://autobuild.buildroot.net/results/fc9911e402acc8e8465120719cfbaac6e3eb3ff5/
      x86_64 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/cc20564281102db1adce5195ce275c4cd3328fc1/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/d86d7af08f0f3cacc483a0c563223d90d0c054c6/
         arm |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/f4efb08248bd741c2b247649f23f7651e918fe3a/
     powerpc |           sane-backends-1.0.22 | TIM | http://autobuild.buildroot.net/results/b6a3dca2b70c6c6b9693b55e11c2bea8522b4cc8/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/b6b2f6017538529469119ea82fbd74c706b58bc1/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/569a1b853574a4d8054e323d9712c4a3b3324e20/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/2605c768ec41769e222b95b7deabc2d26e810947/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/842d23fd4150e1c171df0ce13188abb6e98047f0/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/9dc031cb26e2d3036ee6af264085cb764c3b5be7/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/991e5ab86cfef7b9a22d82f1e97eabe4051917c1/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/0065d994fb21155116c1714b300d37e9ed058077/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/1181e721b30de6fe21ff92cdc7d9998d1e056bdd/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/218fdf3be17f7195bbb0a035a562674331747a06/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/0b81b7d1c16ee486142aadf483d0b6663e8d9d49/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2dbbf2e943437c9782e10db159ef08d37ccf3e3f/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/bb72334a8cd174106558f7e524022688234bac23/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/8a6402966e9792b071993d8c4c1ee9b24b8f87a0/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/6acecd8f91c61caebaed0ca30b01a0d77a3f78da/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/ee4b288eef8d034436323fcd013bb13d005d29c3/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/034609df5600237c73114ba87e811c15f3e624c1/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e946afd4ada8d13046efc81e2c1bba5000a60163/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/7525ebe1a71a64600761e7094b139ca693340e6e/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/77fe89d358a90f5167e58bedb73495d7ee9a7f5d/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d0b90a515769b174bdefa8e9b049db1345e50fa9/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/8d91e3ffccee753135e9d0faa2b1ae00875606c9/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/22cf8f40045aa181e88d998a399166e6f83d8291/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/0002785795474ba9f1d33fa878930a7fedde6007/


-- 
http://autobuild.buildroot.net
