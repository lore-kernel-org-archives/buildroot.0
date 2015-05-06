From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 May 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-05
Message-ID: <20150506063017.6B6A61015C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-05
===============================

        success : 301
       failures : 50 
       timeouts : 1  
          TOTAL : 352

Classification of failures by reason
====================================

freerdp-770c67d340d5f0a7b48... | 6 
              postgresql-9.4.1 | 5 
            python-pyqt-4.11.3 | 5 
                  cc-tool-0.26 | 4 
          sane-backends-1.0.24 | 2 
              cryptsetup-1.6.6 | 2 
                  snmppp-3.3.4 | 2 
               libsigsegv-2.10 | 2 
                numactl-2.0.10 | 2 
                      qt-4.8.6 | 2 
                tinyxml2-2.2.0 | 2 
                  weston-1.7.0 | 1 
          google-breakpad-1373 | 1 
                 rsyslog-8.9.0 | 1 
                librsvg-2.26.3 | 1 
                 libepoxy-v1.2 | 1 
                  python-2.7.9 | 1 
         lua-periphery-1.0.4-1 | 1 
                   zmqpp-3.2.0 | 1 
                ipmiutil-2.9.5 | 1 
                 cdrkit-1.1.11 | 1 
               qt5webkit-5.4.1 | 1 
              libarchive-3.1.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 
               host-qemu-2.3.0 | 1 
                 mesa3d-10.5.4 | 1 
                   czmq-v3.0.0 | 1 
                  boost-1.57.0 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b64fd94a8ccff7fa8c5e0ca0c4acb7254f9cddc3/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5f84d5696a52c75416c85f802278ee776053b4b9/
      xtensa |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d971db839e84480a565c5b2970f13296700dbd51/
         arc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8126d59d06f5452a7ce2a4cdcda3103fb64046ee/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/37009dda6344dcf25ca52878e9a5beb37f2a0a93/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2bd48ed578a143749d4503aca96f661647afe525/
       nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/ff456344eb5bc8af619c1f5d88be0cb758dd5075/
       nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/a288b0c5b437c3d82dae4f3bf391c59236739c3a/
      xtensa |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/4d3dea604da9a5a1e7fe20548813f8de474ae33f/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a4caf2b035ea5b7d5318635bf78373d6229aa496/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/88a4c76e3a48fae42f78eba8febfe4eb29fc9904/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0889a99bc4092ab553889de458b534e4da2cbfd0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/4c1a244db94dbd37e26a4fec5ba506f0525c1d00/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/50ad78fc35fa90cda5e0453b6867b3ce0dbf65be/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e94cdc19a18c91eb851c007b833f0dfa08be5cc0/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/c9f116443199dab708a18c23fcea3e623664d947/
    mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/a23401c97a11636799b685d9eec8c96e5e202cd0/
        sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/40a47f11daa201c488519c0b1270cc2e71cc3116/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/e0a198d88c746c6ad24916d723b5faa9024f8abd/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/6c0225e109d87178e80cf7edfff1461b077629b2/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/fee1e3a4eb7923d7ce166184323b908ed069b3b6/
         arc |                 librsvg-2.26.3 | TIM | http://autobuild.buildroot.net/results/858daf884d04d56d37e3a2e481c45f7b9a2a88f8/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/2c7bd050917ab0a65a53f3516a7023cac5be078a/
      xtensa |                  mesa3d-10.5.4 | NOK | http://autobuild.buildroot.net/results/3e2e24f697e26c93d4d95782b1cb7799fa620a7a/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/c7d63606065b7c53545ba498493661e760647812/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/9c1088f1676474014c5977856e0bfb1dbdc121fb/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/1d9d11291d8e0591144f0652cd42615fd8993cd2/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/24253e3a9183a0bf0f8f021cf1eb59d631f27839/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/d2d1fc7ceb35b25ef68947b2cf0e219616313121/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/7d1e92b61431b83e7bc38da1bb211b5f2b3dd119/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/ebf2e54d0d6f08c57bf6d4946b1df8df4a84c422/
         arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4c694d715f66de49964ef36f7236c7575c3a0b5a/
        sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/09302c153418c3af6dc4cdd12a0149505cfbca0b/
         sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/96f8a9758f0116aec999028fde1b9c983c143809/
        sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/848b9433c09d6cbc81c8d1e22778ae68223b43f3/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2062208c171207428c9121215971e00c52bf306a/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/57ef99b9dd0623e3e9b61e5964eb45e611b89cd5/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/50315ab70d313f40a0caeff51dc76354495a5cf9/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0e2e877cb75a49d0560ab785c4afa51065fbd54f/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b6d6e19cfe484afabcd392f6095e8425dd591540/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d9c388b15c20c934426400c8e85775ea1efcc007/
      xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/6f6f3aa826bc3521e29aa0755cbeb3f333f511ad/
      xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/a27442aca5b2df58e37eff7209117c787673baf3/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/45858c9754b8aa017a58f3f74463b28042fdf9cb/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c479c9a9f1ba2271ece2f316cc7b6c2c9d39e60d/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/349c1ec8ee9f2e1e1f8f37b6e6823761cad5edc8/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/c96e4bd3044c89df8e67d9c383886eb61c438e24/
        sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/b4da4e9f0c85c9fb402cb5a1bb5a8d1d63b05b13/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/73e5b739887dd0d62fb215bd03b13a31e4a0d1fa/


-- 
http://autobuild.buildroot.net
