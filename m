From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-14
Message-ID: <20161015063031.33F2B10294D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-14
================================

      successes : 215
       failures : 133
       timeouts : 1  
          TOTAL : 349

Classification of failures by reason
====================================

                    gdb-7.10.1 | 15
                libgpgme-1.7.0 | 12
               linux-pam-1.2.1 | 9 
                alsa-lib-1.1.2 | 7 
                     vlc-2.2.4 | 6 
                 libnss-3.27.1 | 4 
                 lvm2-2.02.166 | 4 
                 mesa3d-12.0.3 | 4 
                    pppd-2.4.7 | 4 
                   assimp-v3.2 | 2 
             ctorrent-dnh3.3.2 | 2 
filemq-e59951489045825d6fc5... | 2 
                    hans-0.4.4 | 2 
              libarchive-3.2.1 | 2 
           libvncserver-0.9.10 | 2 
          motion-release-3.4.1 | 2 
                 mplayer-1.3.0 | 2 
                    php-7.0.12 | 2 
          shared-mime-info-1.7 | 2 
                     xen-4.7.0 | 2 
        xlib_libXxf86dga-1.1.4 | 2 
               audiofile-0.3.6 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                  ffmpeg-3.1.4 | 1 
                   fwup-v0.8.2 | 1 
                   glog-v0.3.4 | 1 
                 hiawatha-10.3 | 1 
                ipmiutil-2.9.9 | 1 
                   jamvm-2.0.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
               libbluray-0.9.3 | 1 
                  libcdio-0.93 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                libcurl-7.50.3 | 1 
           libfreeimage-3.17.0 | 1 
                libsigc-2.10.0 | 1 
              lirc-tools-0.9.4 | 1 
make[1]: *** Waiting for un... | 1 
            mesa3d-demos-8.3.0 | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                   msmtp-1.6.5 | 1 
                    ola-0.10.2 | 1 
                 opencv-2.4.13 | 1 
                p11-kit-0.23.2 | 1 
                privoxy-3.0.26 | 1 
                    qemu-2.7.0 | 1 
qextserialport-ada321a9ee46... | 1 
                      qt-4.8.7 | 1 
