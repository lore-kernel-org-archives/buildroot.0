From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-05
Message-ID: <20160306073022.8C7E5100F21@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-05
===============================

        success : 205
       failures : 98 
       timeouts : 0  
          TOTAL : 303

Classification of failures by reason
====================================

              host-libcap-2.24 | 14
                  multicat-2.1 | 5 
           libimxvpuapi-0.10.1 | 4 
               valgrind-3.11.0 | 4 
               ipmitool-1.8.15 | 3 
              gst1-libav-1.6.3 | 3 
    python-rpi-gpio-legal-info | 3 
                      qt-4.8.7 | 3 
                    cups-2.1.2 | 3 
                     dt-v18.32 | 3 
                    ruby-2.3.0 | 2 
                 rtptools-1.20 | 2 
                    mosh-1.2.5 | 2 
                   fio-fio-2.6 | 2 
                 setools-3.3.8 | 2 
                   tor-0.2.7.6 | 2 
                  cairo-1.14.4 | 2 
                  trinity-v1.6 | 2 
                  connman-1.31 | 2 
                blktrace-1.1.0 | 1 
                 libraw-0.17.1 | 1 
                     mtr-v0.86 | 1 
                  weston-1.8.0 | 1 
              memcached-1.4.25 | 1 
                    owfs-3.1p1 | 1 
               iptraf-ng-1.1.4 | 1 
                 igmpproxy-0.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
                   lite-0.8.10 | 1 
             stress-ng-0.04.16 | 1 
                  ffmpeg-2.8.6 | 1 
                     lxc-1.1.5 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
               libgtk2-2.24.29 | 1 
                 mesa3d-11.1.2 | 1 
                qt5tools-5.5.1 | 1 
                       zsh-5.2 | 1 
                oprofile-1.1.0 | 1 
                     znc-1.6.3 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
        ltp-testsuite-20150903 | 1 
                 mono-4.2.2.30 | 1 
             bluez5_utils-5.37 | 1 
                  gamin-0.1.10 | 1 
                   systemd-229 | 1 
               syslog-ng-3.7.2 | 1 
                 lvm2-2.02.144 | 1 
            gst-ffmpeg-0.10.13 | 1 
                libpjsip-2.4.5 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 omniorb-4.2.0 | 1 
        host-gutenprint-5.2.11 | 1 
     openvmtools-stable-9.10.2 | 1 
     host-google-breakpad-1373 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/8ef0511f08bfcb2f0f98ee76fd65b13fb71da96c/
      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/f02fecfa596a80ab65a3e695ae3e1cc5dbf877ca/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/11b94f1d7079e84cb0468e39c97d5ad445a4796a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/c5d09be2c070ab263da64435c4f53284670ad693/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bf0680f6aed6b8f43cd598710dcce78315737fd7/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/08abb3df9c37d4c319c9ef6c73e2e1606a663ee9/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5cd9ba0fa5374abc8231acdfa167fc1de6b558c2/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/79f55130571caab6c0ef3dcdbbe1ca512f3304c3/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5d957f7855912abb17fbb2aa4bb808f5db083b2c/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c46e4622d84b8c1e0585a9af2682d8bf492b8bd5/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/43f1efe4998dcc7c57f50872519f429cd75eb9b2/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/2b3b73bd9190d930b3d25916bb992bde3c852931/
     aarch64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/1c2e6562c052b60e6fd4d517862dceefa2f283a4/
      x86_64 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/19be5b35f52b3f374091e4cb169e9d7116941e48/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/f87ff3c433c2e6e99c380f7c4579d9d9de46f8ef/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/c0e6690dc0c4be4e963270fc12c8f7f76f21fe97/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/015d90d4b3ec3f9bb21c58bd2a1416cd31baa4a2/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/f2339db5f6402987d04721c70877080523ccef8c/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/3808d2b62c3b6ba535867bffe574bde6eb95f4c2/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0ddbf78737d0f7d367c2ef272170bcc32622b746/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/36bb5850eb47e7d91a3ec182f34b7571ecd8ea23/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/1673a98cb26443e3f730338fb394a979b97a3311/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/65f613af701cfdaff77974ca05d6ba6e81fd6341/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e9e7b8b157eb46fe642ed914cb95c02e4ddf7293/
        i686 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/0ab95b769babbce5813370699121e67e5f55779b/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3a5defd7413fd4fbbf9dcb34ee0dab35ab840ff7/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4e268707d6a0a3954b0dd41f6bd7f86498b51d5a/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7872d59d029905c100bfcf04b13f95232bf846dc/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1b73dc86f2ce614cdca4bdbda739ee55635799de/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7cb4b74d142a3a6c50fc34dd8060fe9be78aeb6f/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3462fd529eea7750cb28214226ac2e376a9126b2/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/690a4524c76ce5fb8a6f6e987572cf48c3768155/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7811f9ed8e32d337c0adc53689e13084f01f99e3/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/37f9fa7f48db6b16059945a72a520fddeb5ef897/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cd55d7333f87590254e1ecf1593640ca4c406e98/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d24d6a006bca37a50d66d7c2eb3f64ceafa30449/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4766104dec65aa239138013a72c1e685fefbd1a1/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a8b357c4c7a0c4966d0cc4c447de6899a2997f0a/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c4174ceab758699f53856d69f81ee48ab967b40f/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/8dabd38ac486424d9a77bc586f9df224c111ecfe/
      xtensa |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/e2f89b0587fb527286081bcdb6a780e57f51c2fb/
         sh4 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/bc763a1e02bf8c9865631df7df387b18dacbdd59/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/4c0936a95480560a99b2f43749393fbac58b0236/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/3eb94dfc2b7ef1e742297da95666592cd660c125/
      x86_64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/c3b9a3c4b0029a385b95b37c8db6730f0496ec1b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/9647365e8b47b239deac905cf6b6d0db841e75b7/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/64b5c58168c28be4b0e2e3de47399e13377b62ac/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1d3c49cf03b97a589a695a51eb6c8d00cddd234f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2789e3a393581feb139ae8e2286d23eec486e2fd/
     sparc64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/a2f407c1361ac5c24af122445e84645e9aee309d/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/7b444c8a2271f2724c07c7f4c6def8f0f5b94ae1/
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/6abef6438b72df7820435b158a9266f9f5dd96a2/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3e468ca4c056ada632a8a206c10becc76199f290/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/75669d18c1b1277d46eb0746405d31ae08010895/
      x86_64 |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/d42f2a32113c853df09662a67538db74d15a4426/
         arm |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/26120738bd7df32df78d35a68a371249a0d21a93/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/b02531c2b28186f098345de5ee80557b3b7f0304/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/3460060aa62c3846a844626b251419816cc0af91/
      x86_64 |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/1afc5459d57611a59e2ecb869c9e155868887751/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/fa2fb1f6a51cdfc94920f918fbdb92d46a764656/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ce8554e0285fec9def13f866f0bb5ef036d87d78/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/0aa545086d5f00a895d89f9f745532f432cdc236/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/1d1841b7573b70fe7bb591e03042a7cf8974b037/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/6824a8eac6e125f43c337edc11c0aa567008e4e2/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/8e1e3d91c5586d78ad0e4cb3d1488b771d568d97/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/3f920b3ebff4500dbabd3f747d86a6d823851024/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/df68df8da9b4adffe041a1ff522ce4f4c679a7b1/
      x86_64 |                  omniorb-4.2.0 | NOK | http://autobuild.buildroot.net/results/25911cc3c711b212bf166c4dd58036b71b669c63/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/0328f425ae9c0f99ce95074106b4c2f9b19ef48f/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d5ebb153bfa9ee9e42cebf2f2f8f963d77c6ae04/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2c8baf6910d7ac2e3c92efa62cc3b9d3737e1fb5/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/428a535cec4a93e1617135e2ce08969e7bd6dab0/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/252a66e19e3442784cd1bd2cb0ce865adcad4e70/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/ceecd9a522948ded0ad2a611faac99263929b6ed/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1b2784e6a3872bec375dce3d715e4380103b2383/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5e9ca64d3e529cc613914ed5e5ca410088099aee/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ab612e58986fd0d56c6a5415f308a29cced67a5b/
      xtensa |                 qt5tools-5.5.1 | NOK | http://autobuild.buildroot.net/results/4eee2a7cee8fce63b0419668da8bd55b3cfd00af/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/31e4a17255b11b8ce5afd5debe5b57e6061bd7c8/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/3df4b67f45117736e8ee16de5edfc0e21a398a3d/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/31c7f4e5b7f4273ec75585146b39dd43ae8dc8a9/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/4f2d77ca40a96fe71540383d1c90f86de7f1fa00/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/60d58a86e89a03d2aca525159a79edba20771bac/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/02e78cd14f8ebdd587c14a3074c0611f3bd440b7/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/ac1d09f7bcbeded5b51ed23f71507013141c103c/
       nios2 |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/b088567761a08bb405325b7a90a0e018f0525238/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/c7b9a31e2d8a772763ea690774ef01a6c885a103/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/af774aa438e4f7d511a480506a09a0476870bdd0/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/eadf50cf0ddc03457d767629ce24ea108dbf6110/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b5db13927768bf992852a6f7d384cdebf5825902/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/90b3902b7467734dd52885a3f9b5504b472a5a7c/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/08986f761d050d62ee1fb8b476f04a42886046f3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/174d6a69bc916d5bbecb8319a7a919d27acadaa0/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/de6df3634ab8e54a00cc9fac26bce0b3d0ec3527/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ee027978b0d0958789f4a91dcb1f91be1cbfb9d5/
      x86_64 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/2cff9c860061a3b8174531b846f278d4882412b0/
       nios2 |                      znc-1.6.3 | NOK | http://autobuild.buildroot.net/results/e9126041825d638d72c59cfa032c56899cdae861/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/4020ea5d4ba46257e2dcfd7025f70c834dca5bbf/


-- 
http://autobuild.buildroot.net
