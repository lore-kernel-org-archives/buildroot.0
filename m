From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 May 2017 08:28:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-02
Message-ID: <20170503062809.3A05D20411@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-02
================================

      successes : 182
       failures : 78 
       timeouts : 0  
          TOTAL : 260

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 27
                    mpv-0.25.0 | 5 
                busybox-1.26.2 | 4 
           uboot-tools-2017.03 | 4 
atest-895b0183a89c15f5e2305... | 3 
                protobuf-3.2.0 | 3 
             lttng-tools-2.9.4 | 2 
                      qt-4.8.7 | 2 
                    radvd-2.12 | 2 
toolchain-external-codesour... | 2 
               acpica-20170303 | 1 
                  arp-scan-1.9 | 1 
                 binutils-2.27 | 1 
                      bmon-4.0 | 1 
                  boost-1.63.0 | 1 
                    gdb-7.11.1 | 1 
              keepalived-1.3.5 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
                 libqmi-1.18.0 | 1 
                 lvm2-2.02.170 | 1 
          motion-release-4.0.1 | 1 
                    mpir-3.0.0 | 1 
                  ntp-4.2.8p10 | 1 
                 opencv3-3.2.0 | 1 
               pulseview-0.3.0 | 1 
                 qt5base-5.8.0 | 1 
             qt5location-5.6.2 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
              strongswan-5.4.0 | 1 
                tinyxml2-4.0.1 | 1 
toolchain-external-codesour... | 1 
                 wiringpi-2.44 | 1 


Detail of failures
===================

         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/a791c1189dee5bc7877c65781ff10683c21ea4e1 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/7771b859a8a6735d9b15287f0ba80aa1012e521d |     
         arc | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/f344bbc94344107ef2f0337a4d8f211563d5a3bf |     
