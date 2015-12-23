From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-22
Message-ID: <20151223073020.083D2100D85@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-22
===============================

        success : 222
       failures : 92 
       timeouts : 1  
          TOTAL : 315

Classification of failures by reason
====================================

                  libffi-3.2.1 | 9 
                  boost-1.59.0 | 8 
                  autofs-5.1.1 | 5 
                 mesa3d-11.1.0 | 4 
                      pv-1.5.7 | 4 
                  libnspr-4.11 | 4 
zbar-854a5d97059e395807091a... | 4 
libbroadvoice-f65b0f50c8c76... | 3 
                      qt-4.8.7 | 3 
                 libdrm-2.4.65 | 3 
canfestival-7740ac6fdedc23e... | 2 
                  ffmpeg-2.8.4 | 2 
                  connman-1.30 | 2 
                   erlang-17.5 | 2 
                  prboom-2.5.0 | 2 
              alsa-utils-1.1.0 | 2 
               wireshark-2.0.0 | 1 
          nvidia-driver-358.16 | 1 
                iprutils-2.4.5 | 1 
                   strace-4.11 | 1 
           argp-standalone-1.3 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                 opencv-2.4.10 | 1 
libatomic_ops-libatomic_ops... | 1 
                    ustr-1.0.4 | 1 
                libvips-7.42.2 | 1 
               libcap-ng-0.7.4 | 1 
             util-linux-2.27.1 | 1 
               iptraf-ng-1.1.4 | 1 
                  ltris-1.0.19 | 1 
             bluez5_utils-5.27 | 1 
                    kbd-1.15.5 | 1 
  xdriver_xf86-video-ati-7.6.1 | 1 
ltrace-c22d359433b333937ee3... | 1 
                 igmpproxy-0.1 | 1 
                collectd-5.5.0 | 1 
xdriver_xf86-video-fbturbo-... | 1 
                   kexec-2.0.9 | 1 
                 lockdev-1.0.3 | 1 
             gdk-pixbuf-2.32.3 | 1 
tstools-08f6be304040e7b8476... | 1 
               libsigsegv-2.10 | 1 
           libvncserver-0.9.10 | 1 
                moarvm-2015.10 | 1 
                 gnuplot-4.6.6 | 1 
                  snmppp-3.3.5 | 1 
                  gamin-0.1.10 | 1 
