From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 07:54:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-24
Message-ID: <20200825075450.09EB3854AD@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  1  |  0  | 17  |
  2020.05.x  | 16  |  6  |  0  | 22  |
    master   | 143 | 48  |  0  | 191 |
     next    | 28  | 22  |  0  | 50  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 8 
                  assimp-5.0.1 | 3 
                     avahi-0.8 | 3 
                  boost-1.73.0 | 3 
                rocksdb-6.10.1 | 3 
                  zeromq-4.3.2 | 3 
               apcupsd-3.14.14 | 2 
              gr-osmosdr-0.2.0 | 2 
             kismet-2016-07-R1 | 2 
       shadowsocks-libev-3.3.3 | 2 
                       unknown | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
              bitcoin-0.19.0.1 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.2.0 | 1 
               ipmitool-1.8.18 | 1 
            live555-2020.06.25 | 1 
                minidlna-1.2.1 | 1 
                 openal-1.20.1 | 1 
                qt5base-5.15.0 | 1 
                 ripgrep-0.8.1 | 1 
             stress-ng-0.11.14 | 1 
                suricata-4.1.8 | 1 
xdriver_xf86-video-savage-2... | 1 
 xdriver_xf86-video-sis-0.12.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/cc385408706f506661f3d174a705f4615e495d4e | ORPH
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a2ac12ac92fac32ce98d3ac78a8a1dc28544e2c6 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/990e7da8823498a306a8fc0fe1f7185eb0878fcf |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7df487d5117b2ee440a07dbff9cae1b181566748 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/700699c83b5bbc92a6d248c54dda6d0187e13c9a |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a7d4fb2653b0f1be4d036ee46a44e72da0ed4376 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b8cecef92ff1ecf031a09378a83017c101d97a43 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/36573e0f04a131900b922f8c23ff2a257747ed29 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2d2c302005716d89595d2365f0f0f9460879131d | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/0292393d69729a81c89c1e8d57c75b84b2012890 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/fc585b022499c149a79784173c0dc3f146ad0a52 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/eb7390db413027dbbabfab1c23bd341bbe3ec64e |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a9ebe3b76eb945cea7aeabacfdfe68ec4806487a |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6a8e575959c2df205d41e222d80336553b58ce28 |     
   sparc     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/c2f30a8775b297e4aa74786d687f23a605d4638f |     
  sparc64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/726726fd1655de01bdf2a4d781e44227d7e607a6 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b9e7aa6fb4d60dd77a766a2566d50b9c003d9cfa |     
    sh4      |         haproxy-2.2.0          | NOK | http://autobuild.buildroot.net/results/ba65e8d5756edd24dfb2bccff42f0959f9693615 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ec977104c2e9499d13e343927a5a626a57be92b9 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/687b5a98aeaa6d45fc84951d1e2d8747146860c3 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1907fb6a186934d827b2db32874ccf7b6b41d3a3 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/383d1e4c97d13c970d739c5f6a00ac09d73288fb |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/afb05ce73342602ae4d4873dd2241aff7820e74b |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0a77b86af2906c82bf2b193c07cb487d0be147ca |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4f29f92302a0b08966fd3647d31a2ccef860c609 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/95754ddeed48de50cc7cecd950b089177740d29d |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b6231d601d6051c97d3c2a0ed3065df03648c40d |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5cc972c7507379a30c651a6236afdacc3a180285 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/82212303bfd97ffe4876b910290f2a749bea9412 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/52646839aeae2b837f4284ea2ef2cc63d689f6d7 | ORPH
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/6ecdbfbcfa70f873c39030b69455f36f030e21c0 |     
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/bfe570dd564434dcb3969cdfd8912b362baba2bd |     
    sh4      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/273c0fa708b16c8df6079b49c7708239245d05b8 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/611b0d3489fba27f8c02f77fa63e3c8ba14a08a9 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/cff2162c7d43ee0bae7d3bf1492033679a861b2e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/9daf42eabe91622a4b265184f6efd9a9aedc4263 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/cc5223e3295b98f0f7c492a1c6f959befa778985 |     
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/4196096aca91472e11d2ad4a66643a8b7ef37fe7 |     
  powerpc    |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/2438d75c6aa2efff568253bc656649f6e27956b1 |     
   sparc     |       stress-ng-0.11.14        | NOK | http://autobuild.buildroot.net/results/9624183cef5eb9639d3ffe68193f3a6fd6d6a064 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/9647b7abe88dee2294f1c0f53590722aee48806d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/139b26d807d3b10fc1481ccf8037d2773f88f7ca |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/95e39b3172d5584cff755a311def9ca4bd4cd005 |     
  mips64el   | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/d93ceccd803a941d4ef0b3000f4e616e744acde7 |     
  riscv32    | xdriver_xf86-video-sis-0.12.0  | NOK | http://autobuild.buildroot.net/results/6bdd7477f9b7a5a64ec6e85110fdb606143d62e6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/66d53ce1729b2d2e3bdd1ea4866beb6a268e4ba0 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7861006940dac3db853488ae54e6999ad25309d3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/98b682878031cddf915526ce132eaca84d9a999f |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/5a77ac0f32123c3ba09c6d44a7f2f2d58ff2ca02 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                qt5base-5.14.2 | 2 
                 haproxy-2.1.4 | 1 
             host-pango-1.44.6 | 1 
              luabitop-1.0.2-1 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/4048f68a13aa2e66265b8ab5dfccf3cbc3cacbd0 |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f3830169efa85179d9e241b8b35aea9c9db90b59 | ORPH
   nios2     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/4b48eeeee45c08e5a3448559d073b2e62a38e6f0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0558a92ec29ca9a61921079586716f2014df8268 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8564be3e7af7bc87a78871a84a6a54f3f42ec1d0 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1a3a5f0b7bb41cd6ba6df9b9bd0aca61e1e73eef |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 2 
              host-guile-3.0.4 | 2 
              ibm-sw-tpm2-1563 | 2 
              keepalived-2.1.4 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
        18xx-ti-utils-R8.7_SP3 | 1 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
               domoticz-2020.1 | 1 
                    efl-1.24.3 | 1 
             kismet-2016-07-R1 | 1 
            live555-2020.06.25 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.15.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     18xx-ti-utils-R8.7_SP3     | NOK | http://autobuild.buildroot.net/results/642a33a23ed0079245e31295a1e24113e9122cd4 |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/647652683865cda3035d4dac42461e86ea1b3ae7 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d3497f29c79c41d82ebe9573ec8138d07bca6c75 |     
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e920e4db0d1c403dc6a269ce7aa59573f262e551 |     
    arm      |           efl-1.24.3           | NOK | http://autobuild.buildroot.net/results/af0823e111dbb1088c9fa85dae629251f66cf0c9 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/89c3989e1d781175080438d49bd468b5988b2eb0 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a53b4aecee3985f31763244193e2409261f6b8fe |     
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a29c8e0ab317db97036de3e50f8256497e021cee | ORPH
  sparc64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9e8ea06a6c2a92f48f6b529e254ce255c3f47f61 | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f03b387692fb00f5849965337b1122830422a333 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d7f1043fe8ef9df03f74fe0c496b94ab8570d622 |     
  sparc64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ad582bad5eec0e778e8a38e48ec1f3570268ddde |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/5981627b82ad71b16a32ab8ac2df13369d290f7e |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1d41314c08db56f3f0dc2abe5c7b315946ef76d2 | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/f0a938660d5f38260f471031a6879145ec45f0fd | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/26ca8b6c7022255d111c5269ba3abf25723bac2b | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/027a3c02eea8ea03a12280cad476c461a3ce1ce4 |     
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/433fa9112bfde94d8bd29fe25c81fcf7ae341b1f | ORPH
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/e7b02eed90c670455c8bdf356ed097aefc9c6bc5 | ORPH
    i686     |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/0b87f2518ca9eef85a824ad3f4bb9dcd812d9131 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a808a5b7f5322acd973c7af5bf7c86f74f849854 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8ff3f17ee8afbb9b554b961999613ae7ac57150b |     


Gitlab CI results for 2020-08-24
================================


-- 
http://autobuild.buildroot.net
