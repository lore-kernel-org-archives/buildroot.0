From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-07
Message-ID: <20160408063022.B4E7A10130E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-07
===============================

        success : 89 
       failures : 39 
       timeouts : 3  
          TOTAL : 131

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 7 
                collectd-5.5.1 | 4 
glmark2-499aa81a68fb4c8aac1... | 2 
                      qt-4.8.7 | 2 
            webkitgtk24-2.4.10 | 2 
                blktrace-1.1.0 | 2 
 make[1]: *** [all] Terminated | 2 
                    cups-2.1.2 | 2 
                  trinity-v1.6 | 1 
                  ffmpeg-2.8.6 | 1 
                 libgee-0.18.0 | 1 
                   tinc-1.0.24 | 1 
          openpowerlink-V2.2.2 | 1 
                    dash-0.5.8 | 1 
              memcached-1.4.25 | 1 
                  connman-1.31 | 1 
                  boost-1.60.0 | 1 
                  c-icap-0.3.5 | 1 
                 raptor-2.0.15 | 1 
        host-gutenprint-5.2.11 | 1 
           lksctp-tools-1.0.16 | 1 
                 weston-1.10.0 | 1 
                grantlee-0.5.1 | 1 
             ipsec-tools-0.8.2 | 1 
       openpgm-release-5-2-122 | 1 
tstools-08f6be304040e7b8476... | 1 
                 jack2-v1.9.10 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/30f7c9d32af4e83d4f68020411b43709ce6967d4/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9a8059a7c6bd4f52f1475081b5062f6c988f7251/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/904b7d024f7767fa6f7c2eafabe1a945911e615a/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/bac8e8a0e501551fbe292046b4202b664c8e50e1/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/fa5a91d733b26512457bc9acd78a846d788e2399/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/5548a4bf91ecb9a713fb527856cdcade0bafe785/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/a90fd2c6b6742d5562a8934605024898ef5f8d0f/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/214a4fdfb1fc7f7410cc0a78a0abbd300c2836b2/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f9b5349793b66974e4d97b5ebc38037aba7fe344/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6cf7dbf26a52310ce1ab5ecb3f46d9e2e317ae9a/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f4490431662440a43291eafcba1a3bcee7c7d00/
      xtensa |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/134e3f26b77b5866a96439483393fb7745a8966f/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/38bf1488f898425feafd838a265bd24ba96060d1/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/ee35582419778d7a2b8af8d9ddebe429aa0e8b38/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/d30d20d39d89b986328420d28153f9f12bba46f7/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/d74d80d5d6113b0b98c4321e6d586aae76236f8c/
      x86_64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/241777c9345453fb40265192e7e1af50c2e5d54d/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9ff31a0220ce1eff4351c3a42884f56f373ed337/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/284db7aa1244a048176416bac7d524d08c138740/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/fb8841d4ce81ba97d2dd21df4a1359b19b3cf46c/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/143a9000a9df136d31c867ef5afead107b095599/
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/d44334a6bbd2fde83d1641b6acf9d10e71445403/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ddbf183d5c5b99d3fa4453fb14d3aa5ebab7e385/
      x86_64 |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/66935f9b130aced90208f484a4f5ac969d7d4121/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b0b2c39367b515161463696050d2188491201c9b/
        i686 |           openpowerlink-V2.2.2 | NOK | http://autobuild.buildroot.net/results/da445b65cb136d71577f04e3a17fdb2ef6302a9b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/74e21c9cd50cfc282539507023204ac21997f1ee/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f0589e1d06404a7bd57f5734228afe45164e553d/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/f0b7c5f53d7d9ab073cbb07c6bf2112374ceebc7/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/a9fa7b0a316aefff85842918e74985a3003bcba9/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2f4e39133f6f2e55bf47ff28638371c04a239342/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/b58ee124ffdc2a03be705050f84b39b86e6d8544/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f61dce0119a159801ea65b60fefc2b07fd598102/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f8781e332b4f262a5e72addae20bddecb9104c2b/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/decaa82ebe15b3b1d6e162bdc52d2e63e93db084/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/517ab062bbce508590a8b9ce92fc1322bdcbce93/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d846b3f66049d990347800fdabb15c0019cebb18/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2d0ea3f322d13589a3a8409db52992e698889aac/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1d2d378a9c5f8334234eb366e4aa237617b4a18e/
        i686 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/5461df2916160a4e03af36dc1ae7c07bde5d9249/
         arm |             webkitgtk24-2.4.10 | TIM | http://autobuild.buildroot.net/results/87bd6dda269db463715317f0488fb629c324618d/
        sh4a |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/674e38154938cdf16112980c97d046e1d46ca591/


-- 
http://autobuild.buildroot.net
