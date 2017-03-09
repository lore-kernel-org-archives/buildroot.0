From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Mar 2017 08:28:55 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-08
Message-ID: <20170309072855.E7EC420809@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-08
================================

      successes : 141
       failures : 15 
       timeouts : 0  
          TOTAL : 156

Classification of failures by reason
====================================

             rabbitmq-c-v0.8.0 | 3 
             firejail-0.9.44.8 | 2 
                libepoxy-1.4.1 | 2 
             bluez5_utils-5.44 | 1 
              keepalived-1.3.2 | 1 
kmscube-87e3ff5683ee54228b3... | 1 
          motion-release-4.0.1 | 1 
            netsniff-ng-v0.6.2 | 1 
                      qt-4.8.7 | 1 
                   slang-2.3.0 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/0924cf2a0c093209c8dd1c73ad7ce277bf4a50bb
        i586 |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/5cf8daad9e8152e90a27b7263b9fb74b324c2085
   powerpc64 |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/7526708d4dcca529d12815362e100040eceaaa7a
        i586 |               keepalived-1.3.2 | NOK | http://autobuild.buildroot.net/results/b61c2cfa949c2a20f0702522857d78651207e6d2
     sparc64 | kmscube-87e3ff5683ee54228b3... | NOK | http://autobuild.buildroot.net/results/d7e82c67e0b04b0aea990bfb19dd6e4fd914bebe
 powerpc64le |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/1180b249339fe9cb66b6ba15626df1134a855d96
       nios2 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/50786f7ea413c06af8ea23f8b8ec9df4a2885f55
         arc |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/acc21af2f921023c1d1bdca6eb21a1cb00e270f0
         arm |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/64b3f8af2ebc5a14ecbef72039ef527b5d71f12c
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/64b730320ae54df9308d300f261ab381b4bfbc03
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0cd269ddc09c74111b5c228efb2d4573f6fc0c67
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/90942a71156e083cc765b0d644e9ec37907d181c
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2c9af8869e608f2ed1897f4921bd6fd6a9db2b2a
      xtensa |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a77241141cf8710fa945523ef62327798e3c4824
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/fbec413f8ef4b3ef4aaf75cb804f41bb5b5bae85

-- 
http://autobuild.buildroot.net
