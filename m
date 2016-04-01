From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-31
Message-ID: <20160401063024.010B61028F1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-31
===============================

        success : 200
       failures : 91 
       timeouts : 1  
          TOTAL : 292

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 9 
                  boost-1.60.0 | 5 
                     vlc-2.2.2 | 4 
                 jack2-v1.9.10 | 4 
                  connman-1.31 | 4 
                    mosh-1.2.5 | 4 
               cannelloni-v0.5 | 3 
                    norm-1.5r6 | 3 
                  ffmpeg-2.8.6 | 2 
                      qt-4.8.7 | 2 
      ca-certificates-20160104 | 2 
       gadgetfs-test-undefined | 2 
                linphone-3.6.1 | 2 
                 raptor-2.0.15 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                 rtptools-1.20 | 2 
             ipsec-tools-0.8.2 | 2 
                    ruby-2.3.0 | 2 
      kismet-Kismet-2014-02-R1 | 2 
             lirc-tools-0.9.3a | 2 
                  trinity-v1.6 | 2 
               valgrind-3.11.0 | 2 
                   erlang-18.3 | 1 
                    cups-2.1.2 | 1 
                iproute2-4.4.0 | 1 
                    yajl-2.1.0 | 1 
                     fbset-2.1 | 1 
               opencv-2.4.12.3 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                 libgee-0.18.0 | 1 
              gnuradio-3.7.9.1 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                     tftpd-5.2 | 1 
