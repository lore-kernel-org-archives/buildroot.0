From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 07:32:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-23
Message-ID: <20200324073223.5F2E6889A0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  1  |  0  | 10  |
  2019.11.x  | 14  |  5  |  0  | 19  |
  2020.02.x  | 14  |  4  |  0  | 18  |
    master   | 113 | 80  |  1  | 194 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.64.1 | 8 
psplash-fd33a9b3d68c89fa22f... | 8 
                    tslib-1.21 | 8 
                  connman-1.38 | 6 
                libtirpc-1.2.5 | 5 
           mediastreamer-4.3.1 | 5 
               domoticz-2020.1 | 4 
                  ffmpeg-4.2.2 | 4 
        perl-crypt-ssleay-0.72 | 3 
                       unknown | 3 
              host-grpc-1.25.0 | 2 
                   libnss-3.51 | 2 
              moarvm-2020.02.1 | 2 
                  pango-1.44.6 | 2 
                    rtty-7.1.2 | 2 
                     vlc-3.0.8 | 2 
              bitcoin-0.19.0.1 | 1 
               erofs-utils-1.0 | 1 
             freeswitch-1.10.2 | 1 
           host-nodejs-12.16.1 | 1 
             host-pango-1.44.6 | 1 
              libeXosip2-5.1.1 | 1 
                   mtdev-1.1.5 | 1 
                  ndisc6-1.0.4 | 1 
         python-markdown-3.2.1 | 1 
                qt5base-5.12.7 | 1 
               qt5tools-5.12.7 | 1 
                  ramsmp-3.5.0 | 1 
                 rocksdb-6.6.4 | 1 
                        samba4 | 1 
                   sdl2-2.0.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/9ae3e5d8bfed5b0a6f7a0e10765ea3ca01ca1b0d |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/71241485d4fb39128124ae5a80c457e8a024068f |     
  aarch64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/c85caee3bf8372e67fd69ea471327fa8490ee5d9 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/b1b9f0469af3f15cbb80859ee2e5afec71f28d81 |     
  sparc64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/c668d379c7b735944a02d32ff1fa6c0691aadc1d |     
  aarch64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/feda2c8bfbde4f04433a5fcf9ddf2ac7639a5508 |     
 aarch64_be  |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5fe2f22305549ea15d765110ec95cb20f93a082f |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/031540ea2e90d12e27fe5f12c2f535f4285000fa |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6c491cbc56601880693d44c70c0ad3127bb91834 |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7c6e5cb35dffa142972ad19594c8cc092cbfaa76 |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/ad9ebbb2d5998db98f6e1a72b66f5f6301120902 |     
    arm      |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/842a3c6416416d7badf4db9f38e3b231093a786a |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/7b6e51465215792901388f08302d9095f3f600a8 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/2d874bb6f6fe9306a722912af35f142a5da8fb66 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/fce93ee0013b1e68360336095526df1d3b94e5d4 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/e7f575f4270c31e9a2c6e8c9fb5180d5ecc7e80c |     
   x86_64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/efa8e8fd50be8b89e0e45c6de563734573be95de |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/14276fadd55cd96771d70ab4ccaa166688058816 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c3a353b5a35f1655880bcac38490e8fa60beefb0 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/05afc450d8b03854e87bdaacbf774b6a73075c53 |     
    sh4      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/72644883c95307fb171b9a6e4acd8042917271cc | ORPH
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/8b04a8d101b3afffe1ac2c79e52e4bc011b54dd9 |     
    i586     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6cfa56ab1375da313866341720ce44134fae1512 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/029a32fdf8e5cfe998f1512dfed17302ebb3af7e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/2ed8acc37b00f3be5f875413590d23fbebd956ea |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/84de4ae93a465a5ef821c6842aaafe45a37d45dd |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/ba9c491e599eebfae50cdbb9aeef79abf42307df |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6cdfa9775046976233613e369aeb9e812232365b |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/507f1df212f466a0e076da931b5d145e5af83f97 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/105fba3531a89020b7e71cea5544f7ecf305384c |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/e1195988b0c5826d8805604e4efd391bc4abf06e |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/650555c72aa693a61fe2093135f87c1b78340810 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/49b14a603ad81438334977033e13c354a172e568 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/053d12758369eb09630244e8d9168c50d0e94c3e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4f7e750bf79227d2c903c5120d71fc548ed962af |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8b94a3228bb851baac987d25bc30c138dd83d300 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6a48914f6a2edce5a832fa6cc650305bcb9367ae |     
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/77d591768945821aa746b587430fc58b5d38db24 | ORPH
 powerpc64   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/216e52c07a963c7246cb986c0b648e82be93560d | ORPH
    m68k     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/f351d7c5f35fd7ef2d62014091c3b4d029211a73 | ORPH
  aarch64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/6a4e3ada739cb14e6a51ce90ee96aa099ec708ff | ORPH
    sh4      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/38a57456e50d39d316271c3c8073f70ada19e87a | ORPH
    arm      |        moarvm-2020.02.1        | NOK | http://autobuild.buildroot.net/results/606f802ca834ab8319a04411de21211a1c4e157b |     
    arm      |        moarvm-2020.02.1        | NOK | http://autobuild.buildroot.net/results/db5e6a7ca2f151b5df79dca1d9671d92459c35db |     
    arm      |          mtdev-1.1.5           | NOK | http://autobuild.buildroot.net/results/208ee4b32bd874d2626fef2a4354b4cd7f845727 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8561d75f7c620d96f5237c71675fbd7d002c185d | ORPH
  riscv64    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/ae6aada3f25afcf11cba72213d095a8cf177e6f0 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/8a47277e143abce3f0b2ce46b22a0b561d1222ae | ORPH
  mips64el   |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/91327cdf036c1530ccef2c8dc46a6d9f7eee73a5 |     
    arc      |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/c6d0deb40903a97fad951f72bc661e85148dff02 |     
   xtensa    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/fc600085fda6df42836e2961217f9729689f67cc |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/25fbbaaf7e9c8dd46bc3626edf5a331d1e023a40 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/fa6c0ab113f3b0437927ab2e93da8ae743c49127 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0f0d743d16419c1cd5a88532372ec84b30501739 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c789b0940e34d2f05b05c38e0a34d8452c10920c |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a80fd076307cfe640d69d097b08bd14e2891a098 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a79d6a22033565d037f60cbf1d077583bfb6811d |     
  sparc64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/66b27a29a5d2027eed757fa771266cc8e0d01852 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/19b2e9f1b8a1d8a8c6b7a9bd7924add9c152f2be |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/78d0d3fa2c6d0ac018a27b7c091d005bd77c3fda |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/019a484f07614c61544ffa764913e89eeb6b7325 |     
  aarch64    |        qt5tools-5.12.7         | NOK | http://autobuild.buildroot.net/results/35edf3622b2ce93401d5540385c08533d9db94ab |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/35afc6971dde2c47fc45a4ab2ed04d9494317288 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/751e6b39a4374523c2b86c38a2b873f329d9c3e5 |     
    m68k     |           rtty-7.1.2           | NOK | http://autobuild.buildroot.net/results/92689eddd063eae74e16c246a7cc5008247fcd1a |     
  powerpc    |           rtty-7.1.2           | NOK | http://autobuild.buildroot.net/results/657afa12fe782e4f06009a5b04eafd1ff19a5b1f |     
   xtensa    |             samba4             | TIM | http://autobuild.buildroot.net/results/8340f15aff46ac4ea5227f4952f044cbf535b291 |     
    mips     |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/8d320fa9e444e244ac4d0ea671fb83a4129e11ee |     
  sparc64    |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/33efe09a0eee29a4b06020b86d7f0d667a05ca41 |     
    arm      |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/318d347789fcf53f526f5fa1c79348d7620efb0a |     
    mips     |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/3e4d2db13abeeae0a56c0865b55f3f55a183ac73 |     
