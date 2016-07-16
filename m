From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-15
Message-ID: <20160716063032.B8CAB101FDD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-15
===============================

        success : 192
       failures : 232
       timeouts : 0  
          TOTAL : 424

Classification of failures by reason
====================================

              host-cmake-3.6.0 | 116
               acpica-20160527 | 13
openblas-f04af36ad0e85b64f1... | 6 
                   dante-1.4.1 | 5 
              lirc-tools-0.9.4 | 5 
                  libsepol-2.5 | 5 
      host-uboot-tools-2016.07 | 5 
               libcap-ng-0.7.7 | 4 
                   bdwgc-7.4.2 | 4 
           uboot-tools-2016.07 | 3 
           argp-standalone-1.3 | 3 
                alsa-lib-1.1.1 | 3 
                 clapack-3.2.1 | 3 
                flannel-v0.5.5 | 2 
docker-containerd-1b3a81545... | 2 
                    quota-4.01 | 2 
                openssl-1.0.2h | 2 
               binutils-2.25.1 | 2 
                   assimp-v3.2 | 2 
             bluez_utils-4.101 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                 lvm2-2.02.159 | 2 
              libarchive-3.2.1 | 2 
                 gadgetfs-test | 2 
               libdvdnav-5.0.3 | 1 
               wireshark-2.0.4 | 1 
               qt5base-5.6.1-1 | 1 
                     php-7.0.8 | 1 
                  snmppp-3.3.5 | 1 
             libgpg-error-1.23 | 1 
            lttng-libust-2.7.1 | 1 
                collectd-5.5.1 | 1 
                  cairo-1.14.6 | 1 
                   taskd-1.1.0 | 1 
kodi-visualisation-waveforh... | 1 
                 php-zmq-1.1.3 | 1 
                    mpv-0.18.0 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                    libiio-0.7 | 1 
                  ffmpeg-2.8.7 | 1 
               tcpreplay-4.1.1 | 1 
                 ipkg-0.99.163 | 1 
                   ncurses-5.9 | 1 
           libfastjson-v0.99.2 | 1 
                 opencv3-3.1.0 | 1 
                   fwup-v0.8.0 | 1 
                 xenomai-2.6.4 | 1 
              gnuradio-3.7.9.1 | 1 
                  connman-1.32 | 1 
                    lftp-4.7.2 | 1 
               netplug-1.2.9.2 | 1 
                directfb-1.7.7 | 1 
                 jack2-v1.9.10 | 1 
           linux-zigbee-v0.3.1 | 1 
           libmemcached-1.0.18 | 1 
                  samba4-4.4.5 | 1 
               target-finalize | 1 
               linux-pam-1.2.1 | 1 
                 opencv-2.4.13 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/f671f30151caeec0b3a1226787718252a96ba2f1/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/7971aa79c9226a4320e40478ac3c5dcb2da87c53/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/d306693d774e5c9cd938fa5532ba2be03731d76c/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/07e80239093a8508fdaae5cd7e5b8040f2d73429/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/107fba97a03b2dde34a26f6f293c5981375c495e/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/983d1ca957f8ee8ba15f7f0b005066f89299d6c0/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/77092f69d62396bf23c7dce2cf1d8e7c96cdcf01/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/9a6fc153335fd041f12b821a1dd7cdfbe6b2d72e/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/645edcdacf609835f06ce92d27df14fc268f3c01/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/a8fbdb590a2a669bc4e0c8056c3408ee108a7402/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/7a9b7b8146e67c3bd3ef5862a01573aee1f03fdc/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/825a44b9c137939f03dddd5a170dbef320a8c40b/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/f948b602384bdd35eb93be979d94754995a86e32/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/cc7c7c92781a18a5459c4b4b0bae80683d10d514/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/23c71f99dd0bb610c0b8a5bc3592ca532be92138/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/22f1517945955a53945f7b709d7ec84fa61dd3ef/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b0dd6158752d00e4a99db16975382d0e409db31a/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/083d4280d3c50598ddddba5350844ebf3a35a3c1/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/eb4f9e409d14b6868da4aaa304bbb80b41045f47/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a3912668da860dbaf9c73b4ef912baf6fdb430f9/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/513260fd3ccb057ab74b5fd4ec1c0491b0a9068c/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/72952c5d80090d8742f6d7e46fba18ff40179ab2/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/eea45eb620d5c1afd13912da38e31fc6e28fc278/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/67f42c92f053d7c8169c4d4465209d3b0d624229/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/412ecb04b4c8331c5a69f99f9ad5e8dbf57117f5/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/d7d911c565a3610c93b6658f0c67a485e530015e/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/48bb42b73e75ec48bf84eefb1a825393496cb484/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c2bb153871df1b7e3c901f97b23fd9efedce9a38/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/84207dabf8cb4178d892f0c26c52915210fbe692/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/6f348c6f73118ecada7f548d14fe36b9b3e5cc1b/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/0a5dc2fee3a09c60b26382c7ff68517ca17857dc/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/4e10d30793b2a90c9d4e211e6fbca19c072b3edf/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/488c6070a763b4d5132e36ae841d94a0897115ca/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/5ae20203ac376bb1a945722f8f804d97840f01bb/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a488533db2fdcbaaae7e0d61757c4c1aa7db12fc/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/8c839c33fee3678682da63f8ae2ff719e5db5110/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/68fd449cf4920913f777486930bb94fd9c9864ff/
        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ef523937a8251ef3aaea9aba034a1468c410573f/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b88df917e091a2c7d053d86e27bd353b897f9177/
         sh4 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/0660ad3e853e24bf204858d138012307a1d8dedb/
