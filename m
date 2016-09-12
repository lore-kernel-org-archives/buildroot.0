From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-11
Message-ID: <20160912063028.65AFB103B93@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-11
================================

      successes : 227
       failures : 94 
       timeouts : 6  
          TOTAL : 327

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 13
               libupnpp-0.15.0 | 10
                     xen-4.7.0 | 6 
              buildroot-config | 4 
                   pugixml-1.7 | 4 
                blktrace-1.1.0 | 3 
                    mpv-0.20.0 | 3 
              e2fsprogs-1.43.3 | 2 
                   fwup-v0.8.2 | 2 
                  libffi-3.2.1 | 2 
                libxslt-1.1.29 | 2 
                    mpfr-3.1.4 | 2 
                 opencv3-3.1.0 | 2 
           python-psutil-4.3.0 | 2 
               qt5base-5.6.1-1 | 2 
               wvstreams-4.6.1 | 2 
                           all | 1 
                coreutils-8.25 | 1 
                    cups-2.1.4 | 1 
filemq-e59951489045825d6fc5... | 1 
                   glog-v0.3.4 | 1 
                 jack2-v1.9.10 | 1 
              kodi-16.1-Jarvis | 1 
              libarchive-3.2.1 | 1 
                  libcdio-0.93 | 1 
                libmad-0.15.1b | 1 
                libmpeg2-0.5.1 | 1 
           libvncserver-0.9.10 | 1 
          libwebsockets-v2.0.2 | 1 
        lttng-babeltrace-1.2.4 | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** wait: No child... | 1 
