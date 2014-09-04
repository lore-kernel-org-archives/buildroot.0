From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Sep 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-03
Message-ID: <20140904063014.5769A100E7C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-03
===============================

        success : 176
       failures : 73 
       timeouts : 0  
          TOTAL : 249

Classification of failures by reason
====================================

                     gpsd-3.11 | 24
                setserial-2.17 | 8 
                  boost-1.56.0 | 4 
            host-texinfo-4.13a | 4 
           host-nodejs-0.10.30 | 4 
               host-ruby-2.1.2 | 3 
                 gnupg2-2.0.26 | 3 
           libmemcached-1.0.18 | 2 
              libgeotiff-1.3.0 | 1 
                   czmq-v2.2.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  thrift-0.9.1 | 1 
        perl-xml-libxml-2.0116 | 1 
                  cppcms-1.0.4 | 1 
                    fltk-1.3.2 | 1 
                elfutils-0.155 | 1 
                   duma-2.5.15 | 1 
               alsa-lib-1.0.28 | 1 
                php-yaml-1.1.1 | 1 
               mpdecimal-2.4.0 | 1 
                 cdrkit-1.1.11 | 1 
             lttng-tools-2.4.1 | 1 
rpi-userland-f9e6f9f3def8dc... | 1 
                libiscsi-1.6.0 | 1 
                 webkit-1.11.5 | 1 
                espeak-1.48.04 | 1 
                      qt-4.8.6 | 1 
snowball-hdmiservice-f75c99... | 1 
                    sudo-1.8.8 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/9fca9097d07e0f2ed59880612606bd8b927e7b38/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/b06b3c75064043280e84acdfa4febe60c6092c1f/
    mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/87a23b8d286428995368ce123e38263453db4666/
    mipsel |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/7445c4934cee545f43b4449e9f52f4ef47c51109/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/7fb9b117c7062902d75edf4875af62a386483909/
   powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e88c4b16089aac3664184779bc715a9d132cf1a9/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/08afec4dc2b57c790827ca78ec691b7eec804778/
      i686 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/2ae4f9bfd4fd5e8eca93757847b30afd32bcab96/
   powerpc |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/015ca4960647f1aefd313c954898800afb02ee2a/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/604ad4b044d1dfb72248db9c2134c212b4accb67/
       arm |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/80ba5589910ab70545ce51c2a1e7be87553c4489/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/8b84d7609b0a33e97ea4defc2cc6107d70cd0652/
   powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/af3005f310a7bb4820899482a9c1d1cfe341f360/
   powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/7e1893bea98a13e454fa29f8b2d13acefe1845df/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/863c5fd85823082b815f4be997f92b6d6f4beb07/
      sh4a |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/305905709280b7790a13f85cdeb6c4ce620ac1b0/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c1b9ebb053f68edd71c54343aae95d1e9a454c25/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/b92d93141f3ce0c9d1db850c8dd5499f9a13647a/
      mips |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c23dfa20f1ab30b36600c0ac16100783e800eacd/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/7a115f9f21d66a266d0f92e4b42cf1420916167d/
       sh4 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/f1f73ad89536612150f5d99478fd303d55651d70/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/eb7742a92aa76a3a109111da615f0397f00b469f/
   aarch64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/6a0dd13c8949992064eb6e736fe4ed2724d224f0/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c68203cc9cf59db0b645d1b20ee7bed4670bbbf0/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/0ac7a7d9416126d7e707fbaba7647c3a95657ee8/
    mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/9173fee6a0b27cee61bc1fa031eec72e111a7da5/
      i686 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/d692281159549902262135d1e586b0343891af8a/
      sh4a |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/cf8c149f5427455d28a75b7d8aa06b77c7d00bdd/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/e066a3ce62132213565d9abe71847daca0886d9e/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/9a7bed04f4171db284ebf2872c38edfdde018db4/
      i686 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/cfe2a81a2a5603a16736cf333441c008e5a262db/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/08cdb5b154a9fd597384b314ad0a6739e81bda63/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/835b7c92a7efcf2ecb2e8eaaf9e4567828db61a4/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3cb7716938bed2f4977ed540ca5e9bcaf15c49c2/
       sh4 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/57033eb355b93d5da788d90c3f80ea991eedee3b/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/87c574190d3eca594bdf6c814cef0155f5c98b6a/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c561d89f3170896991b999de236af4db10234e21/
   aarch64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3656672069fe127c9a81c948eb8b37ec8bb79d8d/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/6a0c7b22a99dcc81e502ca690b7be85740d8b3d5/
    x86_64 |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/146dbabae6c1c6c7e4dd8a9bf3d3f2a4a001c88b/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/506503aa1d1b86356f5299bd5f6c91427b9e352f/
    x86_64 |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/275c7f02942d1acb181892800e3f30846081df50/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/5b633d5c7f0270499cb31e8a321834dd2b4cc2e2/
       arm |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/f28085b75b92a523ce140506bd434b18fa58f6ed/
    xtensa |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/26bb33f703fb5305b6a75674a99abb6e9e25cade/
microblazeel |                host-ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/e9fd90432d0485cc8971c7fe436881f2480a71bb/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/912a59ea582bea2161376f74353d7eea02eba3c1/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/44fce5e1a06c0fad6efa8cf857c0b39f0990e60e/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/9caf3bbcd0631c1c010488c817cecb332fda80c2/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/be7cd9adf29d509c7bdeffccbbe6bbfe1aae16c1/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/db4ae9d652d9f123eab573a1adf9662b10c58523/
      bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/83dd6bb335b9d40a3eb3a8701ba8e900488dc319/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8ccd50082b30011a0663f3e6e8dfe55fe595345d/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ffdb6e322bc9d160dfb959785184572d8318d54f/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/2c9c026b30af8de8bac0b493bc404de9c17b8d96/
      bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/153031e6f5b96efa0a11db3ea67a37e7e74864dc/
   aarch64 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/8af83bac203333781b0b8f79d94a6fbf4de00e9a/
       sh4 |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/296cc7f8ce36b0c8d23ddcad27767b9df8c6ef21/
      sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7a12796dfb8f0a74e0866bfa9011f88ccc63e556/
       arm | rpi-userland-f9e6f9f3def8dc... | NOK | http://autobuild.buildroot.net/results/7669690724d58345b51ec706bb706d59d47a2273/
       arm |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/713a68be2b71a8d5982add15c2b71e666a83d316/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/dc214aec1cf90e6c874c9fd7cbe71027ebe13ed6/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/c8e7458911c54020ff999452b9d86a48a03e6693/
       arm |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/a59465462679891b5fa6559804c954c99c7b247b/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/3f2c84d9081c3b4ace3d2d20dfb9ddbb58632889/
  mips64el |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/c736933d4110865008f2d1e8b531b6e392c68285/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/27beeaa1147103d44a172cf3e4ed23623f1794c3/
microblazeel |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/86efc44200e80f6baee6846354ce77ef0aa7064d/
      bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/d81da588e3a667605f49998814db60545113b9c0/
       arm |                     sudo-1.8.8 | NOK | http://autobuild.buildroot.net/results/c94492243295d5b2a53c93da04dace4e80b516ed/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/07d0741531fe4d123f35a2b717bca4bf2c0ca327/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6c552d34a6056cf68452134c10bc53bf271c8cbe/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/57c6d537862e3909626952584256bb0f6b7d3ac5/


-- 
http://autobuild.buildroot.net
