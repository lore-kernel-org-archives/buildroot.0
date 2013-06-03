From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-02
Message-ID: <20130603063005.8D54F52C166@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-02
===============================

        success : 117
       failures : 38 
       timeouts : 0  
          TOTAL : 155

Classification of failures by reason
====================================

         host-gutenprint-5.2.9 | 5 
               sconeserver-211 | 3 
                 qt5base-5.0.2 | 3 
                 libpfm4-4.3.0 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                   mplayer-1.1 | 2 
                 pixman-0.28.2 | 2 
                    acl-2.2.51 | 2 
                     m4-1.4.16 | 1 
                elfutils-0.155 | 1 
                   squid-3.3.4 | 1 
                 netsnmp-5.7.2 | 1 
                   icu-4.8.1.1 | 1 
               logrotate-3.8.4 | 1 
                cegui06-0.6.2b | 1 
package/sunxi-boards/sunxi-... | 1 
                libsigsegv-2.6 | 1 
              gettext-0.18.2.1 | 1 
               wvstreams-4.6.1 | 1 
                   libcap-2.22 | 1 
               qt5webkit-5.0.2 | 1 
                     pcre-8.32 | 1 
                log4cxx-0.10.0 | 1 
           xlib_libXdmcp-1.1.1 | 1 
                 libnspr-4.9.2 | 1 

Detail of failures
===================

      i686 |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/bbf5e9beffa758ac2239f61f78ff91703e618bcf/
       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/73de100c3336ff0976e783c68e48a23e27e3a299/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/d163404f5a538b74eaba7d39de789deae9b2cffa/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/2cc00bb36cb8bc7d04aa699030317866794437ff/
    xtensa |               gettext-0.18.2.1 | NOK | http://autobuild.buildroot.net/results/35b119f575cf47fd8ce8d219fb7dd65bcd4fdb0d/
   aarch64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/0de9dd7ddcccec4c920e3a6d86d1e57565f53009/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/b00c8a8340728d61e4cc6e1f8ecdde9749685fb0/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/d509a5a7e3c7b88ef4979530088d79059d84e8c7/
    x86_64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/80a1d56fb7419f3cde9ba9cbec7064cb8238b57e/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/e28f636770afd5fac6f6f9ca303022de4e54aaa5/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/998565f99adc5b848958817c8da1f39a0918338f/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/7441ef583d4f9a3dbd9418c889800a2241dd8fd9/
    xtensa |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/280d926881540bc7d0c64fb0e134118e15ca3760/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/3fc258ad84c2eab90322b311bc8bd9ee67caae34/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/9efd9cf1292c99606f2fb0c91e5b2dc6ac7b5ba6/
     avr32 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/73cfb5a646f6f0dad95bc8e14bcf6f6ec51e4325/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/17acc827b7a3b169290889dc7870965fd5c16390/
   powerpc |                logrotate-3.8.4 | NOK | http://autobuild.buildroot.net/results/734df23d3adb358e95e617510e80a8ca5f2fd133/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/c632cd1b63718c060ea9a89496baed1a793eea0c/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/cc5f1f85c40af813936783983198a86ebac0eb6e/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/83b8b06cfd844439ecfd796430ca7f55ad2bbc67/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/3d3c9cf3c1b56059c7a18dd934cbf10cd4ff888d/
       arc |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/d7a138d5411cfec0e1ece139411f75c4c6b8cca3/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/329fef4f294802802c3f4e1580bbec4d3e7b02d4/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/3388bd7de264675e3c79547888b7a65861880352/
       arm |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/f531431c08af650ae1e050f8e9953b754db5f75d/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/d46c41b355b1b20a938b4d3ecd0bfa3a1eadbf8b/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/c51acbf60efab9aaf247c38e33cf31ce87bee560/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3bc6ea01556379db53da79dd6e4a8758208f98e8/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/40c6adc0881b47c1fe9f1fd9d4b89c730c22b713/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d2ecd135b7e1fd42b0f414c1c00cc7fb870119e8/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/dfb1e72a9a434d561e5d23de34ea55b7bae5eaf9/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/1bdb5e014daf76b701afea5c82ac83ac4c97d4cb/
    xtensa |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/a290aa34bd44c0e08f7aa44a7c606420668eef6d/
   aarch64 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/c35175f6dd147342272fe86f6c1feae55c2027bf/
    mipsel |                    squid-3.3.4 | NOK | http://autobuild.buildroot.net/results/2af3c61c06b3a517ce4daf839c1eb31b594bd2fd/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/95ff42731928594d60207095ac0c01fe9c439469/
microblaze |            xlib_libXdmcp-1.1.1 | NOK | http://autobuild.buildroot.net/results/0dfbe1bd93466bd7a24a6e34e3ce2b3f82204ba1/


-- 
http://autobuild.buildroot.net
