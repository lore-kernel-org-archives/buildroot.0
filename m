From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Oct 2018 08:00:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-28
Message-ID: <20181029070026.C5BF720766@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   2 |   0 |  32 |
   2018.08.x |  32 |   7 |   0 |  39 |
      master | 237 |  38 |   0 | 275 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

        i686 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/473c8b268fafd1010ee51ea8c84852e09cd347b9 | ORPH
     aarch64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/b099c33e4761874608c8c3c38ae8e1742b67d3e3 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 2 
                    efl-1.20.7 | 1 
                  giflib-5.1.4 | 1 
                     gpsd-3.17 | 1 
                p11-kit-0.23.2 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c03b6b642e8bb6e399d630b6f46bb8a06ba32b87 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4e2d5ab830629bf78883b37509a9b3a4d8a152ab |     
     powerpc |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/a2d5f38f94255afd07def65148cc9cefd752e58c |     
 powerpc64le |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/ea110455c844513c7dcad67933c322b6f21edab2 |     
    mips64el |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/fe60de997fbba369cb718d692ba4259be5d515d8 | ORPH
         arm |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/87110542e3d5fb35759beb6ce81d1330fd34c382 | ORPH
   powerpc64 |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/493728ec2276eaeee37d4978b23c495ea35ee51a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
                libkcapi-1.1.3 | 5 
               postgresql-11.0 | 5 
     docker-engine-v17.05.0-ce | 3 
                   luvi-v2.7.6 | 3 
                   dante-1.4.1 | 2 
mmc-utils-37c86e60c0442fef5... | 2 
               nfs-utils-1.3.3 | 2 
               openswan-2.6.50 | 2 
                qt5base-5.11.2 | 2 
               boa-0.94.14rc21 | 1 
      docker-containerd-v1.1.3 | 1 
                  mender-1.4.0 | 1 
mjpg-streamer-75c6c4a7809c7... | 1 
               qt5webkit-5.9.1 | 1 
              traceroute-2.1.0 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/d534da198910809c5388a68164a7734937853d2c | ORPH
        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/dc06afc1ac8768d1cb3664533ce4506ce0c2edb9 |     
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/52fd2a5452a0a855ae891e0a6a1b908c7dc9ae55 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/9f8ac26c691b699ac9953c5a6f5ec42f1b50e55e |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/16b07236e62a1f334e3a6a7708faf909e3c7f677 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/816b4162daf30842bfe261e4fa42493fdd3fbb3a |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/5c921fc04bc7bbdfee08451e270cf8a6ddb569d5 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a3db01dd7d2f7106dd1a5436997e14360951d9f7 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9229aa0759f3e1077152a3b631944e60c1f688ef |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/af788cec757821ed3b29c6b2c43348194403c16a |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8707b25ab246b4bed609583cf0324d0fc05b3797 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a02fe52f2f5e6cfcb10bbe19809221231037c1ff |     
         arm |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/8007d9576f99d48eedd8012764cbf3fd6180a4ee |     
  aarch64_be |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/baa904d9adafd4ff12aea5add17ba2635402b5d8 |     
     sparc64 |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/28df3b50d90bc53b965280b77224f89fe09ec2b9 |     
     aarch64 |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/37bfbb9af52b7eb470ec80b1f01f93041538b844 |     
         arc |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/8383676296cb25089b70fd90925bd23600e7351b |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/524c481655e43ec2e9e93a7498d9343a30197713 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/28ed8fdbaaaa54762d769b2fe7fa9cdf55b1a37b |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f0391fa608fa6dd4305bac9a83cb12c1f8efa2f6 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/58b6ce103c54760a3eb33e95daa9602c8c976db6 |     
     aarch64 | mjpg-streamer-75c6c4a7809c7... | NOK | http://autobuild.buildroot.net/results/76a7f8e0583afb1d05edcb4d8d67a85982620447 |     
     aarch64 | mmc-utils-37c86e60c0442fef5... | NOK | http://autobuild.buildroot.net/results/233ef5c00951b5be10a59408f4a8781ecc658d74 |     
     aarch64 | mmc-utils-37c86e60c0442fef5... | NOK | http://autobuild.buildroot.net/results/eba3cf4ac21095bca5af2d5d1d69aca0c9098f9b |     
     aarch64 |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/6fdeb991b4df92f59c93b37a840220138cf41f3c | ORPH
     aarch64 |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/feb2b42028f7035f791db9cb76d07ead55d7733a | ORPH
        or1k |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/5e98e9cf0faa64b054960a0cf559be424476bae3 | ORPH
         arm |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/9c7dad6b4cb362e2ea316fdaeb88f10f51865c53 | ORPH
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/f80aa5b755d7bc460f827b890318ba9362402164 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/54b1f896e8db2c969e3dcbc0e3fb2f4f0f684134 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/c20450955d4d05341b0325e306006ddcca74c29e |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/355aebb2ec3ca40858b040530c51449154802d1d |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/a294e138fb5192fe9b6594511282f7ae8a6d459e |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/f51b45dbef4e5252db30049a08765557dc3c21ef |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/eba5035e89e18837a2691896544b0c0ef4bf1c30 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/6aab1f611f80458c0afef7a3fad3d208a5546288 |     
         arm |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/8d3976a03766b650df1687825422e6217d557e1c |     
      xtensa |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/a86f2e870746ade203aecbab38281b7a859441c7 | ORPH


-- 
http://autobuild.buildroot.net
