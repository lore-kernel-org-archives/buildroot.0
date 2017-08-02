From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Aug 2017 08:31:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-01
Message-ID: <20170802063121.CF2C821E9E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-01
================================

      successes : 140
       failures : 30 
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

            python-hpack-3.0.0 | 13
          let-me-create-v1.5.2 | 2 
     python-cryptography-1.7.2 | 2 
                    cups-2.2.3 | 1 
                  ffmpeg-3.3.3 | 1 
                 libcodec2-0.7 | 1 
         libspatialindex-1.8.5 | 1 
             lttng-tools-2.9.5 | 1 
                 mesa3d-17.1.5 | 1 
       python-smbus-cffi-0.5.1 | 1 
                 qt5base-5.6.2 | 1 
                 qt5base-5.9.1 | 1 
           qt5multimedia-5.9.1 | 1 
snappy-be6dc3db83c4701e3e79... | 1 
              swupdate-2017.07 | 1 
                 uclibc-1.0.26 | 1 


Detail of failures
===================

         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/f9bf1ee0e10a1a4c2fe4b8f778e2c1ed72d741a1 | ORPH
       sparc |                   ffmpeg-3.3.3 | NOK | http://autobuild.buildroot.net/results/a6b99c76b3dfeb92255aeab35069b934fe972072 |     
      x86_64 |           let-me-create-v1.5.2 | NOK | http://autobuild.buildroot.net/results/57cd55ab0fa4c31f28c751d5f3968953eee9bf48 |     
        i586 |           let-me-create-v1.5.2 | NOK | http://autobuild.buildroot.net/results/19b7b0a10adddbbce9093a9f9667e246aaed14e0 |     
       sparc |                  libcodec2-0.7 | NOK | http://autobuild.buildroot.net/results/da2b6402c8fabd85a9ee728e8dbf7b78c5aa801e |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/01beed528551e21479440d208fc2ee9fb0a03644 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/c018f3164a42213a2c3545772bff0c1b1e96d447 |     
      x86_64 |                  mesa3d-17.1.5 | NOK | http://autobuild.buildroot.net/results/bbc6210c49ec5018e85ab3b3b40301a36b494099 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2384bebd7f84467435bad7209005ebec3951edb6 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/422b93febc8c69e4db4691efb03b918516783175 |     
      xtensa |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/d14cf9e21294040f71bc59da6e3514f10476e49a |     
      x86_64 |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/fc888c99fb6d5ed6afa4bb896a1638093ff93999 |     
     powerpc |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/c046ec699157ac657f944b711bf029a9b5e46ba4 |     
      x86_64 |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/cc2c244edfea8ab80bcf966bf52a2cc819ef1380 |     
       nios2 |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/f32fad187bb623e6788dedd9e9194c5652fd619c |     
   powerpc64 |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/ff3dbde387369b64ca68d1f780b9738d1922960f |     
         arm |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/4471ea79c0fcccf9dd11c61410cc78399ac2de24 |     
microblazeel |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/a3961c7fdb65701bba9102a16719c9aa1dfb26d8 |     
      xtensa |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/886598343837edc8db28fa96500a55a138454663 |     
        or1k |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/d69bb66482efddbc8a66d12530cb94556ec17362 |     
    mips64el |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/d2c99bff4b988a6750e249a03bf4277eaedf8b51 |     
      x86_64 |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/3587d05199ff7d3f1e5ca975d56b1e0de2467c7f |     
        or1k |             python-hpack-3.0.0 | NOK | http://autobuild.buildroot.net/results/4189b2ddcd3d59c629af78e4d455a29c77f8c683 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/dc09c8bf58cf20fc6d2afa681c4f80e825d3911e |     
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/d4bfc71d74cc9e27cb079238d961f84c3c928fb0 |     
        i686 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/0cdeddd91692d3ba0be53dc2928b0211bae7ad3d |     
      x86_64 |            qt5multimedia-5.9.1 | NOK | http://autobuild.buildroot.net/results/1365c35103cea109d09c2f2fa590dd32fac6b77f |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/0d2d04b315282d5ab425639267b00187628c9451 |     
     powerpc |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/859eac67be48361fdb9de7a09b98d9d2a53e8c28 |     
      xtensa |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/d5ba81eea9223569ba5b363551c4a2f7044ff8ec |     

-- 
http://autobuild.buildroot.net
