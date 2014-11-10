From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-09
Message-ID: <20141110073015.A5296101317@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-09
===============================

        success : 201
       failures : 58 
       timeouts : 12 
          TOTAL : 271

Classification of failures by reason
====================================

                 schifra-0.0.1 | 17
                    urg-0.8.18 | 5 
                  perl-gd-2.53 | 3 
                   libcap-2.24 | 3 
                 webkit-1.11.5 | 3 
            gst-ffmpeg-0.10.13 | 2 
           libmemcached-1.0.18 | 2 
                      qt-4.8.6 | 2 
             e2fsprogs-1.42.12 | 2 
                    qemu-2.1.2 | 1 
                   czmq-v3.0.0 | 1 
make: *** wait: No child pr... | 1 
             host-mysql-5.1.73 | 1 
                 libssh2-1.4.3 | 1 
                  xerces-3.1.1 | 1 
              host-erlang-17.3 | 1 
                 python3-3.4.1 | 1 
                    vde2-2.3.2 | 1 
                collectd-5.4.1 | 1 
               sdl_sound-1.0.3 | 1 
                    fltk-1.3.2 | 1 
                 tcpdump-4.6.2 | 1 
               host-ruby-2.1.4 | 1 
                  thrift-0.9.1 | 1 
       directfb-examples-1.6.0 | 1 
                 clamav-0.98.4 | 1 
                  libv4l-1.6.0 | 1 
                   nginx-1.6.2 | 1 
                     rpm-5.2.0 | 1 
                    quota-4.01 | 1 
               alsa-lib-1.0.28 | 1 
