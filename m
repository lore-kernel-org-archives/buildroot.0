From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-12
Message-ID: <20151213073021.B22AB10164A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-12
===============================

        success : 218
       failures : 114
       timeouts : 0  
          TOTAL : 332

Classification of failures by reason
====================================

                 libeet-1.7.10 | 11
             clamav-legal-info | 8 
                  ffmpeg-2.8.3 | 6 
                  gnutls-3.4.7 | 5 
               wireshark-2.0.0 | 5 
                  boost-1.59.0 | 4 
               libcap-ng-0.7.4 | 4 
               read-edid-3.0.2 | 4 
                 dropwatch-1.4 | 3 
            netsniff-ng-v0.5.9 | 3 
                 libass-0.13.0 | 3 
 host-python-setuptools-18.7.1 | 3 
              alsa-utils-1.1.0 | 2 
                      qt-4.8.7 | 2 
                 liburcu-0.8.7 | 2 
               libbluray-0.8.1 | 2 
                directfb-1.7.7 | 2 
             util-linux-2.27.1 | 2 
               arptables-0.0.4 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
        ltp-testsuite-20150903 | 1 
                 opencv-2.4.10 | 1 
             host-nodejs-4.2.3 | 1 
                  libnspr-4.11 | 1 
                     rpm-5.2.0 | 1 
                     tftpd-5.2 | 1 
                   mplayer-1.2 | 1 
                      pv-1.5.7 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                libvips-7.42.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                   libnss-3.21 | 1 
                iproute2-4.3.0 | 1 
                    vpnc-0.5.3 | 1 
                  c-icap-0.3.5 | 1 
                 mesa3d-11.0.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
               linknx-0.0.1.32 | 1 
       openpgm-release-5-2-122 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                  squid-3.5.12 | 1 
                rtorrent-0.9.6 | 1 
                 fio-fio-2.1.4 | 1 
             iputils-s20121011 | 1 
                   slang-2.3.0 | 1 
                   libndp-v1.4 | 1 
               syslog-ng-3.7.2 | 1 
             lttng-tools-2.7.0 | 1 
                  trinity-v1.6 | 1 
                    ofono-1.17 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   msmtp-1.6.2 | 1 
                 libdrm-2.4.65 | 1 
                   mpd-0.19.11 | 1 
        gst1-plugins-bad-1.6.1 | 1 
        portaudio-v19_20111121 | 1 
               iptraf-ng-1.1.4 | 1 
                   nginx-1.8.0 | 1 
               findutils-4.4.2 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/5a5144a41ebbb81406fedf44441d378cf237ad04/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/d099cc9e0b7a2da03e538aec06523f6319894c20/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/3703f666fa75a72d2c6d46d1c7b480bd4e32b2f7/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/fde82db8f263d552081a7afbbdbfdb4f8a64076f/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/1660b2fb373b375aed82242d277003901443c57f/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a4f7e4c00acf1ba2c826ff8a93b98301e71be655/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e0acc7ee67c6bee20d98586e70317e24bad1c2ba/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/23078923dcd9bbe0c3aae95833c75f1d53596e15/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/bfa0906942cb251a84783aed0230c48ed6738a1e/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4cfd006290b89ec1a8d2574631f84d8840b945ec/
         arm |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/0ed9da54c2970dad3bf4798ff783af3b242bba61/
     powerpc |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/82633585fd3aec6d20ae44d0307827d2e0ca7c5d/
         sh4 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/7b91cdae1721c49b0801de9cae01b1fb5211b019/
         arc |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/182ff1048bd5366bbe0ace38730faa93fe123fd8/
       nios2 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/bdbff2fa02504720c0f4301a7c2907641dc5f998/
    mips64el |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/cabfe5ed4421f6fa60b041603f935b7fbac5359b/
        i686 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/a2b678e45366472b0bba8c9f7fdcbdef21f592d4/
      x86_64 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/d5a28aafa8a5b2035cd9a933a9d2a693426a925d/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e73590cc78ce5f59e1d1aa6fa2234c2680185370/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b3888143ee17c3de725cd7323293bb9eb7115c0a/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3fad4d478fb89d77408842ae978f8c548a476d37/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/aefbbaf4f2a9f7a5d91f40934848374436b012b7/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/72a4772d35ef3f30472b9e8ceaf4a9a958368403/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/2a18b121ac6acbbd12c776ee9f963d5e2a340d64/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/988c2732f67788477854984d7a9973509010dfca/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/8b27e89f2163c02efa1726c51d84932c7ab28557/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/952fa3ad25b91450aaff090a6bee62adf2a21b97/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/430fb0c975cc65e88f6a6ca2e1ad2c9756b5de38/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/1ab625259ad4f7e91d660b375ec0f9d9b41f949b/
         arm |                findutils-4.4.2 | NOK | http://autobuild.buildroot.net/results/e344f2c628df096f61e6a250bd7ab0d94f8ae1b1/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/7fa5e57bca0b2d22a6758aa7dbf765d29d9cf38f/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/21e56aee4dbf00f8e7d4bd066b2f691d7ceeb8bf/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/268f80a2842d8be7007d5743de2d0545336837a0/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/1c0830446485956e6760275217fbf39146bd9561/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/faecde7a9dcc09cb15124843f4b1a0d3d0aaeeff/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/33f614b7ba1a9a580f49e2f9c181788cb8b8db20/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/c92c40990aeb2863ef2cbde3260ea6463c21bf31/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/c19ff67756c49e0dc5ef2b42f39f88ae488f0e64/
      x86_64 |         gst1-plugins-bad-1.6.1 | NOK | http://autobuild.buildroot.net/results/0634d68a9c565d30267d2edb175d2cb679660396/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2ca64c9c66eb88362c17baa32b958d08e577d995/
      mipsel |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/754e31dbdee243f3b51c7fbefb363e942db32c90/
      xtensa |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/effc2e0586e65d69f09af4c1c381bc99841e79fb/
    mips64el |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/cccead585e3dff064b04cec9adb7aa80dd88da74/
         sh4 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/c47798dae1ce1751609b3f84489266ed685c093f/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/8adc3cb9db470511c44b17fdebcc7aa75db4f03b/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/942f022c58ff633fd17f758a56b1dda20bbd0f64/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/890da8f8d25952cac1bfcc443a740e4629204e3a/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/a9abe807c61c26ebf911e0821bd2d9b61849ba35/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/c629850e4b1ee06816555e7ca6523212fac68909/
     aarch64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/981dd2b131c231f2c01d9e021f14e40897543989/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/cebe1a9c44af5c592a75a25c526419eac97d0985/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/4c3bf1d11d94c49e8075747a18b5bfdd2df5cbca/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/5d3df2d87a037c74c1c81774db85e839e1aaed52/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/182a8f62bd106d65bcaf464ecb66767f3af0b94a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/76b243c9c7edf21edd5455486990b1fdd8705d21/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3470bd7ab7d6524ca51b5924f5c2347e46253c9c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a4b64c20a17b9bbb55b914da985e9f0ae1a8f215/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2305bcb26f07fa32f55eefc0865442c8ed80e05c/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/f00c5cbf140be77880d3f6e239af8118dfa2d6f3/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2c0832bc27afd634b2c2770a0bcb296592008c90/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/853174a9e6dbb69378a61865356ed3bbd58427df/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/a4a4c9522f861961c3566e460b1c8840366921d2/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/15a8bc97a3c752056ed61f177e6a9e1fe022925f/
        sh4a |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6bba70bab75443caccbf39d24d4e6e76f407cfd1/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7ad4992b34915c84e2e2f7c8a9cc01f09b6e0eb8/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/56895d6fe28d1f1de9112973b1796ce585386586/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d299d598f15906163765edfa48c7bd918b020629/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/fc1f59dee56396fb18f4895ad8312a13fb32ad38/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/968f0841c2505a683a60c2b05f62c3ae79d16a9a/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/115a0165330168ce5c052a1a30b75d648aeac979/
         arm |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/ee53feaa225e49e84cbf1634b0b1fad5acf558fa/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/0b7987185731d1f8aaf9704d6503b835eed1d0be/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/3c48edf71fd8dff2932745299180256388959527/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/895150d57453ebc0d9d643727b3e763180cbff71/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/a9091d1ab492a35be50afbbdaf939cf15fe55dee/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/3d9e8507da63ba54067181fe1bdd20ae6854ec95/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/31f120156ec55eb1bed011a33165bca025e0ed49/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/82d7adc72d903b77905216f642d4e0a396760025/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/8cc1f6cb9baafa603878470b5304eb0f91e041d6/
microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/86c61205e6da3cf2da864e8f4bb4ff2b738a90ff/
microblazeel |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/ef07511bb563b30a5d726f52f88f6f8a3c018992/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8d08d6418ac80c5c6992cc8fe2b885f39253bbd5/
         arc |                    msmtp-1.6.2 | NOK | http://autobuild.buildroot.net/results/a7704f2b1d6ad28fe5ff13648a87a10d3b81b3a9/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/25726726fec23783e7593b8b69fca4c5265df5a3/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/cb8290f384b0a0bdb25d1bd54e94a71787052fc1/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/96e9e3df2fac478c67617b35c3711f98d322dd33/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/69b105efaf05d6241fbf83bda9d24866c1813469/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/25d8dd372399594648885d4e7b7bc8537c018659/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/2c9eee00c38c6871c09f63c578b88511827ee9e0/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/f304537634066516596267515aafcb618e571bdb/
       nios2 |         portaudio-v19_20111121 | NOK | http://autobuild.buildroot.net/results/80b83dee0570af25d8a4d1274b0ed947eda3acb8/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/294af463773313aa3355d6c09dcd270816910a81/
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2a336afd0b8fb1d89a1759f21ad062cbc39f5244/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/29012f45757206912723e0cc16acd45c6981dc8b/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/8cc9a525b1f69e450655b47712a647345f91eabd/
microblazeel |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/8a61c0f681690d3b542a28857f82befe881c061a/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/d1275c98c23d40501c1db39c0f210b3014644c63/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/5d4c6e4ac51663713ff39d48cba27a78f4290fe3/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b2b0cd0292dec110ed05d5f130f88097d376d59f/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4dc8982dad36d78970e26b81483b2dbf48711f77/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/916111c7fee886b62262410df4aca7e0a988a6e8/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/e8d0522f91c45774876ac0a7ea8348f0a8ef6d23/
         sh4 |                   squid-3.5.12 | NOK | http://autobuild.buildroot.net/results/dc4aae801d8d903123eadb83e53da0bcaf6e21bb/
       nios2 |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/b06c8d1ab0ee93a6e7ac155df9a735d396ad7ccb/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/84dbee5314d726d9f22165c903251c13aa1531de/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/06a7f12dccaa904e09bc3402dc34fc4f6f8d483d/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/9c2ade50f60b8877bf889ef893e2ce5f94d3acc2/
     powerpc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/d42f96bc5b94e993c6534b6e5c31f41980bdf989/
        i686 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/0c17baebc4028eba240cc811cbf3e0a2b1a79a70/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/9af7aa0dbebe17319557b87d7386084f5a325db1/
       nios2 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/c9af3cb87846f066ac09f09090fa7deb294da890/
    mips64el |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/d7fd5dc4ade9a1f7c5fe7fa8b97e62cf9c1a890b/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/42f69a67f0184b9d1ee145de0ae2f78de7a6a0bf/
     aarch64 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/6fadb5da6c1c412291312d73204b8eb60fde0d29/


-- 
http://autobuild.buildroot.net
