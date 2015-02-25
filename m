From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-24
Message-ID: <20150225073016.B25CD101539@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-24
===============================

        success : 308
       failures : 31 
       timeouts : 1  
          TOTAL : 340

Classification of failures by reason
====================================

                libsrtp-v1.5.0 | 5 
              xmlstarlet-1.5.0 | 2 
                      qt-4.8.6 | 2 
               qt5webkit-5.4.0 | 2 
               libecore-1.7.10 | 2 
       directfb-examples-1.6.0 | 2 
                  thrift-0.9.2 | 2 
libwebsock-3c1615eeadb0b582... | 2 
               alsa-lib-1.0.28 | 1 
               host-qemu-2.1.2 | 1 
freerdp-440916eae2e07463912... | 1 
                libevas-1.7.10 | 1 
           libmemcached-1.0.18 | 1 
               ding-libs-0_4_0 | 1 
                      make-4.1 | 1 
                    strace-4.9 | 1 
                     lxc-1.0.6 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
jack2-ab409a65df95bc261ff72... | 1 
checking size of ptrdiff_t.... | 1 
                  boost-1.57.0 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/fe6e1ff8b0157eb6236ea80da14628e3cf683dec/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6c9bb67fb2e6c0f809c3c2212d7b1362bbe30131/
     powerpc | checking size of ptrdiff_t.... | TIM | http://autobuild.buildroot.net/results/c388cfe677bdc13883c897851838467308b8bf07/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/9f78043f549e09d020d69f45cd26c3e43a91d9dc/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/bd0f4b3e41bf6330f83e3d9b58d985cc63506a3b/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/584ace383204d97fcaad37742e2e035ca78a3d10/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/de85bb105d2be3ceaec05b18ae177cae8382caab/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/13bcb0bac32be7903e6c32a7a62f1b7dcb84faa1/
      x86_64 | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/5e6ee20c9703517323fad7df40dd580a65753927/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/a5941c5cffc2041e3dfee16c43b5f83cfd09684a/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/7230a17c74d8cac0fb761006db9d054410900625/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/916c1291b5e5620b59ebc2946ac2555f88a40858/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/97a99c89ea139670ae19388cde05bc1c7fbc6060/
      mipsel |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/d1d5cdbc71d8ecc4b9be0a97fe473cd7619f091d/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/434c32418f0de57ed3ba69abcc50c7a851a4e596/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/8de089b80be3c7122ac5cf4cfdcaea26bcd7b20e/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/f4aa152bdf9b5db923b1389a54c672c94bcbda4a/
     powerpc |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/a71d85a5bb9af2ee82a8e61054025bceb03dbdeb/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/c80eedb4d7335f1aef736a1312900c2b371eabc9/
     powerpc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/91b4ab54ed9d422bfaef765d09cc92192012ce7e/
      x86_64 |                      lxc-1.0.6 | NOK | http://autobuild.buildroot.net/results/cf24685683480cd10133de718b401918a665940c/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/44682727e89442b20fdb713f1c83de12a3fc3b37/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e8f86eb86f44ccc11bb4bf14f7a6494991763374/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b6d26a20a91bcb2bce81a5f405c6fa3227a3f4be/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/6066d40cb73e6f3d9ed0f7fbb655a757761ae02c/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/2ff6f59bcda5db6f9126f60982ddc238b8901cb3/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/5115f7e4dd37f8846a5da21efbf6a6760121fbd4/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/a7c4a99b53b6dc3dd25a0dfa35a091d0eaa15aea/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/847bdf027710f9e0817521d1ac8dca2199d49f2d/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/652810cc508392ce47603a5fff40edee2a4d2e47/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/aaf9c961a7d4708667462c6bdbf1296f6eeef00c/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/5f09e59c65bfbe4534182616d6333f8356b6e7e6/


-- 
http://autobuild.buildroot.net
