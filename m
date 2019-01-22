From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Jan 2019 08:00:31 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-21
Message-ID: <20190122070031.2DD5D209BF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   0 |   0 |  19 |
   2018.11.x |  31 |   0 |   0 |  31 |
      master | 221 |  49 |   0 | 270 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 6 
             host-grpc-v1.16.1 | 6 
             libva-utils-2.3.0 | 6 
zbar-b3b4e32b55f570372fc3af... | 5 
                  libssh-0.8.6 | 3 
                qt5base-5.11.3 | 3 
                 dmalloc-5.5.2 | 2 
                 gnu-efi-3.0.9 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                     lua-5.3.5 | 2 
                civetweb-v1.11 | 1 
              freeswitch-1.8.2 | 1 
                  grpc-v1.16.1 | 1 
         libcpprestsdk-v2.10.8 | 1 
                   mutt-1.11.2 | 1 
                   netsurf-3.8 | 1 
                p11-kit-0.23.2 | 1 
                     php-7.3.1 | 1 
           python-numpy-1.15.1 | 1 
                    qemu-3.1.0 | 1 
             qt5wayland-5.11.3 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/8022c23918ea58ea2e380bf4eb0662af72bff517 |     
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/3f2518f7a9e87034cd501ac3d121ea3a33827e7d | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/5542ec56a65df262005c99c7785746d94c5b3114 | ORPH
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/7ce0bcdf395d4d1e6a0f36491eddff263e4ea628 |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a060818d0b2bfb21fd031f56e1ceace6bcf11307 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/410ba72f8dc53c93e6bbffd657ccd57b46741285 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/aa61893d69be7d477e558a4337f5200abf60cd46 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/eddf37b6043fbafea81416ded4f45676b4ceb52b |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3a8f5f73528cd07b9cadb147aa79d61eb78ff7f2 |     
        i686 |               freeswitch-1.8.2 | NOK | http://autobuild.buildroot.net/results/7aa1a9e42ec0db8b5667aef0ee12d59059bf5ea3 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/c8761d980342f77c3061c038a01b6782f1abbca8 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/ebe073203bb83b710ba19640aceeafa15069e623 |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/456e4c4a25c703ede5c56f80e0a46537118f37f0 |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/554fd489dcf1e9e48f2ce5aebe38016c87b60e0a |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/c49684f1a3a18905477bdb64a767b75d4fef3b60 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/29d82204c79615b5a82d385405239e3cfe4273d2 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a86555659a98fae3b000e77c06f2387be342793c |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f4f91dff9481a705c8d3c6b9a38be4f4539665ec |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f68ff8e67eabe4257b156072888130fef3da4d2c |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/7d0076adb99669e1ebe5204dcb61d697337c43d0 |     
        mips |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/7e0004c483374cad643dba4fe884042d8815848b |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/6187b92bcdfd9281683c37906ae74f2e0c5e6d0e |     
       nios2 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9eb5ed92a923f0c038e3d913289eddc1cda1b62f |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b999fb18fccb9d8e65698dc78e4509d901cb37c6 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c9e660c764edbd7cf0ae54ab0f0f412464721446 |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/112a2936d511c5dd9c5644bf283f265118dc9ef2 |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/65b24d6459658a19ec78d1f418657b5c5d8d5d0b |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/f01992a3467965eaefc64ac4f40db8cf136911c1 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/19203bc7844d7f9fbb5ea68323942530d8378eb0 |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/2ac3490deaf9e2bc7f0b283707235b83f0d85b4c |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/58771ad13a5af6a5771a20eddeb8612e8069a1b6 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/80b4e867d8f2e28d9c43601aa9b959f61f179bf6 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/e862f5e4d05a258061be7e94b517297a77f02d25 |     
         arm |                    mutt-1.11.2 | NOK | http://autobuild.buildroot.net/results/27dfc6cf82e6abc916f9d5939401ae46ed2f32ef |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cb4f08190a9b084c7ea1255ee20e71b3d6432de0 |     
     riscv32 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/7cf1049174b0f6c8c8c313d381327c6d33cee98d | ORPH
    mips64el |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/7fd52050b50d383c3ac75bcbed6bd88400b2e933 | ORPH
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/abe197e2b13b7ee1a5c7bfddcff4b1d36ae3cd7c |     
        i686 |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/06cdf6b942b25b3a309c6ff18f367ac20d6266e4 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/fffcc77200a70b8bb5a944e528ff97ede835a995 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/68cea0c632675feb08d7c765744b86f465807965 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/a2bcfc061ab1cc616e65dc68b4b16970c5e8ab91 |     
         arm |              qt5wayland-5.11.3 | NOK | http://autobuild.buildroot.net/results/cbf5246216492c773c7e48f0e165084ff83ca36c |     
         arm |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/f3082d2fdda8d73dbd9d3b65a08d844934066ef7 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/f88b13a59f4bc83d2d27948936f1c57ed5ac446d |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/c2c9cd7299e16d9130f0be3994b4bfb9373d83cc |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/667e85a13c9cb2854aa135a2f6f805049cfeb038 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/eca5bef46694a335fdeb770d450b13c478d2a4e5 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/4c14e6553725602f08099c20cb8380282d910e3e |     


-- 
http://autobuild.buildroot.net
