From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Jul 2017 08:30:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-06
Message-ID: <20170707063049.BC46721D79@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-06
================================

      successes : 166
       failures : 110
       timeouts : 7  
          TOTAL : 283

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 28
                  lshw-B.02.18 | 7 
                    efl-1.19.1 | 6 
                host-mtd-2.0.0 | 6 
                  nginx-1.12.0 | 6 
linuxptp-97c351cafd7327fd28... | 5 
make[1]: *** wait: No child... | 5 
                  cppcms-1.0.5 | 4 
                    git-2.13.0 | 4 
                       unknown | 4 
    azure-iot-sdk-c-2017-05-05 | 3 
          linux-headers-4.11.9 | 3 
make: *** wait: No child pr... | 3 
                  dnsmasq-2.76 | 2 
             host-aespipe-2.4d | 2 
                 jack2-v1.9.10 | 2 
          mediastreamer-2.14.0 | 2 
                      qt-4.8.7 | 2 
             core-dependencies | 1 
                   dante-1.4.1 | 1 
                  dbus-1.10.20 | 1 
              dieharder-3.31.1 | 1 
                flashrom-0.9.9 | 1 
                     gpsd-3.16 | 1 
         host-gettext-0.19.8.1 | 1 
           host-openssl-1.0.2l | 1 
                   httping-2.5 | 1 
                kvazaar-v1.1.0 | 1 
      libva-intel-driver-1.8.3 | 1 
        ltp-testsuite-20170516 | 1 
             lttng-tools-2.9.5 | 1 
                 mesa3d-17.1.4 | 1 
                   mp4v2-2.0.0 | 1 
       python-smbus-cffi-0.5.1 | 1 
               qt5webkit-5.8.0 | 1 
                   strace-4.17 | 1 
              swupdate-2017.04 | 1 
     toolchain-external-custom | 1 
                   trinity-1.7 | 1 
               wireshark-2.2.7 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arm |     azure-iot-sdk-c-2017-05-05 | TIM | http://autobuild.buildroot.net/results/e11ac38af350563af6741bbcd5731cc72408d3ef |     
      x86_64 |     azure-iot-sdk-c-2017-05-05 | TIM | http://autobuild.buildroot.net/results/a1297c6bffd8f73e06e7bddd0d229bef516ffc4c |     
        i686 |     azure-iot-sdk-c-2017-05-05 | TIM | http://autobuild.buildroot.net/results/55cba3c25e1a75c6a0cf83e9eddf1ab2915c2954 |     
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/14f6a19b81e84a167dbaa72cdae535096ba4ee8e |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3f8ad9d17f4136b76a2695fca29c31ed15b205ca | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8433e4d0879eccb41b2db984a8a0f7b238b835e4 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0a28eafe2d0433c6f61d17cf15d1eac2f9d04dfc | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b6f881066e78e21fe83fe5a47634ec26131ddaee | ORPH
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/f0e6423e9434ad55217ee575ba76a3b28d61a885 |     
   powerpc64 |                   dbus-1.10.20 | NOK | http://autobuild.buildroot.net/results/253c307fb66c1807ebc74eaeaf4e4e1e96a82566 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/ee668405ed234fbbd644a01d49e8d9d41d216cf6 |     
         arm |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/058586a78f50ba0aead6fad89fa21fa2b8959f69 | ORPH
         arm |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/0b75dbb59e9cee74e89f1031385ea38ac66c7bfc | ORPH
        i686 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/04136e52baf444e9c7fe046ef667550b0a43c74f |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/def40bfdb27800f880694240aff0157e9a788953 |     
      x86_64 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/905bdd04cdea16b7f2142401d922b3e3ab55e524 |     
      x86_64 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/1da4b93372f46b5f4c44af377525f50fd2931927 |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/b8d55819396ea6e90fdfacf103e16fea1b049c9d |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/ee9c0947c7f85cd4c993043fbd24d77853ab9031 |     
      x86_64 |                 flashrom-0.9.9 | NOK | http://autobuild.buildroot.net/results/69ef10ec710f418b4d10c1edb4f2ce2e49b522bf |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/ec367de23992c1bf0f56540b0687ab75843b8391 |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/5e1e9f03e52dfec0ad4881c650fe849dd2bfe3ed |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/30dba3bfd98ddd3eca1b019ed86337793d91abf5 |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/b045ef83a57e131323f4bde96baf5d67d4c09beb |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/14b882497d97a463f8b4877e4dfb60b2eba8b0f9 |     
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/6452f91c78c38c2860e2991e5f7e3471d989f275 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/9f85b3c672fab14d1024bc51a039a0fe87428e5f | ORPH
      x86_64 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/6a31e9ff3f2edc75906224c000aa0203a4c23918 | ORPH
         arm |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/29ea8bc099e2610592726ab60e03c40ae18f2870 | ORPH
         arm |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/47984ba27eaaa23aba37a5589af2abca1be93422 | ORPH
     sparc64 |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1 | ORPH
     powerpc |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/b31c16ae1deaea1bcf08c52dc0cc11193e58ece2 | ORPH
 powerpc64le |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/496a9264fbcd2a4a94233d74574f9b726bb9fe99 | ORPH
         arm |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/58fa76868e232a52bebd3d1da0050be7e5034e3f | ORPH
        i686 |            host-openssl-1.0.2l | NOK | http://autobuild.buildroot.net/results/5dcfb326d3dbcc36509555fd7541952f75da1070 | ORPH
    mips64el |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/8f2dc9c725bf68851785cc1581de0746ed21dbfd |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0f41d29d8fdf86c63073bec7f71523ba76498d25 |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1c27d40b0f6769e6f0c506c81a7c2375ab46d1b1 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/2c1fba63553afa735c5ac29d7f5de8368c794628 |     
      x86_64 |       libva-intel-driver-1.8.3 | NOK | http://autobuild.buildroot.net/results/4d579c0e9163989519eaf58a8f81605f6125bf95 |     
      xtensa |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/4e7a89569aa174b1acf142d31f21e460a932aacd | ORPH
