From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-04
Message-ID: <20141105073015.758941014DB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-04
===============================

        success : 219
       failures : 70 
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

                 schifra-0.0.1 | 11
        host-gdk-pixbuf-2.30.8 | 6 
                    urg-0.8.18 | 5 
           libmemcached-1.0.18 | 4 
      dovecot-pigeonhole-0.4.6 | 4 
                  tstools-1_11 | 3 
                 webkit-1.11.5 | 3 
                   libcap-2.24 | 3 
             lttng-tools-2.5.1 | 3 
             alsa-utils-1.0.28 | 2 
                 rt-tests-0.83 | 2 
             subversion-1.7.18 | 2 
                      bmon-3.5 | 2 
                collectd-5.4.1 | 1 
                  zeromq-4.0.4 | 1 
        gst1-plugins-bad-1.4.3 | 1 
                    ruby-2.1.4 | 1 
              libarchive-3.1.2 | 1 
                    fltk-1.3.2 | 1 
               libcap-ng-0.7.4 | 1 
       opentyrian-2.1.20130907 | 1 
                      qt-4.8.6 | 1 
                  libv4l-1.6.0 | 1 
                 omniorb-4.1.6 | 1 
       directfb-examples-1.6.0 | 1 
     x264-20140930-2245-stable | 1 
               sdl_sound-1.0.3 | 1 
                coreutils-8.23 | 1 
                 civetweb-v1.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
              librtlsdr-v0.5.3 | 1 
                 libssh2-1.4.3 | 1 
            mesa3d-demos-8.2.0 | 1 
znc-b396cafdb249544164ed029... | 1 

Detail of failures
===================

      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/1ab21bf379266eb44bb1a5192d45169ec3c17ba7/
      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/b7b796ee0b2f05db2344e372f051548177b19f2c/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/5ef95a0fc0e4af7b587492cea45feec7354ad3cb/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/31bf1362f1ca994dd84b84927f0e1c83b94ff87f/
      mipsel |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/4a179bebdc9cd85780d7f16f672ee019a1947147/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/5d3ac826c417549a6db5a30aa320cb95f1ea4689/
      mipsel |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/2f2f298c9baccba79d7c94a02703be708cec6757/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/9151021b25b779eaa1ecfd94554080280495e3f8/
      xtensa |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/fd249128d0c671d18d308ab82c0333fe3e88560f/
      xtensa |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/79f3128271e1fbb22288ac8d808f57e914565db1/
      x86_64 |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/a3ab161ce1c5ca968e299c758d041233bd6f0e45/
         sh4 |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/bd6b04bbf0823fa243a5b70e91903d541fd9bf25/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/03faf4f9983cf21b29c327f7aa6f89f5ced1075d/
         arm |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/a20f1ba23972b905c9b6f687e1be34a27a8ce101/
      x86_64 |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/2cb2beeb2cd230dc095e468ce2ab399026fd9ad9/
      x86_64 |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/a18a06feb557ddd8619fb63a11ddc0bded5cf036/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/fa02cc7339f24e29b0785e759a86aae5375ee76a/
         arm |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/8e5578bec3b2d8cdfe1e9460868edb9542e4244b/
      x86_64 |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/a99318ba1f33db52a925d31468827b6e8bda29ea/
        i686 |         host-gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/e5fa22993e7d19b7bb0b5acd38de28eb6110d355/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/643e3741d3fe18c297b303ab30f21b7feb43d66a/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6e88756eb83111db9a81fe189cef6819dfffd972/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9928a251e5cfcf6e574a447221e938135eeb69f9/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/08ed1f5e94fe8ade9453518d6c51f323f28b7938/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1c625b9d4c74084ee3306de4b7efe86afadb2ab0/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3e3144a9f22aac7a463dd2419807818835b0e696/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/262e03d77233093075a50b109179b659580013c2/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/543169763f87ebda4b07193d6c43b9d8bfdaec89/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3e4bd2f3331b1bda79c68670080ef94b01f7caf0/
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/2730114892328463d370f9de0b3c45a5f7b0a518/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/02e4718bb52f465049f494d1724ccc5bf0fe7ddd/
      x86_64 |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/2c11f4dbb7cfadcfc6fbc267679b2b4eab867221/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/0ad2756399bd68ddde0bf65946c5e5523773a5e9/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/ce7ad685186643c1dd311632bbf5658f3092493b/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/e53fd111e408c0f358a671b4e88c82f37eed8ee9/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/da87a3e81b19ad038661f5653b544f4c8cfd389d/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/0a8a710828a0b8f65259147c100502fa894cd436/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/f5995a713e67f168f6828f3824a69788b4690f3b/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c3fd5a9da94edc5e404a57c7c43240b73ce2a0ca/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/9bfb9bcad67727bdaf74c94206eca0bb728d7eec/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/b64a150f3e66d6f2504d2b28f2594e67eda8ea16/
     powerpc |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/9507d84e82177994fa374a577b8f40f1337da877/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4adb5d98cdf2afad0f1a001023c1560e0760424a/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/7c4cfbdbaf5fe5f45b185c3f87651217cefe7b21/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c3aa97e82a982da869b45537e92ead12b32b4584/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/8f0ec7be08c3f8009559d61add6a8045f241382c/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/252b7ada5868587128d2acf5429019c4e47fa61f/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/280fb737547531daacdc7678b7ff24d69d382b5e/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c23019f18ca53a6efa92fc629b084974c15448a9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/55d2edd470285e33d1bdbff344ee27a309df6d2d/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/ead9154de58a2b11a85d4c605f2bdc01a2c3073b/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e2bbe74effd74e01bc999e5c97b1df81a8a286d0/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/10353162f8516ee4d46435ca72ae97fec38dfd26/
         arm |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/aa4dc974c297ad2595363ee524a18ea30536cca1/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/bd8cdf976937c7b9029658871929f4be464b7a47/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/e0471f2a9087d547840a7b18863289963e357b57/
        sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e0c8aafaed4775492d13f5bf4311dabe1043a925/
        sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/0225d5c5e1d2d94932f79bede5440f748473a454/
        i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/a2f91027d157b1d3aad3e321326cabb61193f7ca/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/e34808c806a849ee8d23e5b6eccf7da57a0e39be/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a30cc734580b74940dbbf2726cc9d14c75b28eb8/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7cb1e0f82ee371c93e3b24c3943370aa9efe9216/
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/48dbe0e3e5740c09d6570e276decda832b9b7414/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/4a92ef858360f2c1134aad1633bf602df98a5156/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d9d042abb0d94aa2af1925ee365b7e54c0c0c1b4/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/1222b8ec780a87135ab248679176ffc282b478e2/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/99ebc801c6ed9117f3fed6a657b0a617227328d8/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/0979f12e50d2413c702147408572b01e6bc700f2/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/273097de7defc60c85326445d68d3af2695baed8/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/659c674d46e32f0ca59ec75272535775e3b2597a/
    mips64el | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/d777f62139f47677becd41c76c9ed4a02ff3301d/


-- 
http://autobuild.buildroot.net
