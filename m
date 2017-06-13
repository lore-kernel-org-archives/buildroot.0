From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jun 2017 08:27:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-12
Message-ID: <20170613062747.6EFAA21DDF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-12
================================

      successes : 135
       failures : 38 
       timeouts : 0  
          TOTAL : 173

Classification of failures by reason
====================================

                     gdbm-1.13 | 10
                 mesa3d-17.1.2 | 7 
                beecrypt-4.2.1 | 3 
                 sngrep-v1.4.3 | 3 
                  cppcms-1.0.5 | 2 
                   glm-0.9.8.4 | 2 
linuxptp-97c351cafd7327fd28... | 2 
             mcelog-legal-info | 2 
           host-doxygen-1.8.13 | 1 
knock-258a27e5a47809f97c2b9... | 1 
               libupnpp-0.15.2 | 1 
            lttng-libust-2.9.0 | 1 
               qt5webkit-5.6.2 | 1 
                  quagga-1.1.1 | 1 
                  screen-4.5.1 | 1 


Detail of failures
===================

    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6531598e62d9aec9acaf2d9bb0c3ca13135ee8a5 | ORPH
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/460baf1f1f617aced0352423d8271a5b2da8a468 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/08371d59cf1aee69b790ef0d6af04d767be0509d | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7087bb7761eeffd0f818cdeef3af22ee5d5849bf | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/fa60b429bd4fa33870ca7d4f17efefb5d19d1501 | ORPH
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c56da3511d466169004d0ca4ae19b73a5356c2cf |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/8708e71b780565d6220f6c49d488c2cee97198fb |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/2bc347f707879e27e32204de88d2d71b3135c8b1 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/78b3993f905e1fdfd771dcb4fbc483c9c47d3bec |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/5dde7e02452f2a83c342ab703cdf324d49777ace |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/866c75ab3d8337c812540ded8926cc2b6a8631bf |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/0fc4efadd9b26731aaf161e9e180cceccc42630f |     
        or1k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/bca1082c3c2832d09ccb242efd38392de2f4157e |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/a51d72bce2628769d93fc904becf6dee4ca801af |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/b91a9405e15eae9388305df007613a1bdb13e006 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/630cb48fe3e474b38145497b93ff3e58943247bd | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/8900d0c45c859edd95bb3610b224b9f222ef7493 | ORPH
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/77f8cb47e3444fc6e3ac986bab874c4f48a0a412 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c037d4fe33067ddb031fe89bc7f7fd9d87f59e8b |     
        i686 |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/a0f03fddd261c2f90ea6af39c5cb70115652b6d2 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/0e68b944ed9bba1dce2fa320eebaa57651ac1930 |     
         arc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/fcfb62a855b0cd0c6b2a5eee95126c7bdd444895 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/59d703970f73ad496de003aca98749d7738eb627 |     
        i686 |              mcelog-legal-info | NOK | http://autobuild.buildroot.net/results/02b897a843b995bf5bf3f993f48689870a551dd5 |     
        i686 |              mcelog-legal-info | NOK | http://autobuild.buildroot.net/results/027a4846892bc73e3815a88d72dd6885d52e443e |     
         sh4 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/5c10665439dda614df0a65ab12a4a905fcc8c2ad |     
      mipsel |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/a0ef2efe2bfab77dfae5b6f84b74ce028e8a2401 |     
        i686 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/dbedfc8d9d743bb60fc9bf0c064c3affa8d2d4a0 |     
     aarch64 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/0b4bb812ba43a0cfd75549000e466be6cdab0ccb |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/2592826cb196dec9ce167c2cc8a9199c5ba2e30f |     
        i686 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/b00a4dc923aaa0360055325381e18e0b8db119c4 |     
         sh4 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/3e52f1ab38b4dc04a04da7866dd1c7be2a288004 |     
        i586 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c135db1babf7faccb12397a183c3143db8ec893d |     
         arm |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/162059d34cc475b996e459232fa2f6c7f544c0da | ORPH
         sh4 |                   screen-4.5.1 | NOK | http://autobuild.buildroot.net/results/135e0fe6e3eb156a138a615759b58f9dccf2d7d0 | ORPH
        i686 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/6b69787fc4229d2fce7300edd3821f1962d85046 |     
 powerpc64le |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/64be0753e1c9c4ba0db4d51153ff378db4bfd1b1 |     
        i586 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/a152a94422e45d1af0ca15a6b8dd0aeb851daffd |     

-- 
http://autobuild.buildroot.net
