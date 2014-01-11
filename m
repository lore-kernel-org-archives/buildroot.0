From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jan 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-10
Message-ID: <20140111073010.51E29100CD3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-10
===============================

        success : 70 
       failures : 90 
       timeouts : 1  
          TOTAL : 161

Classification of failures by reason
====================================

                    sdl-1.2.15 | 33
              libnfc-llcp-1103 | 27
                aiccu-20070115 | 3 
                 rt-tests-0.83 | 3 
                 netsnmp-5.7.2 | 2 
                  libeet-1.7.7 | 2 
             util-linux-2.23.2 | 2 
                  boost-1.54.0 | 1 
                minidlna-1.1.1 | 1 
                  bonnie-1.03e | 1 
                  avahi-0.6.31 | 1 
               audiofile-0.3.6 | 1 
                      qt-4.8.5 | 1 
                python-nfc-212 | 1 
                       unknown | 1 
                 ffmpeg-0.8.15 | 1 
           imagemagick-6.8.8-1 | 1 
                 cairo-1.12.10 | 1 
                 dropwatch-1.4 | 1 
                       kmod-16 | 1 
                 pixman-0.30.0 | 1 
                      icu-51.2 | 1 
                  libogg-1.3.0 | 1 
                  iozone-3_414 | 1 
         host-elf2flt-20130904 | 1 
             alsa-utils-1.0.26 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/512093f2d921c2629dabc98c19a27d0729a76307/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9a616194939f0b5afa6194f864069e7656f1dbbc/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/424ec3a18fcd44d384c9d3373d7095dded557c43/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/c8e46f7751e431d8885f69e28d515768a3140679/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f18d0cee74376da52bb7ef2dc5f9268c3f5f661e/
     avr32 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9a5fcc4dccb26821b92c005416e11ce9b68921c9/
    x86_64 |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/ff246c06fcc0703cd4ce32c63da7a4cad9c752df/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/609c71779aa8b4ff0ee2dd909267fb43b93423e7/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/19406b88e3bd61c04dcce022644eaaa5c4bd917d/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c6780ebc8f75f63e408549582db8c4b2ac342476/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/7fc7b06ed88e7d99c62af69cfe338694026c4407/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/12f1708fe0376333bd2020a7cfa3d8200e57d46f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/c0cb7cb119a42ba4b225d9a8bf5a9f3aa8fbd75a/
   powerpc |            imagemagick-6.8.8-1 | NOK | http://autobuild.buildroot.net/results/b3dc1f129b37a06c33ad65209e687a1e929de422/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/669596ad9ebe3f28ddc0c156959913948fa5d43d/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/4c162b5dfd9b5de65d295fa0cae89ed478136864/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/059cb07a2c4b2cb2dd4aa141b5969feaaa7a252c/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/918a6e31972d46f3f7d1d67963c88d452cbff4b5/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/34c506a0f920ad8d1951a59448db8b246be934f3/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/88c4afd68376be334878c9532a27719e0216fb23/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/275815dd0ccae8332332fc5a8b6d7f7ca701bf1a/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/6da1d933ea6888a75df1045a074a512635547ac4/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/15052b70aa164adf88a5eac2eb32fbed32f66aa2/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/0ecf120ed4bf0e29f2acfa55f57b721ba79e5396/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/6430c6bb36332c9429d6657b699048916cd2b59f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/105094e7825c76b2fe5ef0e092ae8eaae29df0a8/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/ef297c4931f53899fb718790e68143ba512e8f4f/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/058f4ebb8184c436a08ca139f17a3cbf0e03d4b5/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/147ce07367a345e9244cb3a6f73cc21fd5161dff/
   aarch64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/5127f5ca2ec207219b529b76165f8c9490632381/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/6c51a41961b8a8a6dbafadb16745e269ec70ef83/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/0d2d84d1ac542bcf60f54f8aeb5fa56becea8cde/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/9b9c4b6c1c42e37a80a91e4f4c39595c274e5e57/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/41e501429c2631861584fd1b633d00400f7b5b16/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/740bb32c81f81f585aa70ac3af64b48dae6d83e5/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/99dca121d98bb46437ca207cbd07728638399208/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/fb9539cedea9c93644d92127aa756d7c21dd40c4/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/5ec638857b0db92c9c7ea5251c8846f91f83685f/
      mips |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/29c93e348415cc0980e411b8abf4247be0e0858f/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/9062511b9d816b6a217e9a8949a7d5b560dc4849/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/980cd3731378bb5b438fbb7c25f8949b09633b0e/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/37bfa93ccdbb783bd17f9a41efd8d56b6c7d30d2/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/e17e62ebb35d3ec82c1a48ac78c94ae3794c021f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/585d49fdb0f154509223f3d5c3846bf28c97b027/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/cddd63b5cd255f494cb7eaf87689f07e42ed5432/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/ab9710e4f8261eca1da1267515ade13932413ac2/
    mipsel |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/11d9484aa11345261df64891a92ffa9dd611db4f/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/a517e57771688225e93d2e7e0239444af251965e/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/884a71d41f2bd395ce487310270aee5075a75f1a/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/f8087c463ce6d0169af25dde788ac8af9d060078/
       arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/2e11b9e946a854deb28ba144ca7e398a9c996a02/
     nios2 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c4b0520046caaea066cb11ed989d6bbacf612ee6/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/dfa333e56627a48de41c0180eb2411d913f1ad4a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/1d5f966ce66215c6410137d85093bdd9fb53ac6c/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/89bd81375abd146b4fb97d4a2691310bf56680a4/
   aarch64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/90ba1e4c26e545a1a4cd150494034fe50baaf538/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/a36204c9b37f6f52bd4222178626cb027f27e193/
      i686 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/15c5412cd2ca3a7e62e649745973d00c7f29ea6b/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/71f3c89f319c2583199ac765a332e09d7dbe8d86/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/9535c4280b14c85b544a6d906f6376a8dd863f2c/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/c057660473f05cdbe1cb2e4ee8636d67f505b4a0/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b003e711d682fbf73a6d75f883e985d2accd2789/
      sh4a |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/cf2be7ac2a2110504b481b35613e3e7c378237c1/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/7a71e8af05a77d47afd5d3ebad27b517cdab17a9/
      i686 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/96dc9adaa24e0022793ba10a5bd78cfbdda543f8/
   aarch64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/a4f8244bff1bb438bd1f7de8aafd0eee29db97bc/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/3c769fac67d7a7cfff5f63d2e059869e15ab9a8e/
       arc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e4bf1b3af287d21793f1d2f40cd4e69c5c6d0fc3/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/7c7676f58e8133d19865f9015a9b0e981606671d/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/650c949c5926520213c4d330ccde9c69f2440905/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/8ae428ffbef10faf5a8f018da3f0da0700fe339f/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/fd6940d80d695115ed0e10337257cb9b84c01f19/
    xtensa |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/0a844e0f93c91f1b182bd2df7a2e3318fd5eea92/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/608e94fcbc66d71e81204017e9f10203e237040f/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/49bc6b694ce41e35e3d5b942446a23ff480bb833/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/27d847356deb198d62a2aa13a310a5b2a6255190/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/bd50b8ce54627ac398d96118e4ededf8b6e159af/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/73bb25b59f2c36746a185334edce197575db2496/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/753ec5f4ed0153b51e86602afc182307c1d5109a/
      i686 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/af1100c31e9e100a1b94355584298c44e3d281e9/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e6826ae7e12377502d3d78c4435e1b7f0e8fffd0/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/fb431427919fffe3bbe4f52c889277dbfa375ea6/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/21a3634459108d1bd57a607d4550e6e09b76a85b/
       sh4 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/40cdab174af0a9e9c632b0bdb20866a54bb39173/
      sh4a |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/7478a317bbfbc984557a6f8e836a2f1a7623db23/
       arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/a88aac6ac51574981cc905c5cddfa0bb53bce75f/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/94e44d9e9cc6f898e1544d247acd0bdfca1a20f2/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/fb7763faec909899488a2c04632a7fcf1d6fc777/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/fd0fa143ba8e42e490f8efa34b962fb6d2caee87/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/644c73f420da58c755afe2ddd9a249c53f7fe7f0/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7e3ed74c53d66382a6b5571c3c061a49fa1cad21/


-- 
http://autobuild.buildroot.net
