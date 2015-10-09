From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Oct 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-08
Message-ID: <20151009063017.B1789101629@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-08
===============================

        success : 164
       failures : 54 
       timeouts : 0  
          TOTAL : 218

Classification of failures by reason
====================================

                   mplayer-1.2 | 7 
                directfb-1.7.7 | 3 
              swupdate-2015.07 | 3 
                      qt-4.8.7 | 3 
                 mpg123-1.22.4 | 2 
              strongswan-5.3.3 | 2 
                   attr-2.4.47 | 2 
                mongrel2-1.9.2 | 2 
                libnspr-4.10.9 | 2 
               alsa-lib-1.0.29 | 2 
                   erlang-17.5 | 2 
                  libv4l-1.6.3 | 1 
                  aespipe-2.4c | 1 
libbroadvoice-f65b0f50c8c76... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    neard-0.14 | 1 
                  mono-4.0.2.5 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                  snmppp-3.3.5 | 1 
                openssl-1.0.2d | 1 
           argp-standalone-1.3 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                pulseaudio-7.0 | 1 
                openntpd-5.7p4 | 1 
               util-linux-2.27 | 1 
                   bdwgc-7.4.2 | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                 dropwatch-1.4 | 1 
             iputils-s20121011 | 1 
                busybox-1.23.2 | 1 
                collectd-5.5.0 | 1 
                  monkey-1.5.6 | 1 
                  libnfc-1.7.1 | 1 
               dvbsnoop-1.4.50 | 1 
             ebtables-2.0.10-4 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/f0c41713eac265d3f695e98dbd8bc5e0f050b662/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/13ca5bbcc5c333b87116a9ce4e3f61165a651a4e/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/c550811f5a8bc7bba32b412fcbb7d877dd9c96a4/
      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b9a3cf863806baa38988abe39d87f691f76af249/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/0c6c93901f9332cd4393551d6607bd323d15335e/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/e5f958d327cbc6c418d0533802dd4a04ea36ec4d/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/5db5bda45926f4aa5ad4fc7f4eb5a0c9f476a836/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c01967b170aa260e128f93373c46565d17b25222/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/0ab02a402308ae5bbb149ee3f62f2ebaed131651/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3e680bbbde1b1ca9b6799cb76fe818b8fcc4f367/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/dcc3d4338c6c8fb1b3253fae1bdd6ada99a77d29/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ea3705fd818bcbdb1c7da69fa964f2244ec05bdc/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8eb127f33c64da332ed508d2803dc8345950a97d/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/31b788972865dc9ee8a78e7774747562ae498fae/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/3e6c01ad0e322919e26e7d65739346dddd80ee3d/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/946a96b767161a224acc4738c691ee1d75f9450b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/30be24892b7ecf6911dab3fc90d1863a7f7a4dbf/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f4919e5b5ceb946e649ee5f2753f97fd9bcd452c/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/683e4699ffdc58b30fa4423c0177b62ee9f9d421/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/737e64b6d8e10ce7af97bfc5cdb365856589d784/
         arm |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/1630d40feca267b6a3f1dbfdf0b1579fa7a0c723/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/f37419b1b73ed4134490d960b60d4de66543be67/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/8a45e208888de688a939046be16d14b372bc03b0/
      x86_64 |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba2f067734ce5da4f9198ceeb8647af4312e17fc/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/489b55a4989e45ade3ffce455d05fd72d13dc7f8/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/df37a31ddf285cb0f31338aa8389aa4d030ff84a/
         arm |                   monkey-1.5.6 | NOK | http://autobuild.buildroot.net/results/0bf7a83a4ccbbcb3ff181ac962e6fdd0099a19f1/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6acd43ccd2f1cd3e77421f4209b7d379d9029f3e/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/32fc6acd04ca5d4b4d371987a6de3d93f7d3721d/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/a14d46e9622162aa6d304fee10686d13c28b255d/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/17a2a0e0275f0ff4cc9a497ab69d34b04464c113/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/968757c46d1dfbc7f72520d9dc06c9dda629cb1f/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3695125ea32c46a5e8b5c9bdc715d12d07adb273/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/51f30189d7bbfdf37dd0b5245a76dccb5d506f83/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/49da9a8ba20cf9b9b238b7e9ac98e82eb24a441b/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d28b734926874a10dbddd075fdf6cf3c41c24cc1/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dc75890657a55efabe0364294256ee666c61b83b/
      x86_64 | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/9a96fdd2b52a75b348b46696c7f8b427f2d987c2/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/0c9e0e28e4dbdde47689ef84c3cd20ce5b4e0334/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/aa44366614ac986d4264aca48d1b292e9119ed95/
      x86_64 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/f9b437a290776f30a224c40d9a2e3f967f287a46/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/cc508e206be1e877648a296b3a225b813de49883/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/67741afc447b7e3190e7dbb0fa1ad47ae6752b11/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6978a41b031401a80eb3d385a7832442057431a2/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6a447ddc89a229c025684235350e5647528c5917/
      xtensa |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/f98876211d3e9ead310ee96363752ab43790280c/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/7e8869b7f0c94252ba80d6283099f2f88beb17b8/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/1e9964f6aab36b1feb5808f9a0501319f70d2d54/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/95b0ef2ddae6e75822bfea248668bf9836eaf9f1/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/4f3f79308b1e0d0b550bf76dad7e6de743a8379c/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/369f570292a8e8f7a3d32f66ed03c61d873112b8/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/90644b46ea847ee9e3f4d8333d4dfe8773f300a2/
         arm |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/33472861ca074c55a05e389230424dcc79425c26/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/e9cecdad47d940b00e01b48b1f90ab5671742e95/


-- 
http://autobuild.buildroot.net
