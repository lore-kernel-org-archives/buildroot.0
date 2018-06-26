From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-25
Message-ID: <20180626060014.1629220719@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.05.x |  24 |   0 |   0 |  24 |
      master | 149 |  43 |   0 | 192 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 


Detail of failures
------------------

      mipsel |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c6563d04bed8f9ac59cec8dfbae0c2a3f326190b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

python-libconfig-b271c3d9da... | 11
                  boost-1.67.0 | 4 
            qt5base-legal-info | 4 
             gnuradio-3.7.13.3 | 3 
                    host-rustc | 3 
               mono-5.12.0.226 | 3 
                      x265-2.8 | 3 
              python-pyqt5-5.7 | 2 
              qt5charts-5.11.0 | 2 
               keyutils-1.5.10 | 1 
                   libnss-3.38 | 1 
package/qt5/qt5base/qt5base... | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
                      qt-4.8.7 | 1 
                qt5base-5.11.0 | 1 
                 qt5base-5.6.3 | 1 
                  samba4-4.8.2 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d76264df7858d71b3d0454354207714de857d0a6 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6a4c5f8d45b51d32114093fa68195c2df2db5449 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7db2baeb70b30f7785cbb823e9eaeb8e99ef0d24 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/56509d315defb95d4ac6e278a9d40cd98f61baa7 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c493028fc795e3e3acac17ef4b4d366153b910ef |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cd92fe8f2e878946ca8936d3d77e340a94140cb5 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a78367e773bb2874dd48b81ed4d9700f9e1248fa |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/421f4236ada9065df6b78e99a59e52f733c54eec |     
        or1k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/288adaeb936f1c498c44ca5c4bc49cbb099c7555 |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/1945889d7607c1aa5f83f250db645899820a816c |     
    mips64el |                keyutils-1.5.10 | NOK | http://autobuild.buildroot.net/results/b8446f3fffd9ef1e2240fb6b9b976c459e45f721 |     
         arm |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/7cd7586f5854f9447c37adeedb9c113ba37ebea4 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/32d8402813ce7ef5bca4cb492db8101cf1cab7e2 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/543b840a60fb7a9e9dc83ea60a505d626453bbd5 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/c0666c5b95c15e2b9260f1e7c0a3bf248b45978a |     
      mipsel | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/936d3985bb62b950f83506e9c07be1635a32ec1b |     
      xtensa | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/b65e9469d5ba38c9b9b9a9e9e97058dff279673f |     
         arc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e798d55ea61395ffaa0cbac2367cc6fbe58d9a3a |     
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/f5e83a82116535b0244f5d220c3cd82a6d61e065 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/694e1b6dd49c18130932174aa6d9b6cad0878deb |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/5c880a24ae62beee176ce51081feff55705f6c6c |     
      mipsel | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/37f0298632168365c0ee5077012f85561fad6cab |     
       nios2 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/56961e2bb591b51cb506bee3404c79a37fa80e92 |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/22c643b347aa41fdcc55925ecddeef098703278f |     
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e39d6ddefc1db820146ff38aa7a7a38b33cd1643 |     
     aarch64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/c8d57fe4da0aa77a7daccfa251ad52e23f46b606 |     
        mips | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/22cf1516c972981f7b1cb218fd697297d7a3c6e4 |     
     aarch64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6d1121bf0ee8ceb6dec4408ce8c60d6475e247bc |     
     aarch64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/b8be114db40822b4727642aae364f906131b0c3e |     
     powerpc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/7c1c895b5a3e26b819893fc9f2daf835aa3d5196 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fdf881d09ee2a9d430f6ce90d4a9fdc95885c1c7 | ORPH
microblazeel |                 qt5base-5.11.0 | NOK | http://autobuild.buildroot.net/results/063221d8a76d422ae62eb9ce7d0b9cd2ffcb409c |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6e87b66fa8a4324e2d417b1c44d31d6c52ec45ef |     
    mips64el |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/4e93aaf5aa9a39317ae9ca9151cf612d46a021a7 |     
      x86_64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/7bc864734c2df46a8ebc14d2f4d7d83c0c5f735a |     
     aarch64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/e8a7dac1246ba6a79bf1ccb0811df6a66e8325a7 |     
         arm |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/6f9080d1e393f37ccb8d6ee0be9df0be348134e1 |     
      x86_64 |               qt5charts-5.11.0 | NOK | http://autobuild.buildroot.net/results/f0334e274c4863c2d7e800a15679adf3f774df42 |     
        i686 |               qt5charts-5.11.0 | NOK | http://autobuild.buildroot.net/results/829e11ec8272ed2dfe99a9761830c3298ce998e2 |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/1ef1ef31626fea51a461f1239f05ba824ed3f783 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/08cf37bb74b8d6694338dfd97e204b7a75aa1791 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6e0584bfdcf220b87ba2502fdaeb72c3cfdea186 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/2f234cfbeca0d0ba7c251557576c33fc3ae9d6f8 |     


-- 
http://autobuild.buildroot.net
