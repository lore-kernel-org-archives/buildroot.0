From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-27
Message-ID: <20160328063023.020B0102AFA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-27
===============================

        success : 177
       failures : 118
       timeouts : 3  
          TOTAL : 298

Classification of failures by reason
====================================

                     tcl-8.6.5 | 24
                libldns-1.6.17 | 12
           libimxvpuapi-0.10.1 | 9 
                  connman-1.31 | 5 
               linknx-0.0.1.32 | 4 
  getent-buildroot-2016.05-git | 4 
gmrender-resurrect-aa3d02cf... | 4 
       gadgetfs-test-undefined | 4 
                    norm-1.5r6 | 4 
                 jack2-v1.9.10 | 4 
                  ffmpeg-2.8.6 | 3 
flann-04b4a56533faf8c8228d0... | 2 
 make[1]: *** [all] Terminated | 2 
               ipmitool-1.8.15 | 2 
                wayland-1.10.0 | 2 
        lttng-babeltrace-1.2.4 | 2 
                 raptor-2.0.15 | 2 
                  boost-1.60.0 | 2 
      ca-certificates-20160104 | 2 
              gst1-libav-1.8.0 | 2 
                   redis-3.0.7 | 1 
                   mplayer-1.2 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                      qt-4.8.7 | 1 
                    yajl-2.1.0 | 1 
                oprofile-1.1.0 | 1 
make[2]: *** wait: No child... | 1 
                pinentry-0.9.4 | 1 
               tcpreplay-4.1.1 | 1 
                grantlee-0.5.1 | 1 
          openpowerlink-V2.2.2 | 1 
                qt5tools-5.6.0 | 1 
                    ruby-2.3.0 | 1 
               openswan-2.6.46 | 1 
                blktrace-1.1.0 | 1 
                    cups-2.1.2 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 mono-4.2.2.30 | 1 
             netbsd-queue-1.70 | 1 
                 mesa3d-11.1.2 | 1 
                  apitrace-7.0 | 1 
           linux-zigbee-v0.3.1 | 1 
                 opencv-2.4.10 | 1 
                 igmpproxy-0.1 | 1 
