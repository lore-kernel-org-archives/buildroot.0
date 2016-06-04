From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Jun 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-03
Message-ID: <20160604063024.EC9DF1023B7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-03
===============================

        success : 177
       failures : 92 
       timeouts : 0  
          TOTAL : 269

Classification of failures by reason
====================================

                e2fsprogs-1.43 | 31
               target-finalize | 8 
                      make-4.2 | 6 
                   systemd-230 | 3 
                    libiio-0.6 | 3 
                    ficl-4.1.0 | 3 
          binutils-arc-2016.03 | 2 
                flannel-v0.5.5 | 2 
                blktrace-1.1.0 | 2 
                   erlang-18.3 | 2 
               linux-pam-1.2.1 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                pinentry-0.9.4 | 2 
           linux-zigbee-v0.3.1 | 1 
        ltp-testsuite-20160126 | 1 
                     tftpd-5.2 | 1 
                 lvm2-2.02.154 | 1 
                   taskd-1.1.0 | 1 
                  squid-3.5.19 | 1 
               libcap-ng-0.7.7 | 1 
                    owfs-3.1p1 | 1 
                 jack2-v1.9.10 | 1 
                socat-2.0.0-b9 | 1 
                 php-zmq-1.1.3 | 1 
                     nut-2.7.2 | 1 
iputils-31d947cf7156cf78d3f... | 1 
tvheadend-8e637f9f903f6d820... | 1 
               host-gdb-7.10.1 | 1 
                 rpcbind-0.2.3 | 1 
               linknx-0.0.1.32 | 1 
              procps-ng-3.3.11 | 1 
                     php-7.0.7 | 1 
                    ustr-1.0.4 | 1 
xdriver_xf86-video-openchro... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             netbsd-queue-1.70 | 1 
                  iodine-0.7.0 | 1 

Detail of failures
===================

         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/3e2c8fcdb90053da05d8b46dc1639a1ea163df53/
         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/6743a5abc5d0a4de14e58130c74574f9fedd0a8a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/402ac1f045e327e70d681183a9a5d27c703d317b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/da733e2a72537ff73f66d283ee9cb4c4f3f7459e/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/9a97cc30a0ae43dd7400e95a237b8422c8863238/
       nios2 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/0d419d41a5c1211f7916597ac35dbe6b55e2b9b6/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2a66280800b8aa16fee2701b3f345aa24bb13c35/
         sh4 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/64ec7b049d527085cf6fc3d2e0179508718ea663/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/a7f6cd6c5e32441d8ff046f59ccaba3bb56f53d4/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/29b5879b7364e8fabfd9d73c4f58763eb3d44dda/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/bb59ce67ef51edd676765e2504c54e3911e49af2/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2c37b009b403b395ab2cf341da82b64522025df8/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/693bcb51239995f14e9d43ec69b1b40aa5808a46/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/517e3df7795d4ed12c7ee0b5f5686029d92a653c/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b3384376994deca30e9fc1c8cf91806cc834c342/
      mipsel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/d15dfe4ed6f961ddf1a7d5ab5fb0a3e849425065/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f932f09a8d71a80153254442539263e6c7344a40/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e84624d97569da25c92637e606b4b9a660991108/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/9c5e7a786beb05ba0f2e6ef937ca6f1d65e6ad17/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2bb230fc674c14d9800ec6d5961f62e286844693/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2f26eadd3a3e1d29f4b09ba62a5c162a8e5d2d6c/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/8ecfb9e2bb2703a3a4821f873453817c7fd1868a/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/6d946c8906aa43dbc479816f4c779e7149da87cf/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f10a6be7a1c139e862802add48efe9479ebf62f5/
         sh4 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/7cb07ab11070ff0586c84e6dfa2dd5abda6cb4e2/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/34f4dc46d1cd0d8372bfdd9d872908c1aeb66598/
      xtensa |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/533544286149c6146988762e673222bb44985442/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e95f367d7114143330bffc35354d32fb3edf59ff/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/81dedaf3cb09a08a680ec7d07c79442a09a4c13b/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/cc83730715ad0aeebf200d856b8b7c6f9a144bc1/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/1ac3cc56686b3e8d691e227924b2ce4bbc2210ab/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f72ede2f7134976ad31b3dedd4ce740e76753743/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/062833459d57eb51a669a6bc55914d9d72346ac9/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e34691790f80c4e951463b3d22a7ad2297fd2acd/
         sh4 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/02589c82352588f646eb183ac0a94b09ec36bad9/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/49f0c4bc376ead9b5c48dd2bf6820f2086ae8b1e/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/f2bcdc7f97cb811d40f30c635b49d2a6da4e32aa/
