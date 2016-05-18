From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-17
Message-ID: <20160518063020.81179101E72@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-17
===============================

        success : 169
       failures : 45 
       timeouts : 1  
          TOTAL : 215

Classification of failures by reason
====================================

                    mpv-0.17.0 | 4 
               valgrind-3.11.0 | 3 
                 jack2-v1.9.10 | 3 
                flannel-v0.5.5 | 3 
                blktrace-1.1.0 | 3 
                  connman-1.32 | 3 
                grantlee-0.5.1 | 2 
                  ltris-1.0.19 | 2 
                  ffmpeg-2.8.7 | 2 
      kismet-Kismet-2014-02-R1 | 1 
                   erlang-18.3 | 1 
                    mosh-1.2.5 | 1 
                 hplip-3.15.11 | 1 
           linux-zigbee-v0.3.1 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                   mplayer-1.2 | 1 
mtr-66de3ecbab28b054b868a73... | 1 
             xlib_libdmx-1.1.3 | 1 
                 host-go-1.6.2 | 1 
                 rsyslog-8.9.0 | 1 
                    cups-2.1.2 | 1 
  toolchain-external-undefined | 1 
                 mesa3d-11.2.2 | 1 
                oprofile-1.1.0 | 1 
               netplug-1.2.9.2 | 1 
             lirc-tools-0.9.3a | 1 
                 raptor-2.0.15 | 1 
       gadgetfs-test-undefined | 1 
                moarvm-2016.04 | 1 
                   luvi-v2.7.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c74ca6e8e466e082784c8ec822e0f8ba5801525f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f74b2ec8e64c246a2b9a35cf4d16af38ceafc9d4/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/91d406d86aca2ab8fa2d5b39c0e27ea41666be6b/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/59632f69afc7d68d43697fbf5196fd4365b126d9/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/918588243b21d2a795e49cbb821c1fe5e1b5dc35/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/8f62ab43780e489099b66e150aec4d5d786c3575/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9aa1705e0d01e98815dbec2cafa50723ad7675de/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/488ee4a13a5c55ec5e4f1346a1c999d275c3e8e5/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5311950f6e99504730227ff4720896e620a2ecf4/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6d70fe8a9f17f870b50ebb1916735978e1628658/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3aaeaf30f8d1af84367a8a5ccbdaa228ee9cb9d3/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a26e964898cf7972bc606c3a1606537ac562142d/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/52d359df3bf2941c39c4eaf747d662c9b3cec04e/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/e98d04fcd6b7082f5c57f18dffdd181d1fb299cc/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e05280f1cc4f669b7e418161749290723179e987/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/d2abe6b308894d726ee5bc63c92064579bcf7e04/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/5c1f5daf795d226b76e9aad273832e28d9aca676/
         sh4 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/1a8d6d954be9f6a313da83c41e6301c0ddf9bfc3/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/6c13f18362400b0b281437b2b3db6ea29922894f/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/18caefd417326da897dd31bc0b4da59a0ebb0a5e/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8468a4129c52fec17cc2b6231cdb11f943b7ef45/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/89721094c84ac576e5f4ab9045d6e92f9e6af4e2/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/befea6a40b09d1e80fdc21b9fd2383f42ddaf562/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/8ab32abb1d137bcb722054b2947dba51e1f6e9f7/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/3c7810984d03d45ba048e8209aeef94f4f6aa477/
         sh4 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/ddf55a9e48ee0b73c9a82f27363974853f0eabfa/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b0671af6be81550221f5abf98c2c797787590199/
      mipsel |                    luvi-v2.7.0 | NOK | http://autobuild.buildroot.net/results/3f45fb3466ead1a39351af8e76a193e622ae5a18/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/01988c21827402366875d55800c4ed99be384ded/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/aa973488e35b771f3076e66d03490f4002eb816e/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/80ce55bb86e2557fcf2764edf8029bd4bd8db444/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ac3cebf6256a8c48d62554867a04cf6948d77445/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/b9b5bcd8302f5b331d7f9bfa9b11e9db6282a24a/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/113e8c04b1c7e33a85f637111fd1ab31d7aacc20/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/b8882aa5482fd8c464d51c0aa32364957102c15b/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/0b85ddf2e5b1798d32b024654f224e4c6e30d2b5/
        bfin | mtr-66de3ecbab28b054b868a73... | NOK | http://autobuild.buildroot.net/results/dcbd39878b1a80d6a16032e967bd8e2b928f7a78/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/b97aebae90e2a36004b9f2284c47b5fdd9393c16/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/8470a6e4064906238f5b21fa0a1406369d0633f4/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/6db405a097b192876c0b1b8d59051d614563c617/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/3344896d60f1f907e7813d804896080ed647b942/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ac5559bd281c8c4b3ff3b88dade0794c94d57c9c/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c6efc4fd455cd00ee4999f18af641da3f369ff6d/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/9806c27ddd33e1237f74e54ef59910f7467aa42d/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ec7c1c790d8afd2f33ac5e925194b59d5221fe4a/
     powerpc |              xlib_libdmx-1.1.3 | TIM | http://autobuild.buildroot.net/results/4df9b9e09f0eb18e1b73976ca3f12edb5139e405/


-- 
http://autobuild.buildroot.net
