From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-29
Message-ID: <20140730063011.69EB41014F6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-29
===============================

        success : 75 
       failures : 36 
       timeouts : 1  
          TOTAL : 112

Classification of failures by reason
====================================

                      icu-51.2 | 14
                     popt-1.16 | 11
ltrace-0896ce554f80afdcba81... | 6 
zmqpp-36413487f05b165dfc82a... | 2 
make: *** wait: No child pr... | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
                 openssh-6.6p1 | 1 
                 libebml-1.2.2 | 1 

Detail of failures
===================

   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d602ca99a2b6aae8e60050be0e20eca187bde4af/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d7e6470cf11907f2518dc14da4412440f9f35168/
  mips64el |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/02a0800b01a4bf8734d601f79dc12663fe8f7542/
   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/db97fb38b469938de1b5d935a9d3d035bfbd40c1/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1ea8d2c4a5681e52eb545aa8ae98bac678ac8d56/
   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c9090159f4ed139f522ae9b55ad816f760a054eb/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e8a2513aef916df3badb387cf70fcc6287c83b6d/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1dcd46145541975e5a0fd5e1ba9165c0d5a1cd85/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/0e5ae342325f08b9536b0d0ecf34306ab5fe65ea/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/aa6c958eb2faa1da8ac383f350b84d6e7d1c9ab0/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f59faacf7299b173b131a577b5eabd298ee22114/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/0071625792af5ff29854ab960f08f390dd3a5e84/
    mipsel |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f2f4646d1ac92a777e23b14e50c3cf6e8e90723a/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/cf81aaa6897932dc965ccb156cc25cfcd3cfc57a/
      bfin |                  libebml-1.2.2 | NOK | http://autobuild.buildroot.net/results/737996e76a0c535fdb2b66bdb294815fcb96774d/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/4460aac38225289ef58a8693da9ae520ae07a226/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/2ac1a108bea5a4c5d498b5c6033b1baf0eab8671/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/00be88e7505c8cb74cf2460de6e1310aab2a7cdc/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/c2a10c28c930e908c4f629d5fa0d925038914a42/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/03927138229620d62c43c3ec72fe1e4c3949eff1/
   powerpc | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/0cfb6afc6e1500955a256b8cfd04239089fb22e2/
       arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/2b4eac6f341fe717483631de95f306c397d816af/
       arc |                  openssh-6.6p1 | NOK | http://autobuild.buildroot.net/results/26218e028f3d2c77c5192b45154627f08384b688/
   powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/65b75590a0e37d387349037ac58ad71986a61f41/
   powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/6e27c98407f114df07eb5cd16a843420fdb72bf4/
    mipsel |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/0da8ddfdd1f89bac4c85402a017a4dad95a525c3/
       arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/070155cbb6801316125668bbb65d0361cfb16c10/
       arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/92b450dba08dd1544d630be5f02302e2fea5e54c/
   powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/66702afb5cefcbf9c5eb29a2ecac4d39f43df1df/
       arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/bef06459d3ab6d011fafc04f4739c38151b75487/
   powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/43f202570d2a068c6fb34059dfecf7cac9de31a2/
       arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/d2f07b41ccd581980c75b89cc13730f0918e6f55/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/e09e24fec240382a3197fef3e98eb9a22f76420a/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/7a57f4e5b20bdbe2c6a7eee3515d82891df81d47/
       arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/5f96d9d7c3c57a223e6946d89b63746991a824ec/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/4d960d9aeac4d412a41847398b4d1779bb0decf0/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/bc63884072f941d0a3f6ac9829220684d94ee3cf/


-- 
http://autobuild.buildroot.net