xdriver_xf86-video-fbturbo-... | 1 
                 libgee-0.18.0 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/bc8dcd96a0aa34ced997066c4d2751ad0df9c1f6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2923ff2a7952be37186c3367629a7cc36ca58be6/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dba4d2e271658a5ad6e83d05145fe94c0e276798/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e7bbe28aa9a7b8296effa80dad6e3b8ffad1e3b4/
     sparc64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/5ba6ee827a068223b58bef07102be903d8b5e560/
      x86_64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/053380279956bc31d0f51f8d6f3e2d53274fca4a/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/918b44dd8935e60c3bf357e3f5ffbb1c78d17c7a/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b05e22f81eeef4d37ccba084f63b5630454943de/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a85b6dc2cf32554e49efaef446cffa68b963b976/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e3b000ee2f8728347583c877ae5f4e16999c1c3d/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/117bdac97fdfd4d8753180bf5a10110aed1ea6b5/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/40f25a9b851dab5311b47a3d0c0ec3ab6262b7f7/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/110c52b3bf21926e0d03a984692c29b80d2b13dc/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/90999d03163cea04399e467810ffec3113b1367d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/ab7e8179f91fda2d9b91a0758d2e68030ee8c44c/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e6644437d73f9032db0057d4d65521af686cbe6d/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e4b7e3f7692e2ab76eaace00da1175a6be130109/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/212b65d8313bbb268fbeb4ca646ec78120c88f3f/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/72134db34c32bf1f5d39247092becbaac997034f/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/a83b6c03334632c92f65ef8fefdfec0f5837d34e/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/0d43a93d26a7a94037e7e60851f2d7d478b2d854/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/de536983368ca36d77c0a8133e99a7f2f01f9dbd/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/b32c93dac3b4eff97e0bc5947ab688cb9122665e/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/f05ce1e5ac195516c75def0bf8ec5cb23b4d36d8/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/5929e885d38a34d08a80230e7edeaf6268ca7127/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/220bc16375c5b645375ac265a567a0a7a3be0096/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/030722b5374baf3474f4b549a869ca7826d179df/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/86b4d5a0b80ec37718644285c5df702af99eae6d/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/a5406b6467e89a0bbf02ace143e15831600a7ece/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/7ee104bc8247e13a8b7fcb7634ffa952ae3e64c6/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/d5c2babcedc33b8622d0541d7ad05459983ab2b7/
      mipsel |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/48ca3d9ca4eb27915eb560f9b6460455639cf10a/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/c10a7f0cfe609959c767fdfd1ef2535e60c6b7b6/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/4fbb5f47d85d07d3b5990c4ea1039bc9c0419664/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/b8202c72f4d42bda27ea6f880958d72c9cb99739/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/cacf8179a9c8142eef69562462d3c3b0b20c2879/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0004a31c70bcb3e656745d91892c01be339bab2e/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e7831d3c6015af5b214361b16b9fa53b7e15bd82/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cb9df6fee66843a6753182b6cbe40ce411eafac5/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4c077be341682c2e3d7132df332188f160858bd2/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/6087bf3a498a8f7b062878c55e1849fff6bbc551/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/01082710dc7bd6885f50c67f0e9a3b20a644ca5f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3fcd9e339bc0ff89ac2bdbe030f6a1dd92fe7619/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/088fe1ecb49545a1e572e8354d643c1b5dbb415f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d4853b495abf4608b87da38ece1d1117d3955b41/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/6ebc9a1667f11bbf1de25befbb0f4fe324967020/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/bffaa18b335c18f956e864e67f1230ce681e4566/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1d620f777a8d01b0b6f16b19bb64a60ccabc6a3a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3f87f5d0c1380962be9c261d76593b8d6a5c041a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4d2b42ccbfc144ad948beac83e5428c4a1d33a7f/
      x86_64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/5a7fe02ec5bf320990581f68097d74a483261f36/
        sh4a |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/ee572eac906140d7729c709cf1f361e21df3f4b5/
      x86_64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/0cd9766285645689a9ad16fbc1ecf33f19cbc6d8/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/eebb37029d6e84ac32c82bdc2aea1cef8b663f49/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/ef47654b7f369e5f290c21afc113de49ca6dbcdf/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/35be591e0d3d11f21e9f16e12804b035085256c4/
      xtensa |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/ec9cdca2f10aaac2be768295e2f3d952e29821a3/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/66f9cd64614086b198613f7bd0fa1a03ba891540/
       sparc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/51503fc4d5a22320d960ec6b554d666846a4777c/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/e18d8e5a775b2777cf79f8a37562e3aa0672c64c/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/573679339e4c9d2613e7e74eafabfbad937c9210/
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/105e3f352349d3411f16fc517b82cea53907a89b/
      mipsel |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d8c72495d2b4f43cfa567866569b14dc5cb69347/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/1211c39abedfe9af6f7c92b5927208d91f5ec80c/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c9e6a66c1b87fbdd7592989491944e673c797584/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4c67054c04ac83f4494bb717ce35edcde65bb31e/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/04bf77eb217df5a419fcb6da93c7e13650d95c30/
         sh4 |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/120b1ad692c562dbea7f3a7bb5011876fde1c430/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/83fc07e3c75bc22400d3d9fd05b264e85127a8ba/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/2516e04de6893012cc30fe6f4298fbf17d88b3b2/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/1c38c87b0c119dabc993b530fc6bb9dff11d54cf/
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/82de03375139d7108cbddecaf9eb010329eebcfa/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/60e63a95c7cb5bdd8af35e7e8468dbe13eae673a/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/db13b3ee80b92ebdc30fb0b6079999b111e2ea37/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/25c48743eb9b4099523ca280e90b185646963fa3/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/8a7df1109dd0e27ed7faeb37740f55e8995b2977/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/eddbda668c7cf297f104d3b5df2393a6cc62d837/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/7d4912e09f11f6c884134600e2f16a06fde83b8e/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/0f42dde72e38b1363cf8c53c9172b1109d8e2b5e/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/7f4d387185603dbd4a47b492a0550378baddadc7/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/98b0ab4c2b9d908d4174e0f42d1a81106f2870a4/
      x86_64 |           openpowerlink-V2.2.2 | NOK | http://autobuild.buildroot.net/results/d2150e520524b6b9335c0818bdb0051898f75e8c/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/22ec80a387922b27b05549052959dcce960d9cfe/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f2cd36b25431045937347d43a89d4ec07f51cf6b/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/56b33d6a6feec7b848afdee7d6344a19d11e29cf/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3886dd74d8d3f5e9e37a1d1de1f6542020d7d2dc/
      mipsel |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/cc2453b535e06969bacd763bae71b6e36728a449/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/89c9dad226fa4df46cbbfd21e48358eb52ccadc4/
         arm |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/496715348d1f0fb1ff1b729ab457c1993e4cab31/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/e919d8dc6ce8ca756e88c392fbd79a339aea4aae/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/998470c9cd9290e1942ab9fe129779cacb091da1/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/4535699718e4314640004f67c1260abd4feb7666/
       sparc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/01574f4389b3223d78d8aa7428c16055b89d358c/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/73f328d89193fdd655cef617fb56d811a2ae5061/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6d088bfff6ecfed1bfea4b10a5bb83bd6d3c42fb/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/77ab28a816051719bfce7251d9cc9a60601b5ea7/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e2b1c77d3026698babed29467eab45200a7dcc4e/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2a46c0babdbb0cf1f3ff413b99310ba4a28452a6/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a96655b9cb63a6b3c44cc14487248108f678ed56/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/44dbd7a0c3466ea67d8b009abcee49f03d87cb07/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9c1cfe35b44a271b2a0bfc0c1968e132077b6288/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/696ece4f3f7fd9406306ffc2cc24148ad7d94c94/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3822594c29e1ae88645654e1d4bfda2d0ff97ed5/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0d946747aeabe912c1ec662f5aba0bc94c429bb3/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4fe8cf63f8848437f5c911b47b27f0987a149a08/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d73a7d188ebfb42cb4bda89747b16acf855b3d1f/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/77ec16d718b0eb8135785638a0e60d1dfc49f375/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ebf0930ecb38453bb56bf9bed1b94794dc19dd05/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c629fb4142e62eac6078abaf10306afc4c675941/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b959a2801ef00c14eaea9bf60097a6d074623683/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e9a1254e8b6bb24287527ed446bcb4cba42567a6/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a3553330443fda164d5128af9f8b3ffbf8bd5d91/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/85dce7522388e445f6ac9845b83d1f86ade2a77a/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5d3d30ecb89eba971130d6c8bf2d36b53b7228e4/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3803882a81879c95a32f8538efdd68020d4dbfe7/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0675850939995cd504e0ebec1ef767041d665c9b/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/e7e7744ac0a22eded05f237e40b0cdaeec4ce005/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/c1fb375d35616ae6eabd0eee4072282d15c23b52/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/a0300c844bf87255fb4682b0e7df38e6b6e52b5c/
         arm | xdriver_xf86-video-fbturbo-... | NOK | http://autobuild.buildroot.net/results/2ce3f30ddf7bf486c2c09630b01deca333450834/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a5cc805111586e54aba80bb3e552ef2dca3e4247/


-- 
http://autobuild.buildroot.net
