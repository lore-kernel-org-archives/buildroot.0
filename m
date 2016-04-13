From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-12
Message-ID: <20160413063022.C6170102846@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-12
===============================

        success : 148
       failures : 50 
       timeouts : 1  
          TOTAL : 199

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 10
           lksctp-tools-1.0.16 | 3 
                   systemd-229 | 3 
                 jack2-v1.9.10 | 3 
             lirc-tools-0.9.3a | 3 
                  ffmpeg-2.8.6 | 2 
                  boost-1.60.0 | 2 
                    mosh-1.2.5 | 2 
        lttng-babeltrace-1.2.4 | 1 
                    cups-2.1.2 | 1 
                    yajl-2.1.0 | 1 
                sg3_utils-1.42 | 1 
                 mbedtls-2.2.1 | 1 
                    links-2.12 | 1 
                  cairo-1.14.6 | 1 
        host-gutenprint-5.2.11 | 1 
       openpgm-release-5-2-122 | 1 
                   mplayer-1.2 | 1 
                  squid-3.5.16 | 1 
                wayland-1.10.0 | 1 
 make[1]: *** [all] Terminated | 1 
                  connman-1.31 | 1 
                  apitrace-7.0 | 1 
               linknx-0.0.1.32 | 1 
                collectd-5.5.1 | 1 
               ipmitool-1.8.16 | 1 
               opencv-2.4.12.3 | 1 
               libupnpp-0.14.1 | 1 
            webkitgtk24-2.4.10 | 1 
          chocolate-doom-2.2.1 | 1 
                      qt-4.8.7 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/32c2ee7e9d1cb5c8b43721f687469684a806773a/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e90d8e86703527a6efbcd6778a53e55eac0c4209/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1fb3216b4e302c2f508424f35133fe4f65a4de25/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/b1792623104f71424225624bd485c193e167dc54/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/bb625ce9332e8e11b19896bb839376ccd510f006/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/c2832d2984c005acb20b1a879fd2fbf42563ad21/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/47f980f3cc5e0c5f563d95c87adab76f42417cec/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/ee7b1933f630006434ebffd4604edf5c5ddfd444/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d0bb45eee6ddf40eb605ecaffb1126287b79d305/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b50f206ebca0f0e0c9e4c91ead00acddbf072912/
     powerpc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/bca299631949c7699682af41e3f1373dd10866ed/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/e332eaf794308811f47d6c5756ab3fff9d02c724/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ad757537ea4cb52f81f0e894414b9adbe036672e/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d296d4326c875d744b3769fcbd8dde2f3b8ccd27/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cee85201805eee49689d67d09b8471403725482f/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/e2993aa941231862f08284524ec3828e7fbf10c6/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/bb8cb4dc9210b22195beb7dc7ee132ad50361e69/
         arm |                     links-2.12 | NOK | http://autobuild.buildroot.net/results/548019b71c7db649f20d2c479bb8fb3612162d4a/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/63b1e427df1d6f264517a028655ac80d8d289254/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/9e44e9b4a185231eea28f9d5ee68873b8ee32b55/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/5712cb5d7019c7721327df0015c177546fa55d56/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/5803be7ea21e62842320f6fdc44497b1437efe20/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/94ab8ba783a67529a62d4994ab8c62c8656a05e6/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/25910726158f4b2cbd9ceb60c170f4b2d0b546ef/
         arc |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/7cf25b56ada58f49ea8584eec0e5a521c72b277d/
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/1b7a01f85ecaece0c51cd81bb91826279aec2eb7/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/e087dfa2a6057b18209cd6adff2760026a9ca1db/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ae8de88dc596d590bcab47ac2137783d9d47f99f/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e704a3529ffda37ccf22d7163aee5ddcdb96a38a/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/53434a854f0d9ad8e45ed7eefb23dbcfc34fed40/
      x86_64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/85c9135460de78c35e17dbd791d07732d52abb6a/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/068d33fb087b957133b7d2ae2c89881d366c8282/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/595487789547e9f7f0f51c9c883722d497156283/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/25cf5e0533bf3f5dd92dee65870a72ccdf545186/
         arm |                   squid-3.5.16 | NOK | http://autobuild.buildroot.net/results/d10efa13a73e672ab7e1f7bb65c43767894fe1b9/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/db4d367044c266bcb880f4dd56688a18b3a86fe7/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/95fcb466fd1b22ea438cadb5c47432bded245aaf/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/c0993d3e796fcc07b3ef46ddf8e7a777ab7462be/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/ebfe6fa0881780b90e63e5f8a9e89e72c62c1356/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2162642fa9fdf9957e3e700b2045f3877d09ea32/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/13587e92d96460c26684a59eee0393f9ea3508dc/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/28a53217a1b8523606099cf57e8bd0b192a91512/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/ff90b099d642f3a52d87e627b7ec6966015dd41c/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/73b73be9cb05aa64d1a3b582dbe5c5b764cd73ea/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9c27c1cb75ac669ac260642e71d8a285024dc30a/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/be9b1e23299f6d809404348e8a08bdc558567a26/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/658e0918bc7a261837bc67976cb52f047f3e4488/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/6df42c0fdd762ecb8c63be9aec78691a518a116e/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/7dd2ef308f9208c93ecd27056638242192380109/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/5fb69587afd53ec3c25a9ae54ad8348b43943cea/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6ce0a9b547018aff4dc3a8e2f249e753b9c994ca/


-- 
http://autobuild.buildroot.net
