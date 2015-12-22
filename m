From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-21
Message-ID: <20151222073021.3B3731018C0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-21
===============================

        success : 230
       failures : 105
       timeouts : 1  
          TOTAL : 336

Classification of failures by reason
====================================

                  boost-1.59.0 | 12
                  libffi-3.2.1 | 11
                 mesa3d-11.1.0 | 8 
v4l2grab-6a52a234e227a30e16... | 3 
              rabbitmq-c-0.7.1 | 3 
zbar-854a5d97059e395807091a... | 3 
             util-linux-2.27.1 | 3 
                      qt-4.8.7 | 3 
                  snmppp-3.3.5 | 2 
canfestival-7740ac6fdedc23e... | 2 
              gst1-libav-1.6.2 | 2 
                    ustr-1.0.4 | 2 
                libvips-7.42.2 | 2 
          libcdaudio-0.99.12p2 | 2 
             irda-utils-0.9.18 | 2 
        ltp-testsuite-20150903 | 2 
                  connman-1.30 | 2 
                  libnl-3.2.27 | 2 
                  ffmpeg-2.8.4 | 2 
libubox-e88d816d6e462180f03... | 2 
                 dropwatch-1.4 | 2 
sconeserver-3b886c3dda6eda3... | 2 
                   mplayer-1.2 | 2 
                   mp4v2-2.0.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
