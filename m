From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-10
Message-ID: <20180911060019.C5771207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   2 |   0 |  23 |
   2018.05.x |  27 |   3 |   0 |  30 |
      master | 137 |  99 |   0 | 236 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/92ae0cd1cf372dfe6ad1ff64b0711e7319d377c6 | ORPH
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/29a7f2c2916a67c1ac78c30a44a5aa3034f7086e |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 1 
                host-file-5.33 | 1 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/023ac2fb4ba71ebc6a6960a8df76147e8fbc7493 | ORPH
     powerpc |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/f3e92e20cc6c58ca3d3af4ae820dede32156fb48 | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/86facd1754afe605414543c67cf3400f4524c354 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 18
         host-e2fsprogs-1.44.4 | 13
 Makefile:708: target-finalize | 9 
              ptpd2-ptpd-2.3.1 | 8 
                   botan-2.7.0 | 5 
                     vlc-3.0.4 | 5 
                blktrace-1.1.0 | 3 
                 lvm2-2.02.180 | 3 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
              e2fsprogs-1.44.4 | 2 
              glibc-legal-info | 2 
               host-parted-3.2 | 2 
                   netsnmp-5.8 | 2 
package/python-numpy/python... | 2 
perl-crypt-openssl-random-0.15 | 2 
                beecrypt-4.2.1 | 1 
                 dc3dd-7.2.641 | 1 
                 gadgetfs-test | 1 
                host-file-5.33 | 1 
                  libssh-0.8.1 | 1 
mjpg-streamer-bbf32fddfd02a... | 1 
          motion-release-4.1.1 | 1 
package/glibc/glibc.mk:134:... | 1 
          perl-data-uuid-1.221 | 1 
                perl-dbi-1.641 | 1 
          perl-digest-md5-2.55 | 1 
            perl-net-ssh2-0.69 | 1 
       python-numpy-legal-info | 1 
                qt5base-5.11.1 | 1 
                 qt5base-5.6.3 | 1 
                rtorrent-0.9.7 | 1 
                     squid-4.2 | 1 
             util-linux-2.32.1 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b0175651b0b4e24e0745f577b52577edbfe109f1 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/1617e5371423daef89f427756608a209dcc3a41f | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/be4a5588abeb3fd4c5b4b4197018fbafa15c6ec5 | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3d703caa8608d94f0114a62f6cdeb78c4b94478d | ORPH
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/81023cda55b4a0504392132c245d3e530c3a907f |     
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/818608175d7439f06c74b7d1ed704d551ea4c393 |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/a92ff371f742099b09f96a7f020ded85c01a75a5 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/20d1a2a43b9303be0187692a93304b4bda9ccb86 |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/51f534f12ef322f58544a23f8731fac704d717c3 |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/76ef420fae5e5451ae62e16f6a0a28767a7957da |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/608c364333ca2ff475ca3363f2bfd76db12fb15f |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/52906401b6a87a050fcf3bd6b4dc36fc5f9084ab |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b264c7330a494e6edd9e5bafae13ba0d5b3a06f1 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/7a8d08b9e82e1e0d71796f71933cc65f56848601 | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/5f44c8107b48c359c3673aea70a279550bb4a6cd | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/a889d1ae73d1d51302d444e9593d9eb85c81832b | ORPH
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/3962d4d44e5c0fdfa6a1136a5b7c02be3948b1a9 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/65a5ee599bcab903531dedfe752de3d31f70ddc6 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/df85b7fbbc2b5c0bf5daa4a9a16460d3bcd5dab3 | ORPH
     aarch64 |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/9f6bff33ece0b21531105d45bd33aacc707b0029 | ORPH
         arm |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/1d816f9be6bad6e10d273dc2d0acb200233d8d4d | ORPH
         arm |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/44a0487f65b299c4654313777338d335c2612b20 | ORPH
    mips64el |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/13c056cf187b7a462f89ab415b8d193093f1efab | ORPH
  aarch64_be |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/e8bd4b8263ca5f5108a024c13664c1987f511617 | ORPH
        mips |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/6b424ba788ccd738c2afcd940075991581e860b6 | ORPH
         arc |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/cdaabe5aa2bfcf08f1909c2b9a1681b6d66f13d8 | ORPH
         arc |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/0fea50a059bd8ee027189840e818ca58b373caaf | ORPH
microblazeel |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/66a2fe176a4a75f73785956d4dc629afb5e92657 | ORPH
        mips |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/b7a0a01ec86b28112923d3856feecf609a2c87f0 | ORPH
  aarch64_be |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/dbfce497335ee144fcad1d8dbd733260dc8183c0 | ORPH
         arc |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/d6b0330f3105d18db8cc478f5fa52cb39559da24 | ORPH
      x86_64 |          host-e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/deb50520ad881bc704a5aa0d484af3d37e3d1747 | ORPH
     powerpc |                 host-file-5.33 | NOK | http://autobuild.buildroot.net/results/11a0423377ab7c5dd88fad6ccfeda976cd452b9e | ORPH
     aarch64 |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/14a10d1f95353cedaab96162bc67b962403e452f |     
    mips64el |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/3230abaf78b8df8d23310b37b4099050fdc76eb0 |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/39a786da4a912a5d5cb9928403aa24558c6fa664 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/44bb5d9498f2ec707ae557cd30179b094fad9038 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/69c2112d222ee2a8d5805a9e78a12543e2eaded3 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/b8d70939b17994a612335340c5a08d2f4ceb3c1d | ORPH
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/9e2f6ebae9b7fd773304746416a676ba52d2735c |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/3d526c23ae17f03cbd771f6ad18390567c1c5d3a |     
         arc |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/816a04e8c664f5ea1f526722c3cb3db98060fcdd |     