microblazeel |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b6a52d4eeaf955ffa2f1c73267a6b3b5d0cbd107/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/848f452d6e3ca648e6c9defbf6aa3f92bb20213a/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/67770716b68d280a582b5b20d31fa0e38258ec12/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6b306fc4a7a764c7d46dbbc2b7b18a8cae43ee73/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ee3397f5b002a35e26012e06d1284d6ba69b14be/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ac240168974fcbe61d9535ad57cbe6dc1120cbd2/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f7c437957ab70ee437ec078fd5fa2dd37a2ee27b/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/b7cc42d51c88335955fc1482af6a5d6bed546628/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/634c80926378ec932503b4cd40586e759345224b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1696f33e923df40aa7d77a2281cf0f586c21dda2/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/348cecff629ab0dc091e7908d1f705e40d170a31/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/124c31549b9c557bce109036283a4b89f86870d2/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5da05a4d3bbc461073ca387923ceb592ee5b770a/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/437a026f36ab85e9f74ed98634b1237d1a64e4c1/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0b579ba3792df345a492f67a3cacf9c2437bc0b4/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/61b4092d978b341482b76e532ff3020e21557da2/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a2bfd7dd095db8d406104e2654c8fe45038cd9fa/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/640b7b5bf382501f419ebbcbe45e7dd7bffcb2a5/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0dde2653d18233b8695ca6f4c51e475952754d32/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8a76f607354389cbc4078bd030c7e45a895c89f2/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/688daa64fe140b4d32be8f3a8ff585f8a2585293/
microblazeel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f09d1fcaa044749d407a431ce9bbf293b0d76bc6/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/cd1747e8a4cb9e0bfd642be257ce222990900392/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/89739b3a8e9a4725d21deb06670090d358a42526/
        i586 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9536a8a3e442b6a602156f2fc40d65a8a247162e/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2ef4ade33b1ac36e904bcbf884597b1bbe851195/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/05c89e578e626e5324ced3b33196baf2568aa3a9/
       sparc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/aa2a894b50f33aa71e5c7956bcf52a2c4e3a3980/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a8e64084491cfbb29c6bed669dec3de8f0088eeb/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9859ead7b288fe6aa627dfe79e5c08a3f9f6b69c/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/703b5d5f4f0064025a2bdffdaa0f4c0dd3e721bf/
