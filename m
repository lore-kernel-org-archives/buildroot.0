From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Nov 2020 08:10:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-21
Message-ID: <20201122081013.7AD702002A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  1  |  0  | 25  |
  2020.08.x  | 13  |  2  |  0  | 15  |
    master   | 124 | 27  |  1  | 152 |
     next    | 23  | 27  |  0  | 50  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 9 
                  boost-1.74.0 | 2 
                 dc3dd-7.2.641 | 2 
                opencv3-3.4.12 | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.3.1 | 1 
                        bustle | 1 
               collectd-5.12.0 | 1 
                lmbench-3.0-a9 | 1 
                     mc-4.8.25 | 1 
                 mesa3d-20.2.2 | 1 
                openblas-0.3.9 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
                snort-2.9.16.1 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/86e89a0c26367e05c8431f7b4c1b123cc1e3560b |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/2b49ad2b1323a6a4d08367240d2171a35217e158 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5cb3a3440ffc5075eccfba458adc951c03b9a6cd |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d523da581cd5d8e7d38a84234688fd039ec0a744 |     
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/5bd2010e4d4316cc4eb4638d89b5da960d59c389 |     
   mipsel    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/86c62f89dccc8e0e1c3edc98cf521e7f7290cacc |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1ce5a6395a5a244312ead0f07f34f6ede9a41a61 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d0bf14dddfcb5b550f2b9afbb8becab5103ee184 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eb23b357e1559c3b80878520bba72b6d2848a404 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/affbcb7841b4d48fa5b1dd461b88d247e537fd5a |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/70db159be638506bfe45d5b245d311b64ac69089 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b30a19101b9c0eb39be300c6b4e64a7cd88f618c |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9913a01d0901c410f76b5b55bf10da6d751d800 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9d539bac1794538fcf9974dcdb2215cf27d7de9a |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e2187e083f2acdfe28a06870ead7287a91eabc52 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f54e41f2a29ac7c209f22a0ca03323005368e6c5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f2b5f7554f2cfc5fdc0b3f10d75d74b630d7eb69 |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/4e63b8f705aa8158af99cd36e10c4b18960c67a6 | ORPH
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/acb4167e2557c1ba8b1281429494aaec1e81f35b |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/9b5cf1d684748f6805b1aad26cfc101272cac60d |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/eab4f4b30b19fffb13fe53e7332511b858d44d49 | ORPH
  mips64el   |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/68f3d69ebd0b0ac9597e2ea9faf47bd29fdda4e2 |     
    mips     |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/a33f679983f2a34667a6b7847613e96d6ffd177f |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/85106e498707b908d1328959ca166ee475c0d770 |     
   x86_64    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/c93548af67689360bc66f5c33e824b2f3758675a |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/6be07911c203bff02c096e41bc2293ecbc8be770 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/303e50d996b7261896f163418831fabb40779ff5 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf2d41f77848a1705415b71133b24972b8f4e70c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/07aa660da2d23849dea0e43f06035bbd9c4f1755 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                       unknown | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9fcecef7d29c7a2512e94dc36a0b3b1b6c9ed5ec |     
    arc      | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/e73ee4c5c4f7fd21b96f05896eaeba5c03a64468 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
         jpeg-turbo-legal-info | 5 
host-abootimg-7e127fee6a398... | 3 
                  boost-1.74.0 | 2 
              libeXosip2-5.1.1 | 2 
            resiprocate-1.12.0 | 2 
                   rhash-1.4.0 | 2 
                  apitrace-9.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  monkey-1.6.9 | 1 
            quickjs-2020-09-06 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
               wireshark-3.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/0c5099fe834c9529a285ad99ce5bd2a2cfc1862a |     
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b5df4e20395434b59dcf7a9da6bcce82279beced | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9ef16422d6004a0629cdf9555fe756e79d791c05 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/78d58dcba7846b462c31003081259df3c4f726e4 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8816fa9e7811fcc88e025574dfee5c429f60de92 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ef6d8b67decd895d59f654438342742987f0a981 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/267afe6fc069fded429cc69956d8393aab6d6a2a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3bc16876a0142900d7a5c0dc2ca44f085f20720c |     
    i686     | host-abootimg-7e127fee6a398... | NOK | http://autobuild.buildroot.net/results/12dcfe87e2b2b910f53440b81a17e1805b5996ad |     
    sh4      | host-abootimg-7e127fee6a398... | NOK | http://autobuild.buildroot.net/results/f736169cf874bef963093ee5645981aa48e7589a |     
   s390x     | host-abootimg-7e127fee6a398... | NOK | http://autobuild.buildroot.net/results/0f0ce9d598d1a9521898f79841aa55e77a432412 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f6d0477b17378f68df61e13dfef30cc9df93b8a1 |     
  aarch64    |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/a9938e988547864bc79936657608dcd79d612371 |     
    arm      |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/c9d0c5d6b96feb128467398e9f626d129d783ab0 |     
    arm      |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/4782232d83f57bd771e08e8e25ea35eb1d3c57e7 |     
    arm      |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/71468349505737ee27193a129a33968620dc25da |     
 aarch64_be  |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/652c16c5db57f8d325dbebca272a9c0e45270621 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/da653e48a79d6d317bb17950fa096b5f0ce9cbcc |     
  aarch64    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/64d01b2791c548ec82b0a44c3dc4f8edfb03db3e |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/29bf285e1a553a7bba01301a8e0a14a15d4b7dfe | ORPH
  riscv64    |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/2956b4e6d0f917038594284a91ada664cf8acd61 |     
  aarch64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/dcd0f55512cc1409e46394b259b2e5a07097e5a1 |     
    arc      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/d1c95b01e18fcfdb90207876720d34b32957018a |     
    i586     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d857a98b6a42900c98e3b40bb082bde5dacc4948 | ORPH
microblazeel |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/f7a8e78947a38867a9f4af845a0bbdfe3927096c | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/44307019385fb20533004fac1d6be90adad41d39 |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/7b51adf53063af76cf8953b01dfaf75f59c26dd1 | ORPH



-- 
http://autobuild.buildroot.net