qt5webkit-b889f460280ad98c8... | 1 
          sane-backends-1.0.25 | 1 
                  screen-4.4.0 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
             transmission-2.92 | 1 
                  trinity-v1.6 | 1 
                       unknown | 1 
                      unzip-60 | 1 
                    urg-0.8.18 | 1 
               wireshark-2.2.1 | 1 
            wpa_supplicant-2.6 | 1 
                 xenomai-2.6.4 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/18bc27bc50e4176acfd568052b6746ca3cd26292
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/9c83c128ffccff27495956a2480a9de996e3dc58
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/52e59d16f880567fdb910914e79202e2740ce454
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/fff467c417dc7222fd2abb775d4cbd140baa8741
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/4d8ca620f706185c26c1c9aa8daf2a9cbd8b9625
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/2e1d2bb1577cef6b322ea0e6efab5ad23a6d9625
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/ffef0e48388e90dcccdbda1e3d075bc187915bf7
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/950783d04a1e049b2a48a04498e3d76ef4e5d8d3
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/39172c345b3186d41739db30080e546cc711fe5c
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/5586d64809a7cdfee0daaa2f3211cfcf0aabac12
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/21f5aa52127c11d76f18e0ffeb1f37a44969a162
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/8dbf5cea00fe44c8282532ddd98a509d3279e0bb
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a80185be2b252e1f272e6c74db82fd2ae10817a9
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/da0992ec53e31248fd3a4458996d7eb57644c567
        m68k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/febf9be73302d824f8ddc6302a7db7c1864180d6
         arm |                   ffmpeg-3.1.4 | NOK | http://autobuild.buildroot.net/results/97d90d9cf2ab3c0810c8511bf0149df1cbfd4cf5
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/e96ade44ae779edc22a4bfbf9a0ea16097238ef8
         sh4 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/5447e68823281e4866a910b04080e6633ef7ef3a
    mips64el |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/7bef22b0910c27d0a075020f611b9235552389ed
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f372fde5f16ebde78bf81a23105604c5bb584de2
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/405943250ef4563db84eade7ecc3bf1ca454c226
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a93aa98293ce40f99dc8d2df0e9c56ed68123fa5
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/53b6f8dd6bf4ac64c1f39326338d18fbc86fe9b4
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/9561d2d6e3997e55fc4c39d0d51d415bdc211cff
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/942b473e380eca6da0391c38bb53ddb839f412f9
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ad02b2abe9a676e9a167cb65619b2825eed95a21
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/7b17030d0fb1616a190f88100fc7b9b72d09ebea
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d575b9664ee2f11c5925c982f859ce8649d81f2f
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0c6529a3e028909c55e4fa63bc573eab4297cac9
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b92b075259d796980baaeb9aeb36c76ecc3b9944
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/18bd7da519f0b73f3d576832a3a8882cd4700898
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/5a1ed358e9438fd64d13f0196a6c3b30ca1a7a7e
     aarch64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0d95f50a6c185fa7d0f48d087384c39ac9b0dc57
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/935cef7cce5c6789f4ba49ffecfa927899e9dc45
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/799e8b0fb796df927c97c3e770960f063b35d20c
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/f0d84f7591c488bf769a0366fd0131e2f8402398
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/29e187b747817e27ec503072e590cb4f97b3482e
    mips64el |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/e8ec3e0ae895252c79563c1ddbf683c82ce2f421
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/f560d9bf675b8746d4a78ed13c19e3c8f2a98741
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/033d666f4681029053635fe7490d9c6518a8f9b7
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/bdeec4b06460fcc27286e4b8e54384c0edbead59
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/40681329f798520113d858a3ab7bfdf1e62bc3ea
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/bb9dc4737bd2cf30571e2e026ad614ce156c8db7
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/98eeca8adf877c93a734fe083dc2c0362d1df374
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/8e3d81bf429397be4cc94f20a355411ae29d46fa
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/3f5d2a5ac17640854411abdf2ff6c2b6e0e08f5c
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/8cc95a15ac25609107a9b78d07e8e44be4a8bc01
        bfin |                 libcurl-7.50.3 | NOK | http://autobuild.buildroot.net/results/6556ee4270aadf22355873b49a5856fff71ce436
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b30bd952a48175a9cd16c5d95119699e5831ed66
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/a790868aeef6f92d371f39f9cfee7cfb165d3960
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/454bd9d759bfb9ffacaadd7fd33a3f3544469ce0
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/ed9938439482473160aa11dd3a83a2f9b2ba9717
     powerpc |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/827e133b0744f1881530651720580ff6cdaf5a37
        i686 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/06fb985c53e81f13e79c21bbbe4fff9955006623
         arm |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/c5a7dda23206fbb173c8ec2c263fd856b9195a72
        m68k |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/917dc58d2ef620f6abcdc9d860cc9f0f8cafe97f
         arm |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/71c0d394ad6d21cb6d79d71946cf5ca8dc915fd1
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/47deec2082ebbe93e9cc01ff2b8d1b32fb141c91
         arm |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/098be8467a07c17b32cb2d2ef7007a0fb9d02622
        i686 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/92d070c0ecc466d89077f28db491dca7252af421
      x86_64 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/ec962a51f1da30ce2f763d469c3538dc8bd165f6
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/ff4294f3fa738f53c215a8106485149fdade653c
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/217d72be46f25adda3b498190ef9282ac0d1d299
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/1f8b5e23d4ec0eed842f04320b436a92546796ab
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/ad819ce312838682344cd07ce1308e595256181c
        m68k |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/db32f51d9545f36a104ded1d5a726404570d587c
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/0579606b4a4bd11f3c1f49bb1fa2441b7b0eed44
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/d5c509bdc8e22a25bcbb267ffe32c77fb59ec562
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/300fea604998189ed20f8dc0b7b3ee4b3e792449
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a8438094751f68f105059f5e58e83efe9982602c
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/bf15dd49c22fbba38feb8de30bfa93acaa2ffff7
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/fcdd7061529223f7aabe2b41229ab0fd48e6383d
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1d6aeab34b7e662d7a82f40d6abf43bc55fc74e0
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/3e901fddaadb4f573d177efd5fd3239a495d9227
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/52caa2bc488fe866d69d32af66c465f9b171833f
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/4c5e6e43e0b60fcf8ec263bd88582469965d7ee8
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/093b376ad636e7354f93db4d5faf1a4a04a13d00
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/883a9ce4b5b325d50d00add608f8849e51406f51
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/da6ac9bb0b7b320c76d613b55951dc1aac9040b1
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/479f92fe77567fc58fb0022ce65c6d22f051a340
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/5e153205c7871eaaaf3ee6d5fc208ea32a11b286
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/58555e92e6c549f4efcb1d11d4be09cbce5d8300
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/dbaac024e4dcb763dc9769540d53d1bbf91967bc
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/c280d8f8383ebaadc3f3e7294fb2877c74ea02c7
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/fff522f88106b9fa9e75545905cc32d9954768a2
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/89f44443605a2b9e8eecd537903dc77cba8ae986
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/f03325a7a2a6dbd2a08e258b3096d5b3cc2b7acb
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/6c6e0a236bde7b892a69119a49422119f3efaa97
     sparc64 |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/92af5b9a57d97253ed1a6f8ab4c8ce46031e6af6
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/19491f385e540c5cd969f3b93ce0f933c527a216
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/99c940da06f7415b8886dfedfd20c85d078d4a35
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/09a1569d9a0590f7c58681c5a08dd17f2d16320e
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1c4399891435add4bb25599945cceba30686be0a
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5862de79e675d7371dcaf33748db06d4661c2011
      x86_64 |                    msmtp-1.6.5 | NOK | http://autobuild.buildroot.net/results/b4fab4c682c5c6284ebaf98f73411d8215843ae2
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/cc18593cdd0bae3120fb4dfcf725b03e648894bd
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/c0beea294db4e2dbef1cdf2d48923a5cf6309c16
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/1448af9507673e07cdcadbc5e81c062cf91630e9
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/e32ec74986913513d13a0f19e069c1bb7b884e7c
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/753bdd0b9252bc72e3846c51e2b1db5a8d69738c
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/fbed54c79c6943587a8b38d6081dabb4219b0a6b
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7368640d105ecebc5e9c2c7d97a9dd521ab863d8
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7784e53770f07233080bc2256459acb9f680642b
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c4c21c968b92d46b1f8c75e269dc781cfacd1bc2
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/e133d3927b870dac93ec781b1db9b5b5fa4ce61d
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/c669c8929013ab6bc1a67f2885d4994e084ca3df
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/5295377d1579d26a68980ffcb32ec559f3036736
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8197e84233ed8130a13d7fb2a964e9d0e7289756
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/f6f82fa525efb642714c3f191b34a1e4a39e8b32
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/70391eacc60ca96adab213a1b529ad61729f4c51
        i686 |                   screen-4.4.0 | NOK | http://autobuild.buildroot.net/results/1b6a9afd07aa76f9b2757a5ed9faddab89fcd688
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/b28d77e936506b6c466d98bd2d62b3ff7457eac3
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/6b47445ba83347f65a671d5726a52a23c7fed3fc
       sparc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/bb539d872565526d020ad93e48abedb0928de9c5
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/20a129059eb830503b04894fcf35965b378c3201
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/2314d574b363cdd6267227f69a899aa7bd5ca190
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/e1a3f0514ca6cd072d5dc630d7bf8451b4cfa540
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/fe8369939f3a16c3cbe7e7f7c091e96f9cd6f14a
    mips64el |                       unzip-60 | NOK | http://autobuild.buildroot.net/results/be2bf44e6c9ce7e79db2bead215ba71ebaa49dc0
         arc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/d49745af833aee1f6bb3d12d4b1cf3383e8a25f2
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/118fc999516995e2236c3b80874fcbef228a667a
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/eec08214d59107bed3418ddc9574954718426cc8
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/13a7de130d62dceadb49d721faa3054badf136d2
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/dc36718e7d004f3c509f3c57798d0af80ae8f719
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/63a5a9cffdcf36b6d88a939ad9c3e03465fc3cd1
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/feb328ef7578e25522049638bbac91081076c3ad
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/557739f98419b4088064d9c00e8efa3f89e3f810
         arm |             wpa_supplicant-2.6 | NOK | http://autobuild.buildroot.net/results/50bfde586348b4dba7b7bc9789918b6b4c82fee6
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/4add816c75ef44acf8852df9bd1ef60d01b19d11
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/063e84fd3e6454e5d59e697e740eafbe8a6ee503
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/b7468b26d5803b8da3ed3878e644686bf14886c5
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/337286c38fa266cabbff12147bd299098b814550
        bfin |         xlib_libXxf86dga-1.1.4 | NOK | http://autobuild.buildroot.net/results/579e6db79929910ac53a914f65fc398a483134ae
        bfin |         xlib_libXxf86dga-1.1.4 | NOK | http://autobuild.buildroot.net/results/f8f0b6cf9af21ff7d9ac76e670a7735ee9753315

-- 
http://autobuild.buildroot.net
