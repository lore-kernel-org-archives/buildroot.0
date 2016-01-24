From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-23
Message-ID: <20160124073022.127051025C6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-23
===============================

        success : 210
       failures : 88 
       timeouts : 3  
          TOTAL : 301

Classification of failures by reason
====================================

                  boost-1.60.0 | 14
zbar-854a5d97059e395807091a... | 5 
        ltp-testsuite-20150903 | 5 
               valgrind-3.11.0 | 4 
iputils-c8ff6feaf0442f8efd9... | 4 
                      qt-4.8.7 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                    ruby-2.3.0 | 3 
                bind-9.10.3-P2 | 3 
                   mplayer-1.2 | 3 
             util-linux-2.27.1 | 3 
               nfs-utils-1.3.3 | 2 
                 qt5base-5.5.0 | 2 
                  stunnel-5.29 | 2 
canfestival-7740ac6fdedc23e... | 2 
                 libdrm-2.4.66 | 2 
              gst1-libav-1.6.3 | 2 
               qt5webkit-5.5.0 | 1 
             libseccomp-v2.2.0 | 1 
             irda-utils-0.9.18 | 1 
                 openal-1.17.1 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                  connman-1.31 | 1 
                 opencv-2.4.10 | 1 
                nodejs-0.10.41 | 1 
            gst-ffmpeg-0.10.13 | 1 
                iprutils-2.4.5 | 1 
                  trinity-v1.6 | 1 
 make[1]: *** [all] Terminated | 1 
                       unknown | 1 
               dvbsnoop-1.4.50 | 1 
make[2]: *** wait: No child... | 1 
                sysstat-11.2.0 | 1 
                pulseaudio-7.1 | 1 
freerdp-17834af7bb378f85a3b... | 1 
          chocolate-doom-2.2.1 | 1 
             stress-ng-0.04.16 | 1 
               libgtk2-2.24.29 | 1 
                 mesa3d-11.1.1 | 1 
               wireshark-2.0.1 | 1 
            shairport-sync-2.6 | 1 
                sqlite-3100200 | 1 
                   glog-v0.3.4 | 1 
                 dropwatch-1.4 | 1 
                 opencv3-3.0.0 | 1 
                   erlang-17.5 | 1 

