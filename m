From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-16
Message-ID: <20150717063018.D77201014D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-16
===============================

        success : 232
       failures : 89 
       timeouts : 4  
          TOTAL : 325

Classification of failures by reason
====================================

          c-icap-modules-0.3.2 | 6 
               libglib2-2.44.1 | 5 
                libtirpc-0.3.1 | 5 
       host-erlang-rebar-2.5.1 | 4 
               libsigsegv-2.10 | 4 
                  boost-1.58.0 | 4 
               libpthsem-2.0.8 | 4 
               upmpdcli-0.11.0 | 3 
                  ffmpeg-2.6.3 | 3 
                 setools-3.3.8 | 3 
             qpid-proton-0.9.1 | 3 
             expect-2014-05-02 | 3 
                   audit-2.4.1 | 2 
                  zeromq-4.0.5 | 2 
                  fan-ctrl-1.3 | 2 
                  cppcms-1.0.4 | 2 
           aircrack-ng-1.2-rc1 | 2 
                iproute2-4.1.1 | 2 
                  c-icap-0.3.5 | 2 
                 libpfm4-4.3.0 | 2 
libsigrok-fe473123ba836445d... | 2 
                  opencv-3.0.0 | 2 
                  cc-tool-0.26 | 1 
                 libebml-1.3.1 | 1 
libatomic_ops-libatomic_ops... | 1 
               alsa-lib-1.0.29 | 1 
                   zmqpp-3.2.0 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
          sane-backends-1.0.24 | 1 
                   systemd-221 | 1 
ltrace-be0c6870e08a3be43b3a... | 1 
             libselinux-2.1.13 | 1 
            host-nodejs-0.12.7 | 1 
                   ntp-4.2.8p3 | 1 
                busybox-1.23.2 | 1 
                  luajit-2.0.4 | 1 
                   eudev-3.1.2 | 1 
                sysstat-11.0.5 | 1 
                   ushare-1.1a | 1 
                coreutils-8.24 | 1 
                   bdwgc-7.4.2 | 1 
                  guile-2.0.11 | 1 
             btrfs-progs-4.1.2 | 1 
           host-heimdal-1.6rc2 | 1 
                 netsnmp-5.7.3 | 1 
                 libepoxy-v1.2 | 1 
                      atf-0.21 | 1 
                 qt5base-5.4.1 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/ca5683178c7c254d8649cb6f53e5b50277371aa9/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/1ac780bcf0ef9414c63416e9732ceb7d0168327a/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/28d11c129f46ae101ac6c0c33dc77962961483bd/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/fbc3b91664768fd5de40b0cbb72319a74bbc6f41/
      x86_64 |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/26a12c34b1be00a4fa5a823333a7cb1fb9e507fc/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/f52dbfcb4e64a26e31bfae22d393387211d28573/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/9fa3fb442c55bd91a7d03a8db33fadcae960d3a1/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/c79b28d9bafabab5fed28fc55f8bb524ddd39938/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/a96f4c30e60d4720e1160c4a5a0f0c3bf02bd6ab/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/47b37d372acf590f7386f9a8b7d8b3b2eac53e49/
      x86_64 |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/2dd60ccc840b7d848918a9e24da45980b5509ec7/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/f5797ad0bfc3ea601406c42003b987a2fc7cd783/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/e63167dadecaf44bedea8a5388ba63001318a5e1/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/a6bcb485ba564ed749a79eebb28a2a4ade69309a/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/67e0af6c44e94094d6bf45c8d1c82ab8382a7fdf/
        i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/e9c3a1f851cd63b35bab5a3809f5b72ab6263a14/
      x86_64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/b401e731b0d094b7afcb5f9393e87cd432549d53/
