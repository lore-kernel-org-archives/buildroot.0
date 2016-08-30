From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Aug 2016 08:30:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-29
Message-ID: <20160830063045.7E70C101B4D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-29
================================

      successes : 186
       failures : 41 
       timeouts : 1  
          TOTAL : 228

Classification of failures by reason
====================================

                  fio-fio-2.13 | 3 
                 libraw-0.17.1 | 3 
                    mpfr-3.1.4 | 3 
                     vlc-2.2.4 | 3 
              libarchive-3.2.1 | 2 
                 lvm2-2.02.162 | 2 
                    urg-0.8.18 | 2 
                acpitool-0.5.1 | 1 
               binutils-2.25.1 | 1 
                    gdb-7.10.1 | 1 
                   glog-v0.3.4 | 1 
                  guile-2.0.11 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
          janus-gateway-v0.1.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
                libaio-0.3.110 | 1 
                  libcdio-0.93 | 1 
               libepoxy-v1.3.1 | 1 
                    libiio-0.7 | 1 
make[2]: *** wait: No child... | 1 
                oprofile-1.1.0 | 1 
           python-psutil-4.3.0 | 1 
                      qt-4.8.7 | 1 
               qt5base-5.6.1-1 | 1 
           qt5location-5.6.1-1 | 1 
             rabbitmq-c-v0.8.0 | 1 
sconeserver-d659468cd164e6a... | 1 
                     tftpd-5.2 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/a5a3540e597a8cbf1fdd4841c26200adba745312
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/82f2ed1099c2ea5ce79b6e62674d9f538ed09877
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/794c010ead6252eabd665fad979ac4580df39dcd
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/6d5ec80658aabb8e2ebbb5a35f13525007443614
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/989bbf2f3c9c995cc1d371ba8f76f9a4ae5da682
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/173e308ccb165477507b7f7ed5edcecd715dadd8
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/b8763e792fba24d4387902bed1305fb59c8f978b
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/424ab900d1a33a6fcb245b6e8559df786ad070fe
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/0863de77cf19580440bd42faa5646ee1e50af562
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2c3cf6cbdc5e954e5768bff836a02cfb0f3528cf
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/c98f3e75234ee9dc113245f58d045970a54d30df
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/c7952a65583bb22a410da44e1f7204dccf9c6d6e
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/93bcf5c1df4010f77f15a96d63599bca6a695178
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/8c86402bd14a0af1b82e6e07c06531a856dd37c6
        m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/098cd87382b52dafe21a4532fdff378c8b06b9c9
        i686 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/d330161a0b45028336f1b458673e05b2f03a58c3
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/e6bb688cf88a0bd09f276d3a85972a2c4b57bfa7
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/30ebfd4d19c26094af8d5f1f7204d6ed88f24de3
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/e76785fff22b72ad15a4fa963dd0671df742ba82
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/973f94db0a89aeb3c3c39c897639b3c8daf141d9
      x86_64 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/4ca3ae3fb01adc1c11ccaaa3594f05b98f17c3b2
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2551c8fa7d93855105a9039c1e4ec40a801bc5fa
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/d7fb325181d1727842f98eaacd873c145397f799
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ec1c2866231971d62f157bd7ab34bb9491e21186
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/47c855448a73745caea8046e811c3064c7269432
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/d3906e1a4cfb486acddd07294077748873c91f85
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/c9f42a167938159963efb972aefa7c733b0d5455
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/fe86c2546538cdfa06524957d1a5fe1e97619c32
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/32e3d838d2f5e0e29dec2e22b2b26135f71a61b1
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/410a0c50ee01da7e35a0821481bb5f4c411fc172
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/139ede6159999d991b3c28afdd00c1b56b1e1a8f
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/5b198afb6357f32f4871e6012496386d344125b5
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/d06f92da162592dda974affd4e067e04d9164e5c
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d022ce25eb0bf9c8c2d1bd6b4c467f571e0da795
         arm | sconeserver-d659468cd164e6a... | NOK | http://autobuild.buildroot.net/results/8e9b0e0247ee9c8f8ac0735b332518c29ce93d1f
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/349bc8668614b0f2c970ff33f25216e708ecdb46
        i586 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/cd76699188d2ee99b5f2d32b6a797de0d832a192
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/d0cd11163753db69a14c02e941dbda40e5f98bba
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/fd37e49f5ee63560cebdee033d1d4b0a5db2fff3
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b41c494ffa6811f5049e9c772481963570b76051
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/76419e04bb5a262f684f30e8432326aab23ee489
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/f6c9f23dc2413b8a54a07bd8840c7b41ed853783

-- 
http://autobuild.buildroot.net
