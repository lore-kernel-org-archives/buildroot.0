From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-22
Message-ID: <20180923060010.1008B208B1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   3 |   1 |  39 |
   2018.05.x |  27 |   0 |   0 |  27 |
      master | 226 | 101 |   0 | 327 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-file-5.33 | 2 
               host-cramfs-1.1 | 1 
                host-libsodium | 1 


Detail of failures
------------------

        i686 |                host-cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/fad1553d45a8c35ba84c5c340410e99322e21c44 |     
      x86_64 |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/23f54b9c6413da6d871b6d3b5fa7f04de90b0aeb | ORPH
    mips64el |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/fb9235d41041adb9e88a0351643b23e3e8c2c386 | ORPH
        or1k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a1d35296b48aea2cdfa741ef0776f8833bd9fe8e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 37
              ptpd2-ptpd-2.3.1 | 10
 Makefile:708: target-finalize | 8 
                    brltty-5.6 | 4 
              e2fsprogs-1.44.4 | 4 
                  monkey-1.6.9 | 4 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
                   mpd-0.20.21 | 3 
                  samba4-4.9.0 | 3 
                   dante-1.4.1 | 2 
      docker-containerd-v1.1.3 | 2 
                     squid-4.2 | 2 
             util-linux-2.32.1 | 2 
               boa-0.94.14rc21 | 1 
                   botan-2.7.0 | 1 
     docker-engine-v17.05.0-ce | 1 
               findutils-4.6.0 | 1 
                  host-go-1.11 | 1 
                  mender-1.4.0 | 1 
                 mesa3d-18.2.0 | 1 
mjpg-streamer-bbf32fddfd02a... | 1 
                   netsnmp-5.8 | 1 
               nfs-utils-1.3.3 | 1 
