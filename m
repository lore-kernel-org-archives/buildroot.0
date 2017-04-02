From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Apr 2017 08:28:37 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-01
Message-ID: <20170402062837.1E7FD2081B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-01
================================

      successes : 164
       failures : 100
       timeouts : 0  
          TOTAL : 264

Classification of failures by reason
====================================

                 dc3dd-7.2.641 | 38
                 lvm2-2.02.169 | 26
              dieharder-3.31.1 | 4 
                 xenomai-3.0.3 | 3 
                    libiio-0.9 | 2 
                libmpeg2-0.5.1 | 2 
                      qt-4.8.7 | 2 
             rabbitmq-c-v0.8.0 | 2 
         synergy-v1.8.5-stable | 2 
           uboot-tools-2017.03 | 2 
uhttpd-a8bf9c00842224edb394... | 2 
             bluez_utils-4.101 | 1 
                  boost-1.63.0 | 1 
                  cppcms-1.0.5 | 1 
                 libdrm-2.4.76 | 1 
             libmpdclient-2.10 | 1 
                   lite-0.8.10 | 1 
             lttng-tools-2.9.4 | 1 
               nfs-utils-1.3.3 | 1 
                  ntp-4.2.8p10 | 1 
                     php-7.1.3 | 1 
               pulseview-0.3.0 | 1 
           qt5multimedia-5.8.0 | 1 
                rsyslog-8.22.0 | 1 
                   systemd-233 | 1 
                 xorriso-1.4.2 | 1 


Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/fe4aafe6d792dc40bb94396e9014c8c6830aaa90 |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/ea73546c1fc431507e413cf36e7e88346100da7a |     
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/627dd4db6247f50bff1d50d3be9057fe16e3e176 | ORPH
      x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/e7e46d2b4ccb63003a8959d952d7dac517432b70 |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/2f311f2c00b3794e0f5009bda6bedd1bfb861bce |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/55d407166e69b43271583d3d37c96c9881ae6dd7 |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/21c4b46c2569abc5fcc0ba18a7a88b020b44d8eb |     
        m68k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/6b72a39ab572a69676f1fe34f911e9715f5f71e4 |     
        bfin |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/bdc663a6e216f49d3374950aaf17e5680864a0f0 |     
 powerpc64le |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a74c4a98c91655622426619b7ed711a8b4602484 |     
        mips |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/5219594c12521525f722df7e5e62fdc62e126032 |     
       nios2 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/fa12c99336a175710c642afedbc4ec29755228d6 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/5b73b0d735691c5f63ed9bc3122bc84ea21faae7 |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/b12b38d4c1008bf1f008706107797ffeeadbb979 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a7e8abf444c883de35f4d048139300e829b810bb |     
     powerpc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/d69250314e1db4c6122b8b288fa5d0798360a3a0 |     
        m68k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/b571dcd22dec79334711836520bd2f53e090e71b |     
      x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a852c9a5c6c8062ea12a8218b7d2e1cf00e5e36f |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/45df1a43114213e17cc768948a760bbb01235bba |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/80d797d1cbddf9ae864e42be66a37ff6937d9cec |     
      x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/0417d0ac5eadc436bfa4e07fb4701aa2b4fcc3fe |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/acea8695ebd7d3dbc3a3bee8f8aeb709da383ad9 |     
     powerpc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/2262c93c319f32abcf9b6943cc997ecec57f5e7f |     
    mips64el |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/32279522ea508b5781f7194efbbe559e7b407008 |     
     powerpc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/daa8754ac4a791650ab0e85e8ab7749caad21e9b |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/75f2ba792e0468cc069218c6b9f1ba42f6da5232 |     
        m68k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/e8e22d19883322dda603d936fe5280f27e1cf981 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/c88d22e3f089a14c1fddc8b1a66e119b231cb826 |     
        or1k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/54dfed66d46a73201b06c4d4497b1db80836c46e |     
      x86_64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/298641b0bb4a52fc0e054f3b9048b5243cd7c4bb |     
     sparc64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/a6e8c111eb45ec6dce8033467ade48025a4be8dc |     
        sh4a |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/e7b3868445e6bcf26827c1e8c68a8db18be014da |     
        or1k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/d0f6c9c98d54c772962f93e8311409e5e4ed4026 |     
      xtensa |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/bc698b171c2000e307c97081f759bce6ffd43874 |     
        i686 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/34c38f73ae2165ba9130f7b4166b08a53ee30b3a |     
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/12dc9c302b3acd659b64e28215734483544a1318 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/7237b22f6a7f9da61595b0bb4e773b7a81bda50c |     
     powerpc |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/244f9d7fb67e14e52cda5a91995971a12517fcfa |     
 powerpc64le |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/ab5a7385bf30c1ce12b7b1d6d11cd7afa5fb57a2 |     
        or1k |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/37f0a3d109ae05a97922678e50dc05eb916d819a |     
     sparc64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/593cbca5230d498651e8d131638235f7f03cfd0f |     
       sparc |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/a92e9a74b0966f8f0bc4080f918d5ddf4c1ec0ce |     
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/a4f6647f69ad89ff1ffe5f1331281fb7a57ade4e |     
       nios2 |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/4fa17fbfed3a676a13be57b1e6d2461838b2c39f |     
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/7158dad14b9f6268ab01afabadde9ebd9b418ed7 |     
microblazeel |                  libdrm-2.4.76 | NOK | http://autobuild.buildroot.net/results/f0205345e841d692d4d185570195fc08ecb55d3a |     
      x86_64 |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/00ffdfce0e7780a0f5a5dfadf6bfd63e51c7bbb8 |     
 powerpc64le |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/863fa72f443c45793df4837992c5c8dc65590c48 |     
 powerpc64le |              libmpdclient-2.10 | NOK | http://autobuild.buildroot.net/results/4a33d610f0edd76d60a09d05d0a730bc8e075713 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/22ef833f108d2d47dc84ef1262429b9c2fab9604 | ORPH
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/de7079b89fda1dd47e52619a644f23c4f4986b2c | ORPH
    mips64el |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/68afe541882b3878854358b6daacf9be12d03d75 | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/110e7422f8559b5b93ee3e400e48a84a071f76a0 |     
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/43b65f366c332760b2dde40bb56a1bfab72e9288 | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/f291ee565cb443ff46436770cbcc6b89b5956dea | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/87f119cf563e0b088911e671e7469fad95005c38 | ORPH
microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/47fa46428b771a63f2a39a716a8cc893897146f0 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/c46c42eac9c386715dd060a3d82a670b1ca0ece8 | ORPH
      xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/f71572e801e80aa58fe3560b84af9ba1f675d096 | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/11f8715c997623e656e30f21f5ce3b51819283d6 | ORPH
       sparc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/b22049bcb3e56a4b826d073fd5d24cf7d469c573 | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/21060312c97d8ebc51222822558b5865207928a4 | ORPH
       sparc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/dfd0f2ea91cfdea718bd63438b0c5f6e076ab4af | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/ac3267bfd36a07ebd251f4d498c4c725355791e7 | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/65c060f454cfcd393340e43c4e5663e43c8d9814 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/a846fd3d6ba17ae7c00d3b6c899b46becff44ad5 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/6bc0129830fa7e66b3df7720587a3c1735cb1ab6 | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/f9588dba130025f69e942cb8538696105d8ad3e2 | ORPH
        or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/7dffedc7eab8606509313c90830f3141ee28d0e0 | ORPH
      mipsel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/54ca9231b3ca257501208e232b2c8696fb2567a3 | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/2ef6ec4fcfd238305360d0742454b362a54fdc27 | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/5e1aa0d386e2593435f0e747baad71bd49b82722 | ORPH
      xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/4c57801ecd44ebfa832e29b01609989371959362 | ORPH
    mips64el |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/d2e69a63997dc8dc09785dd9cd1a26df00982626 | ORPH
      xtensa |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/d61b0fa23906dbd5839a0de4674a449978842100 | ORPH
         arc |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/93849fd732b1ca1be072a141f0d60c753ce03860 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/deea34f3ad4bc1090091da910d13a228f6f57ae7 | ORPH
         arm |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/b77801fa93278042125ca5cde74fec8a035d1b5c | ORPH
        or1k |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/4f17b55621bbfa485c0f436f63165c2f0b32aa70 | ORPH
        m68k |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/05b8d98f11897d2d982f5d9fbdc012cae49633f6 | ORPH
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/2c09128797168d322effaad9df521b98359430f4 | ORPH
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/8618485eccb1ccb92ef9abff6ab1f26fd2b4ede0 | ORPH
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/10fd25f2022ecadc7f4b8dfeca7ee585c8379cd9 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/674b2bb0e688b3bc46c437ddbafa382779669a09 | ORPH
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5eab0bfc350a748051a6f701226f94976d09c721 | ORPH
         arm |            qt5multimedia-5.8.0 | NOK | http://autobuild.buildroot.net/results/71312b6209fa28e0347de19b0ee6da95ba5304e2 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8b5006fa3efb32e50cac4a58cca27c2ec2757265 |     
    mips64el |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7a5876d9f79f072a646a536316f450bb4e42ddab |     
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/581be44925d8ec2a0625ea4a2274d8044c116eaf | ORPH
      mipsel |          synergy-v1.8.5-stable | NOK | http://autobuild.buildroot.net/results/611895e29faba0b35b2b27005a5142192ed63fd8 |     
    mips64el |          synergy-v1.8.5-stable | NOK | http://autobuild.buildroot.net/results/7bdd4428c1335593b04a18ce8e9705b0bc932484 |     
         arm |                    systemd-233 | NOK | http://autobuild.buildroot.net/results/4168208dd25c4385dc958d7efa46283750decf1b |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/74370ee7bf8269e39e98547d57d2cd6b33ffbb77 | ORPH
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/8a7b81b6a8cc6d8c8005912e3db2e83b9c7f8b8f | ORPH
        sh4a | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/73d639bc830fdbd2cb08950a932ae6182622319f |     
        sh4a | uhttpd-a8bf9c00842224edb394... | NOK | http://autobuild.buildroot.net/results/01e7da7152265bca71b26e13ad0f0568e62fdeff |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/b018af5c1e453618b079d8a3797818654745f34b |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ae8abe7b2c377710d2dad1ded20b5fc0374fb7a5 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f6516f798683a5dd2021441327e6b06a73808344 |     
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/b7f05cf2a06b2477739adbb4d3f3e6da7fe0e446 |     

-- 
http://autobuild.buildroot.net