microblazeel | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/b05ef59f1fd20800da2f407f64c369b9b5252328 |     
microblazeel | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/35b4a1e2a47f4e169e286fa8d25606821a88cc58 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/5dcb4d40e545268fea9cb60c7e78bf88ae8adcec | ORPH
         arm |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/cec44d06df211026b1f1c9d5895ed5fc0f127c82 |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/df196da6bfe7dc3643d7d1b6991d40734378f1b1 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/0533b10aed8faf2ecf763157709aa0f672e39a14 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6d8460ed230ab9ba70951918f0e8c1f38ac04c7f | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5e84445616b8a1a5434ccf1e80975a7c770aeaef | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/f2a15353d3469192b5f415de837c45752073b77d | ORPH
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/120a88891d2b79b692c83484055e87aa7743d986 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a23526817d1116263b4b3a45a732ccb88648a674 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3362ebd3d2454cfb03109a00d2b10b1ca76183ba | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6ea11fe967a54122038dd290e6afc87bed5b5760 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2ff93bcbadcd23664890412431fed6d8661a7e83 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/80932e669ca103570a876f9daac13007aae1dda2 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c7fa99f80ded2c9aacbc2e3a50885b984d0ec3b5 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/efee8c5f0a9113462e0549f0bded6a5ec6ffd26d | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6cb01585567920e56f2e95e6a3769aa76175f349 | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/11200b62f8aaec1a7fa5a71d4dd18a7c8225e911 | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/38aba025f98e87542884065f1d4fca7c43ab99c8 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/71c04bf35156c009e77250093aa88093c8abf6bb | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4fa9aeb51c94ece999f01a22608e2673cf6e957b | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0f2c774a8724bcd3c62816f9a357c03b9669fcb5 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7552299524991939dba9f5eef70b56b16ffcd590 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/580635abb85866152f993f8aa05111c909aa1ee3 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8b071f0de61e5f3ab8e272119c5141467d81280b | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8ec03c274278a311fd1c7589e46640068431f808 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4d36bc1961604883432b7a7155727be03002c61a | ORPH
   powerpc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6cc81fd4b480f16da268b87c5618a7cfd43a1883 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/30e04e0b8be2ea256550532cba77f222d639ab77 | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/25bd467e4aa49707c79d1914b34a3f4629b5e7d0 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2201e011486be72483f4b3aa92b1a34b275be1c0 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9f3ae95deba9eb655c9ac582460b2f75c6fd38ce | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8c65614ce4f1a14ab0b1dbcb3374b9bc2f1c3351 | ORPH
        sh4a |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8e9630ea6eca68c8909150a62b0124dd586d3eca | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/43d4d292be692713bd5e4c582849cb23676a821b | ORPH
   powerpc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ec1257ae0c8de64e407b86a15261a9c566df8ae1 | ORPH
        i686 |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3371f130e9edf225d30f3437bbf80ce62bdb0a95 |     
    mips64el |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/0b97cd99f0948105c1f993bf302fb4f8c773369b |     
        i586 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/12e2e65804263c932f61a510107bd7579434b24d | ORPH
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/12d222c9d37827a166c2bbf9526a7af32357f6ae |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/8542e42431154fd803641b1c633c03df2a75ebab |     
microblazeel |                  lvm2-2.02.170 | NOK | http://autobuild.buildroot.net/results/92ce446ed8fe55271b7defbf4e4b1f548e527143 | ORPH
         arc |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/78a4bf9873ca161d0edf843ab6b7a7248a837c47 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/858777af90cd03865acf15301e4e074c6ca4fb84 |     
     sparc64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/49f1bcce888e62851cdd82fc670d099240327899 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/0ca0a988eb29dd66348c80527b84296e0129989e |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/459605d634d07015d262a3cc7a7413756570ed79 |     
        m68k |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/bd565b3e052a8cc0dd3df51be0f2c4b2515e3b04 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/06ed9d0ed25e4c4c524cb5b1b84ff46ed80ff18f |     
        mips |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/c58d5840da66a8be5e157a0bd24a5feaff157c92 | ORPH
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/e8832302cd4f30cec076f67965f6aacbaca5b955 |     
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/760bf62f4864900440e5bcd47a83af4a9d84cc88 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/db01dc8ac9dc130b95c6a3f7e4f08272e9c1558b | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c9e84f66d95ab27b19a92575fe4c085b8365ca4e | ORPH
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/f8ec1bc6dc1a547b096132be3607605c45145fea |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f8332c0adcc0732550b3e8812e6855c76c4e5e7 | ORPH
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/33d4efb8662e9ad340eebb856e447e7ed231e3a6 | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/25a8429e582fee96fd4f084dc23d54f2a1806f5a |     
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/a200fcb2e8f5606faac7cf895cf7e013288dd460 |     
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/9054e0f3ebc82c3c1d3022dfe7e84403b6f0132b | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bac26d62299266b9ac6bea732d172b6211943e72 |     
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/9e187e5132357ac4df82e7deaefcdb29b317bf54 | ORPH
         arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/392f94c0d3adf411745e97ca2e471432621a753a | ORPH
        i586 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/6b928e2a6a35bfb21c792fca083bc4cbdaef9304 |     
         arm |                 tinyxml2-4.0.1 | NOK | http://autobuild.buildroot.net/results/12724efa82be666e21097d9632e5ccef8cf979dc |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/09049855f8636aae9561b8fa261779f151143582 | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8d4900e943818cb76a282c5f90f53bbde35afe2e | ORPH
       nios2 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e3e97847afa97c35804d6cbb5c2486119e1a3b00 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6d52ac8bb71012aea6fc4c679691b31a3366728b | ORPH
      mipsel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9a44bf8c5f94fffbd24cb92bf552ada7192d3263 | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/f1865bde73843d6d6e827a8b97280640998f7502 | ORPH
        mips |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/01e37cc985058d5e0f2fe55c10c1ec92809dffec | ORPH
         arc |                  wiringpi-2.44 | NOK | http://autobuild.buildroot.net/results/e5f9b0a7141c8bd1e6db7439a93adf3cc33c43ea |     

-- 
http://autobuild.buildroot.net