make[2]: *** [Source/WebCor... | 1 
                   mplayer-1.2 | 1 
             stress-ng-0.04.16 | 1 
gmrender-resurrect-aa3d02cf... | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                sg3_utils-1.42 | 1 
             ntfs-3g-2016.2.22 | 1 
                   systemd-229 | 1 
                 weston-1.10.0 | 1 
                moarvm-2016.01 | 1 
                 rpcbind-0.2.3 | 1 
                 libdrm-2.4.67 | 1 
                 qt5base-5.6.0 | 1 
                  cairo-1.14.6 | 1 
                wayland-1.10.0 | 1 
                grantlee-0.5.1 | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8e12bf750579eecf14cb58900d4a33918db74d65/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5529d4fb820f67a51a40408bd147cba8bfb85ad8/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0e91ad427bbe6ba368e5ea9ab1a38d4fd0281967/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/93c558800f91330ee0139b9413a77366d9d5a98c/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/63dd4d4ee60edd3aedbce1a041b0745a0780b8d2/
       sparc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/61b7954e2b9f6674f9ef605a1e8466d4b7055f5c/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/8e9405df45640fcc69fedaa2a5c0ad63e3db2693/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/e82e8e284354ae49ae0e908ad5acb489d41029a0/
     powerpc |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/4a9999555c20e495d4981deafc2960940e67febe/
        i686 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/1ae2e0338af80903c19cb4ceda3054bb628d3d8e/
      x86_64 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/91048e4c316a55951fc9337e461ffa14ce88f95c/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7571c68ce609fda45a9bb45874463bebe6f3784f/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/38c84df2a25a36bb3dde350bc0a6fdf43c77f777/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c20602b5aee3979511679b0a7c30f8d4087450fc/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9d0e38c0a275ead15fb9882c43444eb4a10f6788/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c64dc4b61115b584bcb2f9325ef084fc6213d296/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/370fcb3a6b3401e530dc6044aeaf3422fe8d9f54/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/6b3d07fb4f158e5baa56691a95b8a8c89ff2de3e/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/ce0ee5e305613ad35c9d037f0bf3e5984fd5ce4c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/69580fc99db2dbea3f8f9d65c9a74fffacf5da86/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/cdacdb3d805ed45e7c711dbb95cb137913c1e262/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e2da6c94408eeeb679ebeff2323f93efeb0f4fd5/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/f9f73485697dc6bab15fe45991ed99addb4ead91/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/4b59ab176f90d6bf3ff223af1b03d6a1367efda9/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/fce1fb84c795dfaedcd42861a6f67ba5c92b95d7/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/42978107255043992936b0c64a3e5aaec112c952/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/fe834279a38d9e8c1d84ed680b44f27519824111/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/725a38c9ea4061482208bd7bf89f30ad1e3bd89b/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/ce73c57e647175bb11772467823e0e360c0acb32/
         arm |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/fb398ea5ebdd57c0cb37c13ecca16eff07cabf73/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/83df68870088fa6d2222b83da1b45645c344b75e/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/23558a6b3a1814f1ee03e678657a610436e90294/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e26c1fe3db7fa451abd1a2d00f33e10a00305ca5/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d04e3f4525e5fa464ddc051fcf92ae71d8d381fe/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/fda2d285577d12f9e7cbfdd856d88ccfc39287ca/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f5dc7b928904334cc086a576882659a7a9cb2971/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/b82869c46bf40749f37c0fb3909078d7972937fb/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/201eb729a7901400c66be49634dc440c3f8009db/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/60ef3eb755dd4fb171aafa599dd250343d9521f2/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/85b2bf49edde198f53dc869ba93054991b3277a0/
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/dc72cab8839e10b50eead2637102752f9eb88134/
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/42c9311febcd2cd4d7275d114e335ec69a4994f5/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/612ae05ce270ebf80adbcfff6190789222f264a3/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/7037ac5d78dcdda2921bc8fa578b96f0d4cb3750/
        i686 | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/32018afda94431fcaa0b904c3c004c13e74c155e/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/ce2f9d89558ad8fa0a1e89db8fede737c492ca01/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/2672c5e6f03e7b9209e72989628fab8096743abc/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ba3dd59bccc63681e804982c50527abc448500fb/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/8f74e5dbebbbc769196a2557f0dae6f146c1514b/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/8b1fd383a7ab42e06df7af98208c743da5770ecc/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c0ef9a85d4fb9c5ea3d878b5a6e4c1e83651154f/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c0e897a6db888d4a7e0302cdc1e0cbec7d1e88f3/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c2dcdaa6690bcb860d6a16693b718538ffb1f90c/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/fafb86f9576c62b7abf57186798c0e694359afa7/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/b217321346d30061ddb237ed0939a68338c00f02/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/2072d9abcb3113a4605b6e7305d98ba8a4b805eb/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9a8d45fda5afd2a79c48934b69e59534a140048e/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e4fb6a641421ece29425670790c2d3c6d26f57e1/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/ce7b04a53a90186621858475c8af3c0c96353c23/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/25edaa164ba37a4f03d98d8fc711cb399bbee035/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/7535240ea0bf51e993d35bf6a9bcba2ddb46c2a9/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/e1ce510a9cfca108a8b455ef6baf16621918c0c1/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/1f0d02c2343d7778a10c4821efe85aa7a3b746b7/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/4d81449f2992405d2b471dd0ec0b11a8ac2e1fe9/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d9d37ea6eafb656be4e54ad078f8b9a69048afbd/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/5fa4f73354f46136364db82c44c049d164324ce7/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/bdd98687cae85bf1b02d5bc67be2bad63ea968ed/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/7f257d03ee0cd338f4b3c80c324b4b1f23e7e0bb/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/58c95e897cc4153ba72b8c6528fc2937500d7030/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/71ce177f05f96986cb1b649706dcb29055e79724/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/876083832770348359eab1c0269fc17d98276c93/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2f3982e5b5a9d1e57522522b7a7e743347076623/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/70b8a0490bf72246c07539e083864b6ff44be9ef/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/47ffc21c644502d766496ad8f1fd95d60d0360ce/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/18923f63894936101d655ae36ffadec808a8e54c/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/3b720527df53d9bab62627c43e8f84cf65929a4b/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/8eb6773b116174dc0cb7b55b7e4745ee702b6776/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/146a8461c1b8384d1bc7e13588cb14afa8736353/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f1284797eb48c72e70ef57f45250111c138216dd/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5d6fa61cb7eef56c8c0d69356f68895cc967be93/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/172f1e6175059b192485977a8094a167ea6e0c2f/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f03cdbe176fcd781d2d351c508fbc1ce4c6a60ad/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0b6ebd678480c2a2195abbb204550e146f255ff6/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/903c8e3e447927885afcc187fb7ad0816b5eaa15/
    mips64el |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/9c8917c0b15c38f832a4df8735b44fb54d3b6cf9/
      mipsel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/e6257f7efea943798fae281b1cb012de6a880203/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/0ef4945f8c621ed96d2130ba7cbf3b1b8ce46d27/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/9e474240d398882d1f10e37333221ea112b8f3f4/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/99668cc78918768a6ca60f4d1080c0d33a1325a1/
      x86_64 |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/bea8ab63952dc79d13c97e1d58747d71872b8020/
         arc |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/8aec759b0e485b2c90e2a26d60c7776c2684c44a/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a7a7e6ae4aaa2b9ebd16413e0a93571912080459/


-- 
http://autobuild.buildroot.net
