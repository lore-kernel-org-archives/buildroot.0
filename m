From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-09
Message-ID: <20140210073010.EB93B100ECC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-09
===============================

        success : 59 
       failures : 1111
       timeouts : 8  
          TOTAL : 1178

Classification of failures by reason
====================================

Makefile.legacy:27: *** "Th... | 994
                  aespipe-2.4c | 18
                   attr-2.4.47 | 18
                     gmp-5.1.3 | 14
               alsa-lib-1.0.26 | 14
                       unknown | 8 
                       kmod-16 | 8 
                sqlite-3080100 | 8 
                 libffi-3.0.13 | 7 
                     apr-1.4.8 | 4 
           argp-standalone-1.3 | 3 
                   kexec-2.0.5 | 3 
              host-sam-ba-2.12 | 2 
                     vlc-2.1.2 | 2 
                 libpcap-1.5.1 | 2 
    trace-cmd-trace-cmd-v2.2.1 | 1 
                 webkit-1.11.5 | 1 
                    sdl-1.2.15 | 1 
  toolchain-external-undefined | 1 
                libtirpc-0.2.2 | 1 
              pcsc-lite-1.8.10 | 1 
can-utils-111f8d3acf6f6b30b... | 1 
                coreutils-8.21 | 1 
                 libxml2-2.9.1 | 1 
                  thrift-0.9.1 | 1 
                   expat-2.1.0 | 1 
                     at-3.1.13 | 1 
                   ncurses-5.9 | 1 
                 lvm2-2.02.103 | 1 

Detail of failures
===================

      i686 |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/9dac650aee0f7cbb7fc8e7816fdf9b519102a96d/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/4507e565d9e03d4a5b9799a6c27fc3a410564cc6/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/23cf57f0506d9408edf8f1225cc1040b7176c16e/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b65b325350e1d540cf73a03103474ba2e111a84a/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/32703b186f694ac4f91759ad2acef6417599e37e/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/c3575643d27d90d28ef95ba3c43b512637706b78/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/289395de2ae73bf2b5168c2e3901d3a2c77b50e1/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/235aae9f8fbf4bd4efd807d2e94b3384184b5182/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/2b864e9b9a54401d84ae9ffa8245d839c4e354cb/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/95504d553c024a067961884bb00c6412566b45a3/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/f4605d81bed23eee1590c0b72e58f27521748bfb/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/d65bcd906ee7d06c0e63d083dd9e50732d57ec39/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/a521ec56710e69091ab1ea607da2e2d0a1c2d338/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b31a76320d0d115be74b91d10440644e846cf2d5/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/90f2e04c94187baf9919efb3b0249e38905e6510/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/56d4fd2e74c60a9ae269296615df8b9fb73864dc/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/06c4d106e733255113f320dba29e47e1f29c286d/
   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/a52d9adba75365def852123268eddaf85f879c86/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/224bf9c2c016f73fab7e03d0ffa79f62598a1b1e/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/44858a83fff286e2ca5f9cfa2ba5ba043c974d24/
    mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/794e80695fb9e270321decf11ecb9566a565a2e3/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0c6b300f73f8838b8dc7fa520d5c3b8f841aefcd/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4c02cbd5709d826fab65d7b2a67cff6cf5797738/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/57b5a7eaea49a10d0b0f0ecaf200a3cb00546a55/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/484e77fb522669e83d163d974ff19bcb3a68ccde/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/73c7ee9e7e3e981663b9a22b185221be30f3947c/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/024d31144640607bd3acb64f0d5fd19b3b4a3222/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2eae2250e5016a5d615b0f26a596f7c50d4c1aab/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ecdc22b37ed306e6cbc3c5944d857c46cd920ab3/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1f6568e0ad02f5f0e4f202b6554c910f5c34eab6/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/bbd0d2051c134a0a9af0dc41ca25dd026b1b7004/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/615d398f63ef4fb69f2ae7a6bc04545a76a4b076/
     nios2 |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/4c80305f751287bb19a6638bb7f217d4268f7778/
   powerpc |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/1d6a7f229fb8d9b75cb17490c33d7aa39f997c5a/
      i686 |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/ef3a2a4717f9b3c30326c03c2d22c2de517c741a/
       arc |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/f78585e26696801191aa17137fbf1d96b91dd576/
    x86_64 |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/fa72450803efc80011b722ae50cd78b33cc60299/
   powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/84b26a28fdebb773d77cc3bdb80a0588b25ec56e/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/3bfb32cf1a33783f2aa72a01eebb96577d472a1e/
     nios2 |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/d921c9e34cefda242a7db35d642034e23c2f1c5c/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/5f3a90962045e80fdf2b0d0e4d4b5e8114d0957a/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/03476b8484cbdaf0566eaa37fe6a13a6fbff1a9f/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/0ccaa0d7a3090fe641e09f84a5723f9a03253769/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/507f6b52d4fb2bd2c37c21dc817ec0399abfaec0/
microblaze |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/56d7a3058590467885bbb7e9b8e7bb44090b9935/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/6c0e5f43de156eb1b47491f24825c6ecf37cfc7f/
microblaze |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/04b29122903ff8c07147ba3fd0c0118009bbe45e/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3a43db3ad9d5ffa18d7f2a91866435314797565d/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/631e6f08d73e8fe215c78789c865c7e45cd8621f/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/229e8664b382039f4a7c4dc7f18fdabdd792a413/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/96d59b36308c798f453b36429b648447a057a34b/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/79f39d7d7d78060777628faba8a2872a562731ec/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/97c3ac38375764eb0b0de948689c8dfee3fdde5e/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ff7ac12e2269c93c959a316c8307276a33936320/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b0294813534173d8be780e55f10c254e9ac5fb30/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/48ab069621a653dd40567b3b3d784a0fa121f3a7/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/e8940c88d968ec4584b6ee53d5f7e86e2b9d36b3/
       arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/e0bcb8ccce9200200ffe3569929753a60786d7ca/
      i686 | can-utils-111f8d3acf6f6b30b... | NOK | http://autobuild.buildroot.net/results/54bb537758848a3a62bc29540699f513e2bcc901/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/8501f3c37e3ea805720f833ba1dc3a919350a2dd/
microblaze |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/458abd7177e06fcc157c745a2d4b59001815cc10/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/dc200195414b18e309a3c731411d993b06d03963/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/c9b1e7619beb95f6fd47dc39880c31bd4833671f/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/e74a0695e4786b9b916a8be6b4a6cd86d1e2b97d/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/333da9263c93c615680677f9e928859c90510bbe/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/7933270f6492a10e4107f6460408af758132fa51/
       sh4 |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/932c1f77070a62a033008fa61da0df6f8a9738c5/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/805d0fdba6a33452d6d9f806e0731bba83b2f007/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/bb2a0bb7f4b00897cdfa1167350fecc550a0cd2c/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/070d268ba9e32388cce5bcdc3f8ea027792ad32a/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/f23c822afc787f8ae0d6c662f78b2865e6c78c10/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/b3669c2c10cb129cd05b88e8ee6fb6e1afd27b56/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/6a30db00ef967c149f5c6e52ca04e65dae5ce141/
      i686 |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/f2d08a83974a588b9fa6eeed336e31152a8d4ad8/
   powerpc |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/02b28e2cf3972edd70db1f47903df2255a1acb63/
   powerpc |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/69e5e695fca107f64bddbd3f58c89de20386cbee/
   powerpc |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/319a5aa2153e696bb744a6445d41eb7e18745910/
      i686 |                    kexec-2.0.5 | NOK | http://autobuild.buildroot.net/results/c1b2048b6b4697d47c894e2b4eefc6c4bbd86f53/
      i686 |                    kexec-2.0.5 | NOK | http://autobuild.buildroot.net/results/7d2a08a91b6a8f040f64a5014e6d8d41fecfcd09/
      i686 |                    kexec-2.0.5 | NOK | http://autobuild.buildroot.net/results/c3525dd25a37db7a976c7019901160e449363b5d/
   powerpc |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/842131307c171e1bc5a1e918996d53b00ddb1be3/
       arm |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/7534ee2bd63f1952d377086841cadee94f5f033d/
    mipsel |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/42cbc9a0563b06d2e4c80fa4f5aae604db6e05e6/
   aarch64 |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/3b5afbbee55c5442672a11bfce8293477ee02eb4/
   aarch64 |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/2cd9b2c18741fdf3c17fab3f28dd34c8137f0c2d/
       arc |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/f4d053d71e27ccf779cb7992041a95c4ecd20af9/
     nios2 |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/31a6199528ac3465bfcc04cbff5cef31a4194172/
       arm |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/b8a09c521c07be53403d65ec9c1d9dd92a8f4b55/
      i686 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/225bca6492dec36e48ed07b0be27ee732b897e39/
   powerpc |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/93d3d08038783bd7d7a99ad1184fe558fd1b317f/
      i686 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d6cd59e08cf75d433c3df62acb72f5ce2bc26a97/
   powerpc |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d81cde2ef30d16a0ba3bd0c50cee1a4db118d525/
      i686 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2d5ce654fb6f26a0fc97cecdd75096fddde48d8d/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/359d46de3ef1c51e27c4e1261c60d03532087a25/
   powerpc |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f4d48579ce8a12c0dbfc861a65f974879373e84b/
       arm |                  libpcap-1.5.1 | NOK | http://autobuild.buildroot.net/results/653c9c1d9f24a7376a825d16d0976ad3b18f049b/