microblazeel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8dc4208db1e45d9dac20f061a7f24e54c6773dc3/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/20d2dc3565976665e7a95ce107177266662a9d0a/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/08ab6868ddc4982e01a35ecf62cff3d806d389cb/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8e42c4001887f762bb21e68f743f9c12c1010a14/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/04e381bf135f1408dd0c9d7a4b844367ad15fa9a/
       sparc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0657d9912bf4ffe271f4d8a2121776a45567afb9/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5657792502947caf734021f0fdad681289184300/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5630524d81293c22d37769348378a54f5641ae36/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/06018f5147814bb71f1ea99efef12862c5763d86/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/98f7f9505aa679e2ac153413e1359a64baf6a41d/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6574f9f920f8263eb3e595240d1451c90d3ae89e/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b7e27cd530e58ace597e794ea7e911018c03aaf8/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e303492eb408e706fa72c34ddc62ba0ce743c3fa/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2b6a4db814e77af033f049c3e06d0e436a4f6274/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e19ea2b6db64779666469c344502608521a20536/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4b586b15ed46cc982f4a81d2de85a22ead2e6ad7/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/aebe5d94565910e8e7ee6902aa4ee65f601855d9/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ef497052d84a59a39bc9676f05cb24b152ce0bfa/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8c3ee310c5d7279e1534c7302bdab44912c2901c/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/27c3b225c9dd45bd852cadfe0d4aeb83d5d72788/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/1a6da0a9fb1453f25abceec49b62c3d35e256904/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/bcd8af3142ecf0019f48a37bc9b1d4cea727f5e4/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5b15096bfe56eba057035b1436ac79945508a038/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/adb8c2731415756f44737b860cca4611f65a270e/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/278866c8932057b5d303e930f95b074b59bef4e3/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0b95ae1e6ebe62ca1f87dab803034c9148a854a8/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/1313a4b497e9f6baef665807abedc2277902e149/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b642634dbf53d7ac76603670265ec5b9cf940a76/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6d40f836a29cbb48467d78775f95f52aabcc3037/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/48c8cd58bffdb6acdb53c7d48c9017472653b2aa/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/95c9f78d3acba60f879a61d9bd35da93adbe7da5/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a570e45a9b7cbaf9b1dc5fdf395f301f7d76affd/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6ff179ba1127be9a1f39ed87faa8b1e2690fae13/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/be670ccd266dec049d82bf7635665df72cd560f6/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5176403bee907271494db3c0a60a8e23b267f71a/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/025dac56b85711fd67490d9be3b719f2ad7a7525/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d18b54d5612cf0b8ff09c74afc45ec6b385e380a/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9cb914f2c552fd5cff3dedd73b2d3dbd190161c2/
        i586 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2dd198e505ef2dcd23a0f4a7e0582d6b751030b1/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/18abe457f78233c58c6a85969c8803d04570c949/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/1256fbcfb630c75770e8af93c0e5ce4cc68553fa/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/58475d76405311101a64c67169aa17e9d74d872f/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/df6bcd272e001bfe5d26341bb62d56045392fe79/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f2c3f3d53d50d468ede48bda1ab3fc90bedf72f2/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/64286fa6e2ba52cd6588133d1c79669ef455dcd3/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/dea0d765790044003a48926d8f62f0bf78e7c8db/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f2d9ee61a4fe394a9ec1bf4533c7402a05ac7944/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/685526086dd4f2dd7be9f62eb204d7e9b10b485e/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5b4a3201681bb0f8025b757e3d872233a11fb366/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f86e64fb9dc48d1d20c9d2483f5437ad1e938e83/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5619adc4a91971025575248e93f85eb6c49b2558/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f3cc72aa0afeaea5bd33192ecf9239cc1bd4f8d1/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e5873daad4fefaac93833c09e1b1b3598ef43bb2/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/15ef788fa5de411890da4bd5eabc6996401d9b3b/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4b1e910f3f1f6266cbe4586387c3e1ea4600cce6/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ce090c4add58afe249dac67db430be780eadd94d/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8af0cb4253b1acbf4cb144c69063b0c7647d933a/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ec5bcb12af7ae999e48db840c6c1e8a3af845f9c/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/410fadbf85e0fa2be0ae6ca01d5cfa1536cff391/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/eef7dbe8916ccfa1e6f6e1a581d765d4cc6178c6/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/25fa95ac044e3441999f7ae74914f8ec4230fb6a/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b5707bf21882cffa700d69063b1c077b245eb64b/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/59a125ede1ffe5f4ec9a649f74bb049448cb043c/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a156ee4498c3f1b1ba68c7cafc867b11ca68fd4d/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/bd86bb1bc5e90bda185d62b13ce8a2f86c36b716/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/7449f4ae9909e2c6e30796f16cd536357dce4e1a/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c688c45262cb195499fbcc7896dad12f0d3736d1/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4f237e8eec60e04fe705da8e89c6de8354e8c361/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a9b0d424c5e0529c9d51da83366640aab919ec12/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2d2c3bae11e310f1370916e164568abd57d1dff1/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/17dc8ca7a56dd811c86e8ee101ac2d295559ece0/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a106b2641a2a6345bc5895ebb09e6bccf1adec2c/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4c7cc66cfe2b2b31e7069698f108a4714ac8278d/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/53aaeb9f11aa92c10d00c5f03b62f110d5fc86e9/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/fba80dc9ea37c05363634aabb224c8d8b68a5a05/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e495daf4400f65d33085060fadac52993944bea4/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c7466e25c7deff3f8aed1e2f0da6d4994607b0ea/
     sparc64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/19ec754d86a72fa2dc1723354dca5316eee379c8/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4dceab61dfa85108e3ff692104c050f40c345520/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e9c785dd85cfed31519b5cad6100f265a2b2cd24/
       sparc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ee2f8f6185f50d6cef66dc5cff68abda47322678/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4e30b95d5f2f2eb935ee4928b0c00e7c67acaf25/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/37126412924fe860956da4a25a2d54bf3f6ba1e3/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/bd82912222ab2c8a51cc72df6143a071b7f4e97d/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/084ef69e41225a5ee79712ec2997d810adc669e7/
        i586 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2580c4871ca5ce0fb030877486ce2181af82025c/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/230044020eae84bfd368428b99432ca90e07b9df/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/dca9a28555401a8f1e8d310ab81f9461c382b616/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d4cd6a5678bc7b128ebcec2c95f75c759533c6ba/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/749d45219e9c3be0223d1dd50678db0c40a9d143/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/7df648ad94bb7f5fa0798fa54c6f0d83ce2bbab4/
