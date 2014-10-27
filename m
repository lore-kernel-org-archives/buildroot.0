From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-26
Message-ID: <20141027073015.69152101541@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-26
===============================

        success : 238
       failures : 70 
       timeouts : 3  
          TOTAL : 311

Classification of failures by reason
====================================

                    qemu-2.1.2 | 7 
                 webkit-1.11.5 | 4 
                  avahi-0.6.31 | 4 
           libmemcached-1.0.18 | 4 
                 samba4-4.1.13 | 4 
                elfutils-0.155 | 3 
       directfb-examples-1.6.0 | 3 
          shairport-sync-2.1.5 | 3 
                 pixman-0.32.6 | 2 
                  thrift-0.9.1 | 2 
                 schifra-0.0.1 | 2 
                coreutils-8.23 | 2 
                 rt-tests-0.83 | 2 
                  zeromq-4.0.4 | 2 
trinity-d68d1f7b9ab6c65a379... | 2 
                collectd-5.4.1 | 2 
make: *** wait: No child pr... | 2 
                 opencv-2.4.10 | 1 
               libcap-ng-0.7.4 | 1 
            python-urwid-1.2.1 | 1 
                 cdrkit-1.1.11 | 1 
                      qt-4.8.6 | 1 
               sdl_sound-1.0.3 | 1 
                  tstools-1_11 | 1 
