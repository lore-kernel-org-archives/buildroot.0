From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Mar 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-02
Message-ID: <20150303073016.EB4611018D6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-02
===============================

        success : 301
       failures : 15 
       timeouts : 2  
          TOTAL : 318

Classification of failures by reason
====================================

                  zeromq-4.0.5 | 3 
libwebsockets-v1.3-chrome37... | 2 
               libecore-1.7.10 | 2 
                lmbench-3.0-a9 | 1 
                  python-2.7.9 | 1 
                 lcdproc-0.5.7 | 1 
                    mpd-0.19.8 | 1 
                 qt5base-5.4.0 | 1 
   libnetfilter_cthelper-1.0.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               openswan-2.6.42 | 1 
                    bdwgc-7.2f | 1 
               host-qemu-2.1.2 | 1 

Detail of failures
===================

     powerpc |                     bdwgc-7.2f | NOK | http://autobuild.buildroot.net/results/6d3f73f7b5e4e7bd1293aae9b626f38ac456b6c4/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/42c83c91e944307e9d6f35ed00e318a7a27233d6/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/02e54b55c120b03a3a9a60945a377f1717e21765/
microblazeel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/0b91da85a236b376982f49f785e197a23b0b1ea4/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/de00c1aff06460ed5b611db6fe2b827b3f9ddef0/
    mips64el |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/c4ff5a57cc179f50fc93770bc725d160b1d32eee/
     powerpc | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/48a6c0e37257d54d8d6315d902c9261bcbcfa969/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/9bc3f27031c2087790e5d37a4aaa30f20945d344/
     powerpc |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/c7bb69f39093752e3066ad0b3da2d4cce78b0f8b/
         arm |                     mpd-0.19.8 | TIM | http://autobuild.buildroot.net/results/95f022a056830cff43d1587d310c48c8bb3eeb99/
      mipsel |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/68b2211cc7acfbdfed8d4b161cbdaf1429315017/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/fa7a54d0963a4f971733a493e09e21f1e43f71b1/
         arm |                  qt5base-5.4.0 | TIM | http://autobuild.buildroot.net/results/a58e9c7a360cfb836622af54087b27bcdaf533ee/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/978d88902925a0bd232cf1455b8c767c767cbf91/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a8f0ed02d6b0f77b0f3d28a9584cab5f23a79015/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/faa828aa355ef83726063ba759d0eee79b43269e/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c052a1301db552f42be02fbdbdc53299e4fed2de/


-- 
http://autobuild.buildroot.net
