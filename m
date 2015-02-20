From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-19
Message-ID: <20150220073016.77E101016AE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-19
===============================

        success : 297
       failures : 26 
       timeouts : 6  
          TOTAL : 329

Classification of failures by reason
====================================

       opentyrian-2.1.20130907 | 3 
                xapp_xfs-1.1.4 | 2 
                 webkit-1.11.5 | 2 
make: *** wait: No child pr... | 2 
                pinentry-0.9.0 | 1 
              strongswan-5.2.2 | 1 
                  zeromq-4.0.5 | 1 
                  boost-1.57.0 | 1 
                 cdrkit-1.1.11 | 1 
              host-mono-3.12.0 | 1 
                 gnupg2-2.0.26 | 1 
               alsa-lib-1.0.28 | 1 
                    strace-4.9 | 1 
                    webp-0.3.1 | 1 
            btrfs-progs-3.18.2 | 1 
                    bdwgc-7.2f | 1 
checking fcntl.h presence..... | 1 
python-json-schema-validato... | 1 
                 lvm2-2.02.113 | 1 
               ding-libs-0_4_0 | 1 
                  thrift-0.9.2 | 1 
                libsrtp-v1.5.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              libarchive-3.1.2 | 1 
           libmemcached-1.0.18 | 1 
                    fltk-1.3.2 | 1 
                espeak-1.48.04 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/e04e3d5bcf4411817077b04d90c3ebdd4627e386/
     powerpc |                     bdwgc-7.2f | NOK | http://autobuild.buildroot.net/results/6f394a64cafdc5acd6d29e2054463604a7a5efd1/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a15a339651a6614ec1ef23cf7ee794a1f36b4402/
     powerpc |             btrfs-progs-3.18.2 | NOK | http://autobuild.buildroot.net/results/99e74b0cb0eec9d53bc01ffa78b01dc241450bb9/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/bd2ed68bb597683d16d3cb8ec624b3b137cdfdcc/
      mipsel | checking fcntl.h presence..... | TIM | http://autobuild.buildroot.net/results/f36d5264076c8b664b8d68be9e85a56b6066f71c/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/f29e5dff31c61c195e76da74c5482b1b32184967/
      xtensa |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/5f3bb5de3b419a1ef636ee67e912c2b7d95f1fd7/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/cb107060a36192adf3c15ab62ebeb767204a23d9/
      xtensa |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/4ff76c7da4c50f10d2194a1c50c6c10adaf6f8b6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/28d32b824c316cf4cef767d67544247e3a07b774/
         arm |               host-mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/409c9077ebe14690bbab2144d63ff176f483fdd4/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/aacc9c6403761cba566994550f10c79fa02c543a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b3b6802e6202be2495826be4c9753faf03c13f98/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/5b771da27c71f3d148b8730cef72f9bcc3b47332/
       nios2 |                  lvm2-2.02.113 | NOK | http://autobuild.buildroot.net/results/d21b95041bf0b99f07a279fd05c46909f72560a1/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/d6d8ddd7ecf43537285ffa5f9b5bcb591d557414/
      mipsel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/248f33bf7320218604dae4ef7a2905ec78c13e6d/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/5c62ea2a741c05324b756aeeb843a19403c55612/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/f65e246e468c9de6c3d8c1f832a8d95e5d7458f8/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/a085fb55269971e3c7b8ae8c167e7330c3c042a5/
        sh4a |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/865b1f5516ccd87dde85349cfdc00b1be7a073cf/
         arm | python-json-schema-validato... | NOK | http://autobuild.buildroot.net/results/aab8d6d419a241a86c83406a22de992bb74c064f/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/de55c4f141cb30c2d933757a4a5db184a3f86443/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/af7988cc1ed294ec4ee449365bb95a989397d49e/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/a6793e52d0ce79f6389508e138643b98f1534228/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/ac7f81fe29a5a74bd53a2a1587618f672e8dbba3/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/f3ea3c1982af24bd2787fe741f1559e2e9b64f66/
         arm |                     webp-0.3.1 | TIM | http://autobuild.buildroot.net/results/e7fd58f07b21ee08ae35203c63fdc6547a379ad2/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/5347293cdcd7eb2e84b762ee9d073f3b937b5312/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/a0bd6312d450fb78db7f57d3db9e01ba2b26687d/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/05038be7117042d00ae654f1391dec4eb79ab103/


-- 
http://autobuild.buildroot.net
