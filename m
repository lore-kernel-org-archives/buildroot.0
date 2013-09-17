From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-16
Message-ID: <20130917063006.03FC352C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-16
===============================

        success : 45 
       failures : 181
       timeouts : 0  
          TOTAL : 226

Classification of failures by reason
====================================

              liblockfile-1.08 | 34
                   cvs-1.12.13 | 33
                    orc-0.4.18 | 15
                setserial-2.17 | 8 
make: *** [/home/test/test/... | 7 
make: *** [/home/test/test/... | 7 
make: *** [/home/test/test/... | 7 
               libglib2-2.36.3 | 6 
                aiccu-20070115 | 4 
      host-gcc-initial-4.8-arc | 4 
    trace-cmd-trace-cmd-v2.2.1 | 4 
                      qt-4.8.5 | 3 
                libtirpc-0.2.2 | 3 
               binutils-2.21.1 | 3 
                 libnspr-4.9.6 | 3 
                 dropwatch-1.4 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                  nettle-2.7.1 | 2 
                 cairo-1.12.10 | 2 
                   dbus-1.4.26 | 2 
                    ola-0.8.31 | 2 
                  connman-1.12 | 2 
             alsa-utils-1.0.26 | 2 
                 rt-tests-0.83 | 2 
                  sawman-1.6.3 | 1 
              cryptsetup-1.6.2 | 1 
                openssl-1.0.1e | 1 
                valgrind-3.8.1 | 1 
                 sysvinit-2.88 | 1 
                beecrypt-4.2.1 | 1 
                  dhcpcd-5.6.7 | 1 
                coreutils-8.18 | 1 
          host-protobuf-c-0.15 | 1 
                sqlite-3071700 | 1 
                      icu-51.2 | 1 
                directfb-1.6.3 | 1 
              libdvdread-4.1.3 | 1 
                 omniorb-4.1.6 | 1 
               madplay-0.15.2b | 1 
           imagemagick-6.8.6-2 | 1 
          libmicrohttpd-0.9.30 | 1 
                  zeromq-3.2.3 | 1 
                libiscsi-1.6.0 | 1 
               w_scan-20130331 | 1 
                      gpsd-3.9 | 1 
make: *** [core-dependencie... | 1 

Detail of failures
===================

       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a9eec98a92f73b67a955f4d003cebac4833be9b3/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a59a4962b00a41a6632a3be16ddba143fff5820f/
      bfin |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/199a4802be840bea59a630ab9ebb5f177ab1f00f/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d93df7fb39cd2b0ddc436b747a6bbe46b3141aec/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/29aec258d38b8d7a9f8d3b44f222c2956c0877fd/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d6da944f9fb51590bd29a5d4c545882086cd8bb4/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ad1bc5bcb255fc9ed8229519793be6dfb6565401/
   powerpc |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/a1b0e70fba73db766e9dcc4000fa9ffd4e2915b7/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/5149c3a7db40b0d73e2398b3cd3a52106caa5780/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/968f53126c324c3493234ec1016b0cb1ba30f653/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9b5a7608b7878fc09fb1b0becce1baa079f613db/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c9e20e720c9535000a7caaf3afc02576da8424d9/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/7bd4ee9f2f26e04a7a6ed1349088520b9f969ffa/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/8bda24f3da35c0ed5c1826dd0b99f6bdf0ccc445/
    xtensa |                 coreutils-8.18 | NOK | http://autobuild.buildroot.net/results/a8ea50cfb7310b681c7057aef81579b3fea04f9d/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/6744331f5c6ae5ce6fae86f66f4bfb99b8638a9f/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/aa7b32f88b85846660c3899448c0e1b0fc48ba09/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/a6810b4aeab0e76de496685ae11b05a3b033bb71/
      i686 |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/0f31586e5367b65b483d531e3b40fac66a20ed9d/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/edcf4f6b55ebac0996c7c8c77b0a69667c4eef30/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/468a0db9369c113a9d73327d1bfbca01db5c740b/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/df7d8845d8d349792f99e022adade3e25dc4ad31/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/69730410ac1f21338679395db62860ac9f5bc06d/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/bd86ffe7457dcc2d17511123afb2059ab2023c8e/
    x86_64 |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/1f88da64ac799348cceffe6f39315ef0539a890e/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/288980b2d33d2c06f2de99d9742e2a1f441de770/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/c409b2c201a2671b0d6335f564e22ae628ac6e28/
     avr32 |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/4ecbdd3ab2bf9a4256228329f7afe674c7c6a6f0/
    mipsel |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/3cb5932a86d2d3a0146f118e20e5d5d0c310793d/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/f3f5a4d924ce692aa5aba370a9da8f574b5077df/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/e30ae83bcdfab6c2c349b49c54750cc6151ddeee/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/60b41af8dbf1b55c8a22d8d3db96210eef94d647/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/7007b97a9a1d67aa33e161f12ab9abfae3901bbb/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/1580303f2a39233425ddb384f9e063bdb716a9a6/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/eaffeefb17a5aa30ddcb901de3df8df7711256ac/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/ddf08c3f13484284ef399fa32771a92dab2ddcb4/
      mips |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/462e93202b56b327db36f0ded496705208d432ec/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/7674310698ead0839b3bae641d8823bc0a91a58b/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/0eccbef9ee5e9e970f9af60ca3ff4a3a8dca49c0/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/027b25ac4ea6c205a25bf594a35babfd3eeb92ed/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/121c15cbc084bba890b91944faf04984c3d54d26/
      sh4a |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/f3263c752a3a54ba94104e4740cfe1610bbcd338/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/6eb9a20cac93da6a0ff8b1b6b71b354641203229/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/97b9ba5e6c17cbe040a3443cbfcae398a224b829/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/5129c6475c04fa53f423b23f423bbd3e055fc209/
       arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/a97b0fd8497733c48462d333403f2f38ff3ec85e/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/c0e1b65d736c8f8ab43d1c06e380566534a853d6/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/874131b157edf3ddb66d7535d6e8f876dda4ddb1/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/61c34c14a61dc99b07082d39c6522a53f1edd5ec/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/baa9dcbbbc7ada2eb9c755f6c4a3ec1a4f8e0afd/
microblaze |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/19a515a55df6ccba2ced1c4d173b801f94ade0b9/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/0449b198601600a70ceda0177f185f19567f2157/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/3c1f15cda1569c5724ada9df591c816364fa1e32/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/19443859d77961155d85640b6ca58f329d8f80da/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7925a2ac36fc39fc6ea907501638db0c9248fd05/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/c991b41f523619b66c71f63c24a65cc16b72edd7/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/c93becafab9ecc1510f3fe584781cd25090b39dc/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/dc7f934cdf02691aa5612165fa76f9de6d48ce07/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/fe21a59abd1b3e858dbd3f6ab6e0981357283d9d/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/0f3e4803689f58fee420cc9fc14c36dff96b195d/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cfb594af664f53e78fbed4e80cd88f60d0986a9c/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b93de0ff7b023fe785329639b878b785288e0028/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/d4a69c431489bfbcecbf16a59f3eefb9bc0543b7/
      bfin |               libdvdread-4.1.3 | NOK | http://autobuild.buildroot.net/results/f9518835df22d20cbc95c9a7af7d611338fc77ce/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/317cfa79831dd9236f7ad1e684b88e46b7f407b3/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/54151285f057331c7adc48762928860eb823a468/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/607833e182966816a9d85a8e166fdca5e4d55d34/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c78abf2f5734011351920af4da570db03e30ddaa/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ec62a53c3845b76b06815ba77e575c06c76246c7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ca7163c066415b65d44164ed97c668d4113f3cef/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/f6f4c00fd10386817f1a82f32138ff1312f69a3a/
      i686 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/df4761207a32ab1c849970d602045078da249583/
      mips |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/87c76739b2875884a403a252db2e1f34e832311a/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/e775b1df8b30a9cf53da34c96f8435ef0a2f314f/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/f9af8e54dcc7d2012487a3def8fa00a94b107983/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/ebfe36c3acc806e736be549486b206c90a29aadd/
       sh4 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/c6698d6a4ba1169cbfa4cf888ee872eeddc45008/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/8687be8ec029486d9c5e2224cde542134f72884b/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/7c4809cc320b6ef0b8cd1631446814ac3bf73ca6/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/65d339d7674c489c7352220893804150d3b09971/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/feaf5832abb49e6edacbbf8d24055402da169154/
   aarch64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/936c4ac2a26b133ed2a7939fd3ab0420208ced9b/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/bd3f47a50eacd2217eb763c4771975eac229ae78/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/854b886a218403f7e45c282bf9b863428e1c4b7c/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/38cfc49d6ee2e11863cebe1ddd3978f6865e2532/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/3e24aed89bc37d55928bb224be36a11cc2049474/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/fdfbcacbad40bd116e60e6dac0f317f35e4a4933/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/889913902786259ace59b45918fafa430c20667a/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/bccdac41aa25cfd40d98b3b8cc921478d888f043/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/83a6eaa95c392436c104c9b984e635c77eb9aee7/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/fafdfdf7916daef5000678cf5e70ecfca0efa534/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/28876424ce65d5b8387d27765b423b13f15f0d61/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/0378b37022f411b55a2d31fedc67015cf45c096b/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/5a1633ebbd00dd569013828f68801df3d26caf23/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/326b98a5e6616c008ae88fca93537453333d1209/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/f2f3092835292883ee5fe7d966fe7237764343cb/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/f5adba815598f9b253983e562df091452745cc74/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/1b90b7b224e2ea5e5991ecc06ecfb72416fe0349/
       arm |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/e9fbbdce45cd97cc37d387f4db968a66fe66b385/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/d72ca65d5b308172cb6919d4757bad559ddd73ac/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/0e962ddbb7d126523bb937724266f4236a1105e8/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/83e7765047efac592fc9e7f88749526c9674490b/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/3d5f2c960ff2cc2003c9cc68d3a5a48009f5602f/
      sh4a |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/dae63646bb73269f1a49a2bdefe03949aa823d32/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/906ffd96abbff5003f509b04fb2159026033dd66/
     avr32 |           libmicrohttpd-0.9.30 | NOK | http://autobuild.buildroot.net/results/83b6cc67b7b1e032a2c99aee5109265f78c04632/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/38b809f8b84c69eb8ca14336ecb8ff2df62e28eb/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/3fa0ff0fdb2b10440aadbd08214b06523684412f/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0cb8a2e27bf5c59ad561be3929a603b17b0fded8/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/d5c785540651c25900dcd942797382abe97f6faf/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/43f7a58da6fb8b1f740458114f7b51a213fc23bf/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/4d28d72910921faed933b41224843c34c92858d9/
       arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/7218cc1c1067cd591714359fd959cb130db58efe/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/df31bb716874651b9250c6b8deab84c33d406e41/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b0f43c469fdd7b57bb44334e00b93b3329855041/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/390861c493788dba6479faeff2af925cb29e530f/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a0129702fe1ec2289238372fc2b86f95ba522d8a/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c4377432a2cfca7a58a6c1d2ba51d409e0b189b4/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/ad25675d0a595686000a937b9fd1c2b1df5f46b9/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/01f2fdbf3ca2c6f5f72599fae65f58e4817ff6ff/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/0bb187ad2f63ecd512a47eb07d219ff598627e7c/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a04d9c626d99ec50db6fbbc19b0929e4c469e71d/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/315566a62700505ae9bbffb48dcb53e6a7771073/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c4737705aa65a345cb36dfd2bbfeb6f9540ec339/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e4f8ce7321a17d8c158ac58e50aeb14f6904f5a0/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c46291d0a89750a90a461fa2ef4a493866575a18/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/67cabdbdf707fa3e8c59ca1d3c69f177f8b8fa99/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7cb5e2f477c7d0ddc79e38b2530b84ab9a7561dd/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/3c593b89f3c894b0b5bda04d10df5d79cfd5ba55/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/4a0133c87d2175fe1528cc162964801c0fce7152/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c838e55ac758b78e089fcec4955b6b9d1dd61b9a/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/0099f3aa3bc9f41d68faa8033099963e82c5f382/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/f71e44e4e8d4fa5af3c0a601dd2d8e568e40acc6/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a0a0445aaa3b2be8bf94666f767f56aec2fe3ac9/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/7480e978e07c0eec8212376358f4294164633276/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a37487995ef8e56c45b23096644212f37492a93c/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d18b96b52bba7c87293d418712a4028c20a3bbd6/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/cd3f86acaf06d81f286d634913e84529a22b97bd/
  mips64el |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/806b740bc4a82c3db5e410412b3f3dc4f24bb0f6/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/d74ae673358ccdf5cb24fa1d29bdc83e6314b4ed/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/5251742d93100977a198121304ef49a8fb00e248/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/2a5da85c2602666c757ea88aedb74c82c5a3b445/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/a773a3ad903e77c0b53ec7603e0e7369a50e19c6/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/2a3fa4ad28938906e5c1b92712e088dc7ea40cd1/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/af64d06516fd196e97957b13a8e65e28395a14de/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/cad777cc6d32781c3f76b36d819737987414a3a8/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/37c26681cb1191725bafd0d72563a558f9ad15b6/
    x86_64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/9efd0854b582885bce1f2e0b73b44a555e91f316/
  mips64el |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/e5a19a0020d9fa67d9770af8a6cba5c549292054/
      mips |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/06b0fb48a59259bb82cc76d9e7de67f8f0fff389/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/5e93e49c3d764a1ad9770e1e3e46686fa4935d75/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/ff0d3a7df33d85dfe8336be85f4fc97b106c4a67/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/840354e7c0a98f78d900735a7a819ed7b366056d/
      sh4a |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/387af7f2446689ce019313ff71062bbd96a42bcf/
    x86_64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/f53e6fadd6bc94e0301db3409746ab314f2777da/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/7837f60f761a76bf7d2bd444169c10039853b0c2/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b6611778749b210adf468e374adba571a193a4c2/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/76387f14428a1a9decd9698320eaa991e173ed97/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/dabd6d628cef8c55d83b81ace1f43badb9dd8541/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/0a7e99e1b5c7c62d56d01f7dada5f128f1ca0b3f/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/10a27528efcdc462a25728f7b38de1f5114eae94/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/d48b2b27a6ee2f04b10c43579c9dd18552f78f30/
       arm |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/4ea27e04228bc492650021d9db18a745fbe9d01c/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/b454f13851936f179c13a8ba94001f3707d52f49/
      i686 |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/cb17d47478d9d43ef5783e46e6a306f97947f084/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/e0ad05e7111a828b624758f6a3bec6401ee0a028/
      i686 |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/1323ba825754944b9710bfb0e93904ec38bc99e1/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/df72baf334ebdb0ed547102114b37c6f31a0cba6/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/6c3ea815910cb89c0b24428be39cb1e5f3994c31/
   powerpc |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/92273ee7a303270b6e5581cb8ef0528ee573fe2b/
    mipsel |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/76f824855a25ad74f6cc08d603af74978e855115/
   powerpc |                  sysvinit-2.88 | NOK | http://autobuild.buildroot.net/results/a4508a1386ee7867512e77cb39ea8f44218a2b91/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/20cae13a6c0992fb4483ddaacf845cabd758eb09/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/33dab8af2bfd16dc83cc1dfaf69095cb39ae4c66/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fdefd80eb65179685d5e6a302c068c3cccb07381/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/abdcffd008d2d06d3c8d7069b2b3a04a707c9bb5/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/ce0871c3896c7e7faa7230dde1e0edab72c92563/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/0f42403bdb06e1cb6807c2c8102afbccaa366236/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/391d4b68202546fb97f86b05fa0da6a86657f21f/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/aee4b803895167478ae01c4ab5b8f73ba5ccec95/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f0ea3c2026a5fd7594feff9ca658effb2850de22/


-- 
http://autobuild.buildroot.net
