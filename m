From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Sep 2016 08:30:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-07
Message-ID: <20160908063027.BE12F101B92@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-07
================================

      successes : 195
       failures : 74 
       timeouts : 6  
          TOTAL : 275

Classification of failures by reason
====================================

                           all | 6 
                    mpv-0.20.0 | 6 
                libcurl-7.50.2 | 5 
                 all-recursive | 4 
make[2]: *** Waiting for un... | 4 
                    cups-2.1.4 | 3 
               host-qemu-2.7.0 | 3 
                 leveldb-v1.19 | 3 
               syslog-ng-3.7.2 | 3 
           dmraid-1.0.0.rc16-3 | 2 
              libarchive-3.2.1 | 2 
               libepoxy-v1.3.1 | 2 
make[1]: *** wait: No child... | 2 
                    ola-0.10.0 | 2 
                 openssh-7.3p1 | 2 
                      blkiomon | 1 
                blktrace-1.1.0 | 1 
                  ffmpeg-3.1.3 | 1 
                  fio-fio-2.13 | 1 
                   fwup-v0.8.2 | 1 
                   glog-v0.3.4 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
                    lftp-4.7.3 | 1 
               libglib2-2.48.2 | 1 
          libwebsockets-v2.0.2 | 1 
           linux-headers-4.7.3 | 1 
                   lite-0.8.10 | 1 
 make: ]: *** [all] Terminated | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** [utils/CMakeFi... | 1 
            micropython-v1.8.3 | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                 opencv3-3.1.0 | 1 
python-libconfig-b271c3d9da... | 1 
                    quota-4.01 | 1 
                    ruby-2.3.1 | 1 
                  squid-3.5.20 | 1 
                   taskd-1.1.0 | 1 
                  trinity-v1.6 | 1 
                       unknown | 1 
                     vlc-2.2.4 | 1 
               wvstreams-4.6.1 | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

        bfin |                            all | NOK | http://autobuild.buildroot.net/results/4ac5ee1f80f1901cb5aba277147aae74af8ad796
         arc |                            all | NOK | http://autobuild.buildroot.net/results/1c0b1862e092e4acf19cfecdde38333f9019f1e1
      x86_64 |                            all | NOK | http://autobuild.buildroot.net/results/31ff15cdc52797f2f7e4d9e1acce1bad9d214bf2
        sh4a |                            all | NOK | http://autobuild.buildroot.net/results/51452096037dca9c1e239b47eee974669ae277c3
        m68k |                            all | NOK | http://autobuild.buildroot.net/results/1eaf2a5b9a597a91c1d3cf437044873e98e26190
         arm |                            all | NOK | http://autobuild.buildroot.net/results/9b88aefedf0bea9cde66e069b44965f0354b860a
         arc |                  all-recursive | NOK | http://autobuild.buildroot.net/results/5ffed2e142c8975574a984ea53b9822ba04a6396
        i686 |                  all-recursive | NOK | http://autobuild.buildroot.net/results/fa36965a33d497de97a47138a8b832c0d1db1f7c
        bfin |                  all-recursive | NOK | http://autobuild.buildroot.net/results/a91c2ba05fd3b99710a68763db5a63d9ebae6aac
         arc |                  all-recursive | NOK | http://autobuild.buildroot.net/results/1e2aa49a01d070240fb0ada55645744e8ddd9e28
         arm |                       blkiomon | NOK | http://autobuild.buildroot.net/results/9f8b4e71550cc2aee8d53ea99bae7f9fe1352814
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/3bec0fdf291673423f00fa9a2977ccff9421c0ad
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a9b38ebde2609fd7cdd407d7e430fb0cd00a1517
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/42e455379cf5e6df79d3c429486c6e74e704124c
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/b90a4783c95187468087d4c3efa4ea7bc1516552
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/0edc6b4129bafb6cdb11532b32d1ede505ce3a14
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/2f39a35bbb46da8333b0e0435317411d4cf0549f
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/3bd0c9950579290e1af2a03f24d1bab3d7f480cc
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/ae92d3d260a66111c60a9a9b74092f149ee89ad4
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/5cb28119258f0f92479334aed025ec013a1c2bdc
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/e9cccaae3d0de4224634017a9374773de80dadd3
      x86_64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/15844361d0aea42818efa4cadf5fbc1bfc0a298f
    mips64el |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/8a42e210622493fdfa1d08adb1ddcd632855f84f
       sparc |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/32984da716e3504727be6da83efca56ae19e2017
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/a8b92763516ee9acfce163d9bbe60c64ca98af17
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/7b7a0d93dc81290cf62da051c72ccdca0531592a
        m68k |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/494713d7b2687cd8cffdedec5a9b98bb5ed28184
        m68k |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/10733ab41967afe19f5434792253c788accaca8b
         arm |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/991e349ac0bb5ba6acc8dd2aebc55a5984a18ce5
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d0d21c5b0ba4d210415cbc7f865793cf40d9c192
         arc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/4019d745c78c0befe9bc6277afb7d0f6f467e374
        m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/2377edf738d76fd7e991cd4328e4ad7cc0bcd182
     powerpc |                 libcurl-7.50.2 | NOK | http://autobuild.buildroot.net/results/4f6e35779fe41e54911a4325b63e90ec198a478a
         arc |                 libcurl-7.50.2 | NOK | http://autobuild.buildroot.net/results/63621b8ccc4195300adaad2efc460dea2b039f68
     powerpc |                 libcurl-7.50.2 | NOK | http://autobuild.buildroot.net/results/1392b1f4d5cbdf277ae2f6af20c3be24188b1a52
       sparc |                 libcurl-7.50.2 | NOK | http://autobuild.buildroot.net/results/64093da778eca7ddcd7c960b3b31c7d5c18abd1a
    mips64el |                 libcurl-7.50.2 | NOK | http://autobuild.buildroot.net/results/7756cd83355c6a68bfb518a4d6d7d7ebebce3c0a
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/44ca11b52552b56ac332b267745153d7f022f8e4
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/ae84ded5eed48760409742071e254e68b1ed2192
microblazeel |                libglib2-2.48.2 | NOK | http://autobuild.buildroot.net/results/3d0668a3aef91cbef3684e00b9f90783398d3561
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/2cb66cd0269375fb2483a61e6ec09bdb40dfc203
     powerpc |            linux-headers-4.7.3 | NOK | http://autobuild.buildroot.net/results/45d85fb3035af67cb6079f424aed439e8a23f3a5
      xtensa |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/68978a379306d1939110f876366fd1bd9deba9e3
        i686 |  make: ]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/2ca438ed9a43d18bc2b9ac480af98af0a230dcb1
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/0e74e2045169d0f0ca91185b2cfbe4af45e16aff
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b9c2b55b4e3782bb0976b3f75b7b607b60b0c706
        i686 | make[1]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/e7453390c413ba19cc0e1ed02987fa1929c350e8
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/a48686607b4788b916e00c6b798763123dc0f180
        i586 | make[2]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/8555d7f395696f3e3b0c85b710bc5d91bfc686c6
     powerpc | make[2]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/f4b19fa6793925249c4391fda77c8b01e304ef98
         arm | make[2]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/cf13af4d9830aa9d13df388f1659e4a1007c8e52
         arm | make[2]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/3581a6850e65589a01ab7f1d262224535b760ddc
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/65648f73a330525978d612d7a9736fccc45d412b
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/a0d49d9a23f4e2d3724639bd23008128b11d281d
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/6d006e8843d767da81575977e2f36ecdc9038b3a
      x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9e9143078a333ff8e7a87a89e4e8dbe394840330
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b84a32795cb314e3b997739f145bf5525f02af53
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e8ab9faadd2e2ff288be0eee66a497bfdc26b04b
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/32ad002949278bc41c9ff0d2338d237df596e98c
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/3963dcdc9410c631070c74718c546d53313e0905
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f6371c4587a6b4a948cc42dbcf267a02eb18976d
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/af18ce8ac8461c8605f6febe1a20555339dd4bf0
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/f189089673b4b67c9e7e1b710ec4ba7f6e63b06a
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/73109b03eada5802f409279d85b5a3429c8ddd11
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/bd8cffa8956363d64173a272c901ce4d868d9964
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/b961e2350a0cf1707010402037a9b6bb39253a03
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/d40b0092c88fb45d8026d01a609ef8413a78974d
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d1e5f36467c925cf9c8424fbfdb7880a8d1889a6
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e3e9f8658d0c8d0a382585317c91008f934d602d
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/f7fb05768ff895d5752c7ebabe9d622eee739bda
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/d3e65a28949c76673062976223bb1bc74f4e5bd0
    mips64el |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/71c733e4a7275f3a1b79cd19065d94e77af0309b
         arm |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/d16ba0b9ef75d5a676a26db788be31556b69772a
    mips64el |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/9659d1db1a128b269459fd9b8be797a9efbd35af
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/fdf3b1d9bf831e98dc1e1f6e5379f22052c28268
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/f72c55b45f944ed19ac66daf214734e9e5ac4a19
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/31c22eb0af3c7cccdc689a0ca353e601084828c9
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6b763237bb7a0534685a08c6945578650ccd4327
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/92f6860e49a332dd78dd097e89bffda33d1a28bf
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/77660b2d48f519f45a543c88c7fcce5ce9380a46

-- 
http://autobuild.buildroot.net