microblazeel |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/0cfa6106aec2054b32048a05d81282606259ab03 |     
   sparc     |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/594cd1a0d9e6286eca62b575fd1ba2d3a5e01234 |     
   x86_64    |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/04668bebc0ce9f788ccfd3729d4fefae5e074520 |     
microblazeel |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/e75f39acd1853d72d26aa0a9027040c18770efaa |     
    i586     |           tslib-1.21           | NOK | http://autobuild.buildroot.net/results/762d53443ebef231ff9eafc117664ffee22b5939 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/da5437ef55d9ca023cc8b0d10ce5a42dc330ddd8 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6a758b204609c8c456d2c8ff11af9c5923e4c5e |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/11931f4a6914301334aed12fcaaec11877060b93 |     
    i686     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/7428132d006f6b534787dc13f1a84a1a8ea7cdf8 |     
  aarch64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/0f8a6729b607e481bf7bd95954041fc27c9c097f |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/c066063945dccd8b755d23c06b8d5f5519d45b14 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  gmpc-11.8.16 | 1 
      gst-plugins-base-0.10.36 | 1 
           libwebsockets-3.2.0 | 1 
               mongodb-r4.0.12 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/5e1210d51ac8ff0568a2171ee36a2aca23bea6e3 | ORPH
powerpc64le  |    gst-plugins-base-0.10.36    | NOK | http://autobuild.buildroot.net/results/7d40817195c095d9615e1a4e9a8dbf2c44efebc8 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/aa4e7892c89538cf9c0ef1170a0801295497c7cc |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/2c7848ede7fc13480e5278528d2b086e33c25bd4 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/af6af001a8b99881904b7e21e3b21d2a1935b3b5 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 2 
                   mimic-1.1.0 | 1 
                    sox-14.4.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e6e1ce4576828099cec9c4b6ec71af573949bf85 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/05de2f82375d6c8f7b96f1a74f36d8686f7edd40 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ea52e399f9a1d0edfea9abe369d68d4981410c64 |     
    arm      |           sox-14.4.2           | NOK | http://autobuild.buildroot.net/results/3a58e5a87b84b24a8870d7d16ba46bf9412ca4aa | ORPH



-- 
http://autobuild.buildroot.net
