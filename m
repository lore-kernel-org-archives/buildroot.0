From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jul 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-30
Message-ID: <20190731060047.74A0986802@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  11 |   0 |   0 |  11 |
   2019.05.x |  10 |   0 |   0 |  10 |
      master |  65 |  33 |   0 |  98 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-mtd-2.1.1 | 6 
           can-utils-2018.02.0 | 4 
                harfbuzz-2.5.2 | 3 
          qt5multimedia-5.12.4 | 3 
              domoticz-4.10717 | 2 
                 libv4l-1.16.5 | 2 
                   mpd-0.21.11 | 2 
                     mtd-2.1.1 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
                  dnsmasq-2.80 | 1 
                    efl-1.22.2 | 1 
fs/tar/tar.mk:35: /data/bui... | 1 
       gst1-plugins-bad-1.16.0 | 1 
            host-mfgtools-0.02 | 1 
               log4cplus-2.0.4 | 1 
                       unknown | 1 


Detail of failures
------------------

     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/b33ab5cde23ae6b9142e4ee42187afa4e05526b9 |     
     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/94bcb274235fafc60275ed1dc4f1a6f392c92138 |     
      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/e6bbb5fe287eacb284609fdf7bdc7ac4d3f31d96 |     
     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/5e4b206ed4c086757ca993d04caa5fd48ee20f52 |     
microblazeel |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/83d3d9cde8a08de38a703fe7e59baef1504ff3f4 |     
    mips64el |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/433e12aac11f6ded6e36d7bfd134f4bbf062a4d2 |     
        i586 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/e200f306463c394852de9adf5aa67de55e025c3a |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/d5164112d1a06b4c1cf76d4a82f484cfeb00ba43 |     
        i586 | fs/tar/tar.mk:35: /data/bui... | NOK | http://autobuild.buildroot.net/results/743898dc10eb7f73e6b1f0ef3a6b4220f8163fc9 |     
         arm |        gst1-plugins-bad-1.16.0 | NOK | http://autobuild.buildroot.net/results/5800373c59b032253806e91a7d274b2ad5cb6fc7 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/92ef041addc483856c16cb0f006718617b05d736 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/6fb845e148840faf372d538bba7c68f21a48ecc8 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/7f476d3aedf3e1a6f178783063828804220eb188 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/268f3b947f3e13b4501b6f91cf2d4dad46e45b15 |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/727e2b6bd4c5bf4dcb886c9ae63b293251a1d3be |     
        m68k |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/8b507d6deafe69c59597a99863df46c8c6888288 |     
        i586 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/e459400a3f50fd5c24165802fe1effe4de6c2932 |     
     nds32le |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/85b64c71f20eb11fa3e215c6d4b9eee07ecc6a25 |     
         arc |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/480fcb2ad263aabc08c463eaebaf9e33934c3b72 |     
  aarch64_be |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/cb7ba2e5ee1ba33ff613bfc73612af6d29fe8066 |     
     powerpc |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/4975e3177e8dc2df1844f002ebad6f2c66da095f |     
        i686 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/66eef8567f1f14f92722b1187b3844ec1a0dd76f |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/3f104de7ab91bc082a1541ea53daf60744badebe |     
        mips |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/ea6faf504b23a49432772211f1cbcda429f244bf |     
     aarch64 |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/6174fc76775396c34ead4b4a3f4f15db344f108e |     
         arc |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/bb99b8d95b242c303de3179dfcf76fe7c5200e4d |     
         arc |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/4d0bef7daa708697532c0bf4d3c00788a98c8d99 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/ceb17e10db884e42e0dd0c30845d1dc035fd0083 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/507424614ac4cec864b5da64abe6be8ffb28a739 |     
      x86_64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/537a1ba7734c547d9b74beb6219ac877a7a3a143 |     
microblazeel | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/7f35c8f9e05696028770868c2663a17fba59dcd9 |     
     powerpc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/cf74b8c13c9616a092b8d3e65e0544630aae69b2 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/30a2361884a1d837e7bf4812199efa22f74a86eb |     


-- 
http://autobuild.buildroot.net