microblazeel |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/9ed6069543a731abbe55208dcb28d033b48fe6b4/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/43a2cef508e2c59a12210df973ba83ed93d79468/
        sh4a |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/d9eb2f7408e49ea94b60ab518f4909f4863beab2/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7260db85a46130115b50a9d33008e1b1eb4c5cd0/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/d4a25d6941c067c9defc2a0903d2b261477fe6f0/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/15a73c1ade8e3712edf8be38100bce96c1b2cd70/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/f1bb4fabf54307e5ac676bd0a691087677b8a8f0/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/41461b3345969b9d9a2e356ec5256cca17d0eb80/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ef080884abd56658c21e9ef6ae54ff510c3b1802/
         sh4 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/2ccccbb8250482391de01a99f363889a3c6950e4/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/8c57deea1d569fb57d2e03edc2feae3d7a660288/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4e4bacadf581043b6264b42a2a852711a9975dd2/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d998e6557c214dc23e0b4c960f49ce4c3e71d570/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/3e174d5110b2c5a57e9188c2b32f372e89b61902/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/ad56fa3839c45a56b881fa99a2ed3bdca32a83b4/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/ab51c9390ff3729d78617086bdd5d24bede59910/
      xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/d0026cc9c528248f48333d3c3869a2513e771278/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/058e3105e9b4c91c6ebe44e2f84177526db4aa2c/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/61ab5f59f220d336744ce5a8cebb64e613168986/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/539288ed7ef3281339368045222e0d92cbce9662/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/64c791209a2079fc7c74b6dc58197e547a1d26eb/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/854bbd296db9a84ebf6c7dbdfbf6bd71e6b33b29/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/9dc16814b0b5d1475e5c22c55a39c53a122d2912/
        i686 |             host-nodejs-0.12.7 | NOK | http://autobuild.buildroot.net/results/48757ae2f85c294ac6a30318a15aa5782750d3ba/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/e6ad312e37eb3f17444c08f6b2e7f83bb30433d7/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/b0d8214ea0c73c28bca2e101589945e6b001df76/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/f9e4f74c6a1005dad0ed4bb43203c982dc641349/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/69e073fafc1f932150f5d9095a682acc39d20c2c/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/dcbcee34ccb7991816f7678448e9fb02fe969468/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/6f2b699578cf1c6b6f6c3592335dbf3e3b60f738/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/6d045d427739cfb3c7d0b3c8c855ebc062e9c4ea/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/5b8280526c1fe3a5cc47cbfed53edd45e9a26cd6/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/533e89d517f99f6d49886bec8b92d9b5e3b49552/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/16796a20bf42fb59f52eaeb99d87a959f22baaaf/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/542ad405c4858448bf9558b1c1f0f8c98af15b59/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e17c0b3afcde25d42468a459a80b48ed91685ce0/
     aarch64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/4c25bededbeeb5b68fa8dcd2b88b662d0808bd18/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/6f2f0ae90ff435ce5404de154d5d084f5e6a8e33/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/2c054e88eb96466ab77471567b5e5503352a42d3/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/4bc6ce440252dc21c4d2d19268d52ee099031fda/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/48ad0f0485fe720c8ce348fe9c07101adcc97c4f/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/ea2ae7fca8037f4cd5d28ecbd861825aa13c09a4/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f244ecdf10eacfcdf8ef669f12dde47adf642240/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/44c54cc2997425cad5a1907d715e8ada73e038e1/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/bfa11c26288a04e9c065f6f5994003dc972560b3/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f4db2f493b256905480529158a89e4bf27f5e082/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/369f9848f4046098a22fcae16746f6bef670a75a/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/bd24390c4ec145c11aaebededce7833e7b48bda0/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9aaa5394e6027c563d2e5dcfbdbf2a7eda59bc26/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/398e3b2b2e48f8cd8709c555732d321d61e506ec/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/fbdcdee6fce538544f86a00ec8211ec91d84fffb/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/461930ae9241154b48fd1ae2615608215c4e1b8c/
        mips | ltrace-be0c6870e08a3be43b3a... | NOK | http://autobuild.buildroot.net/results/49a655eaca0b065a53059f111acc3a4e97dde4ac/
         arm |                   luajit-2.0.4 | NOK | http://autobuild.buildroot.net/results/20dfb10198f3688f92208591960192ca08280987/
         arm |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/5df28482dfa3d7c54d1e4ae3e1d373bd8e9a2265/
        bfin |                    ntp-4.2.8p3 | NOK | http://autobuild.buildroot.net/results/a92dcc84071daf1b8cd7ff3634daba1f687c8c39/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/4fa59930ca06e010aaca9857d978438efa15f0cd/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/da622461860ed6d1125770ace3b0e924713113a4/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/7e94bbb58aff034d7cede1696d6c3794f771a973/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/3d84459b2fad923d76280af7d3a993f51fa9e458/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/b0a1069763e852cb235b9959dd3ecc93ea88bbd6/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/5bd1e5e2a6133e1d86669e5f35e14501111dea2e/
       nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/d94987c5e2365775eace3b0ecc4240c3580cc6a4/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f2998a48d4363f1f1dd48e85bd48ee2b98af0df8/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/d9ccc52f026b1a03c7633ad2c68baa60f7aed90f/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/66298d476d26dbca67f9965df62f7bee2580b068/
         arc |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/04cfc76a09e089985549a4320f34f6669d21cab5/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/e224982d6aea38568a62f48e497e91f251b70cb4/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/34256fcce463993a22fef2ed32fea5f5176d32b6/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/e878410d48820b8a8c3529d1a34b02423b637d9e/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/d10c7117396b092ea89e9cfdd9bb85c0dd542c59/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/257655faa275213648ba52125702db5395641033/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a9aff4432f2f5d1fcfd0b6b9b7407751b264136d/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/713edbc552e62f88e6801856d8052f0518fd505e/
      xtensa |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/8de602e0abd8f44d8afd3c1f9297abf85432f28d/


-- 
http://autobuild.buildroot.net
