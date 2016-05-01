From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-30
Message-ID: <20160501063023.20E5C10193D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-30
===============================

        success : 140
       failures : 60 
       timeouts : 2  
          TOTAL : 202

Classification of failures by reason
====================================

                    mpv-0.17.0 | 12
                 host-go-1.5.3 | 5 
                blktrace-1.1.0 | 5 
glmark2-499aa81a68fb4c8aac1... | 4 
      ca-certificates-20160104 | 2 
                grantlee-0.5.1 | 2 
                sg3_utils-1.42 | 2 
                 rsyslog-8.9.0 | 2 
                libinput-1.2.4 | 2 
        lttng-babeltrace-1.2.4 | 1 
android-tools-4.2.2+git2013... | 1 
        ltp-testsuite-20160126 | 1 
                   erlang-18.3 | 1 
             ipsec-tools-0.8.2 | 1 
                 igmpproxy-0.1 | 1 
 toolchain-external-legal-info | 1 
                 jack2-v1.9.10 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
                  boost-1.60.0 | 1 
                   luvi-v2.7.0 | 1 
                   taskd-1.1.0 | 1 
make[6]: *** [libavfilter/a... | 1 
make[2]: *** [Source/WebCor... | 1 
               valgrind-3.11.0 | 1 
                  cairo-1.14.6 | 1 
gmrender-resurrect-aa3d02cf... | 1 
             stress-ng-0.04.16 | 1 
                flannel-v0.5.5 | 1 
                  connman-1.32 | 1 
                 qt5base-5.6.0 | 1 
                     vlc-2.2.2 | 1 
             lirc-tools-0.9.3a | 1 
       openpgm-release-5-2-122 | 1 
                    ruby-2.3.1 | 1 
                    mosh-1.2.5 | 1 

Detail of failures
===================

        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4a639f38d73c7845903bd17922be911d8ca71ac1/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/387273c8bfc73d5499867e0146f153e206cd9e8c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/365d5cafe07b6dc99a0ba0d62e6f3dced29460ff/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2886acbec2ef9d30ddcc70176b6070d5db736c71/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/8fc698316d49679fbe15ebdbc8b914163bf183fb/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c63d14118aef944d304dab82d64dcbf4f931f7a1/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5d4c188d319f491c9e7d2b3002ed8b845af3a71d/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/38354017cc24fe481aacaf070e20bed7da258fcd/
microblazeel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/7879c3971763a10d2abdeb50ce94bc15937df86c/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/d5d123d5d1e53c18892a70532a2a2998f1d1a71d/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/063c8034c6d932b016b3d9f34eabcd18ce34b4f7/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/41ab04e143329807bcef82bb84b0d40c1a7c3bc5/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/b74c3d79cb614c68ffcd21b85c2494fead0d814d/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/62bc0c611c4c1449ad5b4b4dca81b0b971892c0b/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/e9eeb40fa6062635c80d05c21399a3286f667e30/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1c4812f06f31739f1f1fb3bf208f7a810e6b7116/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/414f160bc564c39209530f248c6ed3a29f31757b/
       nios2 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/dd71c996e6ae3d4e704de96da8a76459615796c9/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/cde7cd377cfb3931ea776a989f464e9142ec025e/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b4b62d26ca6062115f0243dde5732e931a2f0f62/
    mips64el |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/3a58514ff98e004d47274bd9f2bd108581bce4f4/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/16784c0b55f3f2c7dbb5f94bce197a0fdeae2e84/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/b11dfb119cb171b2dfe3af268999307bb7e863f3/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/b5563a3c4697c69ff8ded0793eb67afbe5c1bf52/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/f96643707373485cf3b4c3c2eda171ff4816ad61/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/6672b7edf60c75ef5b4b78d7a7ad5113e18c2e65/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/e61e64956a9fc2c07b33a5083557a510014ba146/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ffe66373c44aa4f6e74ca80b1783c156f43488b7/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5e7db21cdf5c8c8882053a2730a6bcf59e4fa55e/
      xtensa |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/4804ea3fd1584c7a4c66a6a209cd3a2c1db3459a/
         arm |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/e2879acdd19568ffbc8988130162fe327797dda0/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/2b3aa77b9afa6fbd8b6be588f88c8b060607bd6a/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/ba2082948b41a35888d19d7fcd56bf9ed8af9e2b/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/bbe073d3077b0b28ab22dfe30adb3dec7961de7a/
      mipsel |                    luvi-v2.7.0 | NOK | http://autobuild.buildroot.net/results/7bd8c90aba9bddd33c59dab78ed6852f8751bcf8/
    mips64el | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/2261c5b1c5c6fe21cfd574853aeea391eaaf66b5/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/0b7cfcf5878e221eb18813b9a44de1482331848f/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/98889b01d66b36f1e2776e80e0704503471068b5/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/0dc86d636fd2a29f0b498892b6d999bb4d3cad1f/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/40ba7dc2dd40a45ce4fefb1662af34b6c5f997b9/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a69a50ae52439e74605c472bbe989b100e9b05c7/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/6ca5ae4826c90e2e89b1fda880bec0a11ba9a70a/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/eaead7d928984bddd3fbdfe4bacae5b059fb3b80/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9f094800d65b18f1096a038f1551c215fecbaa57/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9661f01b8bb62041e00a286f438fec44cfa001e9/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/136e5064a3efd0b81a605f8d1bc3376711707f4c/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/fb44fe87b26b9a2bd484a36a7ab87ee59dacd8e0/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/da6a3cfdfdd902f0fece1614dbaed9e01b447fd8/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/185eb50f79181f91109ce88b84622c1b0107566c/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/19f2a736e42cdeabf49389b991a0a483b20ffb69/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/931f17f006f5b8625c8934e58c8b534e343028b4/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/ed62394e6bcb0475f9243c2b947ca0c3ace986ad/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e2d4b69ed281cd2458b17dea4cbd017186ba421c/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/a8a3dc9a02f9ba58fd356e63e85dfc2f9b09d50b/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/61da1ff041771436e396bd61a901f336ca5701b0/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/203c3686b06d48250143d382947dc1c2768704ec/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/4f13c8d5f1ce5056dea1d93c0d5f185a099e9646/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/dfc09c9a62c0bb8f194e3d0a94aa17ce7ff5b752/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/09510334360f39b938cfe8c6187070c38600f8f3/
       nios2 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/6518ea0d289895c448c2bffe8704fcfcbd8bc2d8/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/25b093ddc2ff181a9fd718a7e9dc5357f73436d0/
         arc |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/be287417eb7f04746e1d8455a940479ac9fd91ce/


-- 
http://autobuild.buildroot.net
