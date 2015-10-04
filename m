From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Oct 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-03
Message-ID: <20151004063018.176FC101EB0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-03
===============================

        success : 207
       failures : 56 
       timeouts : 0  
          TOTAL : 263

Classification of failures by reason
====================================

freerdp-17834af7bb378f85a3b... | 5 
       kompexsqlite-v1.10.12-1 | 4 
                 jsoncpp-1.6.5 | 3 
                directfb-1.7.7 | 3 
                    ustr-1.0.4 | 2 
                    ruby-2.2.3 | 2 
               util-linux-2.27 | 2 
                pulseaudio-7.0 | 2 
               iptables-1.4.21 | 2 
         qt5connectivity-5.5.0 | 1 
                   ympd-v1.2.3 | 1 
             libseccomp-v2.2.0 | 1 
                     nut-2.7.2 | 1 
                  libsoc-0.6.4 | 1 
                   erlang-17.5 | 1 
                 mesa3d-10.6.8 | 1 
              swupdate-2015.07 | 1 
                grantlee-0.5.1 | 1 
              libethumb-1.7.10 | 1 
           libfreeimage-3.17.0 | 1 
           qt5multimedia-5.5.0 | 1 
                  ltris-1.0.19 | 1 
                 mplayer-1.1.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                busybox-1.23.2 | 1 
                    php-5.6.14 | 1 
                mongrel2-1.9.2 | 1 
            ibrdtn-tools-1.0.1 | 1 
            micropython-v1.4.6 | 1 
        imx-kobs-3.14.28-1.0.0 | 1 
                   zmqpp-3.2.0 | 1 
                libnspr-4.10.8 | 1 
                  libnfc-1.7.1 | 1 
                libevdev-1.4.3 | 1 
              strongswan-5.3.3 | 1 
                 sudo-1.8.14p3 | 1 
              lirc-tools-0.9.2 | 1 
             lttng-tools-2.6.0 | 1 
      host-gdb-arc-2015.06-gdb | 1 
canfestival-7740ac6fdedc23e... | 1 

Detail of failures
===================

       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4be3ccc3b6924bacc12a6aeae645c30c1d38fc25/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4b27c2eef4a2c3202c0436598f84d3631cc46917/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b7b98896196f5438210185471689f1554847a309/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9c0906c4f463750acfac195d806438fc7635b963/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/94dac11f429863a844a2666c3c313e746df1e1b3/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/172e46d4f5c6b38517a6497503a02cf67e2b99d1/
microblazeel | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/e5bee760d52e5ee433dcb6c8a7296f99312cfcf4/
        mips | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/0b4793f0bf9f4c57933897f3480054a4e06528ad/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/7a2284d0a2987158fa2e78f789b07c8c6fcdb974/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/3874088c3ccd4bbf76ea0c911ca1ef64c7dc9d1c/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/75c58465884a397702435c0b9e91e26d6e8c6edb/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e256c4fada74e8b252c5708cca3e2500cdc44e51/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/84ceda982df6ca289a0f6c33dc4f3af877d87927/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/82749f0ca7402aaf0b0c27524c4bb12eae209197/
         arm |         imx-kobs-3.14.28-1.0.0 | NOK | http://autobuild.buildroot.net/results/028fb72a0ed2c3e28cc752b5af746a3e718d033e/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/faebfef192d38445aa2d3c5adc5ab0642efff7f5/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/d262d15674ccc8b3c899056250ac05e1922ef98f/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/3c747f4415d1ad469a54ae07daa32ddac08bf6a1/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/f125a2d7a27fd33e27077f0ece1805ac610dcb48/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/cd670140d67270c87535227a4a0c0fbe62fe7761/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/8aa4034189a8e6c6d8be594bab7094e6f87a11b2/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/d1bb824b09e4e6097f270f16c2e2cfbdddbce5c7/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/6184da0087ec11023788cf8def25c62f05f91eef/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/883514bd94d0c4fcc5c151050a967341641cdbb2/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/93228440392b128d31423ffaecdf08570376059b/
      xtensa |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/e4ff019f64aae3a10ea7d876eb66b9253b093528/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/9e16ea4b4fdb70947fd962863e8de93ee52b10dd/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a1f5379d0927d690aa9202e757b5b7fff7d63159/
         arm |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/02cfb350226cd6308b45b91aa3818c31d2f3f81e/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/a1eac3d8b9a8c072b60edce5de9e18eeecf49854/
      x86_64 |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/34b0bea52bd7e65a927142dc0e1f28f85629c634/
      x86_64 |                   libsoc-0.6.4 | NOK | http://autobuild.buildroot.net/results/8fb59cea81b0725db4752022a3942d001c074fee/
      x86_64 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/8d52f2aac7ae50ac8542fa5790b88dd69b866a07/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/b25ace0f8118577d3c640d138948ef6d39d051fe/
      x86_64 |                  mesa3d-10.6.8 | NOK | http://autobuild.buildroot.net/results/45a25713ba9382f0c9d93e768dfe8bcd9b271ed5/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/fbb210f736a9eabde683b923ded0ee3efaabbc55/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/9854158a90a43fcad05b44613bea04a7ff34148b/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/27c93d9c9da845dec02a8ae8b0ddd4ad58a4a098/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/6e403642069093389acbeeccd7030b76d4ab68be/
         arm |                     php-5.6.14 | NOK | http://autobuild.buildroot.net/results/aa34b2326a0702093162eb1f9d7bdf9c7cf45311/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/082802e3460aca154527d5d1a49e424f485c06f0/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/f45e5c099e3e31e518cdfbb5233e18b68d0db898/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/c380890d6c93eee8c987383bf37fe0c68910cd0f/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/4eb059dbdfda8138af310862f34b19021a3b7337/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/f61dbee1e81018282a6b7a33930179d7eb8699f9/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/b7f5f935d6ffe1770fe5e587d08b51620c9ffbf7/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/87cf0b146dcb267b25cadbf97f035ed62d8657a3/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0dbe3955812649e2db4441e78fb8c20a2be6ed14/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/5d0b017848fdc46556b365bd6bbb4240acc0f92b/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a4dbae4454ed62f284c28fac5ae2bb4825ba586c/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/72b11b0c47082b207b795c1f0a1c2e6b835ec567/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/143e727a7cb91e515d6ef2aadad63d32d9f7e704/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/0abfb4d6b753cf130351682b80bafd71395784fe/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/225517641421ab9cd0129c293a0ac8955450ddb7/
         arc |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/21b6912c70a5c300bdabde53bee6a1d9cc3bbb02/


-- 
http://autobuild.buildroot.net
