From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-15
Message-ID: <20130516063005.15F2D52C08F@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-15
===============================

        success : 88 
       failures : 52 
       timeouts : 6  
          TOTAL : 146

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 5 
                mongrel2-1.8.0 | 3 
                libiscsi-1.6.0 | 2 
                  boost-1.53.0 | 2 
                  iozone-3_414 | 2 
                  poco-1.4.6p1 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                  zeromq-3.2.3 | 2 
                   mplayer-1.1 | 2 
                libtirpc-0.2.2 | 2 
                     pcre-8.32 | 2 
                 pixman-0.28.2 | 2 
               czmq-cb9839cf90 | 2 
                  checking for | 1 
            qt5jsbackend-5.0.2 | 1 
               audiofile-0.3.6 | 1 
           xlib_libXdmcp-1.1.1 | 1 
                 cairo-1.12.10 | 1 
                  stunnel-4.55 | 1 
                libosip2-3.6.0 | 1 
         host-gutenprint-5.2.9 | 1 
/bin/sed -i -e 's%^BUILDROO... | 1 
	      echo "installing ./$... | 1 
               wvstreams-4.6.1 | 1 
                   icu-4.8.1.1 | 1 
                    urg-0.8.18 | 1 
               pcsc-lite-1.8.6 | 1 
                  webkit-1.2.7 | 1 
              matchbox-lib-1.9 | 1 
                  libnl-3.2.21 | 1 
                  avahi-0.6.31 | 1 
                    acl-2.2.51 | 1 
             lttng-tools-2.1.1 | 1 
libtool: compile:  /home/te... | 1 
xzcat /home/test/dl/qtbase-... | 1 
                  ne10-88c18f0 | 1 
                directfb-1.6.3 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                 nodejs-0.8.22 | 1 
/bin/bash ../libtool --sile... | 1 
                wavpack-4.60.1 | 1 

Detail of failures
===================

       arm | 	      echo "installing ./$... | TIM | http://autobuild.buildroot.net/results/6fcf0a4440a95db4e6d5ca64ff27002dc7683b33/
       arm | /bin/bash ../libtool --sile... | TIM | http://autobuild.buildroot.net/results/7477adec1701de72e23288b55130aa59132bdf49/
   powerpc | /bin/sed -i -e 's%^BUILDROO... | TIM | http://autobuild.buildroot.net/results/a51822a4a5705f175304dc6de8e5a4b3f4ba3f92/
      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/1eb5a61278230c44dddac0904f037d03815de159/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3faae6ff555b137d6d23206f0a432e8ff2ac843b/
microblaze |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/51a41ef5e8b38a0cf871d74831c222f2ba5f2f7c/
   aarch64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/555db9335d6e0de22d92cb62b89e7652bce6224a/
       arm |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/709405963be733b14f8b46641621c057c6d22994/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/71a85eaef165e249bd51d70fca8c7b2f1bf1ae7c/
       arm |                   checking for | TIM | http://autobuild.buildroot.net/results/2416c19f457db9d031aeb07b1b88f53f17992b62/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/4710f937056df27486f006e694ad4caa9123d9ae/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/69acab2c3946719266958307fc046562b5fb2509/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0f2a760b94069ac915d856cd1ae1998e5483807a/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/6f85a86e03ffb758458b42623c7e398e2f2ee587/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9fbed3cd26aa8a278fa6cafc017524fe6b095f87/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/bbe6c72ac9201279d0918b6ca372a8fa060ae7b1/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/6854c3e64dce573552a68738c975b52aa33bafb9/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/2f6c0b77f64d251a5b52a2499905efe92fa8955c/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/f2eac986ce2321d286cc9d56b3ff24ba415340af/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/64a2c0e2c86415d3ee089180dd28ac8c2356dd14/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/8770926568a5e7ab45d6672edbae32c88f2df3fe/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/0be1e0dbb6d029f5fc80080b0b7b333929b0512f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/a133e6c5e86a97904b8e80c9311353b1a7f3cb17/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/508ca42a95a9ae6ad3c4905fa220426c09a86c56/
       arm |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/8e32f222ddeba262ee2471d22e1c6a8afbf241c2/
       arm |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/dcfbdc1a1ee032881ad5e2f7ca6622d90fc7cb19/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/6e16b159be71a71fc6d6525cc470c43dab41c0ef/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/91811cebcf7028f0521d6fb1e2f3ed3a4d59972d/
       arm | libtool: compile:  /home/te... | TIM | http://autobuild.buildroot.net/results/92e4fabcc2699d0c0e9abe410010d6c0a5ff6266/
       arm |              lttng-tools-2.1.1 | NOK | http://autobuild.buildroot.net/results/e094d16d4e431edceff117ce5b9f1d5d2f393346/
      i686 |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/c2b2f1ebd00fdbe00ceedc0e14879aacf50ad5b3/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ffb02fe198845ff197671f9268182e53179e95b5/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3c77439e0fcd363afb9db7b944e06144d12afec4/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/eb612fef88655bd5b9d75ea4a3f9d11506def2c6/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/a161f1daa7dfffe8514e9a071204408742fdfa89/
   powerpc |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/dfa88bef5b8cb9a7c30b4e271847b24da587de8f/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/91be935e0b907dfca6f490c145ee7980a2fb9d8d/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/d1c0aced6971688b16a2089b72fd9e2cd415ca5f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/9df41ff2f9926cb5703b736d3a926f1aa277ccb2/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/8f5246b89c173f67506860998fe754319e0831eb/
       arm |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/f9b55e0c94dd316aa0ae8697d3b2dc5de4b59a13/
       arm |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/90d0640b6ded69c12dcb0032c1b45ee4728f9cfb/
       arc |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/f1e18f6e24428c2aa0fe27cf7c5a68bfb0dd44a7/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/7f5e309a3db8227d463a0210655a2d8f4535d234/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/2c37ac8db322dc4abbe8f2b5083abdf086e4ee11/
   aarch64 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/9847702b046bed59b07f0e075a58b1f31e9236ce/
    xtensa |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/b6d789a3c9cc4c4e5ba165040be04240938d4016/
   powerpc |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/19f89537615efefa59b31b61e18830467426e790/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/cff92b9fe10bb8023a8aff8f8abaee5f3e895006/
   aarch64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7d07352f1fd5741c5d9b34396ae60548d35f9775/
       arc |                 wavpack-4.60.1 | NOK | http://autobuild.buildroot.net/results/34a8d1f19b3a86a6a3b08f99c08470640b9137aa/
    x86_64 |                   webkit-1.2.7 | NOK | http://autobuild.buildroot.net/results/2e73547ee2c501758a129fc7c5c1e3dd5501f121/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/8282f47c88fec6126de7484e82493d39f2cac1e6/
       sh4 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/285b04aecb5a9851fe0f2a42b44c9e968cc041da/
microblaze |            xlib_libXdmcp-1.1.1 | NOK | http://autobuild.buildroot.net/results/1245e6dc47456460b251ade267692fe2187593c0/
    x86_64 | xzcat /home/test/dl/qtbase-... | TIM | http://autobuild.buildroot.net/results/f656f09b13ebed78a9770d40bf2acfb9bd35045d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/bde73e4dc0ec3c09e13967eb529f6f2622e701b0/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/dcc9e799771e97a78935e6e69475af94855c7c4a/


-- 
http://autobuild.buildroot.net