package/glibc/glibc.mk:134:... | 1 
             perl-sys-cpu-0.52 | 1 
                    pppd-2.4.7 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/5b865fcefbaa7d964c4134c1528e8eff84ebc6fe | ORPH
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/cb1a2b20f28f6f84fac5786efc4988a0c0d5c585 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/732873f55c7ee87a8927687ce1b769b1fb7ea11c |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/3f4fa6b68978a4802440351b05fe9e8cd2cde60b |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/e9382baa47bdd27d2f5a8a28e113cccbae6542ab |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/08f32f247155fcfffec8c080fe2143a9142dad48 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/601151a0d5b947ea41ade9ea0388b833332aff3f |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a0dacaa730a1f032b0434e6842814b0ed4b71d9 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/432efb6b780fce6a7065f3c397e0db2284f0858a |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/52f99faf9ae1a6c025c2bece3d3857a0371d4c38 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/47c0a4daa9635ccfacc092a25e9e0fd87fd688d6 |     
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/c55ee0a155e22697ae6f85b2a4d3a837282b286a | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/652e2f62caaa9f943ece0d1d6bc3cd930d60e18e | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/d4872aa88437a55237f7102284174414bc4b007c | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/6139fe2df932e52b407aa4f712378a66bb5b2807 | ORPH
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/24ba40fbf1f166c1fe726d4cae5f6755515df0ac | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/3c6dd6a5d3b69c6e7df244d05805cd114bfe03fa | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/802b035a01a589e1532cabc1d3c96a11c81edf3c | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/fc4abe6dadbcecae63bb57adc0d05aa0b1333a0e | ORPH
         arm |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/00aaa88301130b130c49caaf51fedc39dc7f3151 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/9a9e4a24701c47695ac1eda65c753a68fb4bbb0a | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/e40522544d92481ac84ce9b802f9ed5094b48e47 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1d2bc6f00b4c3b6523e2e948d4b3b12675764ea3 | ORPH
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/8ba82c338a84aa8a98a3870cb703163fcae273d7 |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/97293f5ab1de6489e50abd6de23640d6842b6009 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/3c0f95c96277e0f7f4c2a59a1641340a36abae3b |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/5576d0002191119ae9d461ba348b003bd18e9481 |     
     powerpc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/c805cc7a635448c2d426940391d510405b129469 |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0464a8b27cbddee4e2d85d0d165e124cb8e17dec |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ec3030017ba11c3f70e4fa7c81f62a21be03d08f |     
 powerpc64le |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/8b6c20ba100360a3c000936b79fe71fd66dff0ec |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/9686c5347393ed322838613f632d7030e902740a |     
      x86_64 |                  mesa3d-18.2.0 | NOK | http://autobuild.buildroot.net/results/73a9b5bd59ea7f14fa5afd43de60237995373172 |     
         arm | mjpg-streamer-bbf32fddfd02a... | NOK | http://autobuild.buildroot.net/results/60f30e1de2cc3a9b28fef79ddee9300319f50d21 |     
    mips64el |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/684cd95d01a607a34af6e2c9ae97e48d5d94564d |     
      x86_64 |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/1936b81da611b1bcb638187901594f2129bd6b5e |     
        or1k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/3b095ca77a900af724fbc79d9cc20cbb9931fe15 |     
  aarch64_be |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/799bcbd332f254fbf3d3547e5e52ac9463d58bcc |     
      x86_64 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/892469e34cb2f7e8fac4a79f8c51ca8e7235aef3 |     
        i586 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/e105c4e20d03a78cacd3d91f6f2f4e826eec1370 |     
        i586 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/015db98f8935dfa712effffc8deef75fc5c5746d |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/cec135163cac010a8ae791e0670201d9b6a9d1a2 | ORPH
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/001874d280c6ff2483682360887bead540fb2c39 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/baf6eff4f50be5246fe565d47cc1d56aef9be14b |     
         arm |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/26142a10fbe8c658199d68fd4fc15127c15ede61 |     
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/27f067fc81cf5743a04e3243f84d6bb3ed152b48 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8c1d3b2cd8347da030b035b99157836f74bcf414 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1afa47f2adda9ee93f17794d324f649d0969c285 | ORPH
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/da9f425a41a605cdb8e3703392f3de00880f287e | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d5e928dc9c66563fcaaea81ab52d614a9b636644 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3e044f9a855c726c7f022eb7632a4c6904b70d13 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/013525607c44182b5014845a9f3b8a89f23b6bc4 | ORPH
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9cb2ae5639c408af9f7a4631944d70e6ffa306ec | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a05d97e65175cbc9890538fdeb713ca1ecfb7169 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/43bef105e32cc54661ded58e0e8ced31efd6c397 | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7123a39953665d4e689b6e6a65301966f72a6974 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/6c674410b7b3e4f17a6b70e91eebab89230fe1ce |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/00dea9b605dd47f4eab9ff1add35225436106aff |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/01ecd8aec41cb7f3133663043018af4b8459d5be |     
    mips64el |                   samba4-4.9.0 | NOK | http://autobuild.buildroot.net/results/049d31c63cee630a3c8e1be636504c49358eec1f |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/eb70d21eb07eb03b23ddc592a4f622da4f763c64 | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/ba2a4c66c0401e0661e1042cfb9917bfb9091d1e | ORPH
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0ab3f85dc9aaba7bdb1089b8646e2cc65329177e |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8757f195db3547eb4c9ad16ce908cc7083b624db |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/9b3bcd761aa35d9fdf4acc05258cc87e8c36fb14 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/5789e0723ffb467857da3be3498aafd2ed2831d1 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/68ca2b0f23e0304c63bdbfb885ee114e58109d93 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/19bce4d367d9959b452b2c4259399355b3219c84 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/56e88c8c98ee4e909bb4209d18a9dcad7ef549be |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/93b6b7310d859b01dd71bdc27bf7c82d3fe1dc0a |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3144784c5c0158bfd7b52ee5cf8956bbae3a2c52 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e98524386eeccd0f97befe8bcce8e32c86d2b55e |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/bc2f27c39b17ee43eea3f3202c37d820a8d10f59 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/49ed554138d8cd25e577acbd7d35e763b1f6d0ec |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5bd27acd3076769d6eb4a06e92fe97488d7460f1 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/001e7f671efc4c749f649aabd7b2bbc80cda76fd |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/0b81eef454dbe9f611ff72221d4788276751f65d |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/973c1cf47089e09d63037789861dba0b6ed55a06 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/dc3d838186a912dd1ec2130b7ae124ed67763f0b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/94ed78d2a9ff97302da325ac666f354ebbf95f57 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8795df4f101284d00f1cfd9ea0be3b4a9293b814 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/48f9b5358115717fca87bbf7dade663c02fea6fa |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/91444dfd713809d7159ac17f50cb9eb5a4aa8840 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f6ace0e454b85d995e05db715079f80d4ace5fd6 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/8180cea409a403893b232cbb911999198a68ef1c |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/152ed2c4b3e96f15ebea9a135ecda9a4ba8cd241 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/ce8efea8885b810f506fc928a084639c84ab9f46 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e7d073e20dcaccf52bddd27a72019a11f15635f3 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e55d5a43d52f3f31edde98e73a4d91022f29aeea |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/38ea3c308f06a96d6deedf580375a4323e8e1d85 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/25f5c8308c602be955d007467e7ae57c3e56eb15 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6312a9595d2ad3ff1a6e0d6f9a074817fefaca3 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/fbe35372a67be28b62c2677b3539f537c0923765 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b7d12e6a801cbc26f8b3e322834c4f00b4d327e4 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b80f8788150dd93c0a0b0a58b219417768d385f9 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d7f3d6081e127117776b3928fe59b13c8a757372 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/54fb861c17cbfeaa776a26f38fe393a23007394a |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/dd8683567616f4418fe7a150646f9deec0b837ab |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5a8ed894be378b496ae1c419a23fbfff66a78a15 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/726e32a97d6bde2c18aace9afa78e3cc02639b95 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/98c6796852d5cf059e15ef6f890cb3b75a597d1b |     


-- 
http://autobuild.buildroot.net
