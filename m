From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Mar 2017 08:28:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-16
Message-ID: <20170317072839.1461422004@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-16
================================

      successes : 146
       failures : 12 
       timeouts : 1  
          TOTAL : 159

Classification of failures by reason
====================================

           uboot-tools-2017.03 | 3 
                   irssi-1.0.2 | 2 
                classpath-0.99 | 1 
                    gdb-7.11.1 | 1 
                    git-2.12.0 | 1 
                libepoxy-1.4.1 | 1 
 make[1]: *** [all] Terminated | 1 
           oracle-mysql-5.1.73 | 1 
             rabbitmq-c-v0.8.0 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

         arm |                 classpath-0.99 | NOK | http://autobuild.buildroot.net/results/bb1f005948803fac9e753c2d3ba1e53bb78a0456
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/ec60d436bd34a4f37b664e4124d7f0c96e90a1be
         arm |                     git-2.12.0 | NOK | http://autobuild.buildroot.net/results/ce09c28b4c2b980100112f593b6dc7842e16874e
         arm |                    irssi-1.0.2 | NOK | http://autobuild.buildroot.net/results/1a349bcfc6a342b3e78941c856ceb04bc9860043
         arm |                    irssi-1.0.2 | NOK | http://autobuild.buildroot.net/results/b8c939b3218b2a1cf79f90b466be40a25aa12d80
         sh4 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/88c9cb5052da078143c2711a161afef2a570c8aa
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/67691a6a5fb8263d75ba866dee42984334951938
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5480064180a0b132e3225ee3328308c54a21473b
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/674e2b263c201e5eb0f0c889456fcc1f6e633296
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a79e451caf9e9827769e398dc7e9402e9223e06b
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/e2fe36c20e75d01a01a6659ef11e888965a843b9
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6f37ff347822a76571a9fe9cf3c491fe7e4164fa
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/b117ce0d3ab0b28913398c5d4c46e00d92aea9b0

-- 
http://autobuild.buildroot.net
