From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-21
Message-ID: <20160422063022.250121015A7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-21
===============================

        success : 118
       failures : 56 
       timeouts : 2  
          TOTAL : 176

Classification of failures by reason
====================================

                    yajl-2.1.0 | 9 
                 host-go-1.5.3 | 5 
glmark2-499aa81a68fb4c8aac1... | 3 
              freeswitch-1.6.7 | 3 
                sg3_utils-1.42 | 2 
            webkitgtk24-2.4.10 | 2 
                  boost-1.60.0 | 2 
           host-cryptopp-5.6.3 | 2 
                 libdrm-2.4.67 | 2 
                moarvm-2016.01 | 1 
                    owfs-3.1p1 | 1 
make[2]: *** [code/CMakeFil... | 1 
      libnetfilter_queue-1.0.2 | 1 
make[4]: *** [all-recursive... | 1 
                collectd-5.5.1 | 1 
                wayland-1.10.0 | 1 
                 igmpproxy-0.1 | 1 
                oprofile-1.1.0 | 1 
                      qt-4.8.7 | 1 
                 mpg123-1.23.3 | 1 
            host-python3-3.4.3 | 1 
                    cups-2.1.2 | 1 
               valgrind-3.11.0 | 1 
                 weston-1.10.0 | 1 
                grantlee-0.5.1 | 1 
                 mono-4.2.2.30 | 1 
                blktrace-1.1.0 | 1 
                     qwt-6.1.2 | 1 
                     vlc-2.2.2 | 1 
                    mosh-1.2.5 | 1 
                 jack2-v1.9.10 | 1 
                   mplayer-1.2 | 1 
                iproute2-4.5.0 | 1 
                  connman-1.32 | 1 
                     mtr-v0.86 | 1 
                flannel-v0.5.5 | 1 
flann-04b4a56533faf8c8228d0... | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/915e4f0aedbcc6873fa8a90f2c7dce6214fb1eb1/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/592eb679201bb3fd90c9ba73a2a0748517407a9f/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/872e5b8038f5adcea8cbb5e5ce912f936deb9115/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/0cf5d861fd84111dcf64117107785fb47b1966a6/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/4039805ce7c2b5b3184f361c447658bddecd2c37/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c476b65653411842a92596ad18824016b4525896/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/aec5c1e66b8ec5e2a1d40c26cfb9bee9c15cb69b/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d8c688e7eb42458f2eb06110941f35d3a7daf3f5/
         arm |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/ce6bc77f861063d70b902456b4e9264b51461206/
      xtensa |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/3701256b6763274278da882c0d91e2e1207fec49/
    mips64el |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/03bac762bad215f7cd2323efc1b31134168ab00c/
         sh4 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/d960bcfff386310e265d0d40533ef2ef7f74d5fe/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/7bd41a86d60543d3de4483f86f0b5a719cf480b9/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/6a45e32c0f894508d05c964a9a0fd645b6f3d6e4/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/75931025f856c28306036926a74542e59f7d943e/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/7445af54c796b071ed461ef66afb23f4a8d870f9/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/d5da0b5e756d5163374d847738e471c942de7489/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/b92c4884036b31de505191e898b20c97bb86cad3/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/e164f5dabbc8b5b9e9d37c95f754e7317c01e26c/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/1c741321907517763c435e915049346dbf45382e/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/813cd86bc185c8e95451fb91d2f70abbb26d3192/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/428de21be35130c6f985536aad3117d996f1a27c/
        i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/0f4b0afab6f03cd6b671f756f164acea96b8f7dc/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/32bfbb4d98f69aad3cce4448f8b94c16699f7f35/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/f3467a96a593f0419e1818a2a0816e4a2a63cb93/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d972d62e08b9eb941f33c2d48330aec97f97d349/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/7ab9b819a37d9df0783ab007cd1b7165c43890fe/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/9f7ff20517590b896bfe81f9d1e6780ccf724bca/
    mips64el |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/f53e8dfcc30a45de8b0c22cdf2ccd3178dade843/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/cffec4c711e84ac39feca479bbdc5c9928cd550b/
microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/96face60a31f6543e1256bc7cc77a0a17279fa4a/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/868628ab8d0dc333ec611708c669846fceeaa4ed/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/3bcb9f8d98f0c7aec55e07342aeed850dac06244/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/dee9d2f1025d2d3d0fa083e803cd1f06a094c2f9/
    mips64el |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/dd9493e0de08221a624ceacab08c0882829ccac1/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0a8bfd644aa04e0bbb47fa99c7becfa35e3da926/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/30a55c1a1046643a6bd5638f512939012d306b12/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/29f9045f4d063146f50fecf041db8ec8a285f1e7/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/d5d57843d0bf0060eb77028434d7313e2095c255/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8456630e1c8a0fcdc00c4493070a8e4ae23a6cdd/
         arm |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/b2ade7b32e6d0ba7381a57bf6cbff7f083d99c03/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/3d99385c6fb98f8860b3f62ec68b0725ef3197b1/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/9964fd3ea7834c77e82ce8428cce635bcb211329/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5266ee130d4e968b06078af8f7cee1a694965c15/
    mips64el |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/872bed947b828dbfb944e25e7ea68d9d7a6b63b2/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/eca88ce8f6fbad32da92512f1ffc77cbbe6bdfe4/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/d1879a4f75991728755caca1e0b89a1810dc30e0/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/1706ebd0f9e8692bc6814d8fbb235f7c63cfcd37/
        i686 |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/3a0c7a22c883fb8994893914e41dea491b1de0c0/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/35a235f4a08256574fb3f75badb4a7f6646ed2df/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/21247c69e025d91f412b7d394c7285cdb1abbedb/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/9ad65f7c9f78823f37335b0b6690dd6ca9b73fea/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/365058cb3cafeeda4efc487634baa4740eadc30f/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/9dfad963d04e2c03db689a2b55412618c5625c16/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/84ce38280531fc2b7e45a57fb7fc53a54a0eb319/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/9f9ff3c89fe006860bfe868797bf288370273308/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a9d0ba68f144940f840c36f10ecd688c37cb68d3/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/8c9d45c71ed7ce977df1eac8524452316dcef356/


-- 
http://autobuild.buildroot.net
