From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 08:00:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-15
Message-ID: <20180616060040.2C9CF20A2B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   2 |   0 |  19 |
   2018.05.x |  21 |   1 |   0 |  22 |
      master | 135 |  77 |   0 | 212 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 1 
                    quota-4.01 | 1 


Detail of failures
------------------

        m68k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/e6f4229d06aa0e28702f93446a07801926f33dab | ORPH
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/19bc1de5b0d56aebb07f1d53722820f7af33d710 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/fbe2810eb9b46e572dd0a74a05fd04c82301efe2 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 22
             freeswitch-1.6.20 | 20
                    host-rustc | 4 
                libtirpc-1.0.3 | 4 
          mediastreamer-2.14.0 | 4 
                  autossh-1.4f | 3 
               mono-5.12.0.226 | 3 
     toolchain-external-custom | 3 
               asterisk-14.7.6 | 2 
             host-aespipe-2.4d | 2 
           musl-compat-headers | 2 
                 libidn2-2.0.4 | 1 
                libmpeg2-0.5.1 | 1 
                 libnss-3.37.3 | 1 
                     php-7.2.5 | 1 
                protobuf-3.5.1 | 1 
                      qt-4.8.7 | 1 
                  samba4-4.8.2 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/89b40dc0fafafbccd2eaff98eef9a9db5d19659a |     
     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/ced60796d9530c79fa37103bc19042d453ce7c23 |     
      x86_64 |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/706548349b6a4b4782fda7dbd877e24cd77f39f8 | ORPH
      mipsel |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/26619a53109f5b804d47219354b6a48f5ad2f2db | ORPH
        m68k |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/d6e5e589f963f9d11aa13a73e6bd1a78ad43e3f9 | ORPH
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/5a4872a386a8833e74a9deea59acb3854cfe15dc |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/173d9222e63c04046372026b843f78eef59f0e35 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e3ea5a9db205752785d4b994eeb2df91d2abcebe |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ee01d6f261839ed3258ff4918629a80be5ff4f47 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/f1c3dd814c61ad584107a631f0f077e80b96ecec |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/1d21b684c2fbf2b09ef2f555597556f48876faf3 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/f128388361a07013791f7e7cfc1f2269057b2160 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9f34d37c255008969c2139b0ec2e1b6fdc8f7961 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/1f47c8b2a2436be4cec675d523ab84ddec081a36 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/e0b37351176b295a7fe4a2f3abdc82e57d7786a6 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/87bcfb5f56cc449ec6104e6117492886905b492e |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/dac41b58071c98b4485e3d83c96aa52770519764 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/69dc12f646bd1d0af8f9364ea13011b430262b60 |     
     aarch64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/63cf9fc5c3b332dd287ee8233f3ff4776e3da1ed |     
        mips |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/858eae9708aa0d1435f6aacb5823cb745a1af644 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/feb77fc5139d527e6212b75f0185fe85443eba48 |     
   powerpc64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/81d628fe95f35250b316c82b8efffc7ef60a1b86 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/310602dbb6a7c3adf86502c8774afd3bd31c0f4c |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/11d598723692c6dd0102b67fd4810da656b63cb9 |     
        i586 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/addb73c7555fc15ced3aecc65a580ce1ff6366ee |     
        m68k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/90dd6921d6eb672b65db8d21b3d71fbca398a963 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/7d16a711822d7c84f18866e4b15422a1cb302962 | ORPH
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/9829e40f26807ba12e01b7d13b838b39c70b6fe2 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/b28400510f906d9f0b1320cf7a407aec5ddd8418 |     
         arm |                     host-rustc | NOK | http://autobuild.buildroot.net/results/946e99b7abdf49549857847aa563c2040b0af210 |     
        i686 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/75a74bd6ed764af8b11c6b65b7c2b84a18f1ea7b |     
      x86_64 |                  libidn2-2.0.4 | NOK | http://autobuild.buildroot.net/results/5a14392db6453aa58206813c349853ef4ef6eda9 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0b552570ef4779c50d247015d8ede82eca25bc0a | ORPH
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/35f7c9f759f45c43d243f938f85f921f682a0106 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/0070204e0c711487036219f162ab40e834c749ea |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/c2bc2142c442242cc7d261e3825ec4a61d944bb1 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/30c61b3c8f03cd539e1d55b18698a32a76e05bee |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/631ccd2e786e74946b3db39cacfa458189ae5b48 |     
     aarch64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4e7e4029c70ed9ea2606b2442cc3c9ddeaf6f0db | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/38a9a2b9bdac433cb9643ebb85163698e5bf21dc | ORPH
       nios2 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/34fbe1ee0fcd43b37386588a21242a27b6aee70e | ORPH
