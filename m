From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Apr 2018 08:00:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-13
Message-ID: <20180414060035.99BB1208A2@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   1 |   0 |  36 |
      master | 158 | 114 |   0 | 272 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/0695289490e173de4364d5010fbe38cc6d161eb5 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

dtv-scan-tables-07b18ecef17... | 32
x264-7d0ff22e8c96de126be9d3... | 11
                  zeromq-4.2.5 | 11
host-squashfs-e38956b92f738... | 10
                   flann-1.9.1 | 7 
               libglib2-2.56.1 | 7 
squashfs-e38956b92f738518c2... | 6 
                     lxc-3.0.0 | 5 
linux-firmware-65b1c68c63f9... | 4 
                  host-go-1.10 | 3 
                    liblo-0.29 | 3 
                  udftools-2.0 | 2 
               asterisk-14.7.6 | 1 
             bluez5_utils-5.49 | 1 
                  boost-1.66.0 | 1 
             expect-2014-05-02 | 1 
      gst1-plugins-ugly-1.12.4 | 1 
                   jamvm-2.0.0 | 1 
           libfreeimage-3.17.0 | 1 
               libupnpp-0.16.1 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
                      qt-4.8.7 | 1 
reaver-9bae55bd30b6d46b42da... | 1 
          usb_modeswitch-2.5.2 | 1 
                   wmctrl-1.07 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/4b04b12c9e46fc015a4e1e8222f3c73c1df93d8b |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/51bf0fe28169fc313abe7167c0654aa1b9c66d4d |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/fac2ba404a35b0903dbe3a26674b1a952470f104 |     
        i586 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4737c8ebe25c5f1198f65a67132230d14e513073 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ae0e523c0cbedc668c65b3851ce7adfcd502eb37 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b048bb8cbe03b553da0aa62294bebb7028c5d571 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/fcb4a9be3929624b9e99914af0efc20e0d16d774 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e01ad49f1b470e8318d4d37d8d38674c510546c4 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6e0a642aea5e5cd3ecf7197cdb5106ca8e267cd8 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f82430876b69fd764919ce2a4993dbb517c09940 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b73ccc0298c338697ecb17045cc92bf807865022 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/587552681ec921c1734dc6154c0710684d9485e0 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b7bafb7dc35f90e9bda630f544d3ac7e3e47764f |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/fec56f3ca902b19019f6e6010962b839ef13ab3f |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2d4bf4bd35845f779a18399d52bbe8b7b78aeb5a |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/bec2ea48c9c32f936366b55cd8d7bffac3aa5d9a |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5dd3de7d648f9619f92f65cf336452766e3aecaa |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/30ed825134452f327c3596ca068050763e2f437c |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2216deae8239f6e96835b5bc483f1fe3186ab11c |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ffedc4b0b4dd97ecc6804ad91ec90efe6b2ea965 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/662a49baa10c62902ce9643a44118530f9682411 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e8ac71b682cd95064c7a6e58303da5ac08602139 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/d098a402261e3ba66809c8781db1ef2a70cedca5 |     
        bfin | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/269f4e2baf3055adeed8c9581742bc5409f8c5a5 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/dc1bbf6fc03378dd8b4d6abcd25c31fd10950fbd |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/242e1ea2dbffb55b0d783bfd216a7705ae2b1bee |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6becba7d8f72eacd40b5e4053534e0ea4c9b32e7 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/511f011393e69d04813e4c37d8832d48d95b2b7f |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b4943c1c96ac14da62f181095e6cbfd3ccd45fb5 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4c7dd60499e5490d30727c25460e8e84d23a329d |     
        m68k | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/4b68632af1cabb32381219dbfbf487b0d75db32d |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a937a53b24f396c90913dedebd5d7c40d7a4d6ed |     
 powerpc64le | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/2b621c364a78ca040f213bc08ff227fc3d1c87f4 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/6a9d35b7089a3d217b8fefd9398e2ec2846be1c2 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8205a7fbc9b768d7e1e9e71b7a3f44a76b52a5fa |     
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ac4131f9a0d504773c575dc646d9f6edd8066d9c | ORPH
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/e75b22c028b2de1e7ed755b22268fb0e2fa4c018 |     
       sparc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/435b855462e197b3bf7a4f4797a05c3d8a96f767 |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/bb0460ccec8961040cb3130b3557184e071d5778 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/90525cee2d2f16047cdaa6dcebbea572e41ab93b |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2d422d5452e79ba61767d5c10744b424c96d5f75 |     
        i586 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/67c0075532e32cf51f64273420326916c3818d53 |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b22c20a25741fdb6421e42feb24d7c28ab24acfa |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/eb96ed238c8afda240cd8d0c1f7617095ba784d0 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2357e964f8d6c18cf73081dbc7b02edd9f94e5e5 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/447744681b8032f6e3c16dde8a80d257161e2c6c | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/a5b8055912759ee3f50bf08c2db56d8ee1b23134 | ORPH
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/33472247a685a8285c93b9b6ecc995d2b3727713 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/692291d90848b9c7b14fabfaabf55b13eb659052 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/1307ca09b68c4158aa74a0e6cd2758b34819c453 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3f2567e293a0a840c671366a9a2db3ffa7c29754 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9e6edad55789bd2bdde899a8c1db7275b5ef5f3c |     
microblazeel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c4570e1ba96b36d582c045f049b3c9f91a842395 |     
        m68k | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c96b0c9b29de23b2505456eca07c15b122b88134 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ff7331c7cf562c3030d3d23379a3fe0e43820668 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a97c6d23db93cf2b48e7132bc913be9179487164 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/004443f571d45e74203ca59feb445cc5b64761fb |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ae435dff5d9742115c12dd14ba9fc4a11f583d85 | ORPH
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1d8cb38053f2703273dd652e3c5a1bc7bea16810 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/78cf7c97f26d8dc9ede85bcf1f4e1b8632a745ae |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/6e4dbebb59817f3637719a9781d820de3b670946 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/cac9e86b2dc75a2d9061f797ec29397e350b9886 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/4cedc6f2a3508786e880e02c31e85faffb02a420 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/01793c2e458eccc25f6edc074e0bc9a12031b0ad |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/60e1f8e9138ebbcd699996b8261a3a57adc7a953 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/d275cba19858ab24279298f573025fe74d7548f6 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6f748ff96c28f79c459c4311d86ba64ea2ef4694 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/d4444e69d8978e99fa25fe5df1c4c84720e646f8 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/a3662acadb096e215f2b82dc27a22e5e18885f54 | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/528967629314377c4d8bd1f7edba4baaa324129d |     
 powerpc64le | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/ec1f982a3e70cf9fae59cb0390764a9d6030f350 |     
        bfin | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/23376d9a7fbbc9d2c506349e42992ddb254bbb87 |     
   powerpc64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/0eaf7ce56e0df34de2b8484d7ff7f4521ab4b4db |     
      mipsel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/dcd899406247a08cfb86218f1cb6c4737d7f2339 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a34d0f5cd3b872941665427a470e72987f912bed |     
        m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ceb6e0404332b83f7f212bc4556b2bb8ca3fc161 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5d9be67631ea137d0d9a95bc6cb37f6f7d94fc5d |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/52b72b6047f92dc4a5f9cfdba5fc0554e0a85bea |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b06c051597ac3a85a92d60f7e5084f37fee5e857 |     
         arm | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/0c8d0eeb693ac29739845f489caffc2f9fa3b262 |     
        i586 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3176b0e81dc8278f46e4d288b6a1ca388ae22e89 | ORPH
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/84e2bd1eb4251515216391970943c6547aa7826b |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/aa4ba3f47857b4594ac6d013508e59c65a5a1632 |     
      xtensa | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/d5e23809ed9bf8dd8105b05cd77bf1b220afd7d3 |     
    mips64el | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/354ccda140b5b77da44b438b0c00a83a2655200e |     
         arc | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/2a6b0455b2f18b5796f231e53388c5b0bfa8fdc1 |     
        mips | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/1ab9e7e492a0adb864e5681315e1c963fbffb6eb |     
     aarch64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/0497ddd275aafe3d6f8807f481547a3a0fd2ddfe |     
         arc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/cabac0bfbb5c8ff918a5d3c77164189ba3cd55ab |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ec6a4746528a516dfdb2945824795a17c4313bed |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/6d6e5cd9f62326c56eba3f4ed9c1d540c39291f9 | ORPH
   powerpc64 |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/7c1b35f805813fbac0a8fea88eb73c797186a0d0 |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/ed48dd372bec9ea2962ebea5ee73274df2933138 |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/c470eb9696002752e80ad8a4b647983b728df646 |     
      xtensa | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/d140d0aa2aeb46b00f01bd2da06bcb99eb1d4de9 |     
 powerpc64le | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/20417efe257027db584f44f7845c0f678aa835df |     
         sh4 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/a365275cd04b3b15ba7419c9995b649857554571 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/ac3b2203513251fb87c2ba5a25c2285411e9354a |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/e2d0dcbccbcf5a30c639c67bc0e5944b0853cfa9 |     
        i686 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/baf1ede33ab281ae3d2d3590ae73e081e567a4d2 |     
       nios2 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/1efa8fa2b231c63721418943cd015b90a90d855b |     
      xtensa | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/472f39034650ebe69875299215cfb3479d355ddc |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/3039dd13eb3569ae956eef648294585ac2df345d |     
         arc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0b957c48df6814a427717fba7ef2597617f64e82 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2bdb15183ece2e7e6dbd5fab91561c5a1b74d3c1 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9372f1a25fbf29df9d7cb0ac5bc6eb9daed3f3e2 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2288bc18f974bbe34565b025bc5f5869c0b5ee84 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f33e86dd5ef882bcbe4fa996ec03166fdfe57e9d | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4097a8e6c456e2f80b06ff857dd09d6ff38f9796 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9a22012bce6716f1507fa32828ef3ee9ad2e395d | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5a1fd2e31bbdf0a8f620b670422f0bac074ff6b3 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ea4b2f1b1fb62bd46541d38fcef92178148cf0c6 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/da9700b3364c441ed67fe5fc06e5def5edbe1707 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e53ba3a249304aa35c2129dd9987b1aaa3f6a16d | ORPH


-- 
http://autobuild.buildroot.net
