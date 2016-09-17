From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-16
Message-ID: <20160917063029.DD238102C9F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-16
================================

      successes : 218
       failures : 86 
       timeouts : 3  
          TOTAL : 307

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 22
                blktrace-1.1.0 | 5 
                    mpv-0.20.0 | 3 
                    ola-0.10.0 | 3 
                 openssh-7.3p1 | 3 
             util-linux-2.28.2 | 3 
                     xen-4.7.0 | 3 
         docker-engine-v1.12.0 | 2 
filemq-e59951489045825d6fc5... | 2 
                   glog-v0.3.4 | 2 
       host-erlang-rebar-2.6.4 | 2 
                libxslt-1.1.29 | 2 
                 lvm2-2.02.165 | 2 
                    qemu-2.7.0 | 2 
                      qt-4.8.7 | 2 
                    quota-4.01 | 2 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.43.3 | 1 
                ipmiutil-2.9.9 | 1 
          janus-gateway-v0.1.0 | 1 
                 liburcu-0.8.7 | 1 
           libvncserver-0.9.10 | 1 
make[1]: *** [libavfilter/a... | 1 
                 mono-4.4.2.11 | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                  openjpeg-2.1 | 1 
                    parted-3.1 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    putty-0.67 | 1 
python-libconfig-b271c3d9da... | 1 
           python-psutil-4.3.0 | 1 
           qt5location-5.6.1-1 | 1 
                   slang-2.3.0 | 1 
                socat-2.0.0-b9 | 1 
                  squid-3.5.21 | 1 
            supertuxkart-0.9.2 | 1 
                   systemd-231 | 1 
         systemd-bootchart-230 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                xfsprogs-4.7.0 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/478a9abccbf8056cdf41146f6c01ec2426170467
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/49013194a9e8da5260643eba39d72baa5bae86d7
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b2d63ba3d4113f9755cd395b3fd83bc3589b0072
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c97fc56f2e54b5dfbcd2956c97963a6da6cd90dd
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e7808bacd9c80702da2bfc044d5a4475d4487f6e
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/88e2dcabe3639fa75ff8df31b64b7cf1db7312f4
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/fa76d79dd7aeeb183ac71977580e4571f52c62ca
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/1ecf0db627fcb1e914e16df8bcd1f8bc9c8f3063
      x86_64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/f7cb36e444275f0209e7eb8c3bddce016d35960b
      x86_64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/903f7261bb3b6419f375db23c3b7e58e519a6ece
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/76815dec90bc45bc2e7a55f8cad85f3d93e55616
     aarch64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/13dba54ea605c938b74e6aec6109578c8d05a12a
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/f77377803bad2a27358a59854ab1a4f87f05b819
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/9d7ff2d8a93c8c3877516c1f848703415d147a86
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ec2b1405c6ed5ddaf54f9d73b104216e78150164
        i586 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/8562756695661796c5416160dddbd9085553de5d
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/2d6e1d0d543e2900cd2fd833c31251df978a7038
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/b01ecd51dcaa276cf7f0681a3192314b0ed904bc
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/f907767a4ca5cdf02bf2b86c2c8f0fe7d190baf0
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/ccf1a5b0c0cfe4c11d19857716372d4213cfba6a
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/018364f94ebf43d9c679c87758c8bce799667cfe
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/f95c6a51b333053326044f50f6eeacb5302fc32d
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/3b92ee185c887ed2e3f628e557586b73188bbe80
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/87ec004440bf5bcb4bb621d31076c6159fa9f3d7
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/07b1772834bb20c2ca89f686f019f581adc42e77
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/03a74f5896511c04190155abff0a6f5d3eedd6cf
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/e766a6423b9371359b98ad2ffb568f0e37b9d255
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/308173bee6807f03ec882f565a889e83e541609f
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e2e06f95ea25e30c07591be3a31d834e6698292e
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/c3ca5237911f50889b4d99084240ec6b8ac031ac
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b4bd67f61bc23a89f3b4b2da1ec2b28905da53d4
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8bba84ad8459344ad5403fdcb6f0bf0be8f72f1a
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/89b136e6dced6ca9842a1f23141b0cb999f783da
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/d5b8fe66ff8d9ea91e87ef6fbe8274f5e24aa7b0
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/89922e61c583cf1d11bd0bafdd5586c35d8f6e15
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/883857226c771df236791ca8fb3aae073564dd7c
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/3facf7ee7a93d9815faf64a17ca6cbc3c5b6cc89
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/a407c5e03f417c68064e2c60c57f277ff468eed7
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/383cca71505e553e0ec95c5b9bb7b228608af69b
      xtensa |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/544c9b9272e93383cbe921772e071b90aec674bb
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/5e515ae7fd5ec6a9aa61392b479003bc095f0ca7
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a2fbee3a41ca1df57bf301405974e7a2e57aba78
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/38274faf013c73ca06a491595da19bba187aed6b
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0194bc058d5b02f45df277b061f7118ce0bab023
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/5197e1cf7ea3f90b58abecb28285b9ac695ae5cc
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/57a84247d0564cf796928b01fb668991eec352d8
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/5513bf4881c7a051ae7262072c3aa0a57b79a3f5
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f0c9f37c24bd35e8a7b460309b35a13f666f4cc
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f3fd442b51e25026a9b8a414f39e55fa8fc8365e
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/4e9b90c5dd98352e8301f96407d8e9c9b73433f6
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c06cae67d6ea7c32b13a0d6c99031548be9b8315
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9083fcb0ee4971ce85720ff7e267866eb20c16d4
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/40bd46cd1cad5dcfbbfc48136a2214b9997d65d4
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/bbcbd5db831737f81483618a2f51da14137c0411
      mipsel |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/e97d1756cf838c4eef4da34e24ae2725202e95e1
      x86_64 |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/c0a4994f5d4fff6a0b1ac683a27b79abc70101d8
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/b0067e72ffcbbe1db9ef49ab297cece951345aeb
      mipsel |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/ddb1254eecd93ae964fd6828b618748e0d1b60b5
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/c8353d63816c3de86d4822ad5a629cd5354fd9e5
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9c0dacb004e1a3d0249f98cec20822bf53f21200
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b5f9a6c1701122f67ace3bc87a6ea1c3863cdf46
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9a50a9ff6676a023cdd0f57dd85f175a96838b02
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5bd1034d1c70a1d2d00767cb73b122701d9c3a4c
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/86e59cfdf4f6c473fe82b0dc3a5a14cb851305cb
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/99965486d2c27fca8cf2afd43316ae62e44afed1
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a794cac18c9eda872ac7b796cf2034c501dae206
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/772ed58954362394b9375f27926474257da76f36
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/279400046771f0c0d3a5e8f5b8dd547857a15017
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d99c9d4a7d9ad7396c5052a3f6d9a369a3614634
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0f10ee6c1c359d7a8f1fea5064dcf97b14606297
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4f28f41040fe685fc4485a87b77b96d046817abc
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2efa77d8376e9ce90c8eed2987bbce9caa9c5efd
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/38f87ab7fcd138c2719e5c61d4bd1597256740a3
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5eb6be9650de2d53fcd39693ff565d8e56ce46a4
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bdda55d31d1560bfb0d46dd548dede45600eb14d
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a635b68a531df6d3fd50c042270b44cea70b37ea
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ca0dddb4d9e9290a449ccc736501e907139e4608
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/202427d925a8e8bce234bf32640a42b79c84e69f
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/59eb97c31a2f14f8f5be9ba0c4bb106187941adf
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cfee15bfdd55da8dcaa30fc65288d07722024475
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5501e22ce652bb66f19bd6135b65c39d5e9b4311
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b6d8aa62769f4838ede615ba65a0a3d4aa6c5e65
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/031cbcf372f93439696f9e4127d1c6e47302234d
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/7f907d967828311d9a68297602ae3c754df6b6a0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5ab0b61812cd60c67b3547748aeac7803fa3c574
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/751a3e5d8f18a7c48d7d47ee524de97f51d9119a
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/d69c5cc9d5f4d0b74476431de035d4cc3adc2d92
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/3c03f6b646627d5c0a6dd145d96d243d583d15c6
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/61d4c8fe4ac350bf6ed36e4ddfb5c4d014547c27

-- 
http://autobuild.buildroot.net
