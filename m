From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Jun 2018 08:00:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-26
Message-ID: <20180627060047.4E2CE20733@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.05.x |  19 |   0 |   0 |  19 |
      master | 167 |  45 |   1 | 213 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

python-libconfig-b271c3d9da... | 10
                  boost-1.67.0 | 5 
             gnuradio-3.7.13.3 | 5 
            qt5base-legal-info | 4 
               mono-5.12.0.226 | 2 
package/qt5/qt5base/qt5base... | 2 
qt-webkit-kiosk-a7720e50f2b... | 2 
                      x265-2.8 | 2 
                    brltty-5.5 | 1 
                host-libsodium | 1 
                    host-rustc | 1 
                 json-c-0.13.1 | 1 
                libmpeg2-0.5.1 | 1 
                   libnss-3.38 | 1 
                  mender-1.4.0 | 1 
                 opencv3-3.3.0 | 1 
              python-pyqt5-5.7 | 1 
                      qt-4.8.7 | 1 
            qt5serialbus-5.6.3 | 1 
                  samba4-4.8.2 | 1 
              wireshark-2.2.15 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8733253bb3cd31a523db45cf22e3ca42bc0a5c23 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5f46b9a1b6ba0638c9aafbcd47c7de50eab9d3f0 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d2c40c90b1fe48895d82dde2f46739bc1ad96cb9 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4836319907debddfd19bd55b948a743ca2ec7bf0 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d80c62cd1a212549d8063b0d520cb591cfa361d7 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/df7a7b6600af89cd35e88253a13576d6efb70fe4 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a28283328d9f5bbc8b0a87282cb1d26df8fd0f3d |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ff9f1f10b9529c212db8aa665bd1538885a16b8a |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/14562c82ea5211d50c1d9c426406ef11d2617fe6 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a502fef3e2a40f38ca63332440b0b6bd2ed11d5a |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/598378ff0551f5f0e1ac2a0c1fee4f1f24e8a857 |     
        i686 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/708b43814c3e99fed2421147626998b4575153c6 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/06ab2320b86dd9cc0982910e597fcbdf1ddc20de |     
         arm |                  json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/d97bba17eabca1e22be6ad29fed0b99b4b95c158 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e4f2199c85a93d4d9046cb0811cd9336a9b02735 | ORPH
         arm |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/06f5ee4bc9e623fa08d77278acdcb447148ae997 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/0212e45fc9e15fa8f0ae3ab6cbba18e5cd37e3e6 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/0039079a88c9a6c3590027e5f3dc154d5df5d801 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/0f7c7e238ccf3327289d01f074ce9455605e0a42 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/3c588e47bd81f907759d8352363a93f333ef7ba8 |     
 powerpc64le | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/97d74e2cd297d742f51cdeffec316b290e2b5c87 |     
         arm | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/012f668fd012e7d7dfb1ae3ee3739e57dbc117d4 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/bb24aba3707755c65be0fa1cf60ef0ef2bee179e |     
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3d18a3fba68044b50a4ecb06328016459185f0e7 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2330e1caa085cee530ee6c7cc42cff7c310425bb |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/09a8322894bf769730ba8c5e88cb236e8ff80236 |     
microblazeel | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/9cb6b08d5565ff672c5d181eeadb94ba08dbf27e |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/def86f69f35c4c95b1479e19a165a09982ecfc61 |     
     sparc64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/a1feb4c4b70b3c939ae1127417130ea33a91159b |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/faf9666d859ee057a90a1c1959ca388742d8920f |     
microblazeel | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7dfc3e79bdfc997e12e08e0139ea53e7cb3733c8 |     
   powerpc64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3721f6abf094d1c3c739fbcd224b32183e424f1d |     
        mips |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/14861aa893b3d8c1ec42167adfafc8874bfe7bff |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ed043d9117c40100664162b4b3561834b53b9d15 | ORPH
         arm | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/e70780741c88eb3a4caa1fa9647aec73c776c041 |     
         arm | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/7c81e3b6c4347215a2c5c220548edd96cc5408d2 |     
         arm |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/d8d27003f634998d2af7993577aeff566b5f07cb |     
     sparc64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/d6784fb6c773cdbb584359da9d3e6ed24cae609d |     
      x86_64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/5c92adce0186b6c8bc46762ad646425ff95de2b5 |     
     sparc64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/7f3dee44d5f3e27093eeb1d3bc66d99ae856cb6f |     
      xtensa |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/62ed9ce6f206b149924dc70da444d9e94195988e |     
   powerpc64 |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/2bd49b4499e2207f781f0cfc473efd94c464e1aa |     
    mips64el |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/d743a18c59a7e2191b2ddccb48c658d0bf1b7544 | ORPH
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/4ff10d7b30224ae5a6704494f71a62a5cd4865ca |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/8d4359667d8f042ee88681ae40c4aeb05d310521 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/24f5bcaf3142a4507e8dfdb6f99d8736684ce621 |     


-- 
http://autobuild.buildroot.net
