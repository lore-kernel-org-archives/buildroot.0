From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jun 2017 08:30:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-22
Message-ID: <20170623063046.261C020A0D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-22
================================

      successes : 152
       failures : 71 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 17
knock-258a27e5a47809f97c2b9... | 12
                beecrypt-4.2.1 | 5 
       linuxconsoletools-1.6.0 | 5 
linuxptp-97c351cafd7327fd28... | 4 
dropwatch-7c33d8a8ed105b07a... | 3 
                     gpsd-3.16 | 2 
               qt5webkit-5.8.0 | 2 
                 sngrep-v1.4.3 | 2 
                      x265-2.4 | 2 
              alsa-lib-1.1.4.1 | 1 
                  bwm-ng-0.6.1 | 1 
                collectd-5.7.1 | 1 
                  cppcms-1.0.5 | 1 
              dovecot-2.2.30.2 | 1 
               gnuradio-3.7.11 | 1 
           host-doxygen-1.8.13 | 1 
    host-xfont_font-util-1.3.1 | 1 
                kvazaar-v1.1.0 | 1 
                   libcap-2.25 | 1 
         libevent-2.1.8-stable | 1 
         libspatialindex-1.8.5 | 1 
       python-smbus-cffi-0.5.1 | 1 
           qt5multimedia-5.8.0 | 1 
squashfs-3de1687d7432ea9b30... | 1 
                   strace-4.17 | 1 
x264-df79067c0cf33da712d344... | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/d81e9daa3e5aa7b4620289c55e198cc2e7890cc9 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b25dd8661010c7d8b56e7276c967a8ddf5958136 | ORPH
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/08ed139b31f5ebfb5c36c2b391ec2c001f9dfb47 | ORPH
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2b7df6eecb1114b5d92681db56a720d56ccffbb7 | ORPH
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6b6669ffce66d657704b0332a01d25b59adc2ff6 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8176834b673748da8769d91b9dc6ab439666073b | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/1d9f0b62e4cc387f508b4fe0086621ab9996a085 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/b6ec2432a48bf62ca90932a7ef3146dc114114a3 |     
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0636cf4ce3098b2178d13302171de5468776569c | ORPH
         arm |               dovecot-2.2.30.2 | NOK | http://autobuild.buildroot.net/results/26ed29386e3c2481772d347ca4897ec44fdd2c2e |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/55ec8702e8a09da5124a51ad3037827baa7202bc |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/0d713f08489704d1a5f41b35a8a207359bf69850 |     
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/78ab53fc720e04ed7a1cbf0556df13752a1216ab |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/f3cd304a178f00d6731685a766c8d7a2af6fba67 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/1df512c96909245a9b07ab1b5770890b1c74d804 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/20deccd730afe71c07d6c60c51ab4cef3710807a |     
      xtensa |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/589dd14601740f52afe4994373937e93caa635f7 |     
         arm |     host-xfont_font-util-1.3.1 | NOK | http://autobuild.buildroot.net/results/4424d6c3d5af8a1b7a994876338ee1cac5c5d8aa |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/d3a49b1e402fb6dad2da2011ae2afd209111f1dc |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c70818e34e14b9e694d3d7cff41401b386c58c25 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/9d50a1a5068dbc90631e1f5a334a81e92e9e5b6f |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/250626254166d4bbf6ad8b2c05faf1357b40c808 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/55a459048122a21b96729c9b08717ef03e7c421c |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/5f0e2505848337c7a2b36fb40319d30ab9afae63 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/29275919238cf8cd64c380d28ef0ff731c89873a |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/fb6b1659daf152d3deda898a5fd23e983bfe8c83 |     
      x86_64 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/5b4491f4d93666a0253ca88f82356ec6735cebf2 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/170c5681c4f605deca63a92c7adc78df22557583 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f13461baa7d656f682aed95148b6de526ebe5a8b |     
         arc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/8895b2f8a4d66eedafb327910e5eba8053066b7d |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/6f427904529bb5f2f08fe194720d14139e6b1b2c |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a10fe4942a14155163887ce0eded963f7a6763f1 |     
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/c967813be6f765d6d1b77d2b6054efa1f584733a | ORPH
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/4abe624d90688c03264f651c747fbdee9cfebaba |     
         arm |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/3cc0b7ae0dfda225d2cfa3cdf9329c0fc2f798aa |     
         sh4 |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/94bc050f291cc42a4fdcf02157320576feb03654 |     
         arm |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/5b16921de7927a022509912262dcc634d5e7a5c2 |     
         arm |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/f62c5e8bd63d21211eb0e658c4e84135bd59b8cb |     
        bfin |        linuxconsoletools-1.6.0 | NOK | http://autobuild.buildroot.net/results/4b0bca50e6dca01bf05968e51dd6fdbf9ccffdcb |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/218365d7c7e3b29c4e04e1e40d874e46959bb82a |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/b435a95a46e1e7ac6d16cd786a2b94d7e15f4f3d |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/c816eeb7e17db969d8935a373aa8f2c6b8af89d0 |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/68781b83095df4e9585b59fad1545a051e20995c |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/35ab56e82baf9d925382712712502f42518c6a00 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/514954f82a6c770dafade083434722802d2ab232 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/65fdf13cb80848a00b7f636f3744de771beaf80d |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/89631597dceea6a6d175af41e9d36ffa9e03f446 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1fa456d4dc865ce9e352dcb0bc9c8def09abf1e4 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b279b73df1feefd64bcb877e9360269b3a1bc244 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/68f15b7850969821770aace69c5f2d500743683b |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8972fb04995f730be92b9dce12ed1b871f884e49 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d52aef70b184f3e14b8ff2ba5845e8844d1c09e3 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5949a6b39ad3802dd79d6fc358154378031c0ee8 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/79ecadb20195951cee111f1a082154ad496d0d48 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f4da70298e3b77a3d583ce389254cba3d12d0b0a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f112507266bb0c132f2ce9311fb9f52b6eb2508e |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bb8c5945fddd68945668c71ed507a95351b83136 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c3d516f0fc992dd398942e9fbb3a56ef4e51f8be |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1a5f94d66368d990998575f25d6aec1940d225f8 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6e959b353beeae677c8aac3cb8698280f7cdc971 |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/7daaa4716e3e83db60d0962b74eec48803a0ec86 |     
         arm |            qt5multimedia-5.8.0 | NOK | http://autobuild.buildroot.net/results/364a76bbf90251f9cae2abd3ef2e382758eae538 |     
      x86_64 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/871426a2c66457c5042dcf38d43c1f676ff0b69b |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/91aa023928c82537dac55473f81ad0b08744355f |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/74bc7c18c8310cb917853db1119238299a56ac29 |     
        i686 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/e994f882bd66f493ac7115c6396a587d1beedb04 |     
         arm | squashfs-3de1687d7432ea9b30... | NOK | http://autobuild.buildroot.net/results/6142c205f022bbe42d2e0504ecacb9c2d3c0f65d |     
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/de404ba6b0885619af7efd2ae6858218d8310f02 | ORPH
      x86_64 | x264-df79067c0cf33da712d344... | NOK | http://autobuild.buildroot.net/results/f019ad098d8fe66a7a13c9f75b111d037934a531 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/2f8003953c60657b66a8484178ba16c8cac6d0d5 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/33add5ab6e60519c8523919f4913fc04bd45a879 |     

-- 
http://autobuild.buildroot.net
