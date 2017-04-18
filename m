From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 08:28:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-17
Message-ID: <20170418062813.5B12E2084B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-17
================================

      successes : 188
       failures : 34 
       timeouts : 0  
          TOTAL : 222

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 7 
           uboot-tools-2017.03 | 5 
                busybox-1.26.2 | 4 
                    mpir-3.0.0 | 4 
             lttng-tools-2.9.4 | 2 
               acpica-20161117 | 1 
                 binutils-2.27 | 1 
                 efibootmgr-14 | 1 
                libmpeg2-0.5.1 | 1 
                 mplayer-1.3.0 | 1 
                     pcre-8.40 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.7 | 1 
               syslog-ng-3.9.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
               upmpdcli-1.2.12 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/c8b9bb60cbb9cca0346ac1343fe7913d0361c404 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/7a36558c690a4decc395b37485a735984b7fe4bc | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ba336f177e6749972d30fd1ac0818d993e507984 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/be7c232e1494eb11bc3ec57eda9ae459d531bdab | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/64f7299ddef2e23518c0f0b6eed0d1bcebf86405 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/75de7efb6257b1d22968deaf432321c8a2483569 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/dc33c3246d3414374212770b77a50b25fd514898 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/79dea2cbf98bfcbe3d9272f602b88697d1a8277e | ORPH
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/e67f532630efa93ef70dd4f9dd0829ec00a34913 |     
        i686 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/f090f0691e2ad8dde6003f841380b7285f29a800 |     
      mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/355db16bd674f8df4a642185aba09442c29cabad |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/df7e532686303e8f975aefc82dafb9ee66c529c8 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/a9a1f0a23f8983410cf641d869ad0dcd543da677 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/4db548af388434518583c7737f38fd47d22fa393 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/24ed18f33ab3d4d208977191d6eeba7e90d2802e |     
         arm |                      pcre-8.40 | NOK | http://autobuild.buildroot.net/results/9c16eda9fbee5eb9044a67de0f80c0ff8a4d747a | ORPH
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/9a20b15bcc4a433e2d8a73fbff603a8fd1091e4d | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0eaa2e994f9bd6a27634a92e9f62b22d0b7a6374 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/1656beab791f3d8cb12e5243c5ae2e17d90aa712 |     
        sh4a |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/15a81b0c30bebc16176ce3e797ddc7ad1d0d85c0 |     
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/ea4aec70ad8d533361d618e7375386335d1bbede |     
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/73336a217b5557a0a509ded2bb6e919b60b136b2 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3277b21391fadf3081c94c8bc17c9e82fc4b04dc | ORPH
        m68k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4c5b43bb45f97f2f9623cde0b889b19aa152137e | ORPH
microblazeel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c98947257caa8058c7f39c5fab3e5fb7de040f59 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6d517198c5ce58ba69c0de4573f68c54de4312ee | ORPH
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/e256ff1371cb43ca690a265b5f1ed90d4f1d698e |     
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c867cc8a72858c69bb55daadf3613d1cb91c7695 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/9e5e11329a162882e3c66953bb45101c777ba771 |     
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/66018d8db250eff1c274e17b43020686091f4d60 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/64b6276a7f78306d39c6c033df50dd5561309a0d |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/3365eccfed1e04661e3b2fcca677430b64f7f17a |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c0798f47f7dfbd342e145c58fec7d783b905058e |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/7e14116d915f4738a50a3df561e8681de44e4b90 |     

-- 
http://autobuild.buildroot.net
