From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 06:17:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-21
Message-ID: <20190922061804.E4F88850D6@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  1  |  0  | 10  |
  2019.05.x  | 13  |  0  |  0  | 13  |
  2019.08.x  | 22  |  5  |  0  | 27  |
    master   | 100 | 36  |  0  | 136 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 7 
                    mpv-0.29.1 | 3 
                    flac-1.3.3 | 2 
       gst1-plugins-bad-1.16.0 | 2 
                 qt5base-5.6.3 | 2 
                    4th-3.62.5 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                  aespipe-2.4e | 1 
                     apr-1.7.0 | 1 
                  flashrom-1.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.0.5 | 1 
           host-harfbuzz-2.5.3 | 1 
                      icu-64-2 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
                  libsepol-2.9 | 1 
             libsndfile-1.0.28 | 1 
               libupnpp-0.17.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
            python-sip-4.19.13 | 1 
                    strace-5.2 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    vnstat-2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/cc433751aaa262c7e351668b2414816839a98eb7 |     
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/76b3f3894ea04c6dddabb7bb379dcec9752029fa | ORPH
  riscv32    |          aespipe-2.4e          | NOK | http://autobuild.buildroot.net/results/bee17abae36ba54e0cd682cdc77a8a6ac9bf88b7 | ORPH
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/69f3a65ec3b43ff6124f83ea63c808a77dc180d9 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/c746c59b4929b3f423963bcb2339f6cce1591b4c |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/5f0873f156744a70ba5b3c51f5893a618bde524e |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/ecdc2c1e91007b73d524af4867c73b2614fb0dec |     
  powerpc    |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/2a6a3c0f7619eba6d27611de257f3a8c7abb2c64 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/344b65d0937231a3f212edd442253b78cd18cc18 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f4835b00207df57ea37ba272cd7f03afa3e79aca |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/5ed950a8d9a633f945d0ab7a26f391e93e2c25ea |     
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/c209e1128cf4601e2f7dc131f82eec0b5df39f75 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/fa455cef10507597a9034db4e65e56713793e40f | ORPH
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/662b74cf79756807835dac384625231b7fc186cc |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/8fc9dacd38284befc79f74f275e9667d8aa759ad |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9824821a246b89a62717d59fa2a6d3b42c9ed8ee |     
  riscv64    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/ee52fc4a79f9b21fd4468cd46e6a8c988c413788 |     
  riscv32    |       libsndfile-1.0.28        | NOK | http://autobuild.buildroot.net/results/2c40494ad0901b5d318e33aee40a991328954cbb |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a10af71cb20e6307d03ab95fd0697ea308613eb2 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3df6364032acad49a2b98b27c81deab960cbcf3b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4e9e4aabe49037137c6ebbc7ff7c33220db08f1b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1fe9769bacc5a7cf02614da29bf99cb49a947929 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2dfe3ba61b17b727557289462c358de9ba889b0f |     
  mips64el   |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/a9cbeceb259b9ea4347155a224797aaa84b470ef |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/0bf826375cfc836de362bddcf6b6ca92d674ecb6 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/ba600820563a38d97a9c8b5f795b72d0670f715d |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/1c3a5771ef9d2e3d1d7f3dc40582ad8c760e2dfa |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/47743c8419c6c0c3846f27064467f965f51d299a |     
    arc      |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/71519b5c0490c586f2f940ba5b552e5fe8a5cf5c |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/dcf662b5f3597dfa001e168aebf82bcf2e96a4b5 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ad5797a6af476265b5883d7557a2247734aa7fc1 |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/75037418ae736f8915ed45b1adb97e2cbcde85f7 |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e07fbc0c072f0cbae4338c5ed84723a1444b3f0c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/946bdbe231ad7e2138fcd9e8f50aad8f8d03b4ce |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3318e9f5131f4dcf0a031239e024de6191c481e4 |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/dd928494f88fb2510241dc0d497e99af83e382ca |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                iptables-1.8.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/0b5817a436621a52f86759a6db4e41981d7efa4e | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
                   libiio-0.18 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/d25cf957fa4031930c5c6b03c29530a9937b911c |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d2e01cedf2758e595e770c6a48aacbea5cdd8809 |     
powerpc64le  |          libiio-0.18           | NOK | http://autobuild.buildroot.net/results/9c18a16f8cd39e1f7c90bcdd55509f440f437fe3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5e998e2cf6a5d1a02f2eb9a8f5de7d9592b22151 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/aaaf940c6fe2998f9e130bccd229d337a4c12a89 |     



-- 
http://autobuild.buildroot.net
