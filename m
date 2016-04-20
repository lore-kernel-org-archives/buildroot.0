From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-19
Message-ID: <20160420063023.B54CA101F97@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-19
===============================

        success : 116
       failures : 58 
       timeouts : 1  
          TOTAL : 175

Classification of failures by reason
====================================

                    yajl-2.1.0 | 10
              freeswitch-1.6.7 | 5 
                  ffmpeg-2.8.6 | 5 
               valgrind-3.11.0 | 3 
                    ruby-2.3.0 | 2 
                sg3_utils-1.42 | 2 
                 jack2-v1.9.10 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                 libgee-0.18.0 | 2 
                 mbedtls-2.2.1 | 2 
            lttng-libust-2.7.1 | 1 
                 rsyslog-8.9.0 | 1 
                 libdrm-2.4.67 | 1 
                moarvm-2016.01 | 1 
                     mtr-v0.86 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                libpjsip-2.4.5 | 1 
               ipmitool-1.8.16 | 1 
               opencv-2.4.12.3 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                  connman-1.32 | 1 
                 mesa3d-11.2.1 | 1 
filemq-acf6c0e003fee938994a... | 1 
                linphone-3.6.1 | 1 
                    dash-0.5.8 | 1 
                  c-icap-0.3.5 | 1 
zbar-854a5d97059e395807091a... | 1 
               libepoxy-v1.3.1 | 1 
                 mono-4.2.2.30 | 1 
                  ltris-1.0.19 | 1 
        ltp-testsuite-20160126 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                pinentry-0.9.4 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 

Detail of failures
===================

      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/077374329b2782dbb4b4a9ee7af264cdda311ccc/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/c8435f39e74f688abfcef955285d1a07395db6f7/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/382f41e52c481a87721ff7571da36947b3035bb2/
       nios2 |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/7f9ec50f20dc32c659d32d209e7d52b4ac860c65/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/5e95a4c111f71e37e3c002e266f1eb09611e9248/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/5fe4322b646dfc275487a166979fe97de9d76ec7/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/05f9a4e882c13f558f2456a8f8727b28a0aae6ad/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/cc57e3a92b2d1c3c16c35bbcec102cbeccef0d75/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/179f3e95c76438d8620b7686ba232fe2c1eea976/
     powerpc | filemq-acf6c0e003fee938994a... | NOK | http://autobuild.buildroot.net/results/1d1987ac43d7a661511812c2131912255cc07904/
     powerpc |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/219a93c93f77e334fd2c7cab36851586dcd7f814/
      mipsel |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/bac47f9b288cfd23f44b5dd942546d40ab217aaf/
    mips64el |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/fe71a3ed34820ff5b97a469b1c9caf9197028f46/
         arm |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/88df05a137c2cef66ca548d1c3d22ffe45270502/
     powerpc |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/dd4bab0cd6f0fe3a30c3fa09cad180daf4d5e97f/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/a60cc63a125575e98de0785f417856af427eba58/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/458179f5a454db8da301b896992daabf9931b2dd/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/8ed947e2aa4990a046c09db74962161ff1c4f699/
      x86_64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/497fe6002acd6ed2626c06c9bd0aa2db21ed045d/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/b0618939c799ac54ff021e6dbe2c5367269f17d8/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a9189f8463ee0c6a7a8cc489b2665d944c5d8605/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8f3d2139de7f85f729e0555f8513fdbd177cbadd/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/84f05597173daf65918452616ec8e0b94a94a73e/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/fecf1ffa71b3ba9e08288b5520a864403ffad8f6/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/1ac6bec0902fb08e80d4343b5788f2472aa3bec1/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/3ab74f73c5d701d4638b7e4e95916941a7a39d44/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/1074b3ddddef895cdf2fe742fffd339787e9aaa1/
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7733ee4472834d26cf6bdd4ca557ac19f97290f8/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/74c796df8fdba54b77986e2f780c300bec1b491e/
      x86_64 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/a13f7eeecd356ef144e79947be1c6453ed2b124a/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/d70427558cbc0ce18541186461a252c83cdcac7e/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/5d4b38c510ecfe8e9a968eabaae01353c6c63950/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/5a2196a42f38d6786d71cf21cb9db051fb3914ee/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/f91964ceb789435c347468d6ba22d9e0da79a1e9/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b0020e12c2113f00371b7c51f781c4b349dbc2c6/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/4ee664cd869cd6547db4f72723c828b07656cbd1/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/9a7e168b48f3f786b9c3cc148470b6ac91612619/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/b6a332df6cc61c5e9df2e5a45b1ec6fa160d3200/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/caa6ffadaae5e0dbcd52510401e78469713f4e9e/
         arm | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/b2626e9e9acb26d6d97c70893b2dbc1b2e730274/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/12e6f2cb8b60c15fe6379fbdb571d68921552907/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8cdd54c8f4ab1d899e145c74587ff93c392fef42/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7642862b6984693dbcdb50400b978cd2693c8c45/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/cafee791a6f7a76ad115cc31a598d32a0c42843f/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/01b7308067bdbba2a9eb0c6fc11c8870b9df63a2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/048c2bf3cb52f367f4a291ce1c96467d0e87b858/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/940631bf5a76d0a58b0c9e53800468129cc44284/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/08177eebf6e7c1deb407855de31987c0ad3b9886/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/51b496e51c8664d3b3db8ae4e05e4af6a5fae750/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/30892ffb298acc2334f8c694038c420120fe43b9/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/776907586e682c0badece6f7d5d004884cfc16b1/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f116a0b63aad1196f761e7339539be44ecbccba3/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f169c306c388da47c1225748c06ddb9d36268c39/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/92b730a74c4e7eb6e9c0be9f28cd863c1162896b/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e16a162324161f5112fa43c59958498628981037/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/1aded25a6363869b745e6e2bf6512b61a7f43f39/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/ad5e589eaf6147a91e78d02cdb2464527cb84bc7/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/05b1847bc838a328e7398d03a4bb0efb95ef3938/
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a02f5ed6a4987d5833060a9ff59d3ae6d2942e9d/


-- 
http://autobuild.buildroot.net
