From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Jun 2017 08:29:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-08
Message-ID: <20170609062944.8AC6920E99@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-08
================================

      successes : 205
       failures : 57 
       timeouts : 0  
          TOTAL : 262

Classification of failures by reason
====================================

                     gdbm-1.13 | 17
                 lcdproc-0.5.7 | 10
                beecrypt-4.2.1 | 7 
                  cppcms-1.0.5 | 6 
                     php-7.1.5 | 3 
               qt5webkit-5.8.0 | 3 
                   bdwgc-7.6.0 | 2 
           host-doxygen-1.8.13 | 2 
                  gauche-0.9.5 | 1 
                 host-icu-59.1 | 1 
               libupnpp-0.15.2 | 1 
                 mplayer-1.3.0 | 1 
         qt5connectivity-5.8.0 | 1 
              swupdate-2017.04 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/bd4c0ab058aa40a04986970a15237a6fe05a64c7 | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/3c6e4c2e52a228a9548640e43e0d06d33720d122 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b95cbf752a0e86abc77df29379b71730a29e6be6 | ORPH
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3dbf308c621df7458ba522f35ad626c8aafbe834 | ORPH
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cda1bb8787283041102fc815fd20a0a70a895f12 | ORPH
microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3df6d27099628dcf700d0c37ac5ceccbedd917d6 | ORPH
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/20c54046c95faa419deca37a80baed2f4d3fda71 | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/eaec84041909bc7f41a1ed5e65e6fef49f67d031 | ORPH
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/fb7b98133c5e2fc0f49513dfc1e57308eac60e98 | ORPH
 powerpc64le |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7edad5c9b125c55db71a4c1c20d94f0fed168547 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/15423368164da06ebe63d7f9f63991645486cd1e | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5e27d6fdad52f5bd59b07fea9cd4ffa4fa1ad567 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7533cd582bac09193b67a753a8b51bea987b636b | ORPH
   powerpc64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e54617b04bd7466b85f1afbfd78053af90e11a30 | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7add53d844632c99f5c8f4c2032822ca9e9907ce | ORPH
      x86_64 |                   gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/ebc70579a94d260fecf05fe4150eebcc59d3b5fb |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/e17f33b99ec11b2d97524d982097dbc6dba305ee |     
    mips64el |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c2d15ab87cae9e4c7b2ed03b8e7b13c415fc2ab8 |     
        or1k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/71860b73035811da9127d7ab8ee585282df25c05 |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/264b7faa00e2b0bc553560ad9f169defddbad95e |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/c01a35100e477b1879729ed9a7e8f81562ab01e2 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/76aece82b1f7dbd079e82bb0a6af7d4beab2ba9c |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/3e7e6a32215a4f49be16cb0c521a4f78e25ff919 |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/4f04b1947d73b8834cdba9b0a25abffde0e99eab |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/eb61cf13d40a07686437009ea9fe536aa2dd4041 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/870da7cebc3deeba0b8577e538ec8e010ad4df41 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/ec576f1001734b1b5a616876c89ab7bd361ac033 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/bfe05dd80b6d51d62a1f693e650a1b08f77f5f49 |     
      mipsel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/447fefe78155fcf7e514b7a3079b501d3f537a09 |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/5b6032ceea52745edece672512042e4a6c5d2da0 |     
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/e0e40486ada31c15ce956240881326507c36028b |     
        i686 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/7a294a62f4811fdaaca1891ec3959aba9cbf1fa8 |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/57b1a19227c19836e4ed86520ecdd1087f16a8bc |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/e131995a148835f1ad153e6077e4e483cda40387 |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/e6f16da98a5f379445cdcbb77b47554267e244dd |     
         arc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/51434469257e1d83e7738328f1dcb032953b9717 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/eb95b3aa3c238f4e7f51ddacdfb2ffe829352758 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/2ebe4642de34a35593702bded111c66fa9faaf82 | ORPH
        or1k |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/0190a90bd1de0433d70d976741def9370e570145 | ORPH
       sparc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/715e42ca32e62d6389cd4d1c9b723e811b9cfe90 | ORPH
     sparc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/88cfff8394d02667c9d7f50f16cc01c23cc5a5e2 | ORPH
         sh4 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/2bafbc54c1c5202fc68c4057ea17e00652f23a4a | ORPH
   powerpc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c3140406c3665b9acc0a851901929c17119d289f | ORPH
        m68k |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/01e7a05b10bbf7108620424033efb7b39a2a90ba | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/53d2318968d5d66540cce7bfe18e731db639761b | ORPH
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/9bc1e0e830c65eea336f24f96c7170a43f8f4cf9 | ORPH
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/d05c91e2ffa4e35004c272f45b8cf81ebe7cd2a9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/87abecfbac48f272a2dbc1eb054ae8fa218acb75 |     
microblazeel |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/8bfea9aaeeca81a1879f134511da727f91619d94 | ORPH
         arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/a90308e8732f94f9c09e2ad91ff41489481bb863 | ORPH
     aarch64 |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/3925b4a6913418b6837a05a2387ebb3cf2edb884 | ORPH
        mips |          qt5connectivity-5.8.0 | NOK | http://autobuild.buildroot.net/results/36c3bdd06a5aae3a98445179dd9317209dacce45 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/830ec1904e6265a6834d5e0f55a0edd6d0c90a88 |     
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/5688fab1e2fbe468f5f1375cb8bbc5802419addc |     
        i586 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/ddba878293d1b1dd4530a1a0aa07cbc56e09eedf |     
         arm |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/631d67e7272c19a1e0ca40630140fab229817ed9 |     
         arm |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/18038f7acc8a0dd25fdfb848fd4159c173f198e1 |     

-- 
http://autobuild.buildroot.net
