From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-01
Message-ID: <20160302073023.58B81101BA9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-01
===============================

        success : 182
       failures : 63 
       timeouts : 4  
          TOTAL : 249

Classification of failures by reason
====================================

           heirloom-mailx-12.5 | 6 
                     crda-3.18 | 4 
                  trinity-v1.6 | 4 
                 tn5250-0.17.4 | 3 
               valgrind-3.11.0 | 3 
       host-erlang-rebar-2.5.1 | 2 
                 libraw-0.17.1 | 2 
                   slang-2.3.0 | 2 
                       zsh-5.2 | 2 
                collectd-5.5.1 | 2 
                      qt-4.8.7 | 2 
                    ruby-2.3.0 | 2 
                    cups-2.1.2 | 2 
                     vlc-2.2.1 | 1 
 make[1]: *** [all] Terminated | 1 
          openpowerlink-V2.2.2 | 1 
                minidlna-1.1.5 | 1 
                   systemd-228 | 1 
                    php-5.6.18 | 1 
                 mesa3d-11.1.1 | 1 
                 libdrm-2.4.66 | 1 
                sqlite-3100200 | 1 
                   hostapd-2.5 | 1 
                 opencv-2.4.10 | 1 
                  psmisc-22.21 | 1 
                    sox-14.4.2 | 1 
                  gamin-0.1.10 | 1 
                     fbset-2.1 | 1 
              gst1-libav-1.6.3 | 1 
             ipsec-tools-0.8.2 | 1 
                   erlang-17.5 | 1 
make[2]: *** [code/CMakeFil... | 1 
               linknx-0.0.1.32 | 1 
              memcached-1.4.25 | 1 
          libpam-tacplus-1.3.9 | 1 
                  connman-1.31 | 1 
               wireshark-2.0.2 | 1 
                 setools-3.3.8 | 1 
                  apitrace-7.0 | 1 
                 rtptools-1.20 | 1 
               netplug-1.2.9.2 | 1 
                   mplayer-1.2 | 1 
                   nginx-1.8.1 | 1 
               pax-utils-1.1.4 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/51efa9a25afdd62ad14ac8f9a74c22cfa3a2c07e/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3c9bd6c21856e3b4cb82176c490186d98a667ec6/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/885c339058337557d8457e6fe2e371f3322deb6e/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/047e3823d078c9357a2226ffcaf12e027b9b6fdd/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0183ba8c9fccc87f9e72279c49c2fdc1a9fcb556/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2a55b999a448cbed83de8319f4f9bbdccc9ad86c/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7dc16a47e800be9ade1d7604dbec975fcfb3fd14/
         sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/dd0acb2911ad4a0fc8b9bcac74b061b2a3c70a79/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c6ccc905fb1b9fd0d0b87ad3770fea3265973310/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/18369093ac7ed7ecb34bf6680c0857b3a882c396/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9ecf9cfb0ec07aec187b7336b9d4afe9386f53d3/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/aa1b0c8a3c093e9e1cd577fe2212b4d4fbb9b2c6/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/3a9328f384fc648ae61316402a84eaffb175881b/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/62c10b3ce969cd2bc84027e84de6440ee0f4f271/
     powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/aa76e988a9a38444fab502ebe248c7773c1c1f3b/
        mips |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/98f345d8690eff7a65c639e8abbb818c9d486e33/
      x86_64 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/93fdf0ec523ab13fa4c378efa88ad9555f10f579/
         arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/0b249830ce4897eca01602ede78f7451e34eeb86/
    mips64el |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e1beb4a50ca23db5677e3b54ae6ef1ca26d94d41/
        sh4a |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/dab1629cfcb5cb33706d0c762dba57baa43299a5/
     sparc64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/f0f66c4b903a77ed9a5802d26d4b7bee40736789/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/0689e9eac7cf4367f4408da26e99f91af79fb204/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/5787805b3e1487c4f85c3a367ed88e8730078b8e/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ada870439e3170d6a3496557836bdf6e62744068/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/8264d5a3c6d1c9d7cabf6aa6be4d87aafccd4ad1/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/a5d8c3f5685563e233a4a42ea370ad4aa1bdcc37/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/76728b54fe0c6ca524bdb2eab9282715985aed4a/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/408c1e4f02f2857364e89d91f0e6d82956dfaf25/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2af0261d051c08c304a8120fb67b1e67af282c5c/
        i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/b7751594d8c21f36da539bcb5acc4d720a403afc/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/fb9dc5d0ecb40b5674c40854645915cece8910a1/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/c0a9324cccbb9ff2d509447988b8e75d5d566c75/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/756ac395494465da830b6d54c39d5b5ee2b75975/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/9bfbf96e7c6a9161aac959c8c364fcb9018f9aba/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/253c0bd330a3ae61239a545210304eb556983930/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/cbdbcf9f67a760c947e02e64a27a79bce3305ca0/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/9dc9e7d85a618e5e6fd9b892ba591fc95edd413a/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a6d571a30d79251d7d09f4e59a0a80cc607d858f/
        i686 |           openpowerlink-V2.2.2 | NOK | http://autobuild.buildroot.net/results/d09ed2885bab8e0f6ca4f933d164037e1e9723ba/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/07c0315a35089a8d3e8eb1a305dcd8bf1fb882ee/
         arc |                     php-5.6.18 | NOK | http://autobuild.buildroot.net/results/98395fef82a4dbe48980cf4d996c1cd7c8f6f29c/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/9ae1318cde3c2deab52c4bd6d7de2619b6439670/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7cfeb8d62b405e81b9a29b97316801f372b00edf/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/24cbd510c9378d5bfb65ed1d904fc0cb78ba221f/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/fa845362f5e99c58e17acf1a3d2cba2a80ed88fd/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f6b662b4bf137b31745ae2eea989564fc0446f92/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/cbded0649d19b3d45039fa48675a476245e65b20/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/74f480dca5c47feb0d0ad8f693051d1c21352bce/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/bdafa8db832b4a13b2f253ea56c40c11f71afbce/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/1dc52048254c32a24070fef1c1039cebb32e7ac1/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/f4c648031f868059659a6681ac10c48ff8ff7c52/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/4a35070e9e05faa45e0558ed66057fdf55221209/
         arm |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/4bb2adacc8b3b165c9e55c82e57a6e04501c0642/
      xtensa |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/2df73641527e70f0310992eb21a45a3beef31a3a/
      xtensa |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/83e29482cad6adef18a0e97bc8e75df302467dbb/
         arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5348e9f2520aad18c82c34c3e30b082520e111cb/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/17eddccdb20cec24d5d36cb5fc12d53c68887257/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7393df9e5366868bab016ec677f4a519ec9096f9/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/94b395bc5670ab01f29b8af5ce7b73b38ea21d0c/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/d3c0ec2adc4f2f1d9a7aa545a1f108905ad60ff2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/61d8b8aea3c028038ac33ac5fbbf0e1cfeb2a5ca/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b2d311ce5bc0493282c3757917526ecf11879155/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/29fc46bd24338301493e989d125a45febdd768e7/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/2b71e30d135e8b301bc52a67142a21fe43630e4d/
      xtensa |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/a503fe336c58f5192f899d39d3debb2f2ceaaf37/
    mips64el |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/b12aadf3016dab0941cae780fa9ee7bf9be8fcda/
       nios2 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/9ad13a5434fe4271c4ac108a9a917e950aafe147/


-- 
http://autobuild.buildroot.net