microblaze |                  libpcap-1.5.1 | NOK | http://autobuild.buildroot.net/results/7825cb83dd80018ee9b0e91ae8fa5435f447c467/
   powerpc |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/de391603f847bbd89978181d5d3ddc6cc60f49bc/
   powerpc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/c75c50ba1fd78e19d56387e35c25a5f29f49f2ad/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/1098c4452ddf8bf2fdd7fe9a75f19fe0c520fc27/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/efd13d7bff78f3cab86e0e9ea79b227d188d6aac/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/08d5a3bd5dde9d2b5fd1b578f2cac5291162b9f4/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/912a336f2bee0980f7eeb8a3e8af6ec8369f227b/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a65f2dbf2d1726458bca4efb6dba715a6ca127f0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/08d7a25efbfc3d443dcdcf6aa7082635788e9c19/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/efae102fc6a8ab310b56c4c15ea602338087785b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2b05a5e5917258cc4df6e3983cc390103309f67d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b1231817dbe8c790ef35eb51c04c9a92b76a3828/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4e92028e4f21f8480e02e6e5ed9bd88a4b9f122d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b76db3187a313636a4801f1f9fcb420dea8baa63/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d519f1047291f54776b14d422d4527658cb2496a/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6883d62f116e0727e65adb7ea5ddf36d17d06c5f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6b3c645838b3c658d45265c8b99e3ce914d2ef52/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e14eafe84244a8b5f3cdb6b97d0fffbffda8c953/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2ecb342b492fcb348b44709d976ccfc37da9a1d5/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/353bde5a1f4bdcc5663d0541bfc38c4789036659/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c79779731d191f91b321cba7dbd95681a05bd0ef/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4747f3bfd24f05124a57463adf199fb07c8d09f2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/beeb06d23994d350acb221255184a2d79c061b20/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/790f427c708d84f9c8790008316567b0009776d2/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5a708980f8845fff776b9d42c5de0f572cc94523/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/86ad6f8cfb2ca46537c8f96b75bc1dda5dc3a249/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/375cf200af42a8603fb06e9810f67e93e458d612/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/651f50137ea4a80f455974134eb5faff5961e629/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9b71b63586e262d4f281b9ccc920d36a82345c2c/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/145cf09eb33f7f8cdb5be460c5b81bc2b81b9887/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e37bd208ff5b7c27372a7528c7844e70c7023b14/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b6d684d4c123070d800b76b32827d80bd79dba2f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/950d1ffe602ed0388a9aff892888060fe007a415/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d499ef426d206e365d4a162bc4a61fa078f846c1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/86efcce8cf851e983151d229c341129b069842ca/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dc47e3fa8acc20a13d4cd90abdd01553c7e4aee7/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/84bfc557fb41c81dc636eaaa5bf1ebdb5c869a4e/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/56b7165b7552a35a94291a78689f2df8baf1695d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/da6d12e8077dabe0c23dea8040d6747b18d4e5ee/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5f827120c9edeedf9006991a47a08fc875a303d7/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5289889e2da50ea5d9d159960a88ba5de01b652d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/515b3252acc96aebf8c138862f6d19fa1ea74a02/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8299dc32082d37c4f6f39ef2aa4f9bd922436972/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e85868700f8b3d283d4c67af11e5298d16e116a5/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cb7fccf4650431474b4876fbc66912b009e551ee/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7950d16f1615e9c38c73fc50fc5ba373bda42972/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f09daaafc1dcd1f45f70b7bdc28613d606d616ce/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5e08b638b3576277ca546b44ee59d6ee09179036/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9cd82cb67c40f5b439e3d27d3ba2a5f730540baa/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8951db00d8f8f036a48ecc766462b60f09d30cf0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e57c8d0c270aed97e809a5447edf41f549f275a5/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7fd6bbb418187bbf11b641e08cb5f490379a00ef/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4397c218e99cd2433b99c28df682c0265151efc7/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e9ce0b6bf9807c80a12f4fe1f0edec69825219c3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c77fd2071565b9d5dde46e087a1888d1ed2ab897/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2f4861d502050955ec123a8dbf87ae0e38b15344/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b0ad18b4143ef52df83d6ba80c98dafadfd407db/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e90b3ff576cf41fd2e77e45c52ae6328f39ac74a/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bd799d5fa27ab617ef856832d047a3bd8805f9cf/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/59ed381dc209cc2537f62367ca012611c445c157/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1457016891ab955a6465893d526783566f035fc2/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/45718662cd295a9c4e5b4985eb05411c220672b5/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5e8d0d9d71f74a80dfbebee23a10e4f36ac969b0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/507b8e92941d6dc526245ce9995fe4b2c9ee3475/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ae83b5ff70736e68aec4324a50221023629b254d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2626dfbc6615ae6fc19fe35af54fe562ded063ab/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/11da2248d83611a84b886ecdb51c490b5b27954c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b967b4db8c771918a8b3e566984799f5540488a2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/28087f0735982a3cfa4e1bfc6707d64d04459bc7/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3f110d10e040dfd5b81d5b0362ca3c9442cfa72d/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9c41f5932739fe9b7d5faccbd7f92977ae957fe4/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e79b7975150672c5e4aed9abb09d051ecaa34398/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b87eff328b0ebc741b5955683ae1777271765763/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/413389b1bdbe92b54bcb4217a496b168725a7f37/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/99454ef945d4c181ffae9176dbc7c2807fd3af72/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b44307a22b70e575b4105fc92fae47906e26dc12/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b4d2bd5f0232f3d83f0a1b264f5dfb171d4e9a12/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1510007e8ce3d6f88f3e2ee90b7c2eadd8d19c6a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f2f847e1ba50e5b1a794a089adae3755945fb3d8/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d7e75e124eb5192a97feab2ed9c814ac5a7b1f9e/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/33c816d95fd3cca792ed1d07adaf9982709d5271/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/607c6a9a445e825a877ce4b25d0d8fbe4b85c535/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a9c19cb14c1a3a01885d4f924fb9d0cc6be63127/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fe71b6763b0271644f469d0f42c302facf2bc003/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f629b720356b9c639cc4a9e701d0d67026fe816f/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3d6581ff1cf0bcbb017675b18ba2ac2573fe528e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dc7601515dd9b8dcc9da88e0ffdd43fbbed5e63c/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ed5c86c0da87832576fd0a3d462a8e3061a4d9c7/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c55dc6321b5fd322177b5bc098df31e5f637d305/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c0ce69ec2a27ce7f4d991b447be2b03aba67af2b/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9cc1afc1916523086f3aaa6498c4d41c33b34f78/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/02c7fa99479182cef00a2be4064f84ba7d739344/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e8bbe6d930c45b8da2cb7340352ec7ce71bb011d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/232f9d67e3c9235d84a3d0d5abee8b2e6234f2d7/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9de6170aec4cdbf39ed4c7634d455092a1be0790/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/48e414af44e43dc08df87677da0cf868678efa22/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/96942cfa7677e1bc0ca9d3ef50fb36f9aa59f72d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ec88e6974b84477f910b37da734dc3222066fa50/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cbce46488052688dd97296077084207c988dbb14/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0dc9785cc105df3c62607295bca981efa5d39142/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f8df4b52edd9baf48c7b160aa2e9f0b14bbb3a20/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0d32c5c8d1893f0865590194767c224fbf6d4a00/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7dd61c4c9e7f0c4009a9b218290d0aa3053a2d78/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7a6fd70d9836d9b612973f11bedd1c942c3ae5de/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/64455c9305cb14d58329b5e9b43609c1912596ca/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/72b2bebbcb718c71cf5c427a069d960b1aaec034/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/699b4cfe2474c0f5a788e4a41488b3075d863b3a/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/36dbd573ab9dc2fca4be62edb01fa3f9bb5fd47e/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0ff8e7c32dc268e09ca3d6bff425e51d7c377fd8/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1c69deadcfc96b3eaa8fdf0b25f3ab1a2857039f/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/89f783b357cf6462fcd3d174123d21f73a1e4647/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/04ceae7901215a30647848a66f9ce3ed54bd7d01/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/efb365f8ade81e3a6258f55229330b9e39af87d2/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/33576809b27da0deaccd58bb9c6520ba0834c182/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ac4053948ea8b503e319e7cb6a13c252ff0a5ff1/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/badc4855ef6f7353c55b4f6286dec6b3d74c6601/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f627c9354ba2ecdf122c26be02022190c640da16/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e506741bad3422db6796d595682c87abbb5276fb/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ea6c8a031d70dc6e8f25f6dbc07224cdde33229a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/493b64657e530fc315017baccc97de561ddd1663/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0d2837f410fe29af16e6c0883cf03f5d1c7daa5d/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1cf0898a233ca0ac5cdef5ddc59d9a40bf45ea68/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bed4408c5d60d13f099ac7fc6f019e8096491ae3/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/92c3b0773292c74d7bd9763947009d047a1ec3da/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/92f20be92a090395554383f3775e3ae685a5bd05/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2a8c07e46bb45055c44a9d71d358210b450c6032/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/80f44dd2d93e87da825d73b65aeb0e563b48a30f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/289287fc6acfe2a8f9e2eaee53e1a7d1f1c6da9f/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f596fc5f60f058dd63334bc73801caadd91ab056/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e205bc1be42e119179439fb826f4bbcd3841acdc/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fc37389d42df16f9e0c4cdf0e9cee9d8e923d990/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a53e1492672341335920f5c296aa49b4def6bd0a/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/92d185aacff080f797278f5b4cba16fe486b2fb9/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f359b62e0b0ecc2278045ba5bf3cfaad1afd918d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/080c52e61a0508766317ac6d503ecbd47e3982f4/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1503c9b2cbbad243c9790f48e7b7394922959be5/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a75e9c32f356cc7433c49cba008e9115b2fdf027/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bd6ff629a113903259261f94fb387e8e85e42e5a/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fd299c6bb71a179e79f7bb7468994f59cda30c0b/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/29e980839ed4437ee7ffdde18aef49a09a46aae9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e463e3582b497bb7aa88f94b3497e6526bbd6792/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6814d914bb7cba1d7ce417546ca21947e5771299/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bb5159d4b56588f03a64d97d3d53425816023d7b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/397448f672913653f108d944d932cd715d0d57d5/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/43ff414d2fee0fc2e6a50f483c3ec0260547b26b/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f12cd9e1092d0bd04a22d7716314dbc9a3c15f97/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ed10834660f4935c7868e5f155c99d3efab3eea1/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c0073fb881cb97f065b1cc76d26d1dc71521af46/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/69dc1436a4b0304e4c169d5516991a263e2feb2f/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c5607e34b4feb197295aaa19091ebdc8008dc6ee/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ffb6d30416e1afc7dab08354e99c77c3d6f41eea/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b86b2afb971fba8e5b8583d7782a05fff6ad4cbd/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e0869879b081fe259533bc885fbdbc11816cf5d4/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/26248aeb8418af216291f9952725c473ab03527e/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e39cbe6c098ff7f8805214dc7d393563a4624077/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/87b063aa697e14e92ea0b913af3b7ffeb5277bf5/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/13729fc2306d8b27baa6bd823f4a55f00673165c/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/460c608864f12ad726b475cbe516d100d050bdef/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/82a5da0dcef34144bc3a729979f7a959846b50be/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/053750c97c31ebf4b3b686101ed34ee66dda9f08/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/71702f2021dfad42c66f319dd2fa9ade965c61b1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/81c69a90d90f0642252eef203fc1ceb3c776f75e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/87873f624d2e5ea28aa37462c6f9b1b5b3209f4f/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/83685f889b513ddb22cf2e1365cc94ba62445c9f/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a105e1e193f9e418837d149d6d924d052e74b38d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ed934ff911291689582d022b96721db604b1520d/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/003c272823e1e407dd09c6aadec6c9a5a01f1e79/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6c0b0454502d9fd8c891caae9baefe2968137c52/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/84a5e9608b43207d70b42b5b4279a7453f1bbc47/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/37d3955b639593640d7f050a32b160fdee733b16/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9cbff62d9a78b9a10a5aff742728ace5ecb81da2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/db2356caa86d2cb1175da3de57936323d1c0de8d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3cc884707404bc213c924071af57083dde443738/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aadc0f7e4b996e80846fcb7b67386733ee56d434/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ca48192f3edfab9403a230fac093c8847963fd09/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/288d08723b59577ecdb7aee1a24d0e67759e3c87/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/304c8f2340fa0e8fbf1474328e7cdb292f17f004/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c06044e39888c17d2f64f50b6bf109aecd4a7b88/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f3c59c2e79c332b6360e8e2842346e5a37917e83/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/20397479a8d01a2e28d97f6da1ce40c640cebe75/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f0a8f3950b869edc0060fa390d42a0d70ae000c5/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f2d5dd09b99c4284bf716db3b5d38334ac332d41/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d4fc0ec1aa4339d45ba326ef8861618a61e5d1a1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2d0a92c630f5c64e17804ad54e0676bf0fc96fe5/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/26735486c5f3b5fc9cf1faa0dbd4518df93e5a83/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0fbd73fef88662a56cf80f1e8068e7ee1ac2f325/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/839003013b19c79946624e8b35b6625945b9dc41/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/581b9310b1e96fc3fd50c567cbc9e6cac2fde613/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3e07962c65ea980f6dbc4bee02f570e167621b6b/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/264944af8bf77bfdf9e97cf69c30218b26663636/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3e65df0cf2ca7debef5819ff652776830dfcbc95/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/79c8ab59cae08e0008c3b5ff657d11f77968dc3f/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0715338b7fe331cdbffc3b29d88163bdbd68fae3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/40b7cfe8bffa09f6b05c5c6808bf15ae3fc0772d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5306138ae207ebe0be04bb3237ea51afccdf4225/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d7d05c0e55f8a725fd450e64d4678a8c5cfecacf/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1dbc29de43bf7010dd0d197a24b5ba014ee8ef22/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/edd4006666b0604839edcabdef3a097c87a6771e/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f9ecdfbf47e871871c4fa959e94560f028e060d7/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4f8f2eae436031793d140377171a3d1ce8e5f3b1/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/21f7e2de71787c7b2aecbc24a203d07364d6f55b/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4b4b859b2e64bb29410d15bddc7ea55e2cecc328/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f0a89fa6329b85b1312d1783a73926560c40dd3e/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/914f6fb49b206b6607c5e859b74a77c5fd54d6a1/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/812c2e327ff1d7530e5fb6c30bc93da6d6876818/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0d79949243dd7a210f044b7e7ff97b0b0e54d6ca/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8e539751b2acb29d9b210e9252c685a680b2b1f3/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/262187a0d7d9cbc705fbccbff017dbc800a36c85/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/928907a49a7871b05df02cb0757dba8ebafe7ed5/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5017521b726fe5fee95a04e76a7ebc8cc1874b9b/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d5661500fbd566fb95af48cb2862ec2e95f0f0ec/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3c86a375e4a874909862fdbce83e25472461d113/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e79a4d334516927b4fa445e5244fc28290883c7/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/41e9301eed61abd6a43a897601f2d9802cb9b58e/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5a427f67b495615f52e7c6eab928a47f797d9cd1/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7d5d4b8296420dc94fdba024142489c10149ef86/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0136c09db3fced07275c081d921e71a7311ce7b7/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/95490a13b83866d5d55eb591794448a537bedf3a/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d0969f28c6720bf9e89906f73d745d0ea3b9d0f2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4722265ad47eb1b41580f93dc69391f799ee944d/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/291405301f014b1b10598cc9f1747fddfdad4330/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/de41b776e683aabf3c61632c3aeaa2d19e76842e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4a5e7dd6f2bbb0b508a7865c0bead0d59974e703/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/012079ed7faf971410a7a65f52f591497e02e9d9/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c6543ab5ca2dc6976b233d154866546adc21f897/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/30dabce21d31c203ab026c2f0e0ad210e8c32784/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6347732913f813e951bc1443ec0b0e1ad441324/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3bc5887b5a4e1a2955d501edd0fb211d8a1a7220/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/87a9c52c79f81035fbf7d0569f0f2900610b19fe/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8b06c8962f790ddd299a6bf08cd8396e07c76ae2/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/48467a8085de0020c7c7bfe4766a1f4e160c897d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/519ef1000c3f853a0912add1cbe425bbbc836c65/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5fce176bf49ddab57c09f8e9fb2c077f09330346/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a91591228c43e03c44400b59612c808c3fa42d67/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/eab52c0e040c58054cb33b0bdf225ea8ed9fe28d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ce6386af46f514015d8dbb1296e4ef806217e4eb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bec742ee5715778b56a02aa1449e702d73f2a75f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cdeab5eadfb88fe741d8d2a02af2ee5e20ca923b/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/043623b67eeb2325e86daeadca3f14e4a3cda23a/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e9cf61ac562c900f60c31fbd89241a03477b94d8/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/152ced161481be819e199916f66f911928a4207d/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/69e2c03493c39c07a680a25173f535b6287f086c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fad29faa0d99a2e359ce4debf7cd124456e4c977/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3f9f91ba4e81e44896de883a183968719788cdfa/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6dc39eda220e8fec05f605079bad5fe7ab3db2fa/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/28360f8a837052a3cc6160e8d95b08049e427e77/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/38058d9de60660dc07ad6992f1bf77523f859493/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19e108b6347965051aeafb3bdecbd1abf4af804a/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e34d856bd644e4200c2477af44c6edca21d04802/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/97b3f6131d3866a76ec2a72f3c26fe0922e9fb84/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bf9ce4374ee6090076c23db4f986f431cb3ea9e7/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fc52452a9b429286e19cbc36cb97c5f9b7b90858/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4ae857f199f296e10eca9ee34ce7567a82a0e5f7/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c5149e5f46247b66befe234c78c78bf18e4afe1d/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e585cdbab7ff487f86683d69c193e736e422684/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/10bc76658bbc477ef47013550a3bb6b3b569ac6e/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c20845197be0fc34ceaf78165e0bbc1e6de290cb/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7c7a1f12ce2e3a0de60d7aa72471f75fa164adff/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a63fcaf5d87baaad71c55a536347a063812aeed0/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/529a70d7d9dd23d447333aa99fe2abdeb91b4a35/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e97c112e3c40708a1ec07af46f75f6c32b9bb0c7/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b42e8016dd62f82079ab5a48513eef26be601aca/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8cca58f55917ed15ef96737f18d39b5ea4c19500/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f2550d5e04ada75d19ddd74296d006d6f5e4f2bd/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1f439f25c2397d89a080958f75d6bd43b206c777/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/73f401574c504d9b6284e6f4fa48410b30ded731/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/42c3d40362b1729b72fa707e253a9f7ddbf893bc/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bbde17308b444d929d63eada9ba172b89d0c0f31/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6f406f09fba1e6a28487f858bfab20321dd17144/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a39411c5a72b22ee51bbf319591e4c97480103c3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2680b57729322e66d019ac12cb3709a1ec11b503/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a9dd0f38b0a396e20a8b0a5853bf9f91fe01cbfd/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/617ffc402131986721298817fadca502b64cacc9/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/656790106598c686fc93e75c9e3a7ceeca48f65e/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/63c47176d5118879842c0b09f05770d2844713ef/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/03ff8276436415eeee2dc07656251c3a985dfb4f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6761eea418547ad0fb40bb72511a789a2c7cfaf0/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0acc1b161bfd8d3b56705bb2492a7800b2bb94f2/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/68581ee4feb807ff61bb1014f605a335d17b409b/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bbad142aa9570d70cb701355b9a2423be22eec80/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3d7603282e8d2486487ef4a98eb4a4528e6d21f9/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f8899a607492890fe7a3a081636e3b446a7693c8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/94afca6e135dfa8657ece3d3c2088abedb123773/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e564cbe76e79904d8acffa86cb03af5fce26736a/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e5d4edc1b5be9159c0688c0499f43bcba016bbe7/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2f9014dfb9188061855cb62f588ecf784fa076df/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b8c546afad1bc901592ecb93cac6c095b02c0f44/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7530c1548829cdf8f990459cfc754aff5a225f5f/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5043e5f55638b405613a5540f8d5d6e0a310314d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/85ae0c7a3a1ea5e5d4df8d875d7f1fd74dab3357/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/99a0b74b7b6c69e19535bc2a120559f74620c28c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/467abbde8c1950d0d991faa03b658f60592d4717/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4bcb76be1d4654c5cf0ad4fe0bfa32c300d1eccf/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e82416945b9a006c2054b5e636c74cb7843a4a85/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e90c7f6a2e1fb94f5be9336c6e931b43c69db878/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7f997bac420664283eea41ca2a003371abd15c87/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/03e95505cfa7e08c666e6bb90ee78b8da62d7144/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/31df7ed601a9bd0b32e893b4691802739fe0bfd2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c549e6f0a68d5b27e719efe29f21ac781b1416d7/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9da1a5d73183ae22d994cd57c355d3ee8b756e74/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a59e5d122ff579e4e4d0fbb846d32a64f815ebc6/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e69af807848c32490fc118c89b9c83b11b169b4a/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/104eddb083cf2137506239a5bb47a3fa5a44ad3c/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c6ed9d7c423629130aa3e11500332fd9a62d611e/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/239a99288e5b0febf8ec707aaec933546645da16/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/91137244a21f9010235b590a71a00ca5fead2983/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/04ba5f996f7ba400ee928e34c383841df05f230e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5c795492cda700bb04fdf516677388f2002a8825/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ad4be395f082b7270156ca5724ccdeb4fbbfbe2a/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/13d00fca1cef07ba622a216b237203278a9a4391/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d686afcc1df455de88f64ecc62066cdb19179b1d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4eb9a3d4131689235ea866f74b62130f5f602b06/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ab947d685db4e2a2ad3ac91a921e393087a519d7/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4776053ace8faa595ea3e0276bacbbc03de48480/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/489167614ce92fb3bf5088b831fb428e78e18008/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c7265689aa00eef993e8ddce7784460d2645ad6b/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dd6753c07a9d9b84b7c966c2062c90bcd2eacc47/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b61450cfd53ce1e140e507d0de13af9146ec3a94/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0a88ee16d1e9fd1756d9c4dd3c2b07c6ccc79db5/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/502a9cc7f8ca3203819d0f585edf03fa956e3fc6/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/998f504ad7e84fa62b26fd9fb6a2c9558cd9040f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/db74e3f9275622c80d083d5acdc57f945b9aa303/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7f4f1c5f02d99065741d7008cb1a01e52792e0f0/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/be06a09341ee31557a2dbb9a82d61b884a8b1785/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/44b3ac824c26a962be474b5ef1f7bc0ac1510b35/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c35930d00a6b792b11ba4f3f3da64277f936ceba/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/739cd8ef7ddd8e7754d44abdb7f000fd710d48f3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/abb3e605126263de65cfab2480ee7cefa5f09604/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0ade0a2709256f42ee269995d4a9d748a3fc0f6d/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0d58db21f79d365e09b4bab3292fc816e100797f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/609e4799ad35679f0a30f9517a5521575fa3397c/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/32b443a9454e9454e19bd4618eaca5812c3dc4d0/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/34ad877f9d2f32210859c7a8b4f4b43e8d6c061b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f19ef433f9f995e3d673d864219f913d3044bdb4/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dde5fc527dae4a746feb9b6a650d259af8d78280/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/caf4ca7d1fe0a3c46f32ffa51a97006991c42df9/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f58746e8598d2ce2fb08de53eaf2e86934fe6bb5/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/be0671d56f03b4b09c8710e9fd308212305a8ec0/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/040ad1489e6780d767676755ea77bed4080ad93b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6a57b704c35dd232e5877476a8a03ad8fdfe2c3f/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/46058d6410a5c95cd941822e76eceeede55f9b08/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/42ad889b8535412dfdf874e96361f5cbbc1e79d1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/45b0e35966a1bc95fc57b5aa7adda73a37804ef3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ef9e442f8025672cf0094a9de972edeb2faf924e/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3fc8cef0771a2f92ef11f9c7cd4ec2fe924d675f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b2716466823bce8381eb13b81933c48c35a78fbe/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7fa9314762349c207a47f7942f2a5708c1dc85e8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e9e4f1eebb0354e494ae4487d911bbad84befe4b/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/048d3498ee8e9560601ddf5838a3c6404764b1b0/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6bbd1db49af8f842ba53d4cb0287f32337e7bbb1/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7608163cd28ae781555bc4d6ac7387ea22beebba/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f9816760cf72e6ec7ac3aa6cfb50cd445b0b13da/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2519e47ab28234ab3239cc3526eb75c6ecbfeb06/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d1df802403a20839289c2343ac8651d02e0d9913/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/13f95b846494e40019a821225a345684233190cd/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1c5d14bf12fb0d1d9bcda25c509c11710c9d2dfb/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dc9b541326c0de5bbe48902652c7af6b4f96432d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e7e8c985e1e40d230e37703f0f542c461a52f82d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/efb8adf4878e15daa24accca5847f299efa22f6c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/42be60544df7cfd1a101cb7b58765376609c1f57/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/23f8b27c75d9dcd958460ca1e9f41bc9ad730e59/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/79ad68bd2df34ee8137185b944166fa35bbc15f6/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4a97a73b708704d00452e2ae5332829093b92ee3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/94f9dea5adad46ab92af8414a2ddcbbff4014a52/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c376c8344d6886fcbc9f0a5824c209326d8b4911/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4314022bf38862e176dd1a524131fc43050028d4/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/090fb6c237addabc71d589b8fd30fa87a960e2b9/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a51f89f4a04c9780d3222d4e675bc7cf8a2daecb/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8cf7bd2232f6d76bfe3b1750f643a5ff72dc371b/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6bfac6a0a645558c0381b9745fa85135be9b1ebb/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4be19b73298111800ace3ffe9c20e797a75f9e43/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/966e0603e341c0981779770330a6a03ff1b12706/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f6e33883d3f452e2a631803f7f2ae052f7bfef29/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/970177ecf316fc0f2584e308b94925c8eb94bfd6/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8399831c62aaad0d65a1480a15768f53bd9d8554/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ea4e4f420f5e723f5cdcc39dbe111090fb1b7c13/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6f0679afd1b1927558b13ce8ad4616fe63e71317/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8e19b0d9b87f6a456a0cf48ceb24cc1d38ebc809/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e713a7b140b4f8e94dd31b418cc7a9f5b0d2ad21/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/93ba4ed62838ddc0be9701b8bd6869f5a29e356d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a7b3eeecb070cdd17e70ba6db950cc720abd3215/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a8d83752babea2d4652dc6ebfbb480868a54d273/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6934cf0c7be9d686f1e041dd9be853d65305f93d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dd49f1a504b695748ebcf0930d5b06741f7c2690/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d67d3d7b14e7e834e353b24d9962dea5a926af14/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dae3fcbb401e2a1ed63b4d4756a9266fa60054ee/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/34ab40be7dd1b339268e2c51f9983070a5944432/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/73a48aa8b12f86cf82a2014d1a46dcaed5a5b3b6/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c4e1a40497bf78132b58958fc8291c7349abe05f/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1695e1c031db8f48cbbfb344e597193a63c713df/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/31f5b970b57557eaeca35eee866d8e8a6d4885f3/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4c3128378b8040d6aeff5864e61fabc452423bff/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f0151876bdf465c3a672f6135393f31043c59897/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/899beed444877f79522af0dced924cae18273ec0/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/74b175e72bbdc97e1433869374d4e8a6670c1545/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a585b90e8ff08d402bcad387d784f5aea4d7c739/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3a2cf82935089a011e203443889d524a3386f211/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b68a22ff78c257bf59b411bf7ffd8f49a18b0cb6/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/39ae477391a25877b9536e6ca3cb70f537cf7e70/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f2c4fb7ce68917d032109893b4d3c997b83ed377/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/65544992994349ed6c043da60cfda219e8b19fc8/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/329e80d6441edbc8a8d574e7e0c4ee9ae3dbd208/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/497af75b012b5ee93c6926ee687baba77db74b36/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a02dfb48d1bf3934b76ce114f535ff43929b53ad/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2740eb18ef9ed8d3acd4329a43c3a8959e043556/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8535f45159376a5c4d03134e8e04fad184280182/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/524fe04acc08bc397ea8f170ffa566f8ac14c7bc/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f2ab554c51bebef9e3a74879344fca6d4e3d226b/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9f233b77ba702fd964f69120e88f0789f711f3e2/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8bec03a2c228ec695bdefb9fb0474e15b4274c59/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8d4ec693b700b08a5d46af0b28c0c6b378728d97/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/525e614f8fd5bd40123975dc584b96ffe75f65f8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/efc9fce40f3f7b664517ac718bb4faad74e58f4b/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/381d186218064ba1fcbc744bdabbbd79a3f4201f/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9fee40e37fa4335bf42fb34c3591f0ee42d69235/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/939c88117c358c11dd0c6be6967ba12fed219a45/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/068e88680963fa89e492b561bcb05a3f29ff38bb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e8f4270288de205efd0bd76001f3199050a07a77/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/087bd354de059bc3cd46076733b0862fa7aa828f/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9f44dc50382d66f2d9ef43ec6c5fc85a48aaa45b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/999991f54b077856056989cc6ec53d4e09ef4733/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/39f5d74e592af6bd38e8f4d1aee1cc634e3a670a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7eb15455b6c0fa84372573c8557e6886dc7b4cf2/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9915e71c340b39dcebb198442ef2f7c1ab1a4dfb/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/343007e3222ab9524156f45090848653ad043b2a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/89d70381c625e21ec0b31e33f0744e070ed9bd0c/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a1f3b748efdad89f6d97625313356e038431a77c/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/624cf415762dc2b358382bf2ab6d6ea39c8a7b0f/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5083a22f06f566b7db5895bb912a5cd8155c448d/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ecbc61995f34849b721a23ff2fd0f1703d9a55d4/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/01a6e995638596725f8e865b125f48d0f1a867d6/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d22546632d141ebf3b5de8f94ad1d19ca55021db/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e951526be8f829fe0493e020f96cdc4541df3979/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6ea3283dd26952bb650c4c52e372913139358b66/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4546c9ab9705223b826f43e8ddf20f262b2630ec/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/656dd509eba96380654318b1a419c157ad0172c1/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5fb52413915388a49d36727d138f237003124ce8/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/37128dc6b6873a8cc761f975b198773a1753cb13/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/11713072cf96da759e46df4e1d9d3521a870d361/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bebf9b361a91a30bc142d8dcbee70be5b3bd83e9/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f248bcf97dcc8fb44c8ed6b9c93f753b65cec93a/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/574ee723862f64c38af69a074f788843d33337ce/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/31302b82b411303224830bc9485d6e589b42c084/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/22158b4f79b512d5c49f787fe4fa7bf98e52b5bb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b20da344b8a1e034424cef9b88d98fdb127cddd9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/531848150517f6ebf608152b8252eda5da055dc9/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b4c8cfcd2d3f5a871dc1fea6c9f7790850e73b13/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9f05147b57434833957e9e301d22b5f9328936ad/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/676c18c21acdc3e26db45fc92a4db5e6fa854655/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8b3819600b2cad6c399aad28160318bb626292b3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7b105a0e0f9e3fcdcaff818963f0d243b0de4212/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ab70ab6ab8ffc6a7ac2c588583f8ed1dbd380213/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2367b62cf194c6e151e493eb897bb507c1862c64/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a4c7852de0151f974372b64314ddf42c60033c48/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8295a47419cb30bd671b9d1cba91028c802b91e1/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/288f1b831af62f4682186c2d86e9d11b347f578e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/23b6634d66eea62d73cc5769a5dd8511eb21f1a4/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4a29c7883d7068a4e3d3c9d4591346104b6802d7/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/520134bbcf6568a772b022bc95396fd6350bfdd6/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e730127d6c26486923cb460b40ae7b6d49971d5f/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/013bef319f5a88372f591728efc45da9b5896e67/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5ca7abef64525589282e025dd522d76b201bf548/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5edb8c14d11fdeeca37ca178eb66cd001beb2ec0/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9b44c25784d8ff77cc30ffe45970f12fc9ac8fe3/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/12216fe0d1129e447cc305b8eb0014f4f55fcec8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/895b943c112fa3c9951bab7cacc3b1a2293b3072/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0dc325d7630765aca918a2557f558193c7b736b1/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/88601ae9e50678d8bf04acc9c21bd7f269450469/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6a3c5e97ff5dfa7ff8c45a5bfc35c08b84b53630/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2640e5ff39a32dda988159dc3a6d62f3cfd4e9c1/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1f6b22ae4c6ca812784a5b4b1cf44a4d88977d22/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7c5fbe4b332a087a69151a425f2b6df35fae6b70/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dec4b34419416b6ec05112d6e3345c0f20115491/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c46ae347167a14410c1d58511165cf2ecb6f830b/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/895308909a9ddb35a2a30cb51ef88b290f12ec99/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cc6a692630015512bd6e7e07190177c26bb343c8/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3a4205f0ac3d57ede72e158645ff4d9d56287797/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3d22ad81a39310cf8e3576e7a60aa2d923ba88c3/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/670068ca1c345e944f00bf9f699d8478c7b8764a/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/84a729d0c89ab9d93ed74577b59781cdc0308814/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3166b62641677c8130f9af4d05651cfe1459127d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2a31d7e552528f60bf5a68b8c25e3effae45b076/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aafbb908f3d771d013d6515c1a7eaa9c69625b9c/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e24ca5bd086705bc43dfc8d681fdb27135ca4074/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ac91155c39fc61785c676a9f7b1b534e9bb68585/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c73427dc0f4c2c600fa351c320a1637571699013/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bfdb61e3eb9962c2e39448f3ec48dfa94ed7f2c8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/20a6771f9d3ff46bff43cfd2703c815c0f2c4fce/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9fd98dba19bddca4df6151011c5c90c7eb3e6d1b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8232a310de821aa755a1e8de310e254fec7eba4e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2e363520d34c375dd2d1c6ace83cf2b96a3b32c0/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b80dcb228d8abd7fe65ddbcd07f4179f0921fbec/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5d8b6a681a99b9e0b047a63e3a7a48f1f040b85a/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/54dd8529e3286fef895cd06ca0e9c728daaf9585/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3f7c33ff6a01e53f76c990d0b3e20e51241cf466/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d4320f35dc0f0e1d55de3a53e2a0db335282684e/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/86d3b1d5464975bff6d3453ba42abd2ccf104455/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6c7218c843fb7f187b0cc3e9f1f4d992e74592b6/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ae0707f94404bad2c67c06b13353412ccb67cf60/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/739c84b68382c15b04e19f76c0c602db322d1917/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b81f1fa594764906921b49e1b7655aa0a0d12efc/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/76ce983cb21a8d39b16ecfec6adb7de12b94860e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/166b895cbcd346f808e879b867f48c4255f21f96/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2c9cf03c1c7f3ff21f94c98b7fa5554a8d419567/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ef895fc9ae6f4ae161aa410f09315853afe97f52/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/33889b781a338453b6c3588b78c291a1d1fb0cf2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/eb2f1454d4c5d57630b3075343a4b56170751c33/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1bed380f5966fdb765b80d2d0ac6b3194655628d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3eee3478cbf0603277b4fd8d51eca900d05913cb/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2feef239a8ec62b39ee83aa157919266cce9ee66/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4806e4708ac17182caa6f2d5b4b87c6cd38a5ef3/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/658b9ab5f9ce4dc7c53cb8f619f0cb1ebd95ee60/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8ed0372b2e29f46fc62bd5ce9b7d5bc8ba0295f0/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1b45939078575d6561c133237d4bde46ee5e15f0/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b755a7b3d1aeb6dc7b1842b8a4ba0e43d4b379b3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9b77feffa38705e4bc727c1babcab54161c33dba/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1f9776ba50c352d659f707ddcc46085708ff1558/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cf931398118360a6bf962161a3eea78a41430d3d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d1d48aa17c1bb34cf2a4f4b02da4636a8152b33a/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/956b908210d172ac46412abdf34a2ab69b0a617a/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a7af0c162da8a0739f427b8972f157039350a712/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e5f1eacf5392249d56311d7e0eb2ef7c4374367b/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ea561eb4e5d0a6f79c391ed90c15659e74b6a856/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/336944e3828542cf1902e62f648166cc211b9aef/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c2cb722fef278b287cdb17f177c269963ce2f536/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19f84c6124cef43ee8ba8bb8b2fee527f38ec89c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/419c5b43c2795ff1f9d4ddea7b546d0c4ff2e59e/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/236e57295c20a6f0e652c5714d78d2f8f6f07881/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/59b445d890db1e64130936bb60493e93799b1321/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7e861baf4872458185c392df1c24798bd6e191e9/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/70c74f162f36b8ccaf26e3ce17dae58d229658bf/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e7826e4ab0b069db491dd400e3eab3b14c97df92/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d0b16c628784324ace854f40131234e8f9c63c34/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e11f9a33272007427434f049e22d06e36633b037/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1daae118390ccb3f8be088125a6c5c082ef3c7e9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/12e70e12b33f55b0f6beb15937f0d2381eba7bd6/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c6f4eaf59ace0b5c898ab8a52283d973bb5b3fa7/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/68bee9eb164d90af67f113c514025d8cd32dc830/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f41b49af55bba5906d9b2f03aac824e3355f922f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c76c30d19e0716726a52dd5e3fd8ad414901a633/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aa0b57b9a75f26bf8279c887e9f1ffe009ce039a/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a1ef1f2b230e1126cf9253124fc3e33963f1f1c9/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/329beae3950c285d578b5fb2db3a5a7a383e1f62/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1ddd34b613b56deda641301b71089b51a8580fec/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a01c3e9d2cc75d502318e7b42dca09f9e6baa380/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a388a061ca792aa7bb854ec3b5f97ff5b6fca0de/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1ee2eebd7dfc1a1a95f73cb595ecfaf7a50a0b4e/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/eb13185f892c3725474cc90a571de6e0945492ba/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/af45a87304a301b5c475e83895e19c6f07fb5dee/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a27ca489b0b825cb3a48fe2968021220768307f6/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8ec3e79b08130f8a8b72f4b9947a8c29159422e9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/38457815305b43753ee18813f6660e93c5a80bd5/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/935a1c4a062b7c38fb39fc42d65667baa6bcaee5/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0190ee8519440de6d5d62174a895cc19acb7da46/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b5288bdbee9138227a1f7e58b581e6e463351fbe/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ecba1349dce303549dd096542efb7b333bcb24fc/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8a9466d2dc8f387e9bde6234b78f273fe8c879b4/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f9f90ad86926a47f9f9d80d627d8459e01ed05ee/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/06ecc783e3b915d91fe93c261432e52438deebd1/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c7661869b1a565b4a65ba8c9cbd0d13c422e64c4/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/97638024a78ca4ce0d37493920db6ef66d73adff/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/14d230d9230da2bfd10a12d16d463cb3ca2fd05e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6df30afdd417754328bc73c13b90c044e3ab334b/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/afea038e1bb21e4dfa041d19bc719f22042fb6c0/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/90213396b1e558197a955de5956c383df16a587d/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/45e2b4ab3bfc8cf324d2b1a2e76070655d0a9909/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/10ba66617b5f7c6d85862dd7013cef72c6a6c5b6/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ceff02e71fddb3aadd70428568e938cfa2c37ae3/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/85832a5878c2f1436cef8255c6dd5f1ca98bda39/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cdaf92e9dda16450c83c04fd93f96e947e128db3/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/21fb9877c5e7b913bf38dd1d24e759340e03801a/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5730e3c487955c252c551cc2608446f9552c87e3/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/835c006b5979c053951d5dc5305d6e8e5a2520ce/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9ae28faa1e9eca43cd6a8ece8a172f64c32a4ac8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cba456a71d640e816f38b5f3a6b73360ab5c4806/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/124a15e7051f8668061f3590ec173b6bb7a7ecf5/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6f2548857df0673812c701b4180d190c154f4555/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5e99f96bb2db9359451af53cf160f9eb97b6c7eb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bd5004a2ba552c3aa0e438dfcac2d9cffc6976ca/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4b5de420859a602878d1464086206d8f06fe074c/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ac9377348283ca40428371fa8407c398563ef84c/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c9d8fd822df4cc9ee8d9becaff60459c1a0d8f43/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bca57c148f88bc9e0a0dec1d086f206a07c2b489/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4c197847a4d94bc171f79df211c21a924656bd36/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/108e3e657dc0f402027d6bced5d122f88096f08b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/977c3b075a5d6226af16e391c4d1c51860463d82/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/beab4f5be8458dfc7d8635baaa8631058dc9d276/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f8181fa52de84f04a73390a9dc3a34eea57003f0/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d8cab95949ba073d6fbf27cd1bb9a46b11625c5f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1884dbadffb985475cd08dacfea28f8c3b8a3e31/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6fc74c1a3f21d82c1728d0db9701e21547024af/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/01538faa2bcff67cbfd4e532768420539511804e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f5f523d248ec570db57689c2fa0538b5e35dfb7e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aa9afc8a8e040b917177b3b1a3dcfc9de91f3c61/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/45fbb76aaab49961ae7c7a548d1618dbb0870348/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c08a7ff85522a090246233123618e894f5ed07c9/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e008a26e640cff5644711bc06093b7fa6df3224/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/519b3a0bc5b5e97e90ee07471f24dbc0ce6c09ee/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1c681b73702db004307d51e40c1ad071b9f73217/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e2b96dccdef7ade80067d086297056be44ab9582/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9fc8cf04917db7a7c4b04657bacc34be68b8ad55/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6c7b119c2aacc105fad37b960d1a6c8415387e0/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6522b49f3f79108a52ee8c20b2ea1f560eca276/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/98fdf9234a3b91603a45219579955ccd5302dec4/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fac6c7f018080c1b2340131bc483762564d24752/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/11c4591bdbff5053b3a1a01d2fdd8f68dffe8954/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7245213fa90c56c48c4678cd580a2c29a52a3767/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1167555d0d7cc79c6889b2c6f0d03989f116bc05/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3a955fc1575d0cc858b7ff9a73af386f300bdcf3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c85251240395e5f85589b59122fa7a979f370e19/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ff80b04ba96ec2167ca4e5167f8f29baa4456624/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d0bf8e40cf3a5b145788d7567f2685dccbc417d2/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b5e3ed0ab75eec14476ee8ac07675550c79313fe/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e18adb7ece52e0240e95a87f9fb63adb9f8cf096/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/35893b27fb240717d7dd0adbb0f50f9fdb2901e5/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9edeeed73758d40b803ea93fac7a9b17f5fe8051/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2cc2c974cd904dbd7bcbeffd5d3ba3342b403b02/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aa69468a23ac2845fc97354abedce9a7f3d4a6bd/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/568d420a414a758766374c08e878a0740f1f951c/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/002566330afd0dfc5248b6ad8d51b974a909171a/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6934925bd5673448013602dfd1f2ce2ab1bdba9c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/086fe78bd4ba54b4b597ac9fdbe3ab0ec49bda2b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/795b5c5ff09e96277488c30988cfcf042f5d2cc0/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/500df3ef64d14b4debc84a155300fd236deb7b48/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/77539c95073a0fc93def0dc4e842ba60f76eafdc/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5b00d7e017cf7a29c3754e4274bfe25438ff3a10/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9aac4a9a61e3fcf318fa49bd850df9d914c30e6c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7446f5c72d322dafe407d6fd91970f3221df13c5/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9c136116d4ac2cfab3ac03cecd8415f2676c39c7/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/01ab25f8104916723f9a943060dd5eb9de616fa4/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e020127218a07cd121a76eb885b1307b67b52537/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0aff0f19faeb6d9efc27b378a89a88bb2183f86b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c16a09d804cd9b560709c88c1dda7d9cf9663da5/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fcece7919935eac3bcb3456d020ea36543506574/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5b1e2040178d9fab7f7f77bd9f106362159ffc78/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/450a69a5b7c8cfae1be90ab8265b0f8942bf1552/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/acc127d7cac9a2fec7442c770d5f2179493c0767/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4c2fcead581940cfe8ac609cd99e4484196f4cd6/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3508956906f0b35345992e3c60d7035bcc1bb622/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c452aa309f4c15aab1b4f4993907818fcd699403/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/73fa710fd3b479a819628d8fa08f3e702b185f34/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c77c5cf7a108065d4364d461b97ca2d368b55279/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6bcf5beb521aa60b1600c2d825c4b5b1524ea1d7/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6d2d115011da52e4c3deaefaa8b5fa62a35e4659/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bf4ec51e790314afdc94d5dbcda9ddd49eaa8b02/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7fcb8621375fe2e8ef838e7d63359000e7a9d2ec/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19a5f8438b497c766aaf7f00b40051902feb2130/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1702d1531d5b4a32c820c5a646ce1476a3c100ee/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f8fdb17c29e5ae5145a4331730cd71d30343bfad/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6406863f6fedcf0452cfe1d324e9961ab8f17ba/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/480a199d9cc326764786aab1c354b42d826fe704/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/11262f6d8d96db0f4bff080dfeceefe1afa5c474/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/01c5cb4294fb207bfe626a11418824d500fbbaaa/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/06a89c50e4150fec4ae219a589cafe09f3451080/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d12b9f2155b1fee872aee871a3b6774a6ff8cac0/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/25134bc72c64337658105ed325c4e70aa8fdd38c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8a5de7e37d45ed83da0b51e83b7db2638cf83608/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/913b637de2ff4ba460e49e4d8dd95a7c4ae4f1b5/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cdd6b9f1e4a6af188294439fcdc42f9eaeb89f82/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3a775095980dab2a839a39f9a5d2fddded35ae84/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f5de89f289420e7334c34b3a49494e95c4b769ae/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d78c31a27a6e547eb071359366322e7c1749a3dd/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f726bf0348a5440fee5e5bd672593a6560d78be8/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f440858f5394c16ffaa96ca9aff582ab681cb95a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6b205c830043840f37bb8071ca68979b523e9f6f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5fc335d94f15312d19aa8c017e1e86bc8756e5ae/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8f5ddab1757ec778c733b05ffac0c064337c3c16/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/de3b81b80296525fc68836179c8e991e5f8f09f4/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cbe8950e25bdf3d2ac6cc872239cc7b5180fa965/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/782951ad21ffd613a37fbfa4572286650ffd82e4/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2a7635a292f334c7da6815ed757baafb01913d6a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ba0f317546b32418ba5b759ba2f647b36293a47e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ae9588e1fc31f4ff3059db09437fe9a774da97bb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a9ac6253c4d9ee092cd736e655842e2958d0774c/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/30f05b50fb70ef6612725cb214b1bc704fc72313/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/39db53f969a061f7fefa4a71fcb247edf1441a59/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ff499a6b19d3587b641a01c20022878221d12067/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a8aa359fd4f122bcd15110a65b7cb43fcc7b7eb8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1d5d1b272123122bc3eaeaff9bc361530413b0d7/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b96ea2b4a1b9e0a9034c1c1a2a55c447dcf9b97d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8dfa16bf9863679c4a970c98dd4fe6254ecf4b8f/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/394e754e9222ce20d78d2f3de3c12a1537cd1eaf/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5cd0ac6ebaf15dc7e467dd2f83ba882c33f249fb/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bb6acedeaf7a939062a5a95216c6e50d808be1ed/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e0bf6376065549e68333a20a91e5e7d3b71abba8/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/43cd4fd85046df5891d07219d42a75f800600750/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d28120fa9bee5eec9c705a3d4f9c80d5a695db87/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6cde1dfd86f7b0a142f51508877975a67d3d85fc/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/982ee45d1cdad52bf510da5d7552704a250522bb/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5f13541373a85d3636c4a4696b1ae9fc9354496d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0500ed5d68d311931d1c02eab6cd2ba8495de655/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f3d2fbfc79c211536522d94d04f4db6b1a6c72c8/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b8b7d66b97af5aab37f6453a48eb1f08c03fe080/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/46a765270ad9ebe42aa80ca53d62e8a59e2c12e2/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/97966eb9d79ad32add80978f42c16a823be3dd60/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e3b186cd7b1e741d1b5fc38f9fde0ed0d02f29c9/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1a62947acbbc6387cc245e68de2dc216963d3120/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8ae099ddb6d4316b2c2ff857f29c0b0a0cb5b8be/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a5832ab702f6aa4b83c1fa954f7ad951b32dc070/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fc766d686adcb8cf86340865fab6873a0bbc267d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/16cfafcaffe52f8d5f5bbfa591b7b1ed041e5f8a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/87a2af8d16d26f67241eea7690df9bc27d75ffc4/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d3b3b706dd7ba2b634d0f04cc49acc9db9c51e57/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/53daca9d6e553641dd7b3c620d6d97509b1c2f9c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/736838b2ab8b8fb73fc2b1a5e7a90422f4a2686e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8f9645aa5db4a1a4ec49f1d9b5c3adb8d486252b/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6d0199270490727e4d86c507ee9ff5fcca307e54/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8751cd0243970c7703ca93202811afae72f43816/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/02e19b8bd97007ad16bb1b9ec57832893d3d553a/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1f16626509c0853ee4bcadae00df4b4aa86a5138/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a0b87bb398db56d7b5d93c1f18cbcbd08f8ac052/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a59994a118a0db173b1d5b545fc41fb5607487e4/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/06ee321d75978701b357f98435442c74b6a9fb31/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c3372eaccb4737a52be0bd7bcd974bf138c749d8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/59aa0e6cdc99f677ab5a881e622c47c6f95d04b0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fb11e52fd24e94ee31c9e4ebd5593fd47e4a46cc/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1b599fa9ae9866d39c236702cc265c2a43e24a59/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b8fb83ab428472388e4613fb8655d5a6f5be25ba/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b16b74f22ca9196c20887d1c7b5fda375c13d65b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5cc103f984c14ba97ea198dbaf90d438431e1120/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c80a604393bd5a2c89a45caebec9e9e5fc6ee126/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/295398f7957569d5f316e7e27f09fdde92c45c45/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aab28d85c60f3ab12ea9e39cbfc2dbb2f67bf75e/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d5c0e8fe845e9a3831d3ab090b2d4233d4d99538/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19398077c4ac1bd47f9a74f79a7a1f8e393431a6/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1733b2e56f3848f82a47b89674f1184f4975fef4/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9b96c5eab5b8f0975d8bc4313a7761c3b88578a5/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/430a48ce64b31e29fbd030a892f9c2dd7adfbd58/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8a64f8252c8b2fbaae4ac7a75dfaf15f138ad22e/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8fa172ffc1bfe3ff0ad68cf54276358c3821c682/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6bcf545d8827b4ef7e63d6c341f72df40df21c83/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/567973876d4f0b8cdb0644678deafb9e7aed41f8/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2ed5c0f65ff1c702fbfcdfb621745600895f1696/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9762fe0737d7815a84ccd471b8402e2abd3449a1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/132e70cde1d635d0d2408ec1d643f379ebb4424d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2dd6f67fa4ce929a0ff6cdbfa472da1fa34d510e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8a2d2731008f4889deb62367e5fe8b18e9d591ad/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fa8e9a2b9650ec83bdbfc4638b0604c770a61d19/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/69ecee5f4001d9fb9a3355f59867440fdc1a441b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/861ac9e7dd8ef5d79f04ba20fe74674fc5d8ee27/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f601c6b4112f46bc3fd5025e3d43dcd7ca169f60/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c6002f9d5391700bb52089645070ca21766398ae/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/00e50ee04c480564b77dfea05f53fbbe90df9a2a/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/63b01f2d23c575e78d985afc264a23f4b216cdf5/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1610f629c2aedd19e77d58370d7b5ee2d5af3c2f/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6e96a151966a8ac49323b587ec98a60e5ff90f5f/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/536f98ea3d0c698fa9cdbf93d7e5c27e4e7fb6d1/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ce183e7180f02dc5c86739b6b883a60e174de75e/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6967caf0e8d959e49cf73a6e4342f3e646e49fcb/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ecd4acd41108034ccfce3020719ae44ff6030ad0/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6d48fbbb2ab61cdbb9bf97955421187f2e4a3517/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/21d5b52750402cd34352254b5281cbd2939df162/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/55643e771a93a64b85efe01a2804bb06d24a05d1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/da786d50cb1ace970c2042a90aafb53ef3c649c7/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/01df92191868574d978929a27bc6328a11e1a43a/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8e48a7ddceea2192f644202011a1d4480eb2da6a/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bc611a061470bc8c8220156fa8ac2b18d1f56e94/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1487b377fd85a718547e9dca76a44300fddd7f21/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e50c4fa79cda4018b5bf695292275f32242a4024/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c8bebb520e510a7e5dea618536da3b68166189aa/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/40e824a7860976589ebe869ed2125a15f358d4c4/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1aa4cd2d1c8792787a21fcacd9229a923a765a64/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9c1046736c75cf8fdc4adac88d786c0ad921846a/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/970c9f745e40aec6ead10b3b49db01fdebadcdc6/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cac1c6654f96367fd49c106b39e198246d65a25e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/05af4ea773e44b5e681098541b52df8c01d6a9c3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3800eb1f8e8e6c58e738ee920b365f868bc7acc9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f1b996f36b7c916143abf0b1d9b21fb307df79b1/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6dd728df72a1a1be36b903a522416460ef0931e8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/92f436ac4c57d5b451eaedd734d48727e043aec9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9db4d3db4b26616f43b70797116f7307e70f9601/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cc0c448610894f0579ca06df73745ba2ca021d11/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ad3d697c15ec090aa01a258b4317192c377aa986/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ea16b651a908bf0dc7b857cd783c005a67e03046/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19be8de4413155a3f51888f35cf20abcd35fad8d/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6a48b076d1e82af59798e170aae940f06d5ea536/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1b476541af7869e88dd56f0ccf277ec189ebec7f/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f39cf6593d5fc5f30895ce8ea7104b10d62fa474/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5085b670c33f0b6f46d214bf18e823b9a3b223bb/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8997119f0a48608edf13d1b24af5b015e3b6a502/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ecbfad389c5a026abe7570b7217bf83b7992d630/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d4ec88fb150342b3d71bf6b6da11a4a26f1224c8/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a93536dfa804998de30d035c50d7df83a3f56471/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/545ec18aff96e81c760c164d0f0d7442fabc0553/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4f3f9126372bf79b3c4609d74b32d6e962416e49/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/41f2daf0c1bea72408eb06a3d62d10aefad424f0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b832e5cea87270bc3cfcbc923ba0b740b74d34a8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4336f4f57ff84ee77c479099226c7cea7e7219b0/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c53588439960a043d921d78fb35c177747b2ef41/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1d4535eea4877004a5584a7f4a93eb5272d5afdc/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/02b0cb678d157c7b8106d5d9094689ecf10898bb/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c12637abe31d25379da144fbd16637897985319b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3adfa7a92c1a916f35445a1bbcf72267e99b2443/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3d3c8f8c52ab3b5b3dac863a7af4996bf31602c4/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3802d028d271529e53ff7c686f4aa7c7d89b7608/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a88989e01ffe655319d405c706507078450b559a/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/86aabbc3786f6e27b1e0a1c31ca88545351d9b0c/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e29f4fb9bf2d522628ec75344a1c594a65f51d61/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/28c990ad80ed945affbc64dcc56c5fbb5ed254a3/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b94f9a87b3d608f0d3f4eb024eb32fd5ea930947/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1a1f4f75326aacc6b4aac90ed60ddd9fd2921e01/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1ac18f7ef810ab08fee191930f927cce85e0e2c1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/577590d2796ccae906b0630f7a7b2b5760167172/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1b6537e1b1aa2ae6c09c660edfd720dce88a5580/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7317d71df507b33e9c9bcf2d3fb611f2c344e322/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5ec93cecbdd647bfb149907f56070f8aa45b419b/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f5b7408f3b14e91ac5962a253c059be2b8bdd2ca/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b77fb4dfc10ec2f70b710750d084f874448fb33d/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a83d252c0bb70ae1cd17788c3f4d6367b0cc6560/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f9990b4c6d4c2f1666948e81712e9b5be14ff649/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/230378ee082eefc5c44e24bc0337a9412c6240ef/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7c77208533aff16fbbc676e5840640eaf3422725/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1655b0f47dd4455cdc61d70362e37765019568b3/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6d119ed049b1d5225394579eb3881d31a26df6ac/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f991acf99b672897e0cedd1d8d525e307794b090/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/37e1f32d7f11e9dad7a35b1b045b05bb7c1d9163/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/55ee17436b74d1bc5c5cefb80202f29f4f35e86a/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0c0c0634f5c0b1e7521feb024742abc2039ce5c7/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c3d391cd303f1dafd861885f39af844108c91596/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/89f4e99c93fbfc6623b9931433f0dc88bf9d6f77/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e784a8d6bf399fd66af025c25e514ef79fd5eac8/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cef29f1dba5c173001927f284551d9274a9636df/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/360748f212f2db9d223faee4e7dca383ed3dd920/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e87e41e1af6f2fa09ebad872e1fd7a9df5264aab/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/438229816fb67ea2bc8897f49445cff8cf186769/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/441af488c47bbeb8c0273415131cd5236f6a867a/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0875d89322ac1f27e4e58a7542a68084c1f47945/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b652d5b6712e669722f53963770a10e0e88747e2/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a07127439a5b85cc82f1bac9396fd9f5bb5423e8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4a17364bc0dd2ed84b8a15da9936894a04b702e1/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0ac9a13114b319058c012efe53a83a9e1fa9017b/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5c83aeac365a46c1153414d5b53081e7d8f92e16/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/32997e6bb5d4f99fa25db45e9f6a9b25d60fd3f2/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/46a934ae658291c0e18b8a70af051fb5717b9535/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/22047192c52ea0a3e1a83dafdb2db6d5ff231453/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/787a32ae054b42512a7dca74b78a17b9551ef9e6/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/379d3c3389cfeb61c86b00a0b2d0af6882b495fc/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/aa017e960099fe3b50f4e8beb38243a004bcc648/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0a353fb0c44bd1461e38bc496b613316f4e5813b/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c28be3d0aafdaaed6f84d7b57e57d95f6a422320/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d2c3fec4df17eb0e64b4c4a84f970d966a4c2976/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b6ada6c2e1238e4944c93d67a45c76c65fd258a8/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/595fe793092bcf5982b08b479b5fb78213f4188a/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cf4ca4fa7c277a66193fe72a3146c3df2ee70b25/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9d6a92e3bec36449f5e26bfc73d0481987d40242/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ba86e6d7428dfb69458dde25fcaa099f2ffa09a8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/613625d7b53c61633ae9fecf2accaf4f2c26c412/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/73174dc36d27eeb164f4fafdb9e454cc40ad2f2d/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d70697c343e1e3f5f6c64127cdc914f27f91ef1d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d6a341d7dd89f3a405b1c1f5a54d626495c77174/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e1b5704681c5beb52a7475f616a44bf13b1dacf/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/46125417cea79ee21600057f65850a8963bf9f59/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d66566ea29868549cc6e5624e852607803fe6cda/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c3e133e6a8e58c82e3496500462df3f9475eec81/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/db896abc03571e4f86f4275cd9d3828597b72a76/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b76bfc57a71dd7ba2e0527c7b1b0ca1e76873af6/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/77b849d03014b3cfe58c4b0faa62ee88d1a5ac48/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/07eda43a79df8bdae6507581008637b2bb149165/
