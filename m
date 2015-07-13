From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-12
Message-ID: <20150713063016.6AC8510129E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-12
===============================

        success : 241
       failures : 129
       timeouts : 0  
          TOTAL : 370

Classification of failures by reason
====================================

make: *** [flite-legal-info... | 8 
               openswan-2.6.43 | 7 
                  c-icap-0.3.5 | 7 
               libglib2-2.42.2 | 6 
                 rsyslog-8.9.0 | 6 
                  boost-1.58.0 | 6 
                  zeromq-4.0.5 | 5 
                      tar-1.28 | 5 
                libtirpc-0.3.1 | 5 
libsigrok-fe473123ba836445d... | 5 
                   audit-2.4.1 | 4 
           host-heimdal-1.6rc2 | 4 
                   tinc-1.0.24 | 3 
                  opencv-3.0.0 | 3 
make: *** [firmware-imx-leg... | 3 
               harfbuzz-0.9.41 | 3 
                iproute2-4.1.1 | 3 
                 setools-3.3.8 | 3 
                  ffmpeg-2.6.3 | 2 
             expect-2014-05-02 | 2 
                   atftp-0.7.1 | 2 
                 clapack-3.2.1 | 2 
           libfreeimage-3.17.0 | 2 
             util-linux-2.26.2 | 2 
                 cdrkit-1.1.11 | 1 
               wvstreams-4.6.1 | 1 
                 lrzsz-0.12.20 | 1 
              lirc-tools-0.9.2 | 1 
                openntpd-5.7p4 | 1 
                netatalk-3.1.7 | 1 
             libselinux-2.1.13 | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                minidlna-1.1.4 | 1 
                  guile-2.0.11 | 1 
               upmpdcli-0.11.0 | 1 
                   systemd-221 | 1 
               linux-pam-1.1.8 | 1 
                 qt5base-5.4.1 | 1 
               arptables-0.0.4 | 1 
               lightning-2.0.5 | 1 
             qpid-proton-0.9.1 | 1 
                  luajit-2.0.4 | 1 
                 libepoxy-v1.2 | 1 
               libsigsegv-2.10 | 1 
                    bwm-ng-0.6 | 1 
              lbreakout2-2.6.4 | 1 
                 netperf-2.6.0 | 1 
           aircrack-ng-1.2-rc1 | 1 
                  acpid-2.0.22 | 1 
                busybox-1.23.2 | 1 
                keyutils-1.5.9 | 1 
rpi-userland-b834074d0c0d9d... | 1 
libnfc-7b7f5061427b5456835d... | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/114181450b5b54f3fe9806da37f78a62c3f1b0cb/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/4726709819d3c9d4a112a3159bd6cb0a139e8517/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/93571b42208717e3e90c702d7652613594f72900/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/fdee23ecd0c5c66fda1ed38efe43048ce934b733/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/28bf6018dcf91ddacfb76f54a92313da8bf182e1/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/3ccc4f5fabf8ab10eb5e38ac26caffc53263d78b/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/6f84828224584e5724940b1b5fd1c13b55d4213d/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/35f4ee184ba49e22e1e441e7e7b37a82d5f00eac/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/e1fba85a85ad0bba916eda8f74cfcbc7acc39178/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/906e8d149b2d4a3615dafb9a0247e8a62c503591/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/4f1116a614490ec040e97095df01ffde74302dc3/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/fb2acf0cbd1dde0bd33aa59045a66a1b97d4ae49/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/516fe8ac37a3bd5f5e48442d06dd1516e07029e6/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7b30727060e1ea7df7ef30eb71e2eec945ea9661/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/90e4a93c8eccc8a3c81df7c585832b98c60848f5/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ab59b4bfcb83d6e1b01ce24114ba6f43b59bafc9/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/bbcbd120a6debed08a8aee4fbf932292594c9614/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/64a55e5bdbc0a3c4980deebcb7b20a7f3c919fb9/
     powerpc |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/13d00fd8202ccea389ab4b43935731a8dc183a03/
        bfin |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/8c3e397eeecb2a6a39fbae1d8665bff92ef3e3bb/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/d1be8f83059100f8762af3a9c18c86e629569093/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/fd39410a982cfcf288d1bc7d48614997c05b2143/
     aarch64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/c3a9bfb10ce01159600605b4243da12b39d86342/
        i686 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/f6011ab8211589fe8e1e8932db9f8be81768d3e6/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f3b2f25c93443a52f5916913f80f15e00a117eee/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/60c1cf48c263ce73b17fec72a53c3034f9e9037c/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/03afceca47808c8c799c3a0bfa8137b7bf3be9e5/
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/039e28ca1914c13fb326da5145ab31a925008fc1/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/78f47fec143a8864e504290ca42434d03e89731b/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/bcabd7dc8b7bd9984657fec17b01d4614cd75be7/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/30ebf50dd29f82d2b1b7dcee8bc5ab58b75686c1/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/9c08d9644ee8ef8ec5b972af06a84d432ff96afb/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/664586136df0f6185bce5e88070ed1566cc1b956/
         arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/d6ab194b7636c5a8bcd4ebce4e459fa964ce7f95/
         arm |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/9bcf926f5d8fd1a6872351416e2cd59793f69cac/
      xtensa |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/6920e48ab40ae99300c7defda01538723678c827/
      x86_64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/8a155eb0910f67d5b5dca2fd6a60ad50d6fe575e/
        i686 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/706120389f13ddeccd0186ca621f82e05a01bc71/
     powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/c0a5674688dc7838b642de933c1d22e587f52671/
      x86_64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/09d3ad504e4d1861b8f010dee8654ecade512e89/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/bc9b5a2ccff25d53bcf74e63852e155a61f1cd49/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/fb8ab7ae7202450a5bf3ee51971fb8c8a2691c20/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/a8ecabbf9df3eaaed243e62806462d7f7062acf1/
      x86_64 |                 keyutils-1.5.9 | NOK | http://autobuild.buildroot.net/results/2536b59735f33709f44fac94c81106e5ddd4fc40/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/afab951f29c38891bcbc9de637e8e6920885ac88/
      xtensa |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/2b46712fb524882003fcd7bb183702794685030b/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e0dc07489297f4b026f6ac8358709edeba428e31/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e3d4b7283231b5f4188a99c831e569ece25ef571/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/facb23585d1c00b6bc9fdd06d2903f01f76e9404/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/a03c1109f6df247082e94f911324becfbbf996a5/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/d54596218ad18d44c6148555852d6580ff911965/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/368a3f98b6348b173b10f35e5d8d1505ba0949d5/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/6125f17f9df37313a3e2cfbf0185972d871ff0bf/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/7f22fd05d0befd752203c7379d43400ca2a307fe/
         arm | libnfc-7b7f5061427b5456835d... | NOK | http://autobuild.buildroot.net/results/3c909bf7f676460fdc4e44282ecd30a8d04001a1/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/251fbeb3160fd2726f0759338bc04d2c1a02d60b/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/567822dd17fc8087c18ff825f9b8305dd0ee5022/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/09c978b2847943906e5a2ea3a854ff8ebda5953a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/d30cdcd3a32fb9f06359047b9e9e7dd59117554d/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/3b86e5672d186cfe1c1d637118bd1ab00f89d217/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/63a8278d5b7a9cbb205281baa830f7072c02faf7/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/0ab7b5d41b8bbc83a7549d49bf586a9de599401a/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4c5fcbfb8b39b645747db043ffa32ff5ec333cf1/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d59532647b03144c2dfd87131b219a19dc0c5916/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/eb03deb4dbcdebba630101abde57dadd3e80eb96/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/e5ad7acb1a6c9d6a17abdba5602fa157a565f554/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/3d2ca1b90d3999d0acb4ac20267335d28a374b86/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/cc531abb1559782c094c85eeec97d714e515e18e/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/69355c0073f3b6df4ca96eb2df00b5faef32f25a/
     powerpc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/da3c1c0109a70b3f36757dbdab18900b9989c383/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/48794e82233729ab60dcc51f67d02ddac59e8d49/
         arm |                   luajit-2.0.4 | NOK | http://autobuild.buildroot.net/results/c3cfdf8dfb315bf64caa9ed0f362016111fd93ac/
         arm | make: *** [firmware-imx-leg... | NOK | http://autobuild.buildroot.net/results/e9ae747b153c1eb8a845b40adcb494e2559d1d09/
         arm | make: *** [firmware-imx-leg... | NOK | http://autobuild.buildroot.net/results/7c3bd75f4d35d3bef6568f43a232b7403b3a219b/
         arm | make: *** [firmware-imx-leg... | NOK | http://autobuild.buildroot.net/results/59b09152700a5839af46edb554e53981569f8921/
        i686 | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/07c25d7c20eda03ec64408a4c1430097011e3547/
    mips64el | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/88685bd9539deac2e3951e537e9117dc0c7d653e/
        i686 | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/fb52844d5ce4e68a0a13fb53a608382acd6c1f66/
    mips64el | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/feedbd72b6ccbe09af20090c80fd54d930e0c617/
microblazeel | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/b8e69c945d96706976ba9132710184727cfdcb28/
     aarch64 | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/c51286a60f78e9f40cdeed53a0660703519798c2/
    mips64el | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/7983ec41a3f136bd997ebbfc110c7fc51ad79717/
        sh4a | make: *** [flite-legal-info... | NOK | http://autobuild.buildroot.net/results/c0ac5c12635a91769c9dd9ad399ec1a9cc482cad/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/a8118792cd7b05b671676e87a0ae0566fe404fe8/
         arm | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/f62d3830c594d9169fa9b9df5212f190d676fab9/
      xtensa |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/88cb46b5c1cc11613dacec46e69b02163367b222/
         arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/40521140c464a5cf27c7589421000d9d16991f3a/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/8a0dc3156bdd40f292c0f8a341b409891a547475/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/57c0e1809ff07b95b625d2be7b2832240b8fcfbc/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/d56a4e5ad746bed37e38e29097ebb841cac86e6d/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/ca493613f41398372759952da7a1dfa61f814ffb/
microblazeel |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/bbba63fdb820d830adb921c9d990d4663c29d184/
      x86_64 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/6b077f6b8ed07377a8cb88e7c46c786b882221bb/
      x86_64 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/28ffda5f038ce1786214b42a6db79b0deeebe73f/
     powerpc |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/50fe9d759504869ab8367e882d2dab3365c17835/
        i686 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/29693914ed9bc03cfe49e0d100dddee12b9630ef/
        mips |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/bf84666df718f68815c47d15d3966ee96fc70052/
    mips64el |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/86e21b371e9c25d2a39c3d37cbd69b2bf00ac3ee/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/691c68e5f74b6802471e1e2b32ee057f13d8cfeb/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/65d77ca0d7b476b4becb043450832d9f3d91ee5c/
         arm | rpi-userland-b834074d0c0d9d... | NOK | http://autobuild.buildroot.net/results/5012affec6c85fe7749ac86d18d3c191f4e74bdf/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e7ac306490ebaa21cc997911aafa2d959bb6b60b/
    mips64el |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/54296f04946fd57635fd15946a25c2e0b54a9232/
    mips64el |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/3ac12f914c6b550754ebf502822df05b6aae160f/
         sh4 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/87d3d52b08b229aed748ab6e6e64bb9e908be72e/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/40b0c99b81f68cd69215fe7c699c872a88638730/
      x86_64 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/7da47f826373892cd4a8743c97bc50e07345dd4a/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d46a9e8e30e5e3ebec7accd4ae3bfbab1db299a0/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d0106e30589642f05618a38e7a26e4ca82a6aadc/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d19dc3058db05c5c7c08459fcdd938f3cc172e7a/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/a819c82343a8f8624df95c5fbcd58871f05b0b3e/
         arm |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/ddae966e69f52ad6734932cd4a43e1847c258448/
     powerpc |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/c56b237d8283f95b361b097cdc44b7b23b3d0c38/
    mips64el |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/b006cfe075469da24a7e563869aaf7c0a79e052a/
     powerpc |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/ae20df67f99f75b1ba5d5b7316ad265d66f3aa66/
    mips64el |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/89b1d2caf4840a7647b035c421663ef2c18c33fc/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/6db7dad4f06011fb6c29cda2b574139ba86f5de6/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/13cddf30b3b0e537ad7221b6824fc87ee7f39d8c/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/a5397d976e8f2a243667dd5bd12df53d62b5209a/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/3e7590566ed3cc7a1dd412fb66b7b987e847aa25/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/8d9c8bab4646fa05844073c61da15cdab421a9a0/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/d7d83bfe56f550a6ebc720db26405777b5679559/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/64e7ae86de1a38d80d56789b9fedd9af638829c7/
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/74c4208bfc026115c22b5f7c4a1859d93c6e4057/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/bf463e6a835126971598fc92927be7afc9d33bc4/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/93894ae9c14cba89791c2fde9773fe9a2de20004/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/3fcdcc2c93bfc4438c3b5a795d7daed9dce80bce/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a9e40c8f4de2c0755f21954c3072eccfdfa44da6/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/da5348f185ac402c046ec27f6274c8fe8c6750ce/


-- 
http://autobuild.buildroot.net