microblazeel |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/6318cfcff4a76b0a9692e69670fc2c0f18579ca0/
        mips |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/98fc0d6c780363d41fa2de3ead18d0094aa5f7df/
     aarch64 |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/53635e95864790166f11ba8b6cd4e8c150c265fe/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/900674934b9dd2b6d6a4d9bf01a7b156f545dc11/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6aec04478b3f09598a0f32ab1fe4979d3c210514/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/7be3e50048e760cd1a8da2e34a87b86919b95498/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e28ab9fd4e82018d4dbaeb445b423badb9310bee/
         arm |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/ca36bd378a03b21a487747fb3ec5ab68825d9b21/
         arc | iputils-31d947cf7156cf78d3f... | NOK | http://autobuild.buildroot.net/results/11fb3e92d744a59ba1bea34884677fbcbcedc9a4/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8fde9a9478938765a5722a7b2d6a5d5b2b412520/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ed646a5e73accdae1146f5a4d8ae37fda88eb4d5/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/198f3e46b4403eeb6f5e1447d3d6114cdbb31549/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/9bfc6a7ffd0f9f9871a19d8caa7b4c054cd00398/
     sparc64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/3075124454b3dd2ed9aa2847b0cab965f63adae4/
    mips64el |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/50b712561fadae052df738357df55d2b8e6b8434/
       sparc |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/cba127fe83739f5d33b197ec344263140c48d569/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/ea5e490daa727b1cc8a6a3ae74d374131901a896/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d339f3c6e196164223056ca2f41705ade07600d1/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/03c9b230a3b2b53ef692596421103762827efc34/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/e7c1b23eae4e2edf4882b0ea5dde19ba4e23b22f/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/745638b910bbc88e41f78537a5d65b379a6e309e/
         arm |                  lvm2-2.02.154 | NOK | http://autobuild.buildroot.net/results/f47a77dfaa15a2eb2b242696649e0a662d0e0937/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/c2e67537d172ebc592a072abcb7a77846216c108/
        mips |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/ae1f40f9c3dacdc5276a8734d0f077de85f09fba/
      xtensa |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/6a9f8fd09cbb343e6051f4e87a87f7386dd41a48/
microblazeel |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/6203cd5d1ae2e7efee50703e210aeb1f1d0ccd19/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/bcdc7484518811fff9e4ee1623e09994fb12c1a1/
     aarch64 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/c5b21d5f6cd27ed492ca8df9041a8e63ad5b54d1/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/69e08368df93a2e90011552012a3eaeb176cde83/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/5df9beb5cdb74956573b9485e633e1f1e91adada/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/90b937f6aeff98d8171107d5469f25aef5a1c048/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/7ebee52e6b95e013b7c2f2776681f776d8efce87/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/91c5210ac95760d1f7ed58e0d0a2585a1fe79354/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/09e5b36f66e6691d90b0b454a8968f2beaea4ffc/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/533f35e9047e84fb72fc7bc1d73e4c6cca48e40c/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/556dc4887ae6f5d3fc4178c0ab7fc4ba56fee0a0/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/be7b254dc5b48e222ff7991b307da650b0c95ae5/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/fc2dea4ef27a818d0b3e8addd379dcb44d729f58/
      x86_64 |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/d4fe289d2faf8870c89a3acb1abf42003955c1be/
     powerpc |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/4a96453e14b1be389533b182890799edb0a5a755/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/18081c6500ff80f4fcb2db5928d18cea7c8b9564/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/6ae5d8a553da9333adc123998d76d273f222f418/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/169b43048dcec49bea621088abc8baf3396e7787/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/94030af2c875e2f5e21acc9c64cc7dcf1c7b4dc5/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/51f092d9b4273101664c4f8aa3d8061ad51b9fa2/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f4c61192350d9142eb9c095e8a7ee304bab573dc/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a14fb7fc002894d6c7cdb82a85152d44bc8240d1/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f26351da925d6ef3adea8053dc7fc24061554daf/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e60dec1381cf338548c8e52dae00dcecbc32ab0d/
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7e438aa123834ffaab3bf0d1df1f3236305b5ef0/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/fa7e4a1201ba5c674f218e7cb0defa15d14454a4/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/677fcee78b473194bf1dc529ccdf35dbd8b6b5c9/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/c08c71b3c3afc32d1247e734906c14e87c549352/
        i686 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/4ad2518dcee8974c69b387ce13a5e57b03e6b746/
         arm | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/15925f1d6c479d9ed815804ad59af19bfdb273cb/


-- 
http://autobuild.buildroot.net
