From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Sep 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-07
Message-ID: <20180908060014.BD2602074F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   3 |   0 |  16 |
   2018.05.x |  14 |   0 |   0 |  14 |
      master | 131 |  36 |   1 | 168 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

linuxptp-303b08cbf55096aba5... | 2 
                   attr-2.4.48 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/4de8ad24b800a6495dbdf9876f75175ff31eedf2 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/5d8a82339aa196a019947027e53f5856da50ebb3 |     
microblazeel | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/33cb967695e76bd4eae7063d296e2813af76f3e0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                rtorrent-0.9.6 | 9 
               target-finalize | 6 
                   botan-2.7.0 | 4 
         host-e2fsprogs-1.44.2 | 4 
           python-numpy-1.13.3 | 3 
              ptpd2-ptpd-2.3.1 | 2 
                blktrace-1.1.0 | 1 
                  boost-1.67.0 | 1 
                  boost-1.68.0 | 1 
            duktape-legal-info | 1 
               dvdrw-tools-7.1 | 1 
                 flatcc-v0.5.2 | 1 
                 libreplaygain | 1 
            micropython-v1.9.3 | 1 
                     vlc-3.0.3 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ffc4901ca626c5a60caab6a1a98197f447ebd667 | ORPH
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/03fa3cfcf33c0f5c7a57f0bb34849f5de57f0242 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/f7f58492bb315ede4a700ba7c6310c24bf343821 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/26eec7e20795068613616a7312681853232ec764 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/4512d59342f815501f6b7375833e91284d2c7453 |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/060146d75c42d0aefd72776bcbeb3e76b538dcde |     
       sparc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d63f70340d1297ad96c20144e658f0e4587a90ca |     
        i686 |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/31eb96224a5204cf86aa00068c9c0ee0bc1092c5 |     
         arm |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/763879f845ffd43343a7b4d548b1eba991d572bd |     
microblazeel |                  flatcc-v0.5.2 | NOK | http://autobuild.buildroot.net/results/972e628d3556c657a426975a49075872391e8039 |     
        or1k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/affa68a6f8a9727536db6ffd1fe05237f50d7ce5 | ORPH
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/14ee1919c1e1327302fb19fbc9c3060a27666b3a | ORPH
  aarch64_be |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/30a9a1431989797bbce8b37bc9447cd2780864b3 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/9940be0180c31bda67045380c7be648697729ff2 | ORPH
     sparc64 |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/0f57f185c4bd8076c79b7b4aedcf87d24eddfe99 |     
         arm |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/840b16ee4e9ac8e2280ab5d9fb0edf56d3a158df |     
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/06c332b8c0717ae7f32b821dd5ce39ab1dc9bd94 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0972b578e2460021f6709082b36af3237b406207 | ORPH
      mipsel |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/bf2238a1b05076d2421d9d12fff50a4310dd0166 |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/1d0e54d9b33b0f352f3b66a1eeee8b3478395ca4 |     
   powerpc64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/91164c4a267ac6b94e4ab8b00adbe8113b10b584 |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/90aa2ccd4bfd36702877cffcb16e01fbf7368ed4 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c0eb979880fbfa102c44afa8a51b78757d1d75c6 | ORPH
        or1k |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/e0dcc89c91974430079372e921664b425ea0c524 | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/1fe8de41b5542660aaddd1c5f677d9b6feced4c3 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/3738fed0e4aa0dd1ba3428a31c41542bd15ffd27 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/12fdaf84ea850fc4262a1edea9ea17b8f421ac3f | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9413e0b8c8dc7178aba1eb6fb559f96641040769 | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/8fd0b50dad813e013fd66cf378d5db216518888d | ORPH
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/72ff3f0fe3daf58299e4548655d247e3d3df1c0d | ORPH
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d4d3efa9a4b908ba14e3f393cf9ab3d9e1072237 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/c82537ad96dd9abe791ec604391a238cfb495aaa |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/521dfb5340d4747344ceed11428b5e736de3d849 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/e00b3134b79737751e8003a7eb351f7c6a28ab44 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/403ed1a37018d6f7e98933268ace04ddfbc0d638 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/6430c7f70481f6d8cc8502e0ad496351f7709bfd |     
    mips64el |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/ce97e870afc46fb6dd8257002196076d778499f8 |     


-- 
http://autobuild.buildroot.net
