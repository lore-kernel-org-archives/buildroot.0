From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Mar 2017 08:28:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-12
Message-ID: <20170313072842.DEDBB20816@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-12
================================

      successes : 141
       failures : 18 
       timeouts : 0  
          TOTAL : 159

Classification of failures by reason
====================================

                  boost-1.63.0 | 4 
     docker-engine-v17.03.0-ce | 2 
             firejail-0.9.44.8 | 2 
             lttng-tools-2.9.3 | 2 
               domoticz-3.5877 | 1 
             fxload-2008_10_13 | 1 
                    libiio-0.9 | 1 
make[1]: *** wait: No child... | 1 
                 opencv-2.4.13 | 1 
           oracle-mysql-5.1.73 | 1 
               polarssl-1.2.19 | 1 
             rabbitmq-c-v0.8.0 | 1 


Detail of failures
===================

         sh4 |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/8c79fa3e9d59a2557ff38dad4499ae713a08eebe
       sparc |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/7f0ec2d249f7219c60979b9abb1eb3266d475012
        or1k |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/5d918ddc0bad65b6990b773bfa15121a1b8e40c0
      xtensa |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/31f6e4593cd59cdb8673141b90439b9c104c71d8
      x86_64 |      docker-engine-v17.03.0-ce | NOK | http://autobuild.buildroot.net/results/c96671737ab8ebba55f5e7ee9c68f7a5edf12b0e
         arm |      docker-engine-v17.03.0-ce | NOK | http://autobuild.buildroot.net/results/fd734f9d1922bd805b35dca484b36b92b02b7bd3
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/dbd530ccfe6e84461e116a5968fb2c66e6fd97bf
 powerpc64le |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/0848f44d185db3aa6fb1c350e7fecf819c14b22c
        mips |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/0e52d9f211787f7b6e6ce7e3dc730f80396b5ba9
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/deb5a9be4186a002c12effe2e6d9114a7c12fcf8
         arm |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/78d218885986ac8172210596756f064a9c3ccf8d
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/7ed0c3d592e538417144178665b54a39d2e69ebf
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/0897578de30f2eee4882b0a4e793c154ac171bb9
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/a6e5ecd9016ba0a0da3885a1505b1843fc73a4c4
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/eee5c7fb7b3376b787c302c60c2510214d6e82ce
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/fc58c3232febb78c2a910f61be27f9e3e43302ae
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/71050241b34d9e90820fbcd6d06e94dcec991542
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c621bec6d2e5917a713d12b163240eb1b866103f

-- 
http://autobuild.buildroot.net