make[2]: *** [libavfilter/src_ | 1 
          mediastreamer-2.12.1 | 1 
                 openal-1.17.2 | 1 
                  openjpeg-2.1 | 1 
                   perl-5.22.2 | 1 
                     php-7.0.9 | 1 
                  prboom-2.5.0 | 1 
python-libconfig-b271c3d9da... | 1 
qextserialport-ada321a9ee46... | 1 
qt5webkit-b889f460280ad98c8... | 1 
           quagga-1.0.20160315 | 1 
                    quota-4.01 | 1 
                  squid-3.5.21 | 1 
                sysklogd-1.5.1 | 1 
                   systemd-231 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
                    urg-0.8.18 | 1 
utils/CMakeFiles/testpat.di... | 1 
               wireshark-2.2.0 | 1 
             xscreensaver-5.32 | 1 
zbar-854a5d97059e395807091a... | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/33f637e3d612746276876860e662aeb7b7af775a
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4068123611b7b14e4760ca03a252fae17611217a
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/10535a727f5527a8a6288c959664e1497f86c52f
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0d1daa51af97cc840c921575e76be9b77d1a008a
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/43343be22e104c9289cf9e3653586dd357edd3ac
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/102b766927f7c0737e2c891e225c97c20ec148de
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/c69c506917557ced48f3a324e32dccfc286dc126
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/60f18a851f2f5764c74a1b61914538b30934eb83
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/b206ca77fe0a35818d94a78e6f431e1d61cc19ae
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/d33eeb887e6ab029461e07a969dcffba8914aef8
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/fdd98f842715d5d5c0853fea9e2b8ffcbe7ae261
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/3d85506b96c47927a0386e1de14f05b4c6b913e3
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/6232837feebe9e673e348096b4861106fecb74ad
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/9a4732e4792bce2c4f97f873688c2c01ce57f77f
       sparc |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/e85dd261b6ce44018ebace92c0a2d9c90223daef
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/16e7cc5ff760c58d95baae59ed4bf63e7e694c0e
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/56f15c9782037044b0e22182781621512c010a1e
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/7aaec857fac817003fc4334d4bc988cd84a4a905
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/edcb830e8d99a22eb207dec07339c9c34667fc4b
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/e0005cbacc8a312e63eb73d5bdf183604418b2aa
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9014da76d5bec742dfc6590018c3ea2526d9fb56
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8e2e60a66a58620b31b5283595a8e65bec9de449
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/4965867eb6a99b93b8a716a13d4750a0b1e79660
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/6417e5d64e058e4830af3876dbe27b10d0d3b4d9
       nios2 |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/5f35e59b818172a41d022fe13b09dc660730a900
        m68k |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/4fe7a9d7d7ae1ca3e316d3ee9dd90103a341b5bc
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/3c34fdd2a92cf96f60ffbc0bc8345a9490219300
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/4a7ff4e6b8d6d758844821a942e2446672cb380f
       sparc |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/75f051735eccb5d92c37670e5d66e88bc01d4616
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/754d55cfaadc4c746b3b02f2eed04cc6527f2500
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/f9e94405aad55ef0029145c0abbef630d53dbe84
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/78fda737a683e6f6b81029545451e63c09852edb
       nios2 |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/c7c9e0201e0bda475efaaff46e00d7ea29c0da1b
       nios2 |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/d9d3d523510881d7eb523b7ad0c093db3ddd05c7
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/e0fa11f75fb8053a1ebfbf46f6af577e00b3ec66
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/6da39f0a7989a2d622388ccdd3e45653de6f0732
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/3fb454a7722cbd3d24748406730c9f90b60527a8
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/e8c7024a12540c4455f4d64e28bdcc622059c720
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/b4b602d135afe00e22f549abe7e115f31480c628
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/451912ec7cffc09fe576c8bb1d9df807255f212a
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/2629b0133ee398118b147b6206f5983a7cce3249
microblazeel | make[2]: *** [libavfilter/src_ | TIM | http://autobuild.buildroot.net/results/f9d503d9e3d58e1f0eeea04a07848d8d3eec04d6
        bfin |           mediastreamer-2.12.1 | NOK | http://autobuild.buildroot.net/results/8c11da1e2b6c04b3f2c215c760d3a54747daae31
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/300882808a853756b8dffc7c971b3cefcac455ce
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/f21d8f8dbfe106ae309bde1cf6353c6b9fa98f5d
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/c98cb5f82b630f582e1f0de12a0b2b8528ee3dc2
      xtensa |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/701332e3c56b5043490fc373e8c87db31ebb4099
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7b77dcbacdfdc74a032bd436ef681ad928607afc
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/32abaa13418de667a8135be65b9f992399cfe57d
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/9ba2838557c7b82fe86b7908e078a9977caaf398
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/5e708c6e6c0f4cf39c4f62b9957c5b5aa857ace0
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/0ae01b7646cd598458eeca84c4f377317fd4680d
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/a337f1e342f1ae880b3962c88aa5ec02b0618cc0
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/511a655c43cb3b15df760efcee9de2eb33313867
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/e004b46935e5e81314de64340ed37055854d890b
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/afbca94cfcb1fd69ca4c8f8fee8c0243ca29009e
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/7ac411c8abdd8c69b4c59bfd4fc72a1d65f2da22
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/a3a32b8e5591aaf8a3e9c48c12ab475dd9588e2c
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/4860076ed5bda4aa79413967b4191cc557a77718
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7453f2e4bdcbcf6d346b1cca22828aba950270e3
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/677bf2a368e8febd7fe569218ca2597d9833cf2f
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/50cb6bdad6844985bf986fe3e853003accbd86cf
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/3657c874813d3bac94a91692ef5019b4c5c57128
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/f438ee0b7c87398896aafb1147382473a10d5aaf
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/6ea12858e955822a92fcaaa9e33b1bbf777d6d90
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/7dc2ac95f9960803308cf9997d1cc2586213ac16
         arc |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/e1b3c77a3cf70b134082feaa8fd9e48ee5bc155f
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bacc54d90b1c90576e20774dbcf53d63f778b1eb
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/0a266ab98018c23dee44ee956e50df8b1a93e93b
      x86_64 |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/7e4f372cdb08bbe6f2a475f6d9b558965c0ad685
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/92d8414857343bb5b2aae501aca000e5606f428b
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/11d8d7b8ee8b4662bd7df7cf369e81d49acdf9cf
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/670e87a338404a92a546f8d536fd507c3b2375da
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b905a7cb8a80f4adcd01dea6274b24ed7e200c44
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/88bf652dd29ea622b4e1163a8ea92f984ccd51b4
         arc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/86f5d0e6b5a955c964d5ff2f0786fdefafedfe5e
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6ccdbcd7a5b867d29bd4f7a4b6b1185ca45717ba
microblazeel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/49d4c0e320e42fc623455f26fd06bf4cffadccac
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f974fd9c4226aa9392f60aa3bf26c38ec744f4b4
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2705dd0f4e8b2580ec64b887659960ce0e2dafd8
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a6ae9a017c505b8fb55c0b87320a13689fd68b26
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f372e5e5403e98499f230a9b9059b26e2e1b926c
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d69e732cc8d12af36f16fa9d78811f65a50c95df
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/67faf02bd607d6843a1d7789e9d7057b174b1d30
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ce9ae05e4a0a1ec5e4aaf02c10840dadcafe5aa7
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d3a537a8e148bd855fb3a04e6faabe4ea941117e
        i586 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/56160b963d85ff110d966f3ba99dc51984353493
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/d767b605eba1d5ff933972ec74f5c7a96a660ea2
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/0af58bf06e0fd11fec0bd3e4867287e155dcbac2
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/e2c70bdce149852a9c71683872a2d4e3970e964c
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/665b5686805523e79404a19f0fd4fd040f4890bc
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/9e733b8afb51add44fcf675fb25c05fe52773de7
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/fc39051eb0c466493a69bd9a320e6046a66db51e
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/65096ed770f89da2c928f504d84fc811619037d5
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/051d916bb12f1a0a0bfc5e2362e7a9b1488717f1
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bcd784b22c0335c04960e1a5601e1925134f5edf
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/563f086f127b2a59edbe2adcfd730378d1a5d5f0
         arm |              xscreensaver-5.32 | TIM | http://autobuild.buildroot.net/results/f7418f9ce17b52586d781715a0dbd3d0208d780c
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/04a00ffdf605701f644dbc3165fb74d437724b4c
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/91f3d997974ce2e23b8e98b665d6308cff377e6f

-- 
http://autobuild.buildroot.net
