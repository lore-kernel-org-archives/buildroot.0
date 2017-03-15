From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Mar 2017 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-14
Message-ID: <20170315073016.EF14C2081B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-14
================================

      successes : 116
       failures : 14 
       timeouts : 0  
          TOTAL : 130

Classification of failures by reason
====================================

               libscrypt-v1.21 | 3 
             bluez_utils-4.101 | 1 
                  cppcms-1.0.5 | 1 
     docker-engine-v17.03.0-ce | 1 
                    efl-1.18.4 | 1 
                    gdb-7.11.1 | 1 
                    git-2.12.0 | 1 
             lttng-tools-2.9.3 | 1 
             qt5location-5.6.2 | 1 
                   slang-2.3.0 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ee5dcf7233bbecb595da8abf50e958d7f4a23525
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5cd83de7e7c20005e62fcca02ab18636c3a9319e
      x86_64 |      docker-engine-v17.03.0-ce | NOK | http://autobuild.buildroot.net/results/ee5950c49b4dd7958348467a0b1f68fb9bab005a
         arm |                     efl-1.18.4 | NOK | http://autobuild.buildroot.net/results/7b1ee8c6d95f43c7288bf7201b8a729dd6967772
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/e5172d96ad7bbfb9e0ecac68559ce2ff8272a433
         arm |                     git-2.12.0 | NOK | http://autobuild.buildroot.net/results/c55505f32b1362517914790b5e86637dc00aed14
      x86_64 |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/3d6d9b3c4743dd7726f3590f2893a27f7c58aa75
      mipsel |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/27a2bf472491168eb2ba15b5bba2d7b56852214f
    mips64el |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/b6258371de6916e558b80bb4a120d64ff71db8c6
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/6ec74906d7752916839bf295e5235751efb267ea
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/167d02891d01ae957337749bc91e7a280eb645d3
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/b0a31a3491a30ee0d6e6e7dbba68a86f0e00943d
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/a8e643041bea95f2ba7176d4edd494a67e2cd8e1
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/6e3a5a7c9dd612927793e0c7c5525f64c8546b6f

-- 
http://autobuild.buildroot.net