microblazeel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/805cfe7a505a9b9970734baac8328ffa4f7aeb4d/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/84693b41371c84de6b609d8a10e8c9c0e9d824b4/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4b67387ebed4513bba079c2a64b6733fae8194a6/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2dc5e5f3fdd4b50b0c983f6455df1793a0512c45/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/8d4d51ab0e751bf250a6d64b32fbea760f2a86a7/
       nios2 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/d4b270b191a9d24bc9f0021f65f454bbb8e1f72e/
       nios2 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/4cb45eaaf557681edbb7c156acd379b463f4fc4b/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/b2d9c997032237f8438c118bf9543b5ec427bc18/
     aarch64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/245779f4d9f962d7391a2ab97db1bcf18f169c3c/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/6477d9870b77316729bf04127aae3661f7d9d0ec/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5caf7f5448410c0a74d72a9758b57710f207474f/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/37816e577e9d6eb364ee771def05496dd582163b/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9072ec08affb37624a1f1409ff8d369ae8924d6f/
         arm | kodi-visualisation-waveforh... | NOK | http://autobuild.buildroot.net/results/d97a80e6de066a7dea08b284eab24fc44b11d661/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/edbde75f2827e092862fd057929d8229b52586e0/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/abe10c70f38423a212ab27d7d27e22174eaa5aab/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/35feb43107841cef148521086553ee1177f1011a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/4735c20408e6d5ab6ac1f9be075cf951e05946f6/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/5ac107b510445912996d2914dc197fa58ba20b2e/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b87f9e6b3ea6b6f1314e2c2a26258b701a5cce24/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c6023befa89a8ba7ad8e1eb6f6a8b67d8fcdc97b/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/261cb3c10c56058e3d3969dcd224876192ddac64/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/d9e834766090092409a19a1fb950f469b7138ea9/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/402a03b0fd87ac27adf144259aeb5d4d7d08530e/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/f5c039564eb7c49ac1a3b2f663b2f618ce338610/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/39717899f0a42374006d24439230372a3f9ec560/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1838858f883f1a3e05af6c71e855752f8b10a52d/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/3aa76f43b4338f4d1ba4b62ab623f3114aac1601/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/78ba18043e9910e052890c0b3760ebe18a8b8e23/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/4eccaa9a0e3d866e6cc7bf04f208a3abedc46a7d/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/c465efa55c360cb9d239f542df2508f120eeb497/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/97611aa8c8fa01f5fb2eed1c664c5b1d1b83d173/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/65a866038749dfb96dfcf6d51fce16eb55d7f707/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/b33d1957b5d547b71ed769585d6a384922dc38f6/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/8e9d3ad1f8cd05fde62cb835c7e3b420fd69444a/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c1e16f31138750819add3e01ed2d30f26603baaa/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/601370ea3040d1610026f78027beb20dedc7dfe9/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/6010a5621ce80f2c4c97bfb0922ca1a0f2720885/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/5ed3cc07e826316c06059f4d997e018049dabfc9/
         arm |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/8f43936e7b255306c81b05abed2c91ba44776ac3/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/184c40a72a5bcffae6af8727bc0e717b2a2660d2/
         arc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/6418dc857c8d135b07a969d6b0f27b53178c355b/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/9b040ffc623588d339098c98bdcbbe77b4477865/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/25962314ec2a3693982062fb3f6670a7aeacfdeb/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5e0604547aa973318e3d3798637e57e71bbcb946/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8347e47ed5ac78843647e1099c599fbe92db6c09/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/faef3123a816eb9ac8da5fa9180c077f94804e1e/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/751025a4b62d959a4bef7080623fc9e0214dbe06/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/b2d66d5116d63819994ff686edb6b9564db23759/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ce5d39c431a3aed044e1d4b3a4f1bb5f825e48e9/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/5375b55dc5ca69732f9be7ae9bcaea522f416b7b/
       sparc |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/85c8c16448cbe6085c1d318b0ca9f53d803e7b73/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/3d58e5a4834d9a86f53aa813d0e93361862a3db8/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/77b09635ec50ace6cdc55c167724734775f12b72/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/e776cb803a6c079e2685f121e0a277407a8ab85c/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/6d7b46ec6a0871d447c7ae958f80cdf28e3956f1/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/1d524dc5e185606df9e7543ed8277e7c739ca933/
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f5b1d57bd26adaf125555b97ff1eb9faf223a293/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2f8ccc4920e7158d4c1221a10fb3af46d3ddbc14/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/dbb2ea920834c2bac8ec8187487aaca99fcc2a12/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/dcbec69098fac689ecf8d7d412aaef7f323aeefb/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b6094e84644373b08d3133940f068bbe3589b4d8/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d321da66853b56d68a2350765264ff505abd3910/
        i586 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/6cb730190967d4e9f9de65649651c4f832f7e9a1/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/10c299e519b7d6d0c6451ddd6be3a6fe2ed78ad1/
      xtensa |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/d52eeb72533619442dd85debdef09eb8288d9757/
    mips64el |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/60120cd2bbff41c2b07456ba45fb9ed414e856c3/
         arm |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/cac5dbc5d30294709aff5f0ecac42229d7c43c46/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/017deb6c59b0e3e94e46a7721d64690f433e04b8/
        i586 |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/0362328fead4d4a790897acd56519b2ff277f63a/


-- 
http://autobuild.buildroot.net