microblazeel |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/ce61f636b3840b3e016cf59f3afb1dedf80d7f17 | ORPH
microblazeel |           linux-headers-4.11.9 | NOK | http://autobuild.buildroot.net/results/b901ee94cf32d34d2313f89f04075c466cbaae00 | ORPH
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/e3b28882112915483db00ab517179dbdf19fcc81 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/aad245229b4d0f6522dc0ccf6d0f457a9116dfaa |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/b6c416de20a21fd1393a0684813e8f13854d604e |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/fbb817de47c070fa3f7161d6441358fba07dfcfc |     
     sparc64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/9998dfca4c1710be163fd05cf36c87a92b6c4ed5 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/8e5dd1ce04042df62c84b6018b4b8a4d247b6d56 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/963c19cff2d22da32bd9d095181c10881108a886 |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/d68abf55db2a07f1b11906d9a3af12e214909434 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/954c8b90ae269c2e985544ec005e190a7536d1fa |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/08418e86cfb33af67ddffdd0c3b4005cc60c4334 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/992dd0f388ca2f5d0f11feff8c2ab7535fa276d0 |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/36c5aa1e11836f46c9b84a6d9da16c0dda852532 |     
         arm |         ltp-testsuite-20170516 | TIM | http://autobuild.buildroot.net/results/160f3ffea29d57ff78924bc9f961037d6f0988f5 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/818d8f579d8feda398ba85af9f2097a341872d55 |     
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/3e05bf4568e3d37e96eae9dce89ed8781ac6914f |     
      xtensa | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f027664f7f5a8669453f13ec629c6d7fff0b8d2d |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/abb5f0087729c10593a38dd51f494da5431ed254 |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/183ef67766d35f96df4735f6514b1bf407c514a2 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/8d723465cdafb711e5767a9f44a6eae025df3b1f |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/9ec956ec8e79ed94dca6e02143a2042bbffaa674 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/bf56c941bba7b20f506b37bd8fcc1fc40d9a62eb |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/dea8c5d3ec085e69ba6d2e66ebcc64383f3b8ebb |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/3f97f0b0e39cc167914ac1692dd7f73405d3b3b1 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/5a747f775a5837056ec6a129c4e86dad6334a33b | ORPH
         arm |                  mesa3d-17.1.4 | NOK | http://autobuild.buildroot.net/results/8d7ebc50fb9d774487b188fc83b3f6e7eed97e20 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/f1d49c212df3a3ed604ff7872421483f14be0727 |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/8c9b7142e32f26e854811837a9b9eff3dce40b5a |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/5125bf1561412017956f237701fda4613130b17c |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/69cbade5b57545fdff15a8f217562434b3561747 |     
         arm |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/6deea9283fd85f6da19c67fcc0897a901931e0ed |     
        mips |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/6a6a7ed1fd74e149a9ca0f36cc0d05048ef75d4a |     
      x86_64 |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/a638455a7582ca60db1965c3ed9b84224c77b9a5 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5ac1b2a6ca09c53392ee0ce4b855fc4062c5ee89 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dc848c511ea4979271b9f8350afab72de3a0ee3b |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7f46dff0c0a94ecabc18a1486df3db48393065c2 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/97d7ec980a88dbe0f224af2fc3c324ea6db77f92 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f48e3e41292c98b243e87ea6369fc94de15e9216 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee4d953f7cae5326c3c520254b8edabaa56b0b6f |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ccc17de30437f98f905e001de0d4171441a1a602 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2b439c41d4bbd9a5c741730ca72b9c5a72cfc46a |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a5533aeaee377eb0d11184efe8d1118fd5c65e11 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/62b6c10db2d7a417728f80f3f37fe9cb47896ad8 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3f27975f10f4050e0727256793c6875b2b7bdd16 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bac9ce9767ca855ec0eda38780e2aed157fedd31 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4aad981ff802b2392d49fd9d2f04ce66b677d8e8 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fa70b5c79d05fe096e9e366e8d106080083f59f1 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ba8437f84845b3beeb3b53110edbcff357407d44 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ed786ca43c3f580b8a25d7469138c7154da5eb18 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dabb8db5c6075f06b332c0ede29683d42ff5ee15 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7b598bd7157726d346d844813d088a3165348593 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7e9a2702e070bdda4e2ca9bfabb70e50f3e5ea58 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/14cb6335ed795f80109c359b2996cb56501c9915 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b9d36cd1d0f07fe1b1369dfde188dd2f14a3dce8 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/13813b8ff2e5f255dd25a8cbb4700508838aae08 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/39eac220c38f8ec2c883575e9b4e83cb5082e098 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/41fb648efcf7389b31db4590e6f953718901940d |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/59ed18776410f69ef902e9025b81470995aad722 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9fa00b41869434cd0f268aab1d9d2ee30e894c19 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c44a33a59823a3270fdbd5a2047524827ec4464a |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8fab7f487efcd3446299570f966478e39225e786 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/bf09f96ed9c836b712df217c57157bd0320af5ec |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/08f7342c02a93cc114fb0c6ea97c73ebfe68f07e | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2552222214fb8e5ac56334d52fd666cf582ba13a | ORPH
      x86_64 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/a09feaa5daa0fd8d8c2a70e5e5449de190ea1a84 |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/bf44e58b617d136bb47117c69df77717169e1a9e | ORPH
         arm |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/0d6ca821559480d235fa874e7010c30281301719 |     
      x86_64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/9a25da61d1b3494178030fa5237e40f1d39e26c5 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/c8f34aaaecf931e0044ef858ef587325e4c0e1c8 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4d0f2c5e080b1e0f41dc5dae3830d33833a250b3 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7c1591e1a81b7c1b615d5bc399751d43fd8f09e4 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/3f02a8b015e4af586731e46f057916b15c6cbf4f |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/06bc4a6dca73b3d435ee7c8c35d56b452cc38807 |     
      x86_64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/b549210b7105bb75a1cec3a591cc153b2ff7a815 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/156885e38b45a3f99ef5d195cf3451d20cad63fa |     

-- 
http://autobuild.buildroot.net