libshairplay-64d59e3087f829... | 1 
                    ruby-2.1.3 | 1 
                   czmq-v2.2.0 | 1 
                 nss-mdns-0.10 | 1 
             subversion-1.7.18 | 1 
                   libcap-2.24 | 1 
                  samba-3.6.24 | 1 
                  python-2.7.8 | 1 
                    orc-0.4.22 | 1 
                 libraw-0.13.4 | 1 
                     rpm-5.2.0 | 1 
                   mp4v2-2.0.0 | 1 
                      gd-2.1.0 | 1 
                directfb-1.6.3 | 1 
               alsa-lib-1.0.28 | 1 
                 libnss-3.17.2 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a7483eab59930bb329e517cdf263ef9ec86ff7c3/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/813be8ac49bbb09cf360b33c610f00fdef1b70a9/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/61231d119f0b9eee0d0195127701470032d807bc/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/958c400828896b3b21c0af97566419f82660668a/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e18e89c43e6766965e9e75b59cb072b9e8921977/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b6e2bf47b794fd6b9f0f9695d85a393dd7a835e2/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/2e72529d163036b40d18ac41cdce26a87f32fc0e/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/6217e93a574aab92e43e073a757a2aba7babd37c/
      xtensa |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/a6a494799174a0239dbffe112feb7fe18ab957ec/
         arm |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/30d0e3d27d8606443479466e60716e6f202a4711/
      xtensa |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/a85b3c6c8c83353959584ece4b79745216bd0746/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/88a4cc0970f2a4b0a88e008095ee77bc3088dc76/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/0e9705f7147e40494124769ebca6846482baa399/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/85c65b7fd0467a5faad02ffb9abe9cdca6cc22ea/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/fb778110dc04bfaee670be021af2e4148b20cd1d/
         arc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/2e93f76b06a24a11fb2ba625f5d72e96b5dd109a/
         sh4 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/e20d0d842ad12338137d92ef39b008fe216c469b/
      xtensa |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/3051d7246d603937cbf179157c6ecf7606a7359b/
         arm |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/1564b8de7785c1a756bead1a4160a2b6e2a2243e/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cceb1ccacec36fb7ef41bb7cdb13b3014813b599/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b9aeb06fbf84d7c36fa19b71b4ba313149138c77/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f0db8e4c86252d052d4f67db06c41c5b1c79ef9e/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7193c2448ec0b87af27262e3d8001803fdfe1eab/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/13ca3607f367e2b64b17206d0c18a1d7402167a0/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f71b4acbae6766b63af413f43b150293e13d3ca4/
     powerpc |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/abf1fbe266bdd6e53c50a842ced173b019c7e9ec/
      x86_64 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/d1f474d848ca0dfcc328e55473ce06ebadec4f55/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/ed0533f71e96d82e7476227a343bf1c48773d535/
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/055bbcc88056d70b24a3fcc641e40a71130a1104/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/9dca13a6fc997af2eca31f8ec510f07957c9f85f/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e0460207357f80e4d00354ba642c27ec0c00a559/
         arm |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/3e285f3c15540a8b456da2e31bd49052ab30fc4c/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a8ca3f70221e9244d16ddab4abf2f16596acb818/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/7ec3b1eef7e54ff2253f1b868ed3adc8926a4863/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/a76c8c5a3d5d067d42575ea00c76c80b51ad15e7/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/92780c2222d372ff802038fad440294ec6a0f8d6/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/a4c81e9f8a708f219ba6cdafe852b6d82bc57f17/
         arm |             python-urwid-1.2.1 | TIM | http://autobuild.buildroot.net/results/5d95306f0ee71158d9fcb49013fcd460276fbd82/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a5eb6ded7ce5f924a1da854d5eae477423a9d268/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b4568c3619b1c86536ac669aed8d9a78102e0a6c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4b7eb4099c8ed132ba13d21ea3f5897b4a988fb9/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/07ac8e53f916938da41ed43d38b7295a4dbf98a0/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1b2932d5b2d47a8940e7e01183a61bdc23b9394a/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/21d93ad6bf8a99d35f323b359a60e08e96c04c22/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1e8d6d165198ecd2fd0efd998faa9925d9b118c6/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/792f5cd7d7dbac466d3fc4334c693252d2505e8c/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7d6e0ea96ab14f7567590627a6f10ed6005f8e7f/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/49b459a4f722a4aaf78af2594435c83e02ed2fc7/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/8f2b3fc5268cf7e85a0b7cfa6b18f9222086c720/
        i686 |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/81f132d4605efca14c6c43f7a639a3597abaf904/
    mips64el |                   samba-3.6.24 | NOK | http://autobuild.buildroot.net/results/97dc2fe019d27f10a1e2ead07b5c31de88eca633/
    mips64el |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/25b0eaab98040eabf96b02ad6133e18d80089045/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/4414c2d63f1f58c5c6f25bb5fd691cfbdf8491ce/
        sh4a |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/621a078d0621f12d082a54344be6d4b390473748/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/ecf0c819b9c6012ecb34e37bb083f70e1655246c/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/fd9f5d4091bdaa292e24970447f903d3eb2e508c/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e85f06d716aff060f17244547bd96f6a4f990d8b/
     powerpc |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/0522a521ddc57c894eab412f107276eb52b11060/
        i686 |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/a40b8cf9aaa4ade4d96524219276cfad2920104c/
         arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/03fff2805b3348f2557bbef73a716eadea3add03/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/d63be49e6b6df77bc3075f68d512c23195cc39ff/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/9503eb65577d99ab96f4656e13f5e9bb2dea166a/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d6339476966d31a2e78c91541712dcc56bc7690e/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/65eb1ec58fce1c629864b866de392f297485644e/
microblazeel | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/ea788f1f0ed5ee4e9b1bf0c8a0d1304e7467dc77/
     powerpc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/3a4e7e6077cd4bbbcb8fe398e0938ad228306d2d/
    mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/8988994419ca82a7ff82ffabc08eebf2ad1efbb1/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7106214ad08a36d84b29242347891d3ccac45ae7/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3fd04349e73ebe09949284c3afad6b596efc37f6/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/f76694d196f44d746d2ef45c1e0ec8fc33dfd84d/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/8e240a0655b21ce07067e86d1c804bff9bb346c8/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/f5fe3373afd27ae2a1b4b14b871554168061e292/
         arc |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/657a45e08dfc068a8ccd5ae1b6b1f66c9d830e18/


-- 
http://autobuild.buildroot.net