Detail of failures
===================

      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/74fec4fba25193d9bc8cc02315c4a862c204f472/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/648237e085d3853549862f675f98e07421047484/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/3c7399cfbf1460afff8047347c7e0f773f9ff66f/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0a0ad056f875d44ceb40fda184a65937d997db95/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e8b170ea8ac58c1b76a5cc7952be13b4a7897e89/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/137f5de0955152dec1e58510f92ecda95536231d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0fb1e98b9f20b8aadf3ba4278a7ac6ee4c6cd18c/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a8e35e9d339d58d436f078e86587ccbaa01e5d2e/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/af0219e731b88a1d675c0069cbec004ef6ff342a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/17939e5d04512230fa671f9fd4a0ab6eb224e5f8/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ba5064d96dc56653036e58fcaf51bfbcc6c483a9/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5552dede5fb370b55fb1c81443e92fea909c0f00/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/82064f210ceeafec8d6187d22b87f573a25cd9bf/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1b6d34fcb78fafb3be40c2fd88a31048f9781073/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/87c86cfabbdb433bc9ba3734710ffad2e8a64b78/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1edda455bf57700d01efb322a193647760f916b1/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/727fe65df923314266c8b78b036b44b3de5e35d6/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a1f14542ed015d1fad5cf7956156c93120adf484/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/21026f88170887b7e295fce9336f132d1371b98b/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/771493f63422cded258f3f67cda46f921e4a9b20/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/fdc46374e2b7a96ccc67d02ff71e0c99e698cda6/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/d234bcd0c9b4eb77f0ad8bfe6845349c5c973365/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/6fbe96af007803acfe9deacf26399cb19e5f2b47/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/1db4d3c7ce6be7ace46ff09a99b5750388bf547f/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/0501e63cbebe4cda4012ace6f7ec5f43342be5c5/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/bedebd594c283adf39374c9a9f44432e5d6cbff7/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/bc94a48275128b314cbd355ecd721918c77410a1/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/d0683de39315142ef17f3dab901aa2e3d89a252b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/7bae7669bb41e736070f065ffc1c2b0e22c015a4/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/74949cfe038ea287385070ac9c51f14a4427a4bd/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4208540bc87593948f4c9e61e8210be23e069f33/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/120974d608cb729e3398ddd7b669aeaec15e4815/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/137f310167a3909ffc1385a339816d8accf6f282/
         arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/5584556c04077c8bd4829f31f1aad2587c3d5d4d/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e4ec70fe2892303f002ce2b8d5ec9d3bb1ba386e/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/6cfa4757e93902d317eb817aa48181b07a4c6761/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/4decdbfc0202548a5ee3fe0bb07cf847b9c00262/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/d4427f036cc05ed0fc8a3a71a9b5e4e7218a8d0b/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/9dfa781a6ebbd8af6aad650067c30a4342b83f0d/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/73db3088d6fa8f43825cdbfe657df94a0f8e3d4d/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6cc0f8c067e07deea688b9b97284601a596b898c/
        i686 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/b302c46347ed53429d580b9cad904c02c373b49e/
      x86_64 |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/0cd47d7e6a49c268b57981ae8bb9abe4c4a183c7/
    mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/1a83aa8871042a8818cf059aeaf19b800652d5ff/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/09cc267b9a40a68ff3483147fd5ef1fec3539676/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/0e34c9b1593a5486b3edb2924b849c502ebbd3b3/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/db4a0cc928ed81c67760c062a086fc31d73fd40e/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a6cc17c687c119be5b1feb70299b2fe5aff164e5/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/41b3435b8e0e14db0a6f92aeb6662382a7e490af/
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/e119b9f7fb80f6531abdc61ad4152e32a06ec24c/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/7464093c5ed8ce356c6930f56ddb50397d4bcc4a/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/720e01eee5ee12ad93e87454f5fa6dfe9361abfb/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cfdb32fc70b8a30526bdfc5ca425283253a14ed6/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/57cae2df0f65d7a12657c73cde5591dc64cd498e/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/897d1c1868b7d740de48389d0071f7312326a3c7/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/1ef50f27f6e92752a88b80236857203f0d8293bb/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/af0be68477a9958de67cf16088e2fceded6ecaff/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/314fb8da3ca87984e9240d67ff233e2f999ae89e/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/5d84943d22aab8dffe961d91fd726701345bf522/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/609df034459a5f52e3e8a1b411fedacb4fec9754/
         arm |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/879260f0efc80c2c9061d89d3e99ad107083f72a/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9ba13de1ac573e377cecdc15697d75a81721bc1d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5f1a6ad3962017bba629d9a1c048151eed5eb886/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e9d35a0378cefc3e8dd8765434454bf1e18c0628/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/b47f9376fcce1538ee1a0be790f68419c5cc8913/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/16379c23b1e7029f668483fbff088749c774fe02/
         arm |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/f361174b217e1ae56c189b7554ee898e55561986/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7e693fd5ad38b15d93227358088ee10998cfedcf/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d837e55cedd27dc6764812150611e3e8927a3fc4/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8ba781ee58c25d88eeea564214da64a70743f60f/
    mips64el |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/8d9e37e707293c5ec4ec4f7a8deac1b48c661528/
        bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/d93e6454c50256d2e1610872a019719d6c9ee01f/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/448094ace5637534da057c4f5419fc46adb3764c/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/40599d56f65946e76b8936e6b06bddf0b5a77ee7/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/29e341f9f0ba63bde00a742bbf1af763948664ee/
        i686 |                 sysstat-11.2.0 | NOK | http://autobuild.buildroot.net/results/df1b1d72fb4bcdb9141844d6b794c99725d6f345/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6345557fe43318765665f92c1729efaa916d8990/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/aacc40ba0ec9821168aaccc336d20effed0c4ed2/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/c1103e2288ba52ff6b53e21f70c9148fde5aa283/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/eb5ce5828ec79724b680c4badd8cbea65d2a5db4/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/9bcff220a202cfc20a6653d8da0a192d24e90a3c/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3047e512e902259ff5cd6df7175a628b6ccee682/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1740940c9cba5a72cbb34caebcad8e68c2f7749b/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bcafde0720117505592ca9a3afd97306cc6316c3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c7f60a4b22a8e9e6ea6ae6898a3c8872b237ec88/
      mipsel |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/9af25806f6bfe589944dfb5ab5b4d498fc73feac/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/041c63553639ba86650daf6cf8221318feb1fbd1/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/64d5fdbb7546c92413b836ae358d2efaa14a1f41/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/f03353a3250df7914343bc6472f08a2cac1c088f/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/17c028d8b4791f5a1670c2269834c83b49e59e43/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4bef829e75c4881a9b74ee41dd036ee25ed0f2a1/


-- 
http://autobuild.buildroot.net