microblaze | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e754dfa242ac0925a060a5b0e1e0f16f293567f6/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cfb7e3d986e50b11fe3c508d12cb7593faf4d55d/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0e6908e4e5711d659643af2839148bd9dede7d6d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5d6506520a8ac88bc646de738ba7a8b79b2d512d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/79fd06100c807bd996ac0451d5c1d4d057600c1d/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1ec38081951cf03adfee4a4ff4d7541da1207a87/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ec30b3ba4bfdbb130eb61ebc3bd041433dbf612a/
    xtensa | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d9b1d87209b546826f617979105d45814bf17049/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/10363cbfb125cc4e37b9b22b13a2ab38649ee458/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e23f2fd6a6c2d05a90f237ca6048f2929bd4ee87/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5b25542f636f9d2590bc96cc0b77d4934c973167/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ae7cce98c1cf547e9d65cdcfb62fd2cfb54de10c/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a55b7ab61d03ddedc357aa6c6f969ca732d8f29c/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8439e707d654d0a4d69f37d02faa8357f30e05f6/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/84e7b0037db7c9d584ffcb863ed435ef1a869238/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2c5114f06f7ffecb10d125a9f2a7299640b88f55/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7c3b0f5c476a583a5a3d686d299c5090217b6f44/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e78c58dec5b910fe53e7f56119e1e9c7ee0776ff/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1719bdf14a02a009d3954bcbcb3ec949a8cf7156/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/77b0e1e3bd722471d083de50e2d94c5e8224b070/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c8f6eb44da0c3bfde628ee73cdbbc6d1be9d30ee/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3f7e8d0700aa6b7d7b5657c64633aeec78841c46/
     nios2 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/937bfdad9eb72e36b82ec76f55dde02663be70dd/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4e4b1d88f46401baba7bdac1ece9a13374f5b953/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/dadfd85f6c3131df030e7e26df0ed91d7dcb6159/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/86c44cbcd6c847e981354642be47e74aadf989c6/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9da822679c6efa3edbb6b2005c9d82090d80543c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/46ac2c44ddd71662593aa80c996b3fbc31ce56e0/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/57eb87a758486fcf0d046db28c78f4345b4f86ab/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/25d07ed72793584636611097adfc3c4f397ce83b/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/685d6711d727f1c0fe9c42050f2c0d55dd578d73/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f4f96002df99f7b46433ca4e8a7cb42b9c714645/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/30315163c513ce6bb452d3fe76f8917704787196/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/02e6fb51d7d39e0604cdae7efa0ad6720ba1d318/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2d002af70f7aeb5577670817217ee44494b5b098/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e1e0e5107789f841b3752df21e36dc2e0159c77/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/410d8d5e737a47e467830ba72ef961d056bcc58f/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/121ca025c2567a855ae631b6d7d3060ead147542/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e7fb315c996c6694b7081c0c3bc0f2015da52490/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1e34082c03a2e0d16e3412c1ed304eed5b0c4678/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8f44aae35116ffd368ff03e3fb491f1b90de538d/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7d7b244c7ee4cc73c63ccb8098577739a865afea/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1ee50ce6df25ae77a2e618257322afaea738e592/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/80ea5e0bae4f86497ab3e6d9e82a5f731bb87a36/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3010feb3c1ce7f9c6b288530c7e3d5e0d1b2608b/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bb251971f49ae5bb0ca697db003f52bc8b87301d/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/699fabe00eacc30c1b5d44bf66af298e4ca2ea86/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b7e00ef0af6c9850940b5a6266af12306a11c81e/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ca966a7bf3a892abac41ff65fe1c0d36ec3e81a6/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1f11a9657097b81bd5f90eac77d8bc2d76d90a82/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ced99feb9c31da08832c323ce76f85b92a0fe82c/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2a620744382f574229024f35024891baa6ac1770/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d3628b6802ca7bed7f8a2fb7c5bc415a13bac286/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/c6b01c61e7918dc83b9323a292000f8f946b72d8/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b0b04b9d7c2127c7bbaf9d0d51aad60b0ab8089e/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/542a310f6f4e1aa1008713a35e52f16c6ea4c429/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9e75ef243501dc245adb8b289492de72b07183fc/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/73bbbc3ce32204912360cfeee0b574320d8a75a8/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6acf01bce209f8eda8b43bcd82b33eef078127e/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/fab9c40e091cbbaa329716adb208950bf0bf2560/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3017b4411470a2e67dae34e8354038cf1355eb4a/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bb5efdb29bab6467195e135d909239ce451de4a4/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/5590952db796ee0f289060460a6ed43f246e020c/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9448288066bf51da53c1d3e3faac249770305c97/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f0f25e8ae62c77f3dc5d383f133af3a8e49464a3/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7464cc06bc912cffaac77327e170d19c12e1ee29/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/262757289e83f26f30d8a761d42167a313f31bca/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6a96705763794349692da5b3f60bdf02ab69e902/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/044630317bba3a04027b8b427b84aa6ab2e2cc87/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8adf35bb3883a59723ad22b4149cdf2cf2d508de/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/118ced643391af92b1271e0f7b1e5902f68be6d4/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/34c847881e23e98263cef37a1adbbc7047f80795/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/579c068f33d6debfded76c1d84ec7869c891de11/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9a8b742db292f1b0abc7a7077f50909de0f472bf/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b3b76658935b33670946f243af23819eb1d8f63c/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0538afba08ea1086a162b3f5195e00158fcbed2c/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/07b98c9d32abb26cf9b73418818bfc0d79a37695/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6d84db27d85e7df199aa3999735e2b223f8eb3ba/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b102e2d2617465640c8d4f11550872ba00a91cc0/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/42752da6095fde7b2818f9f4f35d4eb6d8ceeda6/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/cc93304abeb44de803b7a95eba79ea6e95e7befd/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8d237b0b5453fc82be7fe4ee3cb43f25cd0ad681/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b94bbcaa49414882c475d5f6d0e6cdae4924b109/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/b8808fe65157854108e340fd2e913431924b7e3a/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/84aa5163feea6e505a066294b38f0d9c3de94bcb/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a06235b41add4237297908e45b524db905ad12a1/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1d8cdcfd0064ccc5cf0db488bef4b160da6fda8b/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/47d3206d810f6320a9ed33f2bcbba788d995ebb8/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a434d37f5c66c959f920f25ee2fffbc427cd15bc/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/202028f254715929884c3b5ad1873e5c2abad387/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/2060d1f71839ec22791c6fefe91952409c19e1ad/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/057c7cebbce024c2111362d957561d6981503cf4/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d4c860e7105b3b41dc85b52b2346822225278309/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/32d35029a15959c988f0f794422ad4cb93dec035/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a913f61c67d74027c5d5ae872b8047515e74eac9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d2d4663352c4e794f668b39f7b888d584a602936/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e0b2d3979d11b2b71afc32e07de78e2da335361d/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/551d6df649f3ca59766a318a179c60380db0005c/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/13c7d736730fb6832498bd591a9386159c0ec94d/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/82ae67329f2cfce0b47ee5a2746fa7380fbb9ced/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f9db720f345560349a6f465073f090aea7fe5f11/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/ebb4cbad1b2d55326ae6650c19a92ef6785ff214/
       sh4 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e026c4fd9a0339d87570d92559843b8980a93845/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/35bd56a90a169ff3a83a8bd26dcc2db0ac38bad6/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/266db17baa4537418bfe9eb58a2586e7b1ecacf9/
       arc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/1001602f460bcc607a0af89f78ce9f0b71117874/
      bfin | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/62243837a52442053b246a3caac0ac964acb7c77/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d6885fe9fd4a10eb535e18b24658623f83b221be/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/43d9936b0dc9e22bb6b007f078af9e5a50aa4871/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0ccc924011704f27980c1a05a33ae349b61ec160/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d356c76388e1c295d45a45490882ad13ad7479e5/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/61cddc052625494eedae381944fd7bf451dd4b43/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d5f6a5d6754501b63e1bcfece3e6fa39cf4ab012/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/19c1f4703743a85cb34bf3635a73a37748d1d3f5/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/d1a2a94416141f8c33455842899115e542756605/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/3fbd5a711b664b06be9052c5d173b8613a798469/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/af500c6bf67762edae1d62789477f88a5b7f3de9/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/18938d2e9bc5a2822ba67845be76a51795e12e24/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0f6654f7b9b2da1e7aa60704594e21187b56f700/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/40b81663935ce29ad59dbe6df91e07908e1977fa/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/652239a256934c3c47a22bfa0d1f1452980b8679/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/72e2b55018189a47bb416fdd0389ff01fe9dc9da/
      mips | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/f667c30e2938ee28311115fc013b2b513d29ada6/
  mips64el | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e0806a08f49e784f2fe4d94f834052398daefc35/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a9e3173745360afb2d77acbc5434b9ef5d67ba7d/
     avr32 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/650b6e92d11306a0aaf84d34057f9e7d462879c9/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/0c72d07b2d3333cbe5073062268a94869ea33945/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/bdf099e15060f228077f2dbc798081878ee57fe7/
    x86_64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a78954fd23daf5f3615d1f502a17e9ae0cbf8478/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4027132e55b45f04b394cc44edce3513f7b680c1/
       arm | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/9bcfc0f5f824c395e7c4b704ccc32beb98ccd03c/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/6813f3b436d902b68cf12e888c8e438a61db5d7b/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/68a6c7e572c35f67751d42a5880fc9d3a6849d8a/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/196e32f584ffb47395d4495da284d820195662e8/
      i686 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/4ba6831338ef56efcd01adcb282acd7c58f6ef86/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/a6cbccc657514cba9c8489a8b7d2665ff2824a5a/
    mipsel | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/e0d3d5edc1b42e555f0e149fbf57ceee977dc0ef/
   powerpc | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/659181bea66ce967ac9c7cd53c2d0e07d43b90f7/
   aarch64 | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/7ef1688925b75fc6ce5d583f22da2376703a544c/
      sh4a | Makefile.legacy:27: *** "Th... | NOK | http://autobuild.buildroot.net/results/8db6c1c1b1d2e3c670594ffe3fd21da7239c4958/
   powerpc |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/c200e8a0b308bdcdee14f12dcd90b18fd31daadd/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/83f9d9adc2091287a53d6c90a172e94a2560481f/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/d1c36f634dbf6b6e5d18444c2a23dfd129202b80/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/6c09faa3a21b969a79d61d63b7b7877c8b3c77e3/
    xtensa |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/8c2303433cdd75431f88faa388f5949d15553b17/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/a4a669649ecb0e98fa7524b5a7e660e71a7d0807/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/7dce93f78ec75a122c522851c0c779556706b115/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/d23363d1c0d3a26b0772da9b4678dda1ab86fd78/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/4755b4aff983b2366f37f3e021b23d9f50a16e74/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/ed3793f7c6409a6788941e560a5ab880cbd22521/
   powerpc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/a365d949dfa0885956b1c5a0d3bdc73179d45b62/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/235d654115fc63909bb8790e3c0302cca17e5a1f/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/51c0038f3746673e2714d7857d2ceaaee7512e0e/
     avr32 |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e24af3ceb125da50f0f5cbffb0e3ca091c68af33/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/6508b5ed3c1cbb70368f031e9ee7d7e9617af814/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/6272a660168aeef91710b16c6d178e46fff60ad9/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/b4ecfbadba0d0638842e44cfb7123d8401476d62/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/9bef68826dbbc47d10893dbb9167ca7342f7c3ed/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/58a0932de96cf3d0a07b6e0e23f93a245e379966/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/a69ec5106d5711afd4e46a31610f4ae1dfcc05c5/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/c27c1ebd9c3f00bb9d314ca23531f51a52ca0fcd/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/01e30298966f67d3c793118d19c45e7c33323ed4/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/ef4a1e2166e71021fe8a3ec6c9066193ddea7fb0/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/917c26656557d50f869639162ec7e9d0f3399824/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2e18da36341cc8d6ef2d0bf5f6e721b18b234095/


-- 
http://autobuild.buildroot.net