microblazeel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4fadbf4df0ab1a6b1e0dac7e03357cdc0a5613fa |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/a41ea2ba01453151eb9944339c92ac11ece26511 |     
        i686 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d4dbe2438d829c3c53114203e60a283cca717f7a |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/16c82c34e4e005d0c85f887ae6e06643ef72770f |     
      xtensa |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/425001dc9b0b1a6d86efc79b2423a7f7ea6c4df4 |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/151b9f8d792d25f96be1f5c2208c6398030bcac5 |     
         arm | mjpg-streamer-bbf32fddfd02a... | NOK | http://autobuild.buildroot.net/results/cf9d5cd5864333ce5da2b6029b91617a0865304e |     
         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/5152dcca58944cf732d09fba6e6c9af8a9243c75 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4dc8b53ff9f504c0a3dfc2d72c2609ad4d34559b | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/a1eb848079080ddf7cf2fc9e554cdd63ade0e9aa | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/de902e34a9bd85eed70b53559960489268bf3db3 |     
      mipsel | package/python-numpy/python... | NOK | http://autobuild.buildroot.net/results/9f18a4e62380252e53d42ef74b98b28a3fb0abe5 |     
      x86_64 | package/python-numpy/python... | NOK | http://autobuild.buildroot.net/results/06133a1e0fd0776a44ef26bf2c345555818fbe88 |     
   powerpc64 | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/8c7e632ef67c84bfc749397461b0054da9a70c73 |     
microblazeel | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/64de26723444caedc6096ee11115d2f17d5ed03d |     
    mips64el |           perl-data-uuid-1.221 | NOK | http://autobuild.buildroot.net/results/c1aeb89710c8be77523a32628c2001c20b7b980f |     
     aarch64 |                 perl-dbi-1.641 | NOK | http://autobuild.buildroot.net/results/f7d886b4f5645e6c7a607d9d6b24d7e5ebb2b05d |     
      mipsel |           perl-digest-md5-2.55 | NOK | http://autobuild.buildroot.net/results/a85f0efcc603bb35198b9f17907c725668dcf3d4 |     
      x86_64 |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/7f4ff9d42f3be975084178134bac2c85bcf0bb75 |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a660da9e969dc41fa9f83bdb8e707175d5a04aaa | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3a58c75df03442de5ea6e6ebc064290384cf9e59 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/14a19f5f0631d9bc71c50e6c94b412388561921c | ORPH
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/38a562273d5ffd296f630182b8f40431452b44d6 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/74fc692e008b63775f1b4f4e2513120795a0cfd2 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4eaa01678f8bda6d94de7dcdded598d9d681cfce | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/40838f84bdf29f69d4ccbc6744f3e6cbba11973e | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/509c7e173027ca553c3958811c3113c6d287ae51 | ORPH
         sh4 |        python-numpy-legal-info | NOK | http://autobuild.buildroot.net/results/74be4c93631f9277c6c94ecd9a2c1a52afe95400 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/5d628b83e1183674ff1637f7b40c7050411a8a94 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a7d19064056fa1ba30e5392ef514dcca4868bffc |     
        i686 |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/ad31a37798fdf8fbffbe7a4c540cf5f6d06b6d38 | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/1de48aee10fdefa402d9d5bcc9e8de39e97e2b68 | ORPH
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/a817e98ede8e74006adb901309b6e6a09a52264f |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/ccd40f78aed506f90a5ef074c36b87eabc50019c |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/5ec974954de4d0535ad3b8ad2d5a1945a1d40308 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6a2e802c975f4e2ae93764071e71a5cc4a48ae0 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/28ec16677ff4ef3fbd54ab44fba7e0a12b5e9450 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/2a8e4da5ec8b6641773de23aa8d7ed16db372eb4 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/24da1fa87aa5d8474be076003b37cdaa0cd6633e |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/40d3c7cb8f946a3af8f4a854a3f089893bd9fb89 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c064e3f3179b1a2f24a116a18e36cfd0942a5a54 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c4c93f1174835b1f5cd8b457e3e2f66ed192de39 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/0a55428a8fe5466a1c31aa4471e372362bb341b1 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/af411d9df8a3ba731dd0125192f7c8e455039e2f |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c20d2c32084e42f0e8be0709aa64cb2d6f76e80c |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/d5bf9b3e413b39c9974974ea3e6bf4fece7083e3 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9230df1e56e3586d7f0f8df6498eaf3dc441079d |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/a1db6818cefbce3050b35af68a40f90a7a7bad2f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/855b0a12210c0f87de58edc4dcf0285e56e01391 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/c1c9ac3c338610b66365e67bab6c1d223f6fc841 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/db5df6d8c7def3227ce65a21a5a9416fdb51734d |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/d6a3b43211eb740bdebbb339668b854d26e878b7 |     
   powerpc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/371f4f017f4a5af0ac6d6a8b1b8276858ad47f75 |     
        or1k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/771e88e7fb06714dd4b7246f82b95dffcedde343 |     
        m68k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/a0576aeeb57a49958e5229d9ec08f2bd792d48b6 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/c0b75860a3c2053800d632457f8c52b49e64e543 |     
 powerpc64le |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/8c2ebbb6bdb08abb3d640ed86a246c5937c2e2ad | ORPH


-- 
http://autobuild.buildroot.net
