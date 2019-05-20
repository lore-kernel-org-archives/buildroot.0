From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 06:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-19
Message-ID: <20190520060100.A1E678507B@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  17 |   1 |   0 |  18 |
      master | 219 |  16 |   0 | 235 |
        next |  47 |  11 |   0 |  58 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          oniguruma-legal-info | 5 
                    dhcp-4.4.1 | 2 
                cracklib-2.9.7 | 1 
                   netsurf-3.8 | 1 
package/oniguruma/oniguruma... | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

        i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/c4bed3f3323b588c2a799ea9ea1ea30ee477e799 |     
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0a5ce09ae6f79441c25211b8c196ea239a0c5375 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f5de0c73e689f3f75d6575dc6883fdbf7c4abcc0 | ORPH
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4a67fb6b20cb2e708dc38d0c00f015e81b09027f |     
   powerpc64 |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/551b3f12867e27b1a9f784099cad1e439d50089f |     
     sparc64 |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/959722455ed35815db355424447d960181d02285 |     
    mips64el |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/344a410a8c040f08e66015d29fc73de91a9d93fc |     
         arc |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/d7a56db19df65df54406904102e1c94f27dd2d88 |     
      mipsel |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/a9a0ce81a9b61c9ab0f8e54715a569ed32a72e2a |     
       nios2 | package/oniguruma/oniguruma... | NOK | http://autobuild.buildroot.net/results/ad553d632b2087c81850637b1fcff540dd939a23 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/7175c6e701b6f8c7c4fd1e59ff74d885a03d74d8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                suricata-4.1.3 | 3 
                   netsurf-3.8 | 2 
                qt5base-5.12.2 | 2 
              qt5enginio-1.6.3 | 2 
           host-mfgtools-v0.02 | 1 
                  linuxptp-2.0 | 1 
                   mimic-1.1.0 | 1 
                    ncmpc-0.34 | 1 
      qt5webkit-examples-5.9.1 | 1 
              swupdate-2018.11 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/0bfdc89500931eb0d005df0d457d313062587337 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/b366e9edd15ebfd96a4c30a192c250e37296cd52 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/86923cc05101a875e0fdc82c183b87a14ffca355 |     
         arm |                     ncmpc-0.34 | NOK | http://autobuild.buildroot.net/results/0365b876c0101f9c2b680ccdb191b102ac7fda1b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/104d956f7485747869b767f76369060a79c9cad8 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d134205b843f0c95a479a3b7f653127b22f20340 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/840c9f5718ae87391aba7436e775de20333755ea |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/84b508acfb3b7643fbf02840ef6920bdd6f0a444 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/603531fc4a18b9f434f5e1235084877d8d54108c |     
    mips64el |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/70c936283dc749ddd5aafa32561266f387d0ba01 |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/1eba645beff9b4838782b730c3c33597bc879a2a |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/37e7982c43a192fdaca659c49f03ff67c57f291f |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/50733ab58aafbd958585b7e74a86210a6cdc2e7c |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/94cac1f831faa9df2aabe11fbc1da06b537520ca |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/b41e00a9684a5e9ce459cede59ee0846554eb9d9 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0e59926eef0b83843b51400adf8273dfe1224582 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/450f141f35132d96904e071622eb86bc247cfe0b |     


-- 
http://autobuild.buildroot.net
