From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-25
Message-ID: <20151026073019.9A99510188D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-25
===============================

        success : 149
       failures : 49 
       timeouts : 0  
          TOTAL : 198

Classification of failures by reason
====================================

                   mplayer-1.2 | 6 
             python-spidev-3.0 | 4 
                  ffmpeg-2.8.1 | 3 
               util-linux-2.27 | 3 
               syslog-ng-3.7.1 | 3 
                libnspr-4.10.9 | 2 
                 sudo-1.8.14p3 | 2 
             host-nodejs-4.1.2 | 2 
                  boost-1.58.0 | 1 
                   bdwgc-7.4.2 | 1 
                 mesa3d-11.0.3 | 1 
       kompexsqlite-v1.10.12-1 | 1 
  toolchain-external-undefined | 1 
     openvmtools-stable-9.10.2 | 1 
        gst1-plugins-bad-1.6.0 | 1 
freerdp-17834af7bb378f85a3b... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  ltris-1.0.19 | 1 
      host-uboot-tools-2015.10 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
canfestival-7740ac6fdedc23e... | 1 
                 mpg123-1.22.4 | 1 
                    sdl-1.2.15 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
              gst1-libav-1.6.0 | 1 
               ipmitool-1.8.14 | 1 
                ipmiutil-2.9.5 | 1 
                mongrel2-1.9.2 | 1 
                    ruby-2.2.3 | 1 
                busybox-1.24.0 | 1 
                coreutils-8.24 | 1 
                  qemu-2.4.0.1 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/fb67f52226d23b10990691e52c24a02849526181/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/214eab01113ff047681382b39b103d5588d3f9a2/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/8db941aa46249ff692b6584fd7613b9f51d75687/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/22c5dabed5886248e5e10d443182bbc7aaaa0059/
      x86_64 |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/a117bd0803078e7219c230607eb16d28cc0ada21/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b07cfb8897c4edd77abcf3d50447a10b03e3b999/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/05ef2cb2b84d1704cd0538a6e284535b8b16324c/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/db2eaf79440fc1a395f9fe9974dec2736f07700d/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/6ba0f8e077db461b92b7f06a34553e164d627241/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/3eda001d5403bf3eda529f5c672962cdd736a24a/
        i686 |         gst1-plugins-bad-1.6.0 | NOK | http://autobuild.buildroot.net/results/79a70f64a246aa205331e661ec09fd036a486fc0/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8b5a7946085d0158861701b6faac4a840a72a836/
         arm |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/5eff7e293d54fb71bbb05de4cac5dacaa74b113c/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/bb50dbf73075ab772b757b11e01a825d8f10a857/
    mips64el |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/c452507b1619fdc3fbde014f6b0bda5965a4b93d/
      x86_64 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/bf624b21e21230fb5fbf8f440ef8fec2253af8db/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/85da63d49086f8cc62e2c67632dfdc39d7702169/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/0d357eeada45547c940d8785def1ac0736e736ce/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/a3cb67bf08c42566b6c49322f4f0a0a8fcf7bca1/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/127d632923203a747d8df876113c43177c9a2327/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/f54dc50e6d7028e77c2053cf633e9787af2aa35b/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/d275b34cb9fec6821965ad168d7e41661c36a41f/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/58a72ff2c9e56fb1809581bd4e24fdadc0b3dd1e/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/09b83fab8de286d331734cc5d43c785d3631f778/
         arc |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/c301231762ad125d0f0dffb4637b628135514ae1/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/070023a346e9e95e831fd82a28e8169ba5367df2/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2a203bda404384d8dd799d00ed899a6292ce1e9b/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4035e39bbd471416df639c9a6ce9791af23562f2/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c36f64d2c92c4f3ebfe9f9c670e31a54be7430e7/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3ea35ebdfbaaae441633ab01a8549fe541ce3a9c/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3b5197e42cf5b272c8a428de8cd4de7420a6c4f7/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2218fc936d5e9fe61bb80652bbd81c238cc2edaa/
      xtensa |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/8a76dcfaef76edb615d9c68185c48fa646ed94fd/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/4af964c8ab6afe977af46f2966391ccae2a5971b/
      x86_64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/67220d70fc8fe04e0e8ed0120f27b38dbfaf7437/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/bd928cdaff71e10bc45eea440ee4f1baac611e23/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/5019cfa64027e7117ee8b01457caa802a54a5177/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/3753ba7ae534e55b8804f07b7eb497b38bc4eb61/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/c29f7ecd7b30ffe9c9c0569664da900c5b2a1109/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/c57bcd9701cdce555c135c87bc8761879248dc22/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/809b21a323df6b285cf2ac1aea40da8981856e85/
      xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/babbb089ce1a7750495323248f21402960fb6c80/
     powerpc |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/c9b31d2de72a4e48a213b5c1d011814566732dfb/
     powerpc |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/7b5370d12a2ff8937cba3a201d4edce3dcd12a6e/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/86bc45002c015201c3729e723335f07ed359c3d8/
         sh4 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/a0f1797df6b5c19e500f980b3399ccb4e6779678/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/20c11ccbfc5d95321b7415a930983e025860645c/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/d11c5f040777eb9006447894791be0200acfd7e0/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/417518953fc2f3d7ce40a938856714f416418730/


-- 
http://autobuild.buildroot.net
