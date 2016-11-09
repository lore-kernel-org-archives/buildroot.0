From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-08
Message-ID: <20161109073014.9AF5920CBC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-08
================================

      successes : 193
       failures : 57 
       timeouts : 0  
          TOTAL : 250

Classification of failures by reason
====================================

                 mesa3d-13.0.0 | 5 
tvheadend-50a370707aedf5c12... | 5 
             berkeleydb-5.3.28 | 3 
                    mpfr-3.1.5 | 3 
                 mplayer-1.3.0 | 3 
                    quota-4.01 | 3 
                  guile-2.0.13 | 2 
kvm-unit-tests-5731572b2ac2... | 2 
                    ola-0.10.2 | 2 
qt5webkit-b35917bcb44d7f200... | 2 
               tcpreplay-4.1.1 | 2 
                 weston-1.12.0 | 2 
             core-dependencies | 1 
      docker-containerd-v0.2.4 | 1 
               domoticz-3.5837 | 1 
                     gpsd-3.16 | 1 
                 jack2-v1.9.10 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
libasplib-f7219142e790a329b... | 1 
                  libsoc-0.8.2 | 1 
                   mpd-0.19.19 | 1 
                    mpv-0.20.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                   perl-5.22.2 | 1 
               polarssl-1.2.19 | 1 
                 qt5base-5.6.2 | 1 
             qt5location-5.6.2 | 1 
               runc-v1.0.0-rc2 | 1 
                  stunnel-5.36 | 1 
                sysklogd-1.5.1 | 1 
                   taskd-1.1.0 | 1 
               trousers-0.3.13 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
x264-72d53ab2ac7af24597a824... | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/75214a405b9ffe65bd10c97cdcdd3a868c22cabd
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/aa9973994aad6cd384b43ee53d72ee3c56f05c52
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fefaa6bbb9e0c8358ba20dc10bdea82e56e53c38
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/09653e88862cd6583209003108ec57013967261b
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/971685adb0ccbc15362f4aac4473b2cb20cc1b70
        sh4a |                domoticz-3.5837 | NOK | http://autobuild.buildroot.net/results/7bba1b7008c9c21e8699604a1aacfaef93f5f02a
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6a3877781523b88aac22df927726456fe8e89eca
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/48043d99610d5450fe1dd15733d5882359f8c978
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/c93741534f87069ac384cfd7c7e6f8697cfa88e4
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b41c1123bc36fe941037a98f0c3c89ca3edc9ee7
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f28246d2de3086ca4994a27915c2d47db9bd87bb
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d077a9a9bc03769d6f799fc1aa0d162d6e8de231
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/7c3a4771ecde2fd0c894a1f375d91bf3b3291695
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/915eb4cab8e746a576ad3279df289f7fb7ac7985
        bfin |                   libsoc-0.8.2 | NOK | http://autobuild.buildroot.net/results/b2b27c0e04789612329bb4889dc87e7464e40f15
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/abbe7ba515a968e454bd11c085ba4d721d977570
 powerpc64le |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/2dada7eeb72c8313fbf466aaf7fe9387c2740b04
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/2ab84c2f9188f81c24cc39daeab491dad2e54c34
    mips64el |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/685badb1a47d342e28197483839259a55c2347f2
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/42b547abaa29f6bb88377cc5068bfa0918ab52de
         arm |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/f9dac5a9c3bfe49c510ee9dcf7e54cea38473dc5
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/6669196edb3e21d5bed344f8c6c2fe415c2a42f4
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/4fa7993d22e41a988b3277c220f547c0d6616a1b
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/d805748991c7522193c91eddfee318aaeef4145f
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/81fdcd9c68a487ed9014d97668a5ed93cefd1695
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/403c8f7e27c9842bdbae0d17104a7931e0d331f2
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fe9c1127126362e2d6d98c8c879586561701e863
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e763b06081aee52f9ca581773eedb127fa3ae9e3
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/9bf879585e17df33d84b86d8eb774bb87d0cb4ea
        mips |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/76b1d44cbc85755463eae8f62bbb803dc01a1de9
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c8d112573ddb89a97286fd045f21033e29f809a0
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/686ef1b26fa4f2b434edb0628e84c897e8ef84be
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/dbb36c090dd0c690b208a637bbadce50cad43962
     aarch64 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/0149202d5b56ef8d8b3ef0bcdb09a6ed9f87f1a2
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/b33ac12369dd1e5f6b05974786d003dcee82fee9
         arm | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/e5b43370a4a3ab5ea999e292b7c8396757ab6ebb
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/28809c3da103a24e7b0663ebfdc02f288f2d23dc
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/032276eaf10e4eb13de385470023a020a1d59734
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/12cee0b16b816fed515870113ade6096002e4ffd
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/668bae48696f84310ace06e8f054098447b5120b
   powerpc64 |                runc-v1.0.0-rc2 | NOK | http://autobuild.buildroot.net/results/77c31d6e8f5efe3e024e27a160cf5d1d1952719e
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/5d42dd192677029120bad4ab44bb0653f925616e
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/4764d67a17f3af6eb7daa332dd6e490c728721cd
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/232c82b8393c45b971cb7a4fa7f0cb2e619293f4
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b2936d32e2e01a903a9073be3940c7d5002fc9dc
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b3a6d18ca5d87078623aa991ac02556eb5296761
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3eb1aa093b251541818fcf08f15c9826f6dca860
      mipsel | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6ed5cef61ee3a0e5c24b0e4595324a9b838067c3
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/9ab8b605b017f153299b874fd5a0a2f9f050081f
      xtensa | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/7e2d6d0d158d6092a10c75dcf7011a8d5c68eda9
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/8a93d6d8d1047ad721193c7a1210f140cc812747
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/f4342823be613e8348e39d1b3138e0069f8db796
      mipsel | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/1a870077517fdbfcb358259916e815559acb0561
     powerpc |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/a5aff121f9275e949729e114cc89fefa6cc63d23
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/c82e6c366e18d387ec5521ea95c2cd1b98e102c0
        bfin | x264-72d53ab2ac7af24597a824... | NOK | http://autobuild.buildroot.net/results/e3ee9733d77a1b723c1c0b82633e3b53d32db53f
      x86_64 |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/31e3af00b259ff0f8565a236e566c6ed038dcda4

-- 
http://autobuild.buildroot.net
