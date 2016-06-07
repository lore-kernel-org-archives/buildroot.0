From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Jun 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-06
Message-ID: <20160607063023.9F090102812@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-06
===============================

        success : 172
       failures : 71 
       timeouts : 0  
          TOTAL : 243

Classification of failures by reason
====================================

               target-finalize | 17
               zyre-legal-info | 9 
                flannel-v0.5.5 | 7 
     host-binutils-arc-2016.03 | 4 
                 igmpproxy-0.1 | 3 
                 mesa3d-11.2.2 | 2 
                    libiio-0.6 | 2 
          janus-gateway-v0.1.0 | 2 
                   mpd-0.19.15 | 1 
                    owfs-3.1p1 | 1 
               openswan-2.6.46 | 1 
                cifs-utils-6.5 | 1 
                 omniorb-4.2.1 | 1 
                   perl-5.22.2 | 1 
                 jack2-v1.9.10 | 1 
                    pppd-2.4.7 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
               linux-pam-1.2.1 | 1 
                wayland-1.11.0 | 1 
                mongrel2-1.9.2 | 1 
               host-gdb-7.10.1 | 1 
         qt5imageformats-5.6.0 | 1 
wiringpi-78b5c323b74de782df... | 1 
             spidev_test-v3.15 | 1 
            lttng-libust-2.7.1 | 1 
                e2fsprogs-1.43 | 1 
      kismet-Kismet-2014-02-R1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
               libsigsegv-2.10 | 1 
                nodejs-0.10.45 | 1 
                     php-7.0.7 | 1 
                    quota-4.01 | 1 
                   erlang-18.3 | 1 

Detail of failures
===================

microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/7ad968087320efab9f0b92f06991ae003ed4c90f/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/37ec575fbed34672da8de8b2d5f4e9338f7af879/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/814558f244a36ec4843da3934442a9056df316bf/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0c18f18c6aab8ea379b79636cc4ce80364dc217c/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/53caef48e68e73b1f3f3424ff0663637ebe8282d/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ac791edcd79df21fbf26c6ba28dc6b6320ee2da0/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/185d638120a31f085dd63011eaa1716982141884/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5170918243c0115cf88ef2544905e704ff9eb802/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/25132c3fee96c1ada641ed9d4066d25d834bff7e/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/35470673cd2a40890566732a9e1c558f4a2e0583/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/0171799c0ede13b94c098f726f542615da1fed4e/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/e030d81d9e5344eaff12f93ae8b14d022b16ecf8/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/17a550bd9a1d3fcf9f40bce0f481d1b5bd3c6f78/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/78c274c7e4a44fa964b59913f45665d78e5f013c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/853cf40fdddab999be509dfb4d6e301ad88941a9/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d7cab99f4cd24becd52a7f2cd616be1bbacbdfa0/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/13a79969f79e58ef13ac6ef1988c258beea96aad/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/790d639073ccc3254b2ea4166b1ac289e4a5c830/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/a92da7033266769f6f7edbdd7939ddf8e950cdd8/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/87f35cb06e3d5ef5e2ea577799b49eb1f5c3c9ed/
       nios2 |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/e468792af4aadbc6c9fce828a9d423e35c303b90/
         arm |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/88f2cdbe2aad2d2476372dd4d559edf2bf16d5b1/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/97a2f954bfe49b27069ea06d7d49d6c1a9401bde/
      x86_64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/1a106b485d325dab6eb848919f7dbb427c7e570f/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/0b6c875c5cd7d9dfe8cebd927c308f8d6c6ff9d8/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/0de6e4c1f99dce55cfd1f3a4967b3df979a85c76/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f4730ed88766ada0eb2743b104bc673c40cd66d7/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/72548f2483ed2eba7ad3172cfe036974e55adc53/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/b1006af5e893d2180d3b6fc55c09820c1a97345d/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/c9ae143e7ddb48db73b2995ff612fa53f498ceb9/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e8aa3d2276f278c0d5d5f29d7b3a6dbaa6aa1fa2/
         sh4 |                    mpd-0.19.15 | NOK | http://autobuild.buildroot.net/results/ba5fc9bba6ca6b27151d7c3ed4a4480924e2f78e/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/9ec4c52f6a67bc56095798fd824a826d49f8aed3/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/b61742bcc0dd0e2453f98739ecb7c47bab1e40fd/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/ad7e182e066edaf23cb34c2699b801527d0e6f05/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2ff61f6be9baeddbf4bbd52130e91ee9783ccf9e/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/83b6699303282aaa574a6146b7c333c1a356ef72/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/421cbf27194fbf66a8282134f86650e03cd9e7a4/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/9baf70ba35706dc7416d891ca33904174c00ffe4/
     aarch64 |          qt5imageformats-5.6.0 | NOK | http://autobuild.buildroot.net/results/b3445af5dc4290cf235b02b57f6bef0082bb17dd/
        i686 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/192c660abc4798d586bcdb1da876eea756cd6109/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/dd98c29f3dac3605cfeaa63beb1cb7339a617d57/
         arm |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/6e455e5223a512adffbe2412bd888bbf98e89cda/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d0b4eee62d045e4908da7a5e5184c362ace804d8/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/24b9e357f7028735e3d4198dc991f220ff1998ec/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/51c7fdf125c796393fdef563720ed038c1bf2016/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/84305fc2684124cc27c506385f0b5146068813c0/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9c93b65c4d0c34d95986bae84584c619d56cb49e/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c36019c114155b8940c050e817843cd64f24f368/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b51ee68049463964005663f1c83180122a9862ac/
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f46916ef306f045fb665082f15a2974a2ef9440c/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/bfde1f993ab7c41939ae00127337dc20616283f1/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/189356160f11e6372529b507a14e760ca631cfb5/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/4ffe1ceac68315280bea92fddb01565f1a8e1f4f/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/83a3ab2dfc7211b4047325815dbeee970643598a/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/81040bf8e5d27b04908db3f06d5d1e8b2466fbcd/
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7d075b5ed3160c49aa31857a351efd41a62426d0/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/07368efe114bbeb9da87e346eedebad9172078a4/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/99bbd306b92b3fabc2d5edb124e5201e8f644b54/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ef2e21858fed156f96f0bd546dbf1c743392d321/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/34377a23938ce366594b2f8e51634bb9744c017b/
         arm | wiringpi-78b5c323b74de782df... | NOK | http://autobuild.buildroot.net/results/4e17697c1116b418d8d9c07a202f3c89186e463f/
       nios2 |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/88fa0b150ad83e42625666cbffdf95ee178015cb/
         arm |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/5bdf721511d69d81863f351a9592dbc1ec8bc17f/
         arm |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/e4b8ba0b0646cff97c6ffda7213087a40ce7b644/
         arm |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/8f0a0d5fb620affa9834c6b657e3f1d436bc72e3/
    mips64el |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/af5c099cbdd6eeca81b8c8cc124bcf8b3d788e19/
     powerpc |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/cae848dc099c60e31d31271c62aef1a2d84d106a/
       nios2 |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/cfd5add5e86693530a4e005210e771cac59e3213/
    mips64el |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/8123d4e7a37c2710f4fb2fbc62094a049303d8b2/
    mips64el |                zyre-legal-info | NOK | http://autobuild.buildroot.net/results/32cde7ecde28d032d83a7425111589c180102f61/


-- 
http://autobuild.buildroot.net
