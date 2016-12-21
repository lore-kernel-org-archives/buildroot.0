From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2016 08:29:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-20
Message-ID: <20161221072953.9160B206E1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-20
================================

      successes : 164
       failures : 50 
       timeouts : 1  
          TOTAL : 215

Classification of failures by reason
====================================

                busybox-1.26.0 | 19
                   mimic-1.1.0 | 6 
               trousers-0.3.13 | 3 
can-utils-64edc021d22441002... | 2 
             freeswitch-1.6.13 | 2 
                  lcdapi-v0.10 | 2 
                 mplayer-1.3.0 | 2 
                  stunnel-5.36 | 2 
               tcpreplay-4.1.2 | 2 
               wireshark-2.2.3 | 2 
                    gdb-7.11.1 | 1 
host-google-breakpad-7515ab... | 1 
                 jack2-v1.9.10 | 1 
libasplib-f7219142e790a329b... | 1 
               libepoxy-v1.3.1 | 1 
                 libnss-3.27.1 | 1 
make[2]: *** [all-recursive... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 synergy-1.3.1 | 1 


Detail of failures
===================

        bfin |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/dfec2c0626ab087325fd869bcbe0b9dc354d788c
 powerpc64le |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/74b08b0546f27a61e45ecedd34112f0576e64e68
         arm |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/cb36c08bce192c85db425eda59c924b47dd9c051
         arm |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/ff1fdcfab6987fa93929d4103b00068ec5639b5a
microblazeel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/d95066d52dfb64a69edfdf229ecb52eccec5beda
         arm |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/3b4416b41d8654fdbb6918d8595ce7e5c82a8dbb
      x86_64 |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/2401a7cdef32bcd3fadc7ac034ff20c3367b16d9
        i686 |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/83e380fa4fb98e7ec293efc9ab64ae60f2b36eef
     powerpc |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/4a5fa7acba4bb14031e9aebfb3c1ee87d92e9ab9
         arm |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/7e6cb33452900792f01350e46ba8027ddbca553d
     powerpc |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/49499b39fe45f7064fdb6f092d78b426d3b0f726
     powerpc |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/48e6c81a7315303ba0941246f75086802a7471f9
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/669c3b13e3d77e4a1d05acb6ac5cdc3771dbea52
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/55655daef23788fb3967f801ec8b79e9bed7122b
         arc |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/ba01f6a430389b117656dd1c266b226c0bd9a426
         sh4 |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/79d1d14f856e1e010cc33d841d866d1884cbaf96
     sparc64 |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/8d97b56aa8e374871bc44164ebd497673d669b52
      xtensa |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/261434c985a1e1a531f68d86ca3ac735e6adb108
         arm |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/b04d43afacdb99a5c841f211300b89553c93916c
        i686 | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/0e5242376ff6aa82e89ed1172350e05009d48156
        i686 | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/4d5d4ac4ccebc12f10c04e9a8ff5502b64e4abeb
         arc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/57a77a933f2d3b61a328aedd7c06f683cafcdd50
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/f26ae02a13dbd8fad9661b49956b160b8528d18d
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/ab183ad4a4761837908a9013dc3ee13e0764be82
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/59ee3bde24ff5b0d6a54598dbc2b55d320b5e89c
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/22914146e50aaf7fc3db254b4d29cc372b121415
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e666bc7b6ab36a56fa1ef225e25b809bf56c4d88
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/83d523883e306260d8fc72570ea9c4e380cee93d
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/a84ec778b34b90f695f3e98533e178389e737a6d
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e3caeb7a4876f8aa54579bc55dd2c5c59dc22e99
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/041b00bde58e44151eead8e2a2355f5e4875c3c3
     aarch64 | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/a9421afd035bb9583cdd51f4cf64c2e16e62b93b
         arm |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/47f5ec3fabefd85e62b675142bd6728904acd5d8
microblazeel |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/9f7c1af4b9fd8331672c9096821db91d5f7f3aa1
microblazeel |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/a2f356556b72e59faf0754f324a48710537685c4
         arm |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/4cfe635c8b04c7a36bb8d475612aa224b4e93043
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/50dc8d5f1625719310115201199b0befe089d880
         arm |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/99b8834ef2bb8ee56c87a8d4081b4cd8fb09cd0d
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3c31fdbcb37d59db92c5a7831707bdff79045377
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/12557d96093e876884bf2e99a3a47fe8afa0900c
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/9b7638caa8f3e82e38fb68b0321cb649618a0131
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/0f9012403ea716d0ab86a935ff2452548491ca1a
      xtensa |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/a4657b48de9515d6c1ad312e3ce1646e9d20b1cb
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/89b12bd1d4579d8852f682eba297f409c178daf9
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/2641c52cad9fff4d0a58e490b5f64b13db73e6da
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/f0dc5991bb605352d72c1ec0dbcecbaff03a92cb
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/efd114ebd4b7af4993f6a52143b1054946caec73
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ea50f9dfaee14f96c5d033d053133f7bf6eb784b
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/fa04675b17c7a9dfd64544ef3bd081c6e8e6a582
      x86_64 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/edf35bda863494fdab9e839a941a9eb3a1b9c1d8
         arm |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/66dc831c943ab4cb6be65bceab8aba0dbf4cec7a

-- 
http://autobuild.buildroot.net
