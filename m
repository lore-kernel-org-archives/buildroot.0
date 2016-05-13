From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-12
Message-ID: <20160513063021.AE96E101E21@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-12
===============================

        success : 181
       failures : 62 
       timeouts : 1  
          TOTAL : 244

Classification of failures by reason
====================================

android-tools-4.2.2+git2013... | 6 
                    mpv-0.17.0 | 4 
host-gdb-6be65fb56ea6694a92... | 3 
                 jack2-v1.9.10 | 3 
                  ffmpeg-2.8.7 | 3 
                 host-go-1.6.2 | 3 
                   erlang-18.3 | 3 
flann-04b4a56533faf8c8228d0... | 2 
                flannel-v0.5.5 | 2 
             ipsec-tools-0.8.2 | 2 
              gnuradio-3.7.9.1 | 2 
iputils-3a86a2542c6fe29413c... | 2 
       gadgetfs-test-undefined | 2 
                  stunnel-5.31 | 1 
                grantlee-0.5.1 | 1 
                    mosh-1.2.5 | 1 
                 mesa3d-11.2.2 | 1 
       openpgm-release-5-2-122 | 1 
                       unknown | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                libinput-1.2.4 | 1 
             lirc-tools-0.9.3a | 1 
             rabbitmq-c-v0.8.0 | 1 
                  cairo-1.14.6 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
                upmpdcli-1.1.3 | 1 
                   slang-2.3.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                   mplayer-1.2 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                 lvm2-2.02.153 | 1 
                  apitrace-7.0 | 1 
                  connman-1.32 | 1 
                   open2300-12 | 1 
                    norm-1.5r6 | 1 
               valgrind-3.11.0 | 1 
tvheadend-cd9f07fb865e57001... | 1 
                 qt5base-5.6.0 | 1 
                    cups-2.1.2 | 1 

Detail of failures
===================

      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7462f0e9e7ae63c30b176ed62632e1741f94b726/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c958c1e9efc791706fad9132f9dc4a89f6191138/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2719cfcfea2fa2ef7ca9226011d9c349c6ff2a16/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/91c8e1db79fb7e66f93860c737918c0e886fa8e3/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7be23b271c429116722eaa867ab95656ce63be6f/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/068259325e7cb7d445af3f97073ba7d77c255da9/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7c7f2d645fc25df09390d9a288f55cdae949ffba/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/bc42c4d089534c41a1deb268ee53c954022c2490/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/bb51ed5954778b5fcda26c34afaa8a67f6535a94/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/74162e0fc1b425f365553db5475cb5f3e0176a1e/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/4c4635d4d63a53a453654ba9941e38e6459cb1ca/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/4c02d06caa432cde83c23dfae6b2c2d6fd409190/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/7d66139e913dffa1148d86e62597b3cb75ed8529/
       nios2 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/3fedc1e31bd84e25c43fb7b1d01c950fc4c66a25/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/d5151021cca06f36af7e7f802c75413700a1d794/
       nios2 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/0f0f5892e474bdf9145242cee836b8acc383734f/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/22bc2b9429ed1ef8a19929290e7b129f55cdbd5e/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/27c79f141a5ac2014f87070f5ebb9e3df1a9acfa/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/967c131b68f8803c3ca07c8e4e09dac5c6b0f17d/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5e9deec9cf4c6f0c2c547fbb0f153218944c0b9d/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/e623e97ba6d4f13f91fd85bd9542e1a65e5fe7a1/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/41a7dd7a1ffa415dc49720deca0e03d9c63d9561/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/a55b2e755a953b03c651f3fa743d0309dcd863de/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/25cbda21b3ac6efd30e453fe649a64cd8b973904/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/cb36973ef3662fcce7c1589902363e05c1bdbe04/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/012d5a63fe62b7e53fb8c2e662156bf4614e7ec3/
       sparc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/5cf951368010636792915f7959f2ea834d365951/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e4035e8280bd2d2f50f8f9a77c7f1a9110b86cbd/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/73750f7a39434082ba5cad0df3cabb7023db57f8/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/37c77885aa767e08ec354ae8aa4b41a425f1415f/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/580426e048cd6a31a56002de4d6a37a14bf23ec8/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/631a9c679ed5e7bc95930c989b3bae837e63a497/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/669c6d49883bd261a806374dc08a3b1ec5553f3c/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/bbd0b472b56e6bd8dd774f48f1d6c61919520596/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/3a968211123232af0eb33c381af5655c3ced8d21/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/4de0183b3837b79ad6e91f7a10197177cf292de8/
        i686 | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/864d8901eb901182ce186cf9a845636040e242bb/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/972603d5b9e2e0eabfc891dd459835aa71bd7ab7/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cbb6e753cb9180ebcd2d67bc910fa94d5c63ffe6/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4f8cc4b1bd0153d5f97392c3786e2e4ade5cccbf/
    mips64el |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/1844890c65615f1676a85c6fac78937249eee9f1/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/e263bf09357c8d26a02334c4c7771a5ec60ceb98/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/5e7ffc726910c039f3d51d4e95991d7ac1f2f5ca/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/edac3b0300d7d5f3614f0f035efc0376288be0d0/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/175868858a1f95b0d07c137ac820f88b3dca2917/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/866cf019e142ad18ff4d728b9da92b6014a4c3ff/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ec0f5d5b2b02a8d5590df8f0092f52a105fd12bf/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ee9953c2091846c758b246ea4f2f8b54de5e6078/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/74a2d87b20375ee4ce518e3d4e7289f1ed0d4ff8/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/981e2566d2bc8a2ee4b09812df5ba2032de91a8b/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ccc872775c2b4ccc778097c95107778fd8c459a0/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/e08d22bada940a08168e212962def4dc566c026f/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/cf13e98f87414271f3fc4b9ce94e7cb20d71e9f7/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/1ca0785652b1aeb2302291624a2c3d4f6f6942cd/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/c5427d8781b3b12af2e9f6cbca3adcbe21374c86/
      mipsel | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/6728499da35d3558fc7c68ebfc8d9a2c7b9bdc5f/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d02d37ea7d6cdbd449fa82a7559fe2e156972dc1/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/3cab453b862cde34ca376a44338cdc26fea30793/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/3961dc5e5d43a4b11882b2c63a4d4dc4edf0b1bc/
        i686 | tvheadend-cd9f07fb865e57001... | TIM | http://autobuild.buildroot.net/results/12e361c082f874e1a0b53ea4fa699cc8444c49ee/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/02198ddc0ccc8776623f5d769989c3a68d29b666/
     aarch64 |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/ebb72be68ca39ca0ea2a7454eafa85fa38d39387/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/26985221c54ef0cf7cf1b632234d7955cf8b89f0/


-- 
http://autobuild.buildroot.net