make[6]: *** [libavfilter/a... | 1 
freerdp-17834af7bb378f85a3b... | 1 
            kodi-15.2-Isengard | 1 
                  aespipe-2.4c | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
        gst1-plugins-bad-1.6.2 | 1 
                rtorrent-0.9.6 | 1 
                 qt5base-5.5.0 | 1 
                     rpm-5.2.0 | 1 
             stress-ng-0.04.16 | 1 
               openldap-2.4.43 | 1 
                  trinity-v1.6 | 1 
                grantlee-0.5.1 | 1 
                alsa-lib-1.1.0 | 1 
                   erlang-17.5 | 1 
                   mpd-0.19.11 | 1 
                   attr-2.4.47 | 1 
                 fio-fio-2.1.4 | 1 
                 lvm2-2.02.138 | 1 
                   glog-v0.3.4 | 1 
                  libnspr-4.11 | 1 
                   kexec-2.0.9 | 1 
                 igmpproxy-0.1 | 1 
               iptraf-ng-1.1.4 | 1 
                   luvi-v2.3.5 | 1 
               libcap-ng-0.7.4 | 1 
              squeezelite-v1.8 | 1 
                 gtkmm3-3.14.0 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/e7ce699ebe3669ee164c3fa841b23c8e75db68ca/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/b33919ded5a0d19167c83dc4c53dc7f941376b65/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/74ea80eda39d8c2b0c8bab4effbe304908ef4d58/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/70ae1390b814171298a9d5463e3a023721138ea2/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/206a1259f2b14797c49eb8e820b80e05bf729f47/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a1bf4a3ec3b12bedf6efbf702a372d3c8748d799/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/953bd85fe085f36bcdadd33ba7e9069076fe2a38/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/59b25bc25608494261160a1ba47cc03e0b328f95/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d5fd10903e36489068f2d1cdc95f6356ff4e9624/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/af8d37bfc8a3a425f02673a341ffacfac74e13c5/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/1c15a4b61be5ad1ed57fec3e1ffe52158ed9a5a1/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/922e453eb0db00515b912ddbe4468acb80b819a2/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b7a1f193588c3ec7a97e5d4608a1b1bba5a487d5/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/65bb939d4ef3f6e190ee4ea97cac263206180944/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/50a37f9c027f7dcfbb1fdc3c7861ade6c449bfe8/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/6596234c36c6f6f2a050776fefcba04ce3768177/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ae4042b85f08f982eb7c1cacc26546a483f5b87d/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d581d228ce4cbca86484404e99ab9dd53bf7ebe9/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d95fe9c458505256332099319f7edc9d3167689e/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f6ba6db65a479d371e760708be74fe2521dc2fba/
     powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/26585f40c5697e28215696e3afa6b87f10f3976e/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/383013e78645e8fa7794d0178049cbc6e0785885/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/9d67f88b8cc097220775c66511ea1dc353a6799b/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/13227ebe974c4427d7d6a0ff7fcfb5ac776e6b20/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/a991fca609c26c0d424727864397bd3423926edc/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5eaf628f5f9bf2d7b4bc2c9edada534d5646935c/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/b04e56d259b9b70d0d7312892424a2787b32f9f3/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/9e532866b11dbc32ccda5357fbcaa299338cb99f/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/3e00df65d9c8d59db09563941c574922d9953367/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/7e66f6981e465c4abe14998cf6df82568d70229c/
      x86_64 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/bf94bf22ac2752d8a1596baf8aab9a904c238c57/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/2fb5a5f5f36c06c4ec365e3fc19eef8131b0ff7f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/75fefd205e78ab55214a60dd630b652b26a27e1c/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/891b87d44b10e44a090b40cbce855b1240ade71c/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/f67f1c2a627a6d535dd5c00e2ee131b5c5a99a0a/
     powerpc |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/6266f239163fc1282bddad6ff586411e5c351122/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/2e020176e2f74d7e1d420466ff0a9993242ace01/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/14b0197e9270207639aff87bee731693aabc0771/
        i686 |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/d52e8c4fd272aa341d5195c54cf7a63d2f689fff/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a0ac5217f5a31aeaea5d7d758e5dd1206d122be3/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/7f3919bec23c2e71c6e372fc20806c319e58c83e/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/52737f382c91aac1f4828831c039646d0517fab0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e9acaaf92f078cc98f15aa600c71f4710b4c3b39/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3b97ca027ebcb94a3e3a2ef10393ce72a5d70efe/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ed5ee826eda06b104bb8e17b93bbe19725994461/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0b5b070d1223233316d0983346ea03c7e20e9572/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/aa6c71c583586058d124b1cc5bf311cc48a04e8b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/aba72a2e4c0e8eef35be51a768745b376695369c/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/363a23ed0136b3f82380468000f87edfa6d0ef31/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4aa84f2439e879ad702be9ee3b3490cc4628ca01/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/be4e22dc46fe0288c5d2559d6c7eda19f70c2825/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2b05ee18ec6b45f6c7f13036d152351605dbc839/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/aae5ba9f845720fecf9bc8b250ffa97ed7cc37a2/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/7217730dfeb43562cbd9addbd7f67798431418e8/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/dca11f750960988dd66762ccc0feb16bf49c74f2/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/169be7c01325287019b383c6d1ac6ad2f14c6d52/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/09ecc6ed6df41974dbc122e2e0b8aca14de0a57a/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/8b6c1d99c197190d1634381469b7eb56cc458ffb/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/84c6948ac76174659b928d6f1541663a4272464b/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/f4778814f68dfcfaf4e8d6ea74ff0df7c76232c4/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/855f2600b74660a8c160f8b1f28c9b0b2a792ad0/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/c3ca061b81e711c2477a743d3ba6971c9ccec18a/
      mipsel |                    luvi-v2.3.5 | NOK | http://autobuild.buildroot.net/results/0ce4b59d38c1881e2ebe07c75ccd51fcf09ebf94/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/acad70a33f1806d2e024c5066034e732b6d0ce07/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/f64e5e90ef602e294eb20dba61c87b9609391fc4/
         sh4 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/df6e7b389757fd10bbdeee92126bd5f9719b4bd7/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/e0cca08071fe90bf64e02e1e79155380d93ac4e9/
    mips64el |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/dfa58e97302fb0228f29b8925e0037b6de3219da/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/a719a8ebdd3943f8e6933fd64a7cceb53f370239/
      x86_64 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/606b9cd4d103c7cf432f814e511caa544f4c7ee1/
    mips64el |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/3be671a6f0ccd42e02aeb12f36a6a75f4438c477/
      mipsel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/0f517bd789799ec659e49137f36acdfbaae28ecf/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/f6e264f9071351ed57d2f449632debe6ce173b2b/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/9b2d5897fc0a86a480e78c6adf45acb8469a03ed/
microblazeel |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/e9c4c27cc9ba596a88f3a8c0cf8f4c259250dd2f/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/82f40257f495f4124085f5f7f5ea2f978180dcb8/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/457a35cc9ca66fa5a8f41ea899858e1150295dec/
         arm |                openldap-2.4.43 | NOK | http://autobuild.buildroot.net/results/43eae74b6341c21a618d78a5938da6bd8abcd546/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/48aee2ff29a2874485f8f344c70e98a85ecce0e3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/42b565c42b896b6081fe0ed04f27ce6d52f7831f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a4f932f2b7f30b2bef5e85eb848bc0c885233d21/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5be9e672bf40ff45bf73b3bdce6c719e1d776017/
      x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/a1586717154efb6495dfcdb5c7ce11a047dd68db/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/1981d87ff345483ea7b102e9a0d0d149eea508aa/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/ddd37b9b8bde982322b25b5ef41777c52ad50c10/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/17715399d192bdacd0ae00f650e53a9eb22dd2eb/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/9c47aeb8b1c39e95aed8cc7460117f5a187592f4/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/6952c2b869192cd729156fb06ada1cd468615995/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/f9a323770516c203c9824b70e1727583de0b8d28/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/e569a1ec5f6db90ad99779881a1d45c236b1e1fd/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/0ca02ed6fd4dd054ef8963045e3ab1f9d59a70b8/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/d0f744999c6b7fa1f838c524e9f78d1dae827d94/
    mips64el |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/78781e815829c402e1140623fb5c4090f139214e/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/60e7b75bc756cebf48f963ef5a712f06e3fcf2bb/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/d67d131036cd5ce1c1125322d96586bcb21d86b9/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/c0a6ec962cb405679a51e65cc487b6311efa16c3/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/edb14c398368fc212330ccebed990e99cb81e00b/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/e1eeab10eaaa66869de47849a64d31cc1f97b2a1/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/5e1d630f37545745ee02ef85b42c4ad5bffbd7bf/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/5924ba736df224ccaeedc458510f298845e652c2/
         arm | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/c4382a7f29e1ce52d3caa5d864b856112aab7e99/
     powerpc | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/6313680ea39c5012769422342160adc5605ff54b/
     powerpc | v4l2grab-6a52a234e227a30e16... | NOK | http://autobuild.buildroot.net/results/ca0c32f1e5152f657f464fdcf04f3d25dfd48e4d/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/bdd52a8166282d79395179b303e08a91620919b4/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/e6bdb564908fa12cb6012c42509cb36ece2580f4/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/696138f1a4a21ea40cb5cd835d5794420e63d0f8/


-- 
http://autobuild.buildroot.net