microblazeel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/63cf4688486bf63f01479e2c5a57a96e7e582c96 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b8a604e5dd7f03bdbccc9ec39c759b5daa9cea0c | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/28fcb40a271db868ee8bc9000f883f3ac29fb2ab | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/02b91e1970e90dc939ccba17a4d728494bf1aefc | ORPH
 powerpc64le |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7c8ea9a7fa6faa419950404900952b93ffed0e87 | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/def8dad8f468a4bdc0442a1c9a79beaffd1e80dd | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/18b985849293bae4e8844872a9e961c908ca7f66 | ORPH
microblazeel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/22d00c5121fbf0bcad28af6402ae0998bf316b9c | ORPH
 powerpc64le |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/1dfaf34db96297370eb2541a5fd79aef71d5fd80 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ab9204a32ca7ef38ef426fbdc5b4a5aa4a906a6e | ORPH
       nios2 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/02493df4b29fb177fe6a59abdd12adb84a5246e4 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e6069663675751ea9515a67575982461ae7fd688 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/f505488b9e7410a79e61239ec555daac80db8883 | ORPH
     aarch64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/f484e754e56cfb68e88e04da7868e76447ca1e4e | ORPH
        i686 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d7b67493007f0bd05f7f55c2e9720516d1a02c39 | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/db71cd44b7289984eb8f9b44894b84ecf9c6c1c5 | ORPH
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/6fc764d2fe6d951cc28492e8ab1b04a7c62db87d | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/dfb2615fd207277c73b068495384a99ce820ab0b | ORPH
      x86_64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4a085946f521ce583841a0b501a5928b20fc5b66 | ORPH
      mipsel |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/e6611e99ae31acec8fe7fbc3b74d02cadf66cad2 | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/bc547a3dc115f8c04d4a91b64726ed4636e1f2bc | ORPH
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/b347dab17adc0fc246515238b4020433b8f0977a | ORPH
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/f648f6206f995d4cf2796acdec30a5555573ad1a | ORPH
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/c650b6f8ff559d6f314addaf85342da4b878a65f |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/1a0a8fc284c64633acba787b1607ed1ee0eaf652 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/886e379188fad0df08d95503e6160e23efc2d55b |     
        i586 |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/b492d3fd0c5edba9e67f7c7dfeacf6e3a71da378 |     
         arm |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/ef587f96e22b3c4fad9545eeee77ce40c4e4b009 |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/94d14cb111fd96b3649a60845807cb2876fe9410 | ORPH
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/adbd3088e24d7e681c995f8c3d1db0e14ac500ba |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ea11b0c7be50b3c4394e77032c226bedb3ba07a1 | ORPH
         arm |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/692875730b048286888a4702b1be1544edaff745 |     
    mips64el |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/c95d0e063f42c75650399a7b3a5f62dca92f953c |     
        i686 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/1f159d1a73b7d4dbdd3704e7e77a4f947ce05bda |     
        i686 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/aabe41c486688b7db5b49ea42284df0ea45ae993 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/e10df4ebf5999a27ee5aafa9e9c181a430d8fa58 |     


-- 
http://autobuild.buildroot.net
