From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-10
Message-ID: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  17 |   2 |   0 |  19 |
   2019.05.x |  23 |   2 |   0 |  25 |
      master | 188 |  21 |   1 | 210 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
             openjdk-jdk-12+33 | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/77d159d935ffc351bfc6e18d2a637803ecd8d573 |     
   powerpc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/6afebe3ff4221cd6cfc67af02b20f1fe05a299a8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 5 
libwebsock-3c1615eeadb0b582... | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                   cups-2.2.10 | 1 
               host-efl-1.22.2 | 1 
           host-mfgtools-v0.02 | 1 
   host-xapp_mkfontscale-1.1.3 | 1 
                  libssh-0.8.7 | 1 
                 mesa3d-19.0.6 | 1 
                         mimic | 1 
                   mimic-1.1.0 | 1 
        network-manager-1.18.0 | 1 
                poppler-0.77.0 | 1 
           udpxy-1.0.23-9-prod | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

 powerpc64le |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/c4e0f6a3c79c9cb083a08f811b7d4838efef50f9 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b4744a79697777b0d40c6e070ac5c1c95076271d |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c82b10b6db02b2a87c45f41bd35bc0c5d5beddc6 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0fc486fc037c697b7605f330aafc6a64dd2bc675 |     
        i686 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/1a62dba60f96275ea15471ee7f8588475b2ce5f9 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f9ba64ab4c8d7fa6cb301fab37ee4141ba442f61 |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/71853edaac4d9ed2a29b579e4abf62a68691dbfb |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/42644ede89ad15b2ebcc307a9121d5b647629978 |     
         arm |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/b5ec2d2d17e64ca7b85ebd7e4d0d880eaa661170 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/f03d4225b6c3a3ec8558f96a6a8c91c0318aa6bc |     
     aarch64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/bfbb6d3e31033cc598f2288bce8f1447e79f09b0 |     
     aarch64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/e2cbd9396caea7890996dd6b9e88e7236e46fd1a |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3bc54e2fdce307007b68f5323594666b15343d62 |     
         sh4 |                  mesa3d-19.0.6 | NOK | http://autobuild.buildroot.net/results/1ea031c402f5416851e2a5467cee76f906a6be2a |     
        or1k |                          mimic | TIM | http://autobuild.buildroot.net/results/751953b121670bb51e3f16f63a9223311f119b6e |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/0f0e7521f47cb92ea3ceab6af56a0618c4cf218a |     
       nios2 |         network-manager-1.18.0 | NOK | http://autobuild.buildroot.net/results/e47c7d855b452079a165ad4540b2e5ccd4162e19 | ORPH
     powerpc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/2c8695b75c3241359e739d88726430cbfe47a5bd |     
        i686 |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/114adf08cd94473b59ff46819b27578466647e4a |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/40268ca7d9ba32963de239923cd2ca18a0011b37 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/de2e7db30aec888419c22dea08f4f769d9577afd |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/1284723ae2886cfe05b8337d6cdd184ba1d7e5c7 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 2 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/b01e79868cb2ec843adcf1f72662a23018eb1a0c | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/f02e8842bcae2fb69294def3fc29bd305cefe007 | ORPH


-- 
http://autobuild.buildroot.net