net-tools-3eb367aedf1280f35... | 1 
               dvbsnoop-1.4.50 | 1 
            gst-ffmpeg-0.10.13 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/7c4ce9c8e1c086a1de0147f37d4cc7202eedbb81/
      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/07848d04d246d85368075dd76013383e5b1eec8b/
     powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/6173f1e9eef086d2ee345729930155d2cf942d99/
     sparc64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d2f17624688a79c635505a7b2896f6f64d4b4095/
     aarch64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/56fea616bb58dbf370e6419dd7abe6b84eaec2e5/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d7c0c98db7883f7f6a06fa8dfacbd1ef89cbb89b/
         arc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/9221b1f3c557e50ae1d6bf9bc9290e55019a0888/
        sh4a |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/999d2d5fe07994642ab39b26d936c230d79947a2/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/b8ec35abbe66c7f968c37a470443e70312a25df2/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/71bb2970bb32a0635672f8d622bf3f072b594018/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e0091e2b4cb271881e90eee1b910bf322d586a5f/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/951fac2582b8d68b23f9b05ad44943ce952c5992/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/1dc99b3c9c8f20a8d6452184342024e70acfce2c/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/de6762255159bd8e04c0ebc2027178d850e54db8/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9fdb9fc9c7b1a8b510a8cd32402380bd71283380/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/877360288440615b1c4df88498dd6634a3bd145f/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8821fea4a8c700acf3baac47d9e73ad1d6858479/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f2c4c4e095143d5ec5198480a3d856bbc1c21392/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/73526e2e3ca3c5cfa30b00f6b0d49db2316a5f16/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/d63da25912bc7c3a3b52fe3d7be24754002a6ff0/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/a279e7a9f1791096d16dc06341bdd6d8e7d70e4e/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/00164861779281429c96b47bebe1953464dd7bb6/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/bb028d2ee1a60b78e391c0eda1f881cdd2f52e08/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/645c5efdaacd80b540f326c41edb1796255110b7/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f662756c8dba4d8b97ef7527908ce598fcdf7e89/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/ea6394c7d3ab58eb6e987e718752c62f590d734b/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/992fde06f094991b51ab9c02cc867f35130c7866/
     powerpc |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ccd16292d72d036b52026597585951a45af614ff/
      x86_64 |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/5f2e4d87983275b0310d5ca8f9c9af95adfc46d9/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/2208edb231dd4c518fce5c8596e876710b2ed779/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/a8b0b07b116f63ca5c948ac75231e895ce7e4b82/
     powerpc |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/b39d423852737dc2cee73c04f5c222901618a314/
         arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/380908f96065c09875ce9827430888ccc27b03ae/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/a502f4855c81d1c26902e3b5c898d53e34a2cbfc/
     powerpc |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/f40faa2201f361a675c992648e137cb4191088e6/
     powerpc |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/790093ae9f9e807ecc3ab7c3218af8d215d55ee7/
     powerpc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/57e8554d18423dfd9859d75d4d903fe8b939fff1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d2f093dd945b6f96930741b5865efff2fdde0b03/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/75101eb71f6d99251711eacf3311d3e636f3bab1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/68725bef4a921bd9a54ebd81857970225750b878/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8c2d71dd41697e93a1a1d0830fdcfec81f2bc7ef/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/94e39ca23d0624d55a4fefe2496cc8311ed73dab/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/a9c64e1d2679703f310248e88ed8ccdb4d7157fa/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/e6b61a2c8c21c211ada9fe218452183aee19da90/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/579be0b3b61a5ae95c4d14b681b4c07ca7bb8a0a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e598846260eff11ba87f783786c69b6542e8b9b2/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1e3dfc24a38bd85fd3e672135edbd531a020e39a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0975b6e4a525030645ee7e418faaa37f1fd6fb92/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0ee511da0deb06bd1fddead8ebe7889143188924/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/548f6a7d46181e6dc92849925a0838f078cf1965/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ed595f476b16bac28bad8723db06894d48b9f85c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/da1ccc5b8aac33fe06d94acf60015990975ba5cf/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/657faa015da81b12eb6601640f71957f09e33820/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/f66870806e5cb19a3b3715dd1a9c7360f8e544a9/
     powerpc |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/1e499c7d47425264c739c2288c33a55d4f47022e/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/06362c9ed2e1d86c5214e40466e3ea9ebfd5974a/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/788fadd185795c2798c61c953d9ee0fa2b369594/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ec17758bd11abaf273d7e5d4e736ffad7df53b5c/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/f513384b4ff8ed6977c82453d2684aff5f3d9276/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/b015ffd1e13da06917f9fa5366af89b9fe99e6e8/
     powerpc |                  lockdev-1.0.3 | NOK | http://autobuild.buildroot.net/results/9db4ab40955d3af0027e141245d73ee6c614fb1f/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/55ce618dbe1b2867e5738d90afb2eb67c19200e4/
      xtensa |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/de9b64d28aa19f8a918339db71b831f32c3d5346/
     powerpc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/8b3b57ee400f51a83388d1062fc180e39e195052/
     powerpc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/9476971f37df55f21f48cfbca1bd39343539bb42/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/1b18e48234c7dda35dbf1fec66d2791f7ac152ef/
       nios2 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/7043540dd660638737d66b67108ae95a32581481/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/2b7ff18ef5efb9068b61338cd5870fa170c6231a/
         arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/9da89aa22fa516dfdeb5cbb0649297814a93e970/
      x86_64 |           nvidia-driver-358.16 | NOK | http://autobuild.buildroot.net/results/4c7b749f531e678f540e96accc9f130ba4b78bc1/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/359b823bfe0ea359e482ee7010cc2243228f9844/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5ab6839223f8397eb024075cfdef3dcb08665d7f/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/46d2619210deea7187fe1c8793a77451657d44dd/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/9cbe9c821bf129002eeffeda8416c198bd33a0bf/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/9317988b66be27df39f0dcf27a519e682de5a462/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/552c545667c3251849bbfdc6254170747b2b7590/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/11213e610a3ebf8281e11ce36e4dda48b6228198/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f2cf006b65e0cdb1f0fd745ef16dc567743d74a7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ac9efd7055a286cb673ed1a30c9b7dbec33a9371/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2b970f82624cc072ae1c5a628f84cbafa36a9a05/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/f8504638ecf9aeb6a75f20ead11aacc52aca33b5/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/6d6745d015c042eb2a1090d26c23e0f5fc5c8cb8/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/6c7307d6b798efe6cc77958450ba81adc22209df/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/e54e02aee2325a62ebcdff6cfd85695e9c23f2be/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/185bdf4f27ec36cfc6851e27404fd0b09937107f/
         arc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/7ceeb26fc28e12821d9a9231b47c3db3c0332f9e/
      x86_64 |   xdriver_xf86-video-ati-7.6.1 | NOK | http://autobuild.buildroot.net/results/cfa31eacc8c18f60881551da2b2280b7065acfca/
         arm | xdriver_xf86-video-fbturbo-... | NOK | http://autobuild.buildroot.net/results/4db7ce3869457e8371a8a62495fd7deb89136fa8/
        sh4a |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/31b92237f0d8c03fff86dc562a246f0456fa0054/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/60f4151b98dc8b4e7b7910378edefef476b1775b/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/20ed0f3b828d935c749067d2d5feead39a448dfc/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/f298dcc9babc6ac6526ff408bb57e7e54f905c12/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/860d4910d3db3f3d32fdc477b725b3fb5e8e4a3c/


-- 
http://autobuild.buildroot.net
