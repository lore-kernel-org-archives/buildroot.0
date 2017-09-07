From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Sep 2017 08:30:57 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-06
Message-ID: <20170907063057.88BAE209CE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-06
================================

      successes : 152
       failures : 44 
       timeouts : 2  
          TOTAL : 198

Classification of failures by reason
====================================

               pngquant-2.10.1 | 19
                openjpeg-2.2.0 | 13
                  boost-1.64.0 | 1 
                    efl-1.20.2 | 1 
       gst1-plugins-bad-1.12.2 | 1 
                host-file-5.32 | 1 
           host-openocd-0.10.0 | 1 
                libressl-2.5.5 | 1 
            lttng-libust-2.9.0 | 1 
make[2]: *** [tools/proftoo... | 1 
                 mesa3d-17.2.0 | 1 
         mesa3d-headers-17.1.8 | 1 
                    qemu-2.8.0 | 1 
                  weston-3.0.0 | 1 
                      x265-2.5 | 1 
        xlib_libXrender-0.9.10 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/95128b61060f313a0592b21b163b9fea2ed5ab84 |     
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/67962defb2a7b1fb21d6f93db485c1ccfb65de63 |     
        i686 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/90f1f7838f08e3a557be27470406d4d84dbcc828 |     
         arm |                 host-file-5.32 | NOK | http://autobuild.buildroot.net/results/32744bef0edc90bcff744c1678b1ccf2629971b4 | ORPH
microblazeel |            host-openocd-0.10.0 | TIM | http://autobuild.buildroot.net/results/933e2f5ecbd62df95508021fe74b09193abbbbf9 |     
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/c53d44112e007d838a7739939c50799f973e8d36 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/c4e25199a51fdc21e072b5cf01d5bf976550bfb1 |     
microblazeel | make[2]: *** [tools/proftoo... | TIM | http://autobuild.buildroot.net/results/7bb40c132a7093d6417bb0004319313c38503cd0 |     
         sh4 |                  mesa3d-17.2.0 | NOK | http://autobuild.buildroot.net/results/8cabb00214502dc2c35ee57ad063d106b4678a6d |     
         arm |          mesa3d-headers-17.1.8 | NOK | http://autobuild.buildroot.net/results/ef23996ba10a2143087c3ff0b7549f4acbbe6777 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9928613b3c57cf056f0e7ee1f48b7f700d24ca56 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bc1499d44c60ca6aed20084007b5ba57913272b0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6cd9397baf62491c9ad74b1cee18da6195d4b8ce |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c47e3897df11ad97bc0bbd7d9325623c6cbadec7 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/580ccaf040a62022ebdd4b4f953d4bfc58672f25 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f135b66c1c39bea729fcfea58479d93839892184 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/52bb7520ef8f2064554d22fadafc89dc3e18f9e5 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/61680e1eb8d09b20e925870fc61563239d7399e5 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/7dd8797bd9f434fd8f6de90460fc44759f218fdd |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/026c131d5b5d6e1bb4ab9f3f654cfd2974ee9320 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8f5bb6b4dfe840665c27804e3d781a153482246d |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/414dc37489acd6e2af7405444ba14c92b1200f0d |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/7af84c5a65dd41ce014b620cfeb202f025a403b2 |     
      xtensa |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/69bf7113b2e1d7547560a5b696cbd526e1607f68 |     
      xtensa |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/ab1193db9d76adc02be44d6f273e0986952df3e2 |     
         arm |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/63e5148cd0e5710445b759ac7846775730509ab7 |     
        m68k |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/1537ab344e1e32ba5fd67da7ebc294d614d75473 |     
         arm |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/8f2c5e6484e331ed65f9e7c0c0ad9d72615366fd |     
        i586 |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/3d3f90574b494bd6c34bfdc8bdd3b29f1209e3ef |     
         arm |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/7dde100f2e8bc7849af5976d716c7e9c0752519c |     
    mips64el |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/d99efde154092460d83ba8cbb454f07ceee49e27 |     
         arm |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/4e0b5c63b43a24662d3e96126792453c3013870f |     
      mipsel |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/f8b74583be071ee32a81fd7efbd5fc13a3aeb7fe |     
        or1k |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/46b1f33aacc042058be8701357b324477c533398 |     
     powerpc |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/b6241f2af2ad0b176eb58523b59eb9078210ecd5 |     
        mips |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/bb50deb542a214922149f8d9b1f053a04d802773 |     
    mips64el |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/cb3972b746fef9a09d61b5740027436f38bb5727 |     
      xtensa |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/d38ea5f144b00b99076c9fee2ee5c430ae61a3c9 |     
         arm |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/429cd97fd043153c78bcdd4d77dafa6b6d8732d5 |     
    mips64el |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/960f787ce451e151ccf0c7abdc1eedc4c54b5798 |     
        or1k |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/026a8af62a13dead2599f79989d75273bc7c9da1 |     
    mips64el |                pngquant-2.10.1 | NOK | http://autobuild.buildroot.net/results/00fdb2000e8b580bbf4cc2f0557e7127b92f9f19 |     
      x86_64 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/54f29310ae1be56fa2fdefc3115c40fa5ee275e3 |     
     powerpc |                   weston-3.0.0 | NOK | http://autobuild.buildroot.net/results/26865e023d3db23fe537e461846542f0fa5c4b7e |     
         arm |                       x265-2.5 | NOK | http://autobuild.buildroot.net/results/c286a27a8914a807505b3363bf749a44c0d3f8ab |     
    mips64el |         xlib_libXrender-0.9.10 | NOK | http://autobuild.buildroot.net/results/7747affcb59acd1c530e5e4f9fc3f5924efd93c4 |     

-- 
http://autobuild.buildroot.net
