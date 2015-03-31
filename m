From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-30
Message-ID: <20150331063021.8294E100E28@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-30
===============================

        success : 226
       failures : 88 
       timeouts : 2  
          TOTAL : 316

Classification of failures by reason
====================================

                  powertop-2.7 | 18
                aiccu-20070115 | 10
                  boost-1.57.0 | 4 
pulseview-19be0af16af83ca10... | 4 
                 jsoncpp-1.6.0 | 4 
      libva-intel-driver-1.5.1 | 3 
                     vlc-2.1.6 | 3 
                     mc-4.8.14 | 3 
                     gdb-7.8.2 | 3 
      host-gdb-arc-2014.12-gdb | 2 
                libevas-1.7.10 | 2 
                elfutils-0.161 | 2 
                libtirpc-0.2.4 | 2 
freerdp-b21ff842ef3de583751... | 2 
                host-ola-0.9.4 | 2 
         lua-periphery-1.0.4-1 | 2 
                host-gdb-7.8.2 | 2 
                      qt-4.8.6 | 1 
                   strace-4.10 | 1 
            host-heimdal-1.5.3 | 1 
              libarchive-3.1.2 | 1 
               libcap-ng-0.7.4 | 1 
                collectd-5.4.2 | 1 
               mongrel2-v1.9.1 | 1 
                   atftp-0.7.1 | 1 
               libecore-1.7.10 | 1 
                 empty-0.6.19b | 1 
           qt5multimedia-5.4.1 | 1 
                numactl-2.0.10 | 1 
             ctorrent-dnh3.3.2 | 1 
               wvstreams-4.6.1 | 1 
                 clapack-3.2.1 | 1 
                    fftw-3.3.4 | 1 
              host-perl-5.20.2 | 1 
                netatalk-3.1.7 | 1 
janus-gateway-c632c1e9da5ff... | 1 
                 lrzsz-0.12.20 | 1 
               host-ruby-2.2.1 | 1 
             armadillo-4.000.4 | 1 

