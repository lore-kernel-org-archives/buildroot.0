From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-16
Message-ID: <20150417063021.63497100E4C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-16
===============================

        success : 177
       failures : 58 
       timeouts : 4  
          TOTAL : 239

Classification of failures by reason
====================================

                      bmon-3.6 | 23
                     vlc-2.2.0 | 7 
                host-gdb-7.8.2 | 3 
freerdp-770c67d340d5f0a7b48... | 2 
                    qpdf-5.1.2 | 2 
                  python-2.7.9 | 2 
                  dhcpcd-6.7.1 | 2 
libubox-5a0bbefc8fa44044625... | 2 
               libpthsem-2.0.8 | 1 
                     gdb-7.8.2 | 1 
              strongswan-5.3.0 | 1 
               libsigsegv-2.10 | 1 
                  snmppp-3.3.4 | 1 
                 webkit-1.11.5 | 1 
               arptables-0.0.4 | 1 
                    ruby-2.2.2 | 1 
make: *** [network-manager-... | 1 
                     php-5.6.7 | 1 
                elfutils-0.161 | 1 
                      qt-4.8.6 | 1 
checking libpng/png.h usabi... | 1 
           libfreeimage-3.17.0 | 1 
                libtirpc-0.2.4 | 1 
             ipsec-tools-0.8.2 | 1 
    openvmtools-9.10.0-2476743 | 1 
              libarchive-3.1.2 | 1 
                 python3-3.4.2 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/383eb0afca5fce37dadf098543e622a7ab92f785/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/18430c855292ae4ec0bdedada6ca160e33c8c723/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/c0d8a258ad2b2eb7639629c92887db02901c0bd7/
        i686 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/89cdc18727902b52ba1a5bb07c931eacb0e95b27/
      xtensa |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/e8dd06c7d84aabdf2e3f58114a405309cfeb5741/
        sh4a |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/5b7a58adb7e3fd699a2f44f234fca220007b7b68/
         sh4 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/aa15369f66e776e860168954de6c160c2875c8e4/
         arc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/225cec44e5e7e9b141c3f7a729f195fecffe8734/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/037f39ea3d931b3c63719918e354f5f5aa1e049a/
        i686 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/8423e06f8b7f5bb8412e974bf9b4dceb0ba13462/
         arc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/6decc453e771f1198b4aa7c63bc5817c0373df8d/
       nios2 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/a7aca01079dacb1bfb00768fc4e984cbf0f5afe2/
      xtensa |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/fdceaf8af91b6fed25af41f157d8f52716c3dcd8/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/2f12eeb9121855d235771112de3707feb39d8b97/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/ae89f59d3bca6fa2e5faf1f1b7c154ae2dccb506/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/70e1eac2948d787f8c4a5bc978c0088ffcd149ec/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/88c5b7aa011aaa13a5149441ef7ec44a64c47c76/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/823c12c17fe1ce126c480e4ddf5088caedb6fd73/
        i686 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/91cfea087cea14da9699e001185e5f17bab7ff1c/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/89b4e7c793ffda9bcfdae3a645495d5d117d89a8/
        i686 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/f036e7485ac5e3346e3fe1a8a8602bc94e0fbaa5/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/1723233f0b8c5b92b7b37ef4c1ace173ba6ae37c/
      mipsel |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/3b09debe1b8c8e68731593f070b09109ce693686/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/6fa8c894c81c18f45a2d531b18595f4f0ea5ffdd/
    mips64el | checking libpng/png.h usabi... | TIM | http://autobuild.buildroot.net/results/d1341047ed298cb121139ff54204430a649c7c8d/
      xtensa |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/b91753da7b6503cd45a9c26a213ba4b3feb1ea1f/
         arm |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/ba67aa1ff9c8568d6a43fa0384cbe72e8b2e9841/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/80b5be49d40f800b5022312493b0f24ab06bec78/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e6bd9c0dae6d1520b99bc9f63c0aed42e9ac3116/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0638c84313a0ab9489052d9d0aba927d6a8ddebf/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/7e0e3dd3ec5c11728618117a73f53b2383fd145f/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/1d25b3cb04406df55ce5ece9a3219d77c63a0092/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/586407b95d809f7641148072b81bd6bee30e7180/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/908357095aef2b1bde2b46fc646e59f777f339bd/
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/1302cec8549aada71ab95c3b59fac0693c189fce/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/996ed7cacf0b661c85302e77a0e5fb2bb09e9a13/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fa070c80665ccfe44b020cce8cec4ffdc7e09ac6/
         arm |                libpthsem-2.0.8 | TIM | http://autobuild.buildroot.net/results/3be5228c9dbbb6b541fe277e2ec3ca1fcc5b1843/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2ec5e28dc7358951135d93875d9118941de2616d/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a9e5b5008894c7269ec027259fbbfbbaa448e1e0/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/73f47d011e53233000f730fa78ec5907bbec131f/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/318155e3193cabaad94160768a20f78c554394b3/
        i686 | make: *** [network-manager-... | NOK | http://autobuild.buildroot.net/results/f77dabdd8bd213c12ab0ffd0a60c94ef12616a3b/
      x86_64 |     openvmtools-9.10.0-2476743 | NOK | http://autobuild.buildroot.net/results/2a19f84c35de0ff008c2cd1aea96f6a4f2767ee1/
        bfin |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/b39324b0aa7dec6122a07b753608ec75506a6bc0/
     powerpc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8f8d431142c5a8ba613c6818a9434eaa193cd18d/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/78e780dcec8abee13c3823a4bacd1a3e9de4e717/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/88b23449ba3b0a0345dfff4a732cf8b30a4f59a5/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/8c123f5112b369f2250ed10e4e1db2f1992a0cd4/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/16a418167fe60b3e84eeecbce18cec536e25a00c/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/cd8651880fc99fbb9b263d086a27176fa2e703eb/
    mips64el |                     ruby-2.2.2 | TIM | http://autobuild.buildroot.net/results/9a1d1f24a99a73be8d2347a358590299b2bda3ad/
        sh4a |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c7c76c430479118889ba77afa1ead4da505fc522/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/c4f5dc4886323fd90fd47760a94cf43a75448417/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/f4dd7d4842e8dd1c64978b344fe42b6aad3e5add/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b128387d33ec534a565f307b41a30b0daa1c8883/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/5bdc5c0909d1d730dc7a97d07616b1d83ffe6cf4/
        mips |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b23d3c93c6821cb1986018f33b9cb31eeca57a0f/
        i686 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/c118f1e6e8cf1abc48f4277c0789caaae9e5d185/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/12e90b4dd6223bb1b2a08475bd51e03352eae705/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/24490ee8444088bf63cf548e5b45fa8b99dacdaa/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/308f7ce976b57f846c7b523350ba3f034395209a/


-- 
http://autobuild.buildroot.net
