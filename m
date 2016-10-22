From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-21
Message-ID: <20161022063033.85D29101789@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-21
================================

      successes : 159
       failures : 66 
       timeouts : 3  
          TOTAL : 228

Classification of failures by reason
====================================

                  kexec-2.0.13 | 5 
                    mpfr-3.1.5 | 4 
              python-pyqt5-5.7 | 4 
          libmicrohttpd-0.9.50 | 3 
net-tools-3f170bff115303e92... | 3 
                     xen-4.7.0 | 3 
             berkeleydb-5.3.28 | 2 
               libbluray-0.9.3 | 2 
                    mpv-0.20.0 | 2 
                  olsr-0.9.0.2 | 2 
                privoxy-3.0.26 | 2 
          sane-backends-1.0.25 | 2 
               tcpreplay-4.1.1 | 2 
          chocolate-doom-2.2.1 | 1 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                    efl-1.18.2 | 1 
                   geoip-1.6.9 | 1 
                     gpsd-3.16 | 1 
                  guile-2.0.13 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-0b04ed061003... | 1 
                    lftp-4.7.3 | 1 
                 libnss-3.27.1 | 1 
                 lvm2-2.02.166 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
                 mesa3d-12.0.3 | 1 
          motion-release-3.4.1 | 1 
                   mpd-0.19.19 | 1 
                 mplayer-1.3.0 | 1 
                     nut-2.7.2 | 1 
                 opencv-2.4.13 | 1 
                    pppd-2.4.7 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   redis-3.0.7 | 1 
                 rpcbind-0.2.3 | 1 
                    ruby-2.3.1 | 1 
                  squid-3.5.22 | 1 
                   taskd-1.1.0 | 1 
             transmission-2.92 | 1 
                     wget-1.18 | 1 
                 xenomai-2.6.4 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/abb822389669a9e2e0e3b013090abbb447d592d8
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/95f19ae3bf026a10d67eb6b0430630e1a67a98d8
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/aa6adcb00d576a9507df66641cf8c45457b356fb
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/6f6aae9d0d20eaffb0c56ce97f0f6d06568ca0c6
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/03c93c38e2b3fcfcf52130f447bb1c6ca1fd891c
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/39b433a9ee24be0ff9ed4f1544d23abd57d8874a
         arm |                     efl-1.18.2 | NOK | http://autobuild.buildroot.net/results/b3d1b8b25c83faeccdccb5b77212e635430529e8
         arm |                    geoip-1.6.9 | NOK | http://autobuild.buildroot.net/results/50934457701fe0d2c58ba01e8fba7a8bdcc254d3
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/050e36ad791d979d8a1e4e1d915ed298617323f0
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/404f97047c5eeea451a67a788834473bd9666b7d
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/71bf70e88f6f215c5594c27b44907c38bd8f4169
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/bf939477cce6a5c333ee579006b9aa4856acd604
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/4b3703cfe2b82bacd24b35374d6b553aadcb85d4
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/c1a96fdf37f4f6559b5dcac013f26133861d869b
         arm |                   kexec-2.0.13 | NOK | http://autobuild.buildroot.net/results/8a7407afcf47326aadbce0b9157442dae9558ded
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/72ddf32e38afba26941d0d9070e88c7736d34b07
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/c0a8fbf5355d09c57852c279a56d189704b1147c
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d625521a0daa76e4acd1b21f0e72224461b0d11b
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/749e5224f772a5fffa06582bb81ded0769f11931
        m68k |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/7e0440ef62015a0eca8019ffc08d09a75731172c
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/005a7e6870b8f26d383c3e70f81ad2490d05a369
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/2176d0c06c7249ebbdb67f4ad59e144cf298b8fc
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/ca8d2c3b386cfa3a067bf6c636aac6115b14740b
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/570bd2592893013353da0e119e95f34fc6ad654e
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/709416158ea761726ea0c3f1403d76d647561c42
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/fcf1760595f02fff9ce4e0305c39c3e0490e1bd7
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/b4b5bfb28debb2c98443d0c3251bdf28976c1fa0
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/f331b39b724610db32a720bb25a4c8014df8e00f
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/815cf1fd033dd19734c3c53c2306708fdc54fdac
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/8d010b219e09c41564336455f552dccbfa790ebb
        m68k |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/6cf38698a2a9a041ff375c01ae8898eace17cfb2
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/bfcea295ff511cc30eaf8c8001c07d041534f80f
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/d72bb5ccd3037a09b538cff2cbd8c12591b4aebf
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/b453125c0d34ca9927326c1262c4d6454bfe3816
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/2dd5ff4049f93fd2bd892fa1d2c1c2cb1531a07b
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/95871abfe21c819cde6591908b8ddfb446844b56
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/71dd56d87550af6ff481b1625960e603659f055c
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/47b5aa54c3547903d33449d07b4fce631642f271
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/df09ae7e60c01a8c73cbe7cbf5ab0223348c0739
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/dcb4913452334a86c0811e2613422449a32e826c
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7ba258cc43afd0802273a10d90a75cb2018b476f
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6806a05a13cbfdcef3d508a708baf8b2c0020bb6
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/4fd933e9d915cf9b761449e97e4ad68e1b9ece5c
         arm |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/fdcd509c500338d8f9d87713176eb0c0c2cb63e2
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/06a50af69ae693ae0f1ec7155fb17b96bcd39be7
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/32133b30a58ccac22dc09ef637c0d722cf98d164
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/e17c2ab70d60b69c89eefe152807552698656f35
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/cec422dec484c7b4b99946eba18885093ad96359
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/c211931b37d19dbdc36ac0c2bc723da53d170fbf
      mipsel |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/63165ad649d08ae3a8b70d4bfb7c0b76d5975d8d
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e7c602426830d61472f1e9739212514a7183f900
       nios2 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/fafeaf21193fceb08542bf468c9964ff4d7c51eb
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/fe611fe6e3c8aef197c5a238e2ec21a43c9eccc1
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8289a2f2b219e73a457439b7ef9cb9aa81fadd8c
microblazeel |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/87f909594cfd0c47922e5473c3649e3db4aa05b2
        m68k |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/a46e54a7b621c4254f12540e68f3780ef20b5381
    mips64el |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/b277495ac48f85cb04fd4c1727ab0b56d7e73e12
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/91ba95c1c957b66248ce08ae4a723cfd3676769f
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/cc04acc936953a83c89d0ccdfd306123d479f914
      mipsel |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/5e92c1d67be9abf9b4df996eeed3125eebdcd898
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/ea4a07c5313a115eff8874e2c8c3c32a970fde54
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b039fbde1c79b2e155b29a1825992323b2c24432
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/ec0f3487b559f137fa54898e6f0604127e135171
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/978efd13b782489c36c94a41175231bdbc043e80
    mips64el |                      wget-1.18 | NOK | http://autobuild.buildroot.net/results/dd00ee7647c16dbb8fdea1bc50dbf6f210c12f53
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/207e5be1a39e4fca94824ce3e0f2aab6885d7349
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/22cb37b12e1e56473fa7edd9b72ac4454e416fa2
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/678b69d1391e4a819a22e9c50293d059bfd2a6b0
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/3f78f5ac96ad69af7bf3ba3558aff839e1800c5d

-- 
http://autobuild.buildroot.net