Detail of failures
===================

        i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/1630aece7812259b39fce8cc804652634b998727/
         sh4 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d41b9321ff2d505efc95fc27f08be8ed2ef70099/
         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/65506638ae3a23eac6af3e15756e312dd9f8f354/
     powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/6fee367f01332ff43bdb62d72881950d957a09ff/
         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/718e8e0e6d202b2c97c89f7a2de0adea8fda7f11/
      xtensa |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9b5ae893a2d83fa1f8c8553de53ada1c0aca7740/
      xtensa |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/26a855f85b8174d3f429467a05f5cfb2f3485abd/
         arc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/4e81c86c3e55b346a972b7853577f8c1a9f2a9a8/
     powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/36177df683096e68519403c2393c769737c92a30/
        i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a28e7d2d16d6793b79e71deb49f73ff4faa20b56/
         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/bfc7b2783cd93a2b70c03680ecfb44de8afb7b4c/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/62711f0092bc04dd626ab3a19bec64498a7e6ecc/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/3cab1c696934fb03c7b77bab0f57529b979bf7c7/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/de16561633773f3d5083463359f33869d1fbaf8b/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/226741905febb232480d2605f14cb52b09753778/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/2ff382e4a68070491261d1107b68a651409a6aea/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/9a3303a509ea3283465d69bd4066a59cbaf64411/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/92014876eec84d315b116e822b700c8715b44cc4/
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/b7733086f011d6d4eee98c38bb34cdb4a616a84c/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/dd480c5cb010918b2c18716f2fe8016b477b34f7/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/4bbde05b7a1548b5ca1da7b5a12c21f03a5a575d/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/e6342eff6c9723e96b5f6d1c44b64bf7ec47f110/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/a728ca3c539a9a0ee914784784518f5e317dd9f2/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/49082ab2f80b75ed4ae763354fd980e61252412f/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/f5c8aa31cf784b773d23e9637dede38cbf4ef96b/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/5f4d4149023438d672c43d34c8d49a8e94891d27/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/09e926c2b195c9bf9b5eb23dea2a459e7f0587fe/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/df8b501d164c4933183f7dff718401a4ac39a4cc/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/bf59ac0e3e978397cdb94fb873ee39aecc199efc/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/71b198cc0e83b845e75eb8788529059858a2e5c8/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/aaa79a68b5648e4f621929ec78b94c1562f11fb6/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/c6201d517afe63b43aa9e92d3385e572d1cc892b/
         arm |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/6d70e2abb987cf2e8af9adb61ad033ebcf04b81b/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/16039d3eb0891f85a47080d2643c36538c724398/
      x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/59f149c41fb607a8d155bde7ac0f0e37fe79aab6/
        i686 |               host-perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/8b91b66861900935c222a9c7b8c55391d02ae2ca/
       nios2 |                host-ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/24fd9f9d5b6a014a8568a1f28dcd8f08d497b7d4/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/d080d45cd23249682dd5e72186414c6e85b0380f/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/2f7761c3af00a2cb714ec6a343d933d87348cf75/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/a6b957dcde90cc6ad53cd03c811046f8cfc195be/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/ca0be7b90bfbb5a95d1c8033439173395b3985b6/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/db9a125a9a44320d2f5714ed1186b39cae4e2514/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/3436a96ce7387bf5b3585d17a00f0ddc09f7c8d4/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/efb2c7a67662f5b1e5275071812e15f1dc17e69a/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/626579b4d461b7e5fddf2774ce8f0d53e58eff26/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/79dd2be909e6aee761d6c215a8fcb81b6b00d64c/
      x86_64 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/1fbc88680ab5f12dc3eb48c282bc612ce0b835ae/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a9e83139e34d43735f4b5b9bfe32698254b05a4b/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/01c43b6a2f20da25a77444db050e34610835c1e8/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/405dfffbcfdaa485d0000dad655b0c112688a58f/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/9517bb6d2c05c27cad0b24a4443021a34babedbd/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/91f36f32ef43be897fef9352f97cc07781c4035a/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/35c91e828bd20d03a075682350be503730758593/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/be880ed0a134a295189be51fea54236b7bad4176/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/60786722487a2a795aa19b854340cd5a4d962059/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/24791a6283a3ef6d2cfa2498f6f17d1d5a12512d/
    mips64el |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/3c4095e057d05ab4ab6c008ebf140cddf9368ab7/
         sh4 |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/468dfe077398ce2bead63e467640bdaaa5edb395/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/b786d012568fc750dea77f5c1436393d0a1ba46a/
        i486 |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/60b106fa44c5d6d09eda11ed9168fc886f247fbb/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/226211a66550678e424ca7288ab60b948c46fc17/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1e20bd61a6a419c59506f6f5558cd775acded6a6/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a71ce86765b1961ef4edcff2bd0caf4ea2657e23/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e4d36aea51637c2182e5a0c06811ee0a228ca1e5/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e7d21f77b91f079555fe8238f3818b49c127ea76/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5ca11a3ce8254813b4e3d25454501630652236b4/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1778c66724bc5448b227e5e7d2186626bdd038c4/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/3c47349cd315472c0c66e49ee20ee29116021fc6/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/83443dc86f1952e0d72976db91eeb08e270cca37/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8917d3057bb015bd4a0c608773c02d24b772f709/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6b18f04579248114433a12bf7742064ee273ad68/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e6d3c01bfa4e67477c472b77e0a44b08bb999c66/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/735ad0375aee8ea41618a4e1a7824ddbbf53e0b4/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1316fd2c9aed71f4b6c5e3825e5ad0715f2faf55/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5d6de5f01afe9786a4ab39d761d0ab8a11351836/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d0856ce1d19105915f9010dba0cade1454e13814/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/0b6232bd2c0a7adf476ff4988e01b53befd944b3/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/be92585f75275b7f32c772487274444732790d13/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4f984170fdf0a1c07247b619d315232f8050994c/
        mips | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/39bc633a8e09f7ee87546a785343259468e0a039/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/04779f429197edf57862abd93a7a843f384e3bc2/
      mipsel | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/bb6c9ce477e1ef52448e851487dbca8e5949514c/
        mips | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/fb55ce5cd346c9b1b1b106dd8d1f68dd740bc188/
      x86_64 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/0391b68396f8f5f3d988aac9a802227692fcdc79/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/da10459cd7a2b9353e88144eb0c5a7e55ae26152/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/7e579a188e298331b81ca8ca056dc137b66e5f65/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/3b19c51a7105a95db96ee2c6688623f35966b14d/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/96cbe45cc6d74a5cb56bfa3ef513dc7c69ac1e01/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e67370f9b72eddcd07096e619a1a5012c8a60774/
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/eb2ab9f00ac78f3a2797128ea48c137a0b396960/


-- 
http://autobuild.buildroot.net
