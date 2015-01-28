From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-27
Message-ID: <20150128073016.5CE83100EC3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-27
===============================

        success : 260
       failures : 69 
       timeouts : 1  
          TOTAL : 330

Classification of failures by reason
====================================

      ca-certificates-20141019 | 37
                   mono-3.12.0 | 9 
              host-erlang-17.4 | 4 
                benejson-0.9.7 | 3 
                   squid-3.5.1 | 3 
             libselinux-2.1.13 | 1 
                 openocd-0.8.0 | 1 
               host-qemu-2.1.2 | 1 
     x264-20140930-2245-stable | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                      qt-4.8.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
             sofia-sip-1.12.11 | 1 
               dvdauthor-0.7.1 | 1 
           libmemcached-1.0.18 | 1 
                    fltk-1.3.2 | 1 
               qt5webkit-5.3.2 | 1 
               expedite-1.7.10 | 1 
                  thrift-0.9.2 | 1 

Detail of failures
===================

     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/e540aa8897300eda7075e45346ee92cd59f70f11/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/acc7037936487c145eac5dde081e7bbe1962c65a/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/1b985e4364406263b2e1ec9e3d0672ef1d586e3d/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/0a9d66ff87cb9924a29744a749ed54ab046db755/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/7cd184e4df14295e61465da990da6e40503250a7/
         arc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/ee683569350d5deaf0ccc603ed7066bffb83cbe3/
microblazeel |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/e084ba2e30adae391ed6cd2586688a080e03e439/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/96b56e3483dd99534d5925862438b4ba12827d1e/
    mips64el |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/d9b1411b4eb032f3c4cefabe0d5318d71d12578d/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/081f723a254510879c7c621a0a339cd644085dfc/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/c9d60bdeffa20d6ef92d2b347b6e66a16535cb1e/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/68d65c76baf8e00de943be9ce7dce94671352c5c/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/9de022f2ecbbae2d5d395dd535f86e6b6e8573af/
      x86_64 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/aca89de1b274ba40a03fbebab7cf227a70764b7c/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/ccc163ae7c2af40b8693683b282dc4f5071a6647/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/3c4bf74f740eeb6443dda235d30e47a4f8eb5bc0/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/a18fb01350e9c04c69c0f3677971b0d070cab450/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/400568317888e98e2a9fe5e7e3cbb96f1a2ef82d/
        mips |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/82a8f951ed0f4726b45f3a682fc585c52e71e05e/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/924c40c74d2ad65c012154c37e77bc8721846955/
    mips64el |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/b557ba51869471b77f9b0d3e69e14c6021ce4619/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/01075f63fccf72664d87207f36e876d5fab55643/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/f55312ddab4c459672b61c56b61d6030b4045dec/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/10bc0fa92cfe8119c33ea1629462fb59f55367a9/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/437c8ffeab1d82dfca633a41f52f6e0fcba20459/
        bfin |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/43ffb50a59c479da4aea8c792850d1d3d66b0e29/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/9efc4f92127251b35c7d1304c131e5b4bb99eead/
      x86_64 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/d9f27e126ff6979ba8a009b175f684bfaa5b7bd1/
     aarch64 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/a2ee40f5060bf178321b0b4d337100d66ee672bc/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/f0b80c750dd2d6f63a3b69c5f3bfb1687ef8fd42/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/5da0b46c0b303747858687859d504e6eb647186c/
     powerpc |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/23f51f64c0e7293d36b08f7cc84ad0856a5de785/
        i686 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/6c2e7ee1ad02988aee427fe63ec393dcdf3ec160/
        i486 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/3cbca685abc34a48efa1088e819b1c86f2bfbf75/
    mips64el |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/a96bddb49355f8d4ee18987b72f4cfd1fb667fab/
        bfin |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/46cc0c3bee2fba1f91e37492372891f0d0c15d12/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/673485cc2656d5dedc4bd980ebb1588080ff1f6f/
         arm |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/5ebb47ca3f1ec4790f8fd80ffefa47483535a74a/
        i486 |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/e7cac9a1342196f2b4484425e53eead2937c4b98/
        bfin |       ca-certificates-20141019 | NOK | http://autobuild.buildroot.net/results/11c06a68bb838ffcac76c9c40b00333897d52198/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/a2768028d352c16a77ba5c03190cadfe50939f1b/
      x86_64 |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/8e3fbf35cf2f3c54110c3dff6f774ab86f3a519a/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/37e5bc5abc3c8ae2a37638ac0872b351c7fa193f/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/9b8c045665a3c6b44fda937d236f0abb16d32c96/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b2ec7f851611ae2d8569bde0df8eb848d7d3bd74/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3106ebe8d18b1bab93970779be3a6f2672015a73/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/86b1c36a51f991699c3c404e3a63285b22a7577a/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7b7c8d6bfc332af0a62ebbeb582490c365d3ad38/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b8581a8e6a837b7c86807fe6b8cbd54b9dcbad63/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/871dca4586d36f620b95e4a6c0b7775463deda8d/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/6629807a4771b548972f5a588ae400aa02595d28/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/c3d8e6c21e138b8fd884fe21abc6e9b24ee05237/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/51570ccebdcf1951c1cb57e7b41cf78dcfb8757f/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/2b04bec12ea58d5e9d507bd7c328d01dfaf1ea61/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9c878e777d5e8be099ffc1ebe742e14665bcbe84/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/011d4b09cb6f46afed218a13bf87897d863a1edc/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/689d7c9cba0b8fd8224c73fd4fee39eb61eb1990/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/3ef8d00c0a8d170abc77afb7af82c016090e4d16/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/c0cc2e9f468761f44243383b72d83ec0fe300fdc/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/528bf77ea07e079c5673c19a74ab6636756e93f1/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/fa363860281b6ee41c9ba4eea80d66999054de20/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/a2a8b680a3eb3661ff36c8356017c32d74720c0c/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/ad77af7a953311dffb8a4ffed96d4d28d1ff73a8/
        bfin |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/4891269ae5875fc3daa59035ab9c0135de236584/
         arm |                    squid-3.5.1 | NOK | http://autobuild.buildroot.net/results/8162e4ec941e7642248373be47cca99113a648e8/
        mips |                    squid-3.5.1 | NOK | http://autobuild.buildroot.net/results/a7001e5876636aa352b5e889d5ca339f0674ebef/
         arm |                    squid-3.5.1 | NOK | http://autobuild.buildroot.net/results/5cb539e6bc2a6f573214769b71264a57e902bfab/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/fe2a5e1b3bb18baae624716f3c76f882b9ab76e1/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/b651f488fbd6f2985e1a656814098db6c60040e5/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/dfb81903855337bd42a7267459ff9c9896afd8d6/


-- 
http://autobuild.buildroot.net
