From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-18
Message-ID: <20151219073021.0896C1014D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-18
===============================

        success : 235
       failures : 80 
       timeouts : 0  
          TOTAL : 315

Classification of failures by reason
====================================

       python-webpy-legal-info | 10
                  boost-1.59.0 | 7 
                   erlang-17.5 | 3 
canfestival-7740ac6fdedc23e... | 3 
                 openal-1.17.1 | 3 
                   mplayer-1.2 | 3 
               libgdiplus-3.12 | 3 
                directfb-1.7.7 | 2 
        ltp-testsuite-20150903 | 2 
         qt5connectivity-5.5.0 | 2 
                 libeet-1.7.10 | 2 
                iproute2-4.3.0 | 2 
              alsa-utils-1.1.0 | 2 
                    ustr-1.0.4 | 2 
             host-nodejs-4.2.3 | 2 
                  connman-1.30 | 2 
                pinentry-0.9.4 | 2 
                 fio-fio-2.1.4 | 1 
               dvbsnoop-1.4.50 | 1 
                harfbuzz-1.1.2 | 1 
                elfutils-0.161 | 1 
                minidlna-1.1.5 | 1 
                   libnss-3.21 | 1 
iucode-tool-1cbd73013cd4c6b... | 1 
             gdk-pixbuf-2.32.3 | 1 
             lttng-tools-2.7.0 | 1 
           python-pyzmq-14.3.1 | 1 
                  c-icap-0.3.5 | 1 
                  ffmpeg-2.8.3 | 1 
              rabbitmq-c-0.7.1 | 1 
                     mc-4.8.15 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                    faifa-v0.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
              gst1-libav-1.6.2 | 1 
                 libdrm-2.4.65 | 1 
       openpgm-release-5-2-122 | 1 
                  libnspr-4.11 | 1 
                      pv-1.5.7 | 1 
                collectd-5.5.0 | 1 
                moarvm-2015.10 | 1 
                  apitrace-7.0 | 1 
                      qt-4.8.7 | 1 
                 opencv3-3.0.0 | 1 
               libcap-ng-0.7.4 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/4f30eabf90e183b0a2047c4ce902a94659b859db/
      mipsel |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/437d54b469f0d8ded188446d95943026e731dc18/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/1c00bc8269ee291053e085dd57979451b1ab16c3/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/3fe109bc1186c3cf9851d07bb44120f364dc1aa0/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/01acd0a4ceadcfa207bacef4c7522de458cb1d39/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/419784efdbe556a91003595661c3d4054414fec2/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b97a2b44212bc1cd8bf18c165e25083a78f44313/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9ebfe6c14026fa46db816e91671ce65226582b1d/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fdf2e339047ace6dd81232732a7c0ac86243f358/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f42431ec67a655f6f89186e73a485903fcbaf2af/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/9c2d0deb19e37ca34490e775089bc37d7a29742f/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1375e76bc34a1d070694b087fbcfe7352ae4d77f/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0e638639f00906f3ea85125c81ff976e419e64ec/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ecf13fafb1c6d397ea66a97b1a4efa17e968e884/
       nios2 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/3945eff9c69e66795853df41413920483cb240f2/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/b665281a3edcb99c12cebfaf740cd04a40c93259/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/5a47f2cf2089ca05b4fd28f8312ed848469381ed/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/5c395298a99e15c3f0d75bccc99ec9d86c79d4e5/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/719860fa334128f59ea4539542fb845c05f61bc1/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/88153b80298fa6b0d023228aff979e8cd5308588/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/33006e87a79eda2e33fb3e48117948bbc95a0d85/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/58523f45eb9b6c78c5d15d0840214e9ecd3f0700/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a7a1eefc7ed02638a5cfda2e608a7ed40ca297d4/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2b3117ced9dc43b6dd15d15bd03cd81808eb2304/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/626e618bf09b89cca6601c48d8b5f829d1f3bfc7/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/0da75ea46ac1845ed9389043e83d20aa12289091/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9a7ed75948d91932608f08c88a2b662566ff07c7/
      x86_64 |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/4baf21a5e9c3fda380fa0966dd657f961b12441f/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/41032b7cabfb360dd5ddd156492cdcc4e4cd3636/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/8eb2883d72fb39b2922b832957552917903019ac/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/c36e48d54d5c9e836c5dfac692c9f64b907c9499/
      mipsel |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/09ff6fd7c60ee936c081e7675c56c7a447e0f595/
        i686 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/107a5b557a3211bec324da8384444427980d83d1/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/cb63650d1a59da7d4e7f713a75e314b4bac92edd/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/5712e7f3f1d1ef0704e64ce4fd6eeac8689c7eb5/
      x86_64 | iucode-tool-1cbd73013cd4c6b... | NOK | http://autobuild.buildroot.net/results/1b885c82b7a6b07b21a84c87b47f9749cda6b776/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/5f8a1868b9546849b1ce1fd678bbcbced8cc6b23/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4011e6ee9fc60753b1565d0a8f6367777b8a3acd/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/d7928cf3ec9b30f5509568ea49bbd255b0968ee4/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1c3255aff66ba33e2f3a9805e227aa10935d4a17/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/57bb8758907fa7f4673cee1669985abe8129e73b/
        sh4a |                libgdiplus-3.12 | NOK | http://autobuild.buildroot.net/results/649c258c05293fa5203d7d2c7b20a4265c2815ab/
      x86_64 |                libgdiplus-3.12 | NOK | http://autobuild.buildroot.net/results/58cad610b1bde68de82e44bf3c87d7bfcc1fa816/
      xtensa |                libgdiplus-3.12 | NOK | http://autobuild.buildroot.net/results/7b62e6d5a658d4460465500a0f49f5df9de5c179/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/6c460cc3123fa52a0edd5bb2a6af3570bc5d8331/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/2923e52b205ad76ff984e7ebc934bf72596b648b/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/cea44d2886688be6a9f913149b68fe45923638fa/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3f53d57521ee5a5ed41078229e1d30d52c644e27/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ef49483ccdfa5a3d605dc40e4102ac45e111a4ca/
         arm |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/2f000fa82662c39237785a532cce1909facb8d23/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/b5026b45a7f6b71fc039e351647245411ffd61fa/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/3a8e98268285e603b907d8dbf1cc9fe07d8b5912/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f4972032e93089f586df9c81c7eab6506a00a6c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f4ea5fc4fed8e52585bbe15ab018a2c7ad1d16dd/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7820a0aeef66751ce883ff1cf0a1373f43c7c482/
         arm |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/be8df2bcb1af6dc553b5d4e31a926baf9f942249/
      x86_64 |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/a1fd410ef06441e69e508ec42fad35bde1513582/
     powerpc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/1f1306b2139efc940a0b0e4829ab6b5aaafc8823/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/91a1109b4abeb4bf5bc21e3ced7f782ee66f93d3/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/87d86ba67a4af56ff74a27e2dd59b385540769c4/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5b856764fde16318c3b9b3b61b6f8e34453f50ef/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/0158830a6cf689cbd1e3e50718aee38f0b6a1cf5/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/eee4b63b0e70dedd2782b67fae252c64b38db534/
       nios2 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/9368bd877938da7310a3a33bbbf592cb8d1f2ad5/
    mips64el |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/0aa261c142c2fa51fc1b10ed4a31fd1b2b465401/
     aarch64 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/25c1b7a11c1f2322316846603af4331df3e97f24/
    mips64el |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/2fcaad20b66653e61740e461b09f5c4d1b6f89d1/
      x86_64 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/e6ce48ae47f06ed7b6cd25682ec6df66dcd5d2ae/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/4719c6e7274ac39cadf71159437f953915181c99/
     aarch64 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/aeaa37b8a962be1f0cd061f926af34ff2765617b/
        i686 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/faf54ab99860a9300ca1a4db72460935eaa5391d/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/3bd45978463c29b8f120c6d16f720fd366945493/
     powerpc |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/f4a5b04256133c631992324434d963e1c0cba7ee/
    mips64el |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/74ae41d1c1e17954b072afce1f6ffbdc51b4c2b4/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cd3121e8b39cec0204f7f682cfb76270af7d7af9/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/2a76ae48d2b960df94a3f9fd8ec0fc27ef6939d1/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/eda6c3fd576e7d791bbb554a820ae14acf230d9a/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/606253c32534a10e8120e33a445b4584e7fbf192/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/ccb49feddebdf85790fc0737b0fac2300bf1b69c/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/c4c592a4c6bd2460ab86fc9765d05f124039f992/


-- 
http://autobuild.buildroot.net
