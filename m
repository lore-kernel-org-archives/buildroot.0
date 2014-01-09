From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-08
Message-ID: <20140109073009.A1897100CCB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-08
===============================

        success : 84 
       failures : 50 
       timeouts : 3  
          TOTAL : 137

Classification of failures by reason
====================================

                aiccu-20070115 | 6 
                 pixman-0.30.0 | 3 
                       unknown | 3 
             alsa-utils-1.0.26 | 3 
                 sysprof-1.1.8 | 2 
                 cairo-1.12.10 | 2 
                    ola-0.8.32 | 2 
                      icu-51.2 | 2 
                 rt-tests-0.83 | 2 
                  thrift-0.9.1 | 2 
             dmraid-1.0.0.rc15 | 2 
              cryptsetup-1.6.3 | 2 
                    systemd-44 | 1 
         qt5connectivity-5.2.0 | 1 
  toolchain-external-undefined | 1 
                  bcusdk-0.0.5 | 1 
                    crda-1.1.3 | 1 
                  dhcpcd-6.1.0 | 1 
               libsigsegv-2.10 | 1 
                 libpcap-1.5.1 | 1 
                     php-5.5.7 | 1 
                   ntp-4.2.6p5 | 1 
               wvstreams-4.6.1 | 1 
           imagemagick-6.8.8-1 | 1 
                  weston-1.3.0 | 1 
                    sdl-1.2.15 | 1 
                 netsnmp-5.7.2 | 1 
                  libv4l-0.8.9 | 1 
         host-elf2flt-20130904 | 1 
                poppler-0.24.4 | 1 
              libnfc-llcp-1103 | 1 
zmqpp-30d72d95f2cfdf9c5cedf... | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d99f945ada3215b8580321dc789657c7d0697fc6/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/0df56efacbf66789840df6e08eb864d62fddbbf3/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8ac89656c786c04700b8fc8354aef47963f086e7/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/eb8854b5d8b5dfd6c8caa242dde71698c0dc263a/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/24fa6e0c317d6a13a9fd9348e2effcc2cb340a8b/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e43edb6b30ddb00fb1ad585a5e0d59898ac368e1/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1d1cda7bcaf21af496fa21b0d87920d5dfa5254c/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/518e50524c5eba495300d45c1558c9fc83b4da20/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/2ab02782bc3fa1b3a2cf6ce086557cfd88fde410/
      i686 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/ac46bec04dcf966284d279172d038dbed0595d15/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b4ec231fff142827c3faada32d6d0d83c56ea1c9/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/45931ea228ae64ae4cd2fe7cab97ee36c45d47cf/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/277ecbaa3467f4bcfa7f69cc166500f4a782a21b/
      sh4a |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/7649217bfce93bed71d56752922ee963700dc5a9/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/2be7ee750d4424976cb783e3a497f1b6bead8c98/
      bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/add75f89740a0d0a3b7082e5863fa83e547cddd5/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5d714b0eb1d9c18ae8dbb855f7457020449ef83d/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/37a66954953311147eaf4d7fa87ff6406472c497/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/a6a48cc783dadf94c36c40cfe65edf7689a7f264/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/fc6ca7d657c88afbe98a2de8d25738ccfef209b8/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e4075fe0acf6ed6d706a9978d14f6f59eaeb0805/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/1dac8bfb5d985b2c5ed6f90c3037d330e2737c35/
      i686 |            imagemagick-6.8.8-1 | NOK | http://autobuild.buildroot.net/results/b7caa662db07f811b28837ca2c5003be19bf3c00/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/b69577c10cd6c2ed207b1f181750e1ed144a907a/
   powerpc |                  libpcap-1.5.1 | NOK | http://autobuild.buildroot.net/results/932ef0d4af220286d6b818dce26a64a3e27191ae/
microblaze |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/799ac378713d82f9632a2aa925223e21157b1042/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/88688d689d31ae89dcc829755eda93ef59d800ab/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/054f9af1c72103dd81fb1339fa88c5fee410b33e/
   powerpc |                    ntp-4.2.6p5 | NOK | http://autobuild.buildroot.net/results/3f78dad1914781906eae7defca074c7ff731097d/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/40a5dde3b553e98c05a7f52d1c1ff7a230686c8b/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/eb94659357e0dc68efd45aaa9e9fa03ee286f533/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/fe928bccf65b5950fae904d922d00d630382f28d/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/d678f48125bbe59e89b627d247834c594845390b/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/a4b0ce0621701df55c146609388c3e529ea3411e/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/093646df3351c703014cc504a6f157bbde82af6c/
       arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/301643161cf4a7f7f9fbdc56c48c1e84db60ee5b/
       arm |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/262a1f0709748a6ab74c0f0ea64f5d4b7cbd945a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/38dd62b618841b0e139be66ed2a2fe5261052ff9/
    xtensa |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/8aaa4b56a53241b7342fede568fbc72a7656cc38/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/70cfd649cfe96248a6bf35cb8f6f589982a36fd4/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/2c1a38f118162d16e332324424610b011eca14c9/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/e9d35fe6e63a90c047933062c5297a42f8c72a91/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/b68702f233c435c9bb3c4e0213c0f79eb36291d3/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ebce3ee060f9b12519a48cc9610001a24f0add22/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4088ded448e1abae5e425072e8c769b19d558ecb/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a4136986568d291f8b55d41eeb5970394a35972f/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/827a5b39647fb83f20b449d8cace6a829af03d35/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/4c46e1d25cb674e4098841fdf8f01a6edd8c2df9/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/636e512a9a1cd1b479e444a7b45ff21e29ee3375/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/1f0c0bc6a45441e3ac9b42820d95ef4bb436f5bb/
      i686 |                   weston-1.3.0 | NOK | http://autobuild.buildroot.net/results/b61f802d16a92717cd8ea701eb289cbc9719ba42/
    xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/db8a896b1f724163e14de03a605be16924b42925/
       arm | zmqpp-30d72d95f2cfdf9c5cedf... | NOK | http://autobuild.buildroot.net/results/6198d72088dd72f9506ee65678eca9d3020fd718/


-- 
http://autobuild.buildroot.net
