From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Oct 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-02
Message-ID: <20141003063012.3FF26101250@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-02
===============================

        success : 168
       failures : 34 
       timeouts : 0  
          TOTAL : 202

Classification of failures by reason
====================================

                   dejavu-2.34 | 6 
               valgrind-3.10.0 | 3 
                  fan-ctrl-1.3 | 3 
freerdp-440916eae2e07463912... | 1 
                 python3-3.4.1 | 1 
                  python-2.7.8 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                   atftp-0.7.1 | 1 
                  tstools-1_11 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                busybox-1.22.1 | 1 
                   ushare-1.1a | 1 
                elfutils-0.155 | 1 
                opencv-2.4.9.1 | 1 
             e2fsprogs-1.42.12 | 1 
           libmemcached-1.0.18 | 1 
                  zeromq-4.0.4 | 1 
                      qt-4.8.6 | 1 
                    neard-0.14 | 1 
                 webkit-1.11.5 | 1 
              libgeotiff-1.3.0 | 1 
                    fltk-1.3.2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               alsa-lib-1.0.28 | 1 
zlog-ca6162be1608839e99c638... | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/cfaa2b5bd084d99a66494656cbebda91c0995f27/
      x86_64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/9f9a50a3a0cf752f2cb56b775f1c0cbde6bcf559/
         sh4 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/1728099fe95ceb26c57346e51f5584ab906625ab/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/aae564e9f23dc4a67bb5c3eacd5e0dc23b0ab254/
      x86_64 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/52b91bc121801e6b4673e1e9a4d0ea1aeddc6cdb/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/1ca2c8c962cd2e92172265ebfb3086c5346c5afe/
        i686 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/44f134acdc6b94cf870a7a7d098d9af34c903cd9/
     aarch64 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/bea13efbcf626841c6c277343ee445ea63864f95/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/b20e045801b00ce033605d2be01f7cb4beb2c2a8/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/ceab4c8fe11bdc0069702361d4f5a271eb9ce236/
         sh4 |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/fee41846cf7c8b034cc334787c04e88bda4ac4af/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/219a4f1ef08d87bae6017b5a24dea4a4031426c4/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0689e1bc205390a04923d4f162a8d02c992701d5/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/cb0e7e97612ed7ca4c6c284f7b496b4b945b3fb7/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/faed28e01799022cb109bf82ee9ec908d91b1ec6/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/481d4ba2ece81904edc5571a1aed16cecdc83a1a/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/feded77847d77aaf1ab4449f4078662751962780/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/ac1b576f27202fe8d5675830451bd5a0e89d8b49/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/534ad53aa48b5dd37fa89af552603f9b1bd7ad4a/
     powerpc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/299c358830807ff80984907109339ff6e77ac46b/
        i686 |                 opencv-2.4.9.1 | NOK | http://autobuild.buildroot.net/results/52b1bda6f02cd7a94d77fbb7dddfadb37113f3a6/
        i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/dc0771bc962d70916e36abe88baf3fd3b6610f1d/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/146b08ff9ba9051576e5f9dcf797cf082273cef9/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/a71aa0a75a7499abfa773a557dbdb41e7738798f/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/035c4cc5203cfbd9817b45ddc41c5b90e43365d1/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/7759ac107a7a2483da5b42e3d553bd2e6a413bbb/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/b9f83f7e72ae1da5c28101a0bb00e12d6da555b8/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/16e92d30d097477ba06b99bc7acd4c327a605143/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/ea9bfc481109d6a3e284e86b5d1a3d4f4a6b3f57/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/11646d39d37ee282d9f3260cedf062869934bd28/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/728125534c9df1547dba29e7bb6885f918727656/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/3fb1ada3529365295e905a46ed5520cf6a8ba368/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/b49d054c2501bbbc20729a98441d1195ca8dd713/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/b88350a13c018bfda204f12ca3406f83ba466611/


-- 
http://autobuild.buildroot.net