libshairplay-64d59e3087f829... | 1 
                 civetweb-v1.5 | 1 
                       unknown | 1 
                     radvd-2.8 | 1 
           gst1-validate-1.4.0 | 1 
                grantlee-0.2.0 | 1 
                  python-2.7.8 | 1 
          qt5xmlpatterns-5.3.2 | 1 
    xserver_xorg-server-1.16.1 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/40f7591acc637aed5ca11db5dbad542284d6d369/
         arm |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/c1ad8a1c8f8dcd028141adb199986fdf4a636c76/
      xtensa |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/235c528b7e1e0ce17970f003cb943714bf6a7e93/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/45d7156d4e29056b24ef1b47683f5f555607103f/
        i686 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/a90fcc2d98eb267259a093f29569cdb5a64739b5/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/95ca8e4d93ce8534af67c4aa101ec0d74d144944/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/11f3ec3517f429b5939aeffb36ddc1176771aa72/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/e3dfef09fcad2b0b91c9ccf74db90ddce7c5784c/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/62e8c4c7116bb0b1a8852b2166bd531c59ca07d8/
    mips64el |                 grantlee-0.2.0 | TIM | http://autobuild.buildroot.net/results/d3f6142f60c58d50715ca57b9b9dabc00a84cd4d/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/ce0ef8253d7c9fe9e55e0a8508f4d9ad41d49a13/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/37585918467ae72310be19d926828660ae3a51d2/
     powerpc |            gst1-validate-1.4.0 | NOK | http://autobuild.buildroot.net/results/229ca690112a0eb3b7d4338bc0c87b3f86b1e273/
        i486 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/4dded62d4f05a84bc149cbfc6043b32007f37810/
      x86_64 |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b32c0f22ded60d3b1f073f862eb8ec76a4121240/
     powerpc |                host-ruby-2.1.4 | TIM | http://autobuild.buildroot.net/results/47a4c5c8ea16012ada31b27f60a1e070f08a3b20/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6f33f8e6ef5eff42d60850b23e01e290ed629ef9/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/34718ff55029c65b86640f6163f74179be54ea13/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ebe1b2dbe7a9bf5d513b93d7a34376a4194d1873/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b81eef0a9ab3f03b13f22de7f7c48fe0b62cea55/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6ed64010b7f6bf0946b1627de65442926b9add11/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/5668152cad133fe48eccaff64a8b5874734edba1/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/0e0ba86e63eeb4a833ea4447adce1f3a4932113f/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/1d7eb0f3b0a6eea417ac7c446679bf4122eb135b/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/2ff5fef5b6955f56d320c5a205acbfaa8eddaf0f/
         arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/1a4c00753a7e9decc9c0d76f990aeab6d1c8d46e/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/c3c23018964c93bb18b59ff5717803031bad83f0/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/a2719e953848bd99e1208c0408a82c2db25424a8/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/0998cb8d1260b5f99c776f583cbf36531831c540/
      mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/e2d343535955b5bdbdcc299e4ebc139629a43268/
      mipsel |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/ff9ed332803d6cff38b94bbc4db8baab2a94f73f/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b2ff4a1dcefae6ce60929fb2e118266728b7c780/
     powerpc |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/3ddba7d43ad31bcc814b76f0822d92dfba70df35/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/bb8ab5ea7ed02cf17c46522903b4e46035e47f16/
    mips64el |           qt5xmlpatterns-5.3.2 | TIM | http://autobuild.buildroot.net/results/0229330a5989e04daeef94296749c823dc8c4a71/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/7d577c2ff227351029591ace143b84691b341f13/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/7bc305599fda02c0c84d75ddba62e68d05b3ab0a/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/1d7ebf118452e3c2e276e91ea55037c435564986/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/fda68bba71e9e2b10174d887037ca42434fe1982/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c4a7f7718f45ffab0db7c059df6d64fd2365803d/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/145c8a1039a9b0c2ad57a14352bd2a0b77ead5cd/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b6ff324017580da1579e630a777d7f3e04013c42/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/307d24557c15856ae6e75c13147e4246912fd509/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9967281d0484a23ebd799d61d6f110eeed4ec2f3/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/932c532efd411c2e60b5cc091c91156bfd1b1214/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/f55dfdf0f20028e033f5d3d65c2186e81fc4d941/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/54e642a0fee9b057c406a4b01a47ed33a6846dc1/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9d2164d8fc5c6c1d0c3e6ba23ae7847a2b28a1d7/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/87149caa5fde1e80f0dfd5370729ccb81ed7cedb/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d339a90b1188cce08f83ccff5a23c6be6f67cb1c/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/081d54a86dc58dba09cea17d1f56c8f711afd593/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/014d907418ac340a5c44196be5757070c997a1a4/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/f1454f0b10b200455d0a6c7150bd34758557dfea/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d4bd24ed877c970da6fa13295ca57402c438f5b5/
         sh4 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/63481b3ceab0d6c1efddb2f907e756eed891e38b/
      mipsel |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/5fa1c9a33702881827b99fb67dc9b3409c0e2bd6/
        bfin |                  tcpdump-4.6.2 | NOK | http://autobuild.buildroot.net/results/fd231d34e4bb0306609b021e9e74eb862b7bd6bd/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/8496c9a4c5b05dc9b7efd7f07ae2faf87ceee083/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/bc572cf564987aa23dae9ddd331f46559144711c/
        i686 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/93f74a186eaa9d6560a0e5ca4a3df08b71360ed3/
        i686 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7aca18b3b4d0cb7ff482b27b8598539f5007a974/
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/cb24b58e74fa2277c705d92ec166d89a06e85476/
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/c613f8c510f52933b1b8ef57825ba2e9091ddd5e/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/773ee4f8199ad3ff20197a5444e342a7ef61977e/
         arm |                     vde2-2.3.2 | TIM | http://autobuild.buildroot.net/results/6bb2e17a6a78aff1735a296c9b3a1fd99ca05529/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/363bc81da5548659559dcce5ac95cd24747a2a2d/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/6d37d525dd2559a6da28402036284fc698f67c4f/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/954665e9c9cb8216dc4b076350ab87063ac7e268/
    mips64el |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/ac3ffc67f7248d55810afc14b83bc7b35ddbbd69/
    mips64el |     xserver_xorg-server-1.16.1 | NOK | http://autobuild.buildroot.net/results/df92d9b682976b77d9e1e4c39afca52b7512d847/


-- 
http://autobuild.buildroot.net
