From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Dec 2019 07:18:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-05
Message-ID: <20191206071811.D431988A5E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 27  |  3  |  0  | 30  |
  2019.08.x  | 18  |  7  |  0  | 25  |
    master   | 130 | 91  |  1  | 222 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              alsa-utils-1.2.1 | 21
                    libffi-3.3 | 12
       alsamixergui-0.9.0rc2-1 | 7 
                 uclibc-1.0.32 | 5 
                 samba4-4.11.2 | 4 
                 acsccid-1.1.7 | 3 
              host-grpc-1.23.0 | 3 
                    strace-5.3 | 3 
                 libv4l-1.18.0 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
                oprofile-1.3.0 | 2 
           spidermonkey-60.5.2 | 2 
           uboot-tools-2019.10 | 2 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
                     gzip-1.10 | 1 
                haproxy-2.0.10 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
host-google-breakpad-7515ab... | 1 
            host-mfgtools-0.02 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
        matchbox-desktop-0.9.1 | 1 
                 mesa3d-19.2.6 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
               protobuf-3.10.1 | 1 
           python-brotli-1.0.7 | 1 
         python-cchardet-2.1.5 | 1 
                snort-2.9.14.1 | 1 
                        stella | 1 
                   sudo-1.8.28 | 1 
                 systemd-243.4 | 1 
                       unknown | 1 
    xserver_xorg-server-1.20.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/88c0fee111769b04d9361831ab207bd507419725 |     
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/ec6130d9f60df01a77c562639c4e55fe76ab7814 |     
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/874dc7b65ab51d9f80d98115978647118575e06a |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/8c1c87e77a182ffd269a4290cfb2b32c7e33a151 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/76930ce5d3f0970729752316bd3b33a02da9e1fd |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/74c01a9aab27a95a568225117771b9341f88a772 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/1793448d106933084be0e52eb21d6425ab916039 |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3174ca33376091814c9ef6df573f6b3937acb454 |     
 aarch64_be  |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/336357ce3e094b0190ba0da99594c417b048f128 |     
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/0aa63d32536df8f07b29855b8f4b3ddc7ac890f9 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/8a082ea252589f64c67c3c190f21aaf086c91c96 |     
    arc      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/5c3ffadc0a5d86bb46e1b070dd0daee31d962cc6 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/1dee9ea0bcdb9e369f8df7c18701c7a096e2697f |     
    m68k     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/cf2601b58849921605661c12f34100f30dfc61cf |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/40238fd97c160324cd4684fb753fc96c5efd5824 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ef761861a782645f0a1ca79293969cf4f3311e70 |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ca9c12b7fc0e0698cc16519f06b2da55bdb65c30 |     
  riscv32    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ff865fa22a5f12493126fb5102d85a6259c83f63 |     
   sparc     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/380e1427cacd02cf81c7e2673e274c2d5692d820 |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/85d9ce98798628091ac21bd7a6db4d67af1187f7 |     
  powerpc    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/34956fdbe737594f0d3e66ee61b0d8dfd19c4624 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/418406ddb47167f1f6b1c057d5b741184980cf02 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f722a7f97d01f71073e532d704a589626c15276a |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f0effb7845d0df3d11996a4ada8ee2c690a0ff87 |     
    or1k     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/b54161e68ffae4d042682d90095c16fdf7b8d893 | ORPH
  riscv32    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/a4589b113a4fcaea3adf66f19f19fb9f47602503 | ORPH
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/8585cb065d6fb7051f17e99512f644e3da3c26f3 | ORPH
    sh4      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/27d74c5e69e59661ed84e8083e53a86c27d51e99 | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/edec1f9097269c3aeae04617da20f0fcad648551 | ORPH
   nios2     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/130a67764f5451cf4d26dadb879d482bb90ea327 | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/7e14b7c616f55c8d8c3b07246e939c4ea6573a9d | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/49b289a1c49b174c555353085685515b8152f35e |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/4362161989c507dd44bf5a7d943b1bb55a6c6685 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/0318f83c6ed921284d23b01030c4b7066b1799ee | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/28fa59f70620758fd384aa3fd05e8c4af1d8620c |     
    arm      | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/7b22a2fd4d25f22bb6e2f11b6244a93deaaff40b |     
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/3f081db06abb05dc7d3d3d0ef43ee444d0ce490f |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d0fa754b17435bfbcbcd560bc39eb22cd84dbfab |     
  riscv64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e3d1f3b4126b2cc07e1d70e7619b3362c668e8aa |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/841f4d1dc3002a6aa358d9c6da095180e3e700fb |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/cbb86e9fa4486a2a3f3d233e00f32ec93ed32af5 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/6ff14690c039fd96933bc80fba7a7e4639ee55a0 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e8a0b4c511ad6db887adac0fbee0ad4472fdb7a7 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/062f4258ce08d4afd728e7b06b04ab6707df481c |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9fa515d8acaca54f8ba7f06c1aee4826afa18a63 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/79915b4f1c3b92d85a3a5a54e80890275577d112 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1f7d8b6879b24f242dd76e9f2135cc2282b93202 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3fcef92f09fafe4247fd5d6eaf9825a308fe5992 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5925dc1ca97dd1888337d7a81535b5a2603d2d22 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/48f0e960e4eeff251229b53778aa08de74613a09 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bbeeaa594d4a3786551b59fcdfda5f634bfa82ff |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9eb944896e04fd24d1a03ce471213345432d2210 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bf4ee2a9ae1bc9273f6c2b9de70f235959069d35 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a98468975027262d5e3fe2f2cbbb75e2a3cff7b9 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/e6f17bba9d42026dce3f6a76569b8da2fe9bc2f3 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/d01d51e5666008a59351ef4a68b4a77b2d5d30df |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/e732daea44f51e9bcba7ead58547a0b0c86a6ecd |     
   x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/d915a8466afb7d6fa1a52ca38cbc4fdcbb340991 |     
    arm      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/9e14fde02588c1cf0c476fb52e482bf385c45f59 |     
   x86_64    |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/f154d03f927bcd7621502057ccd1e55ac0e3f766 |     
  sparc64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/ec7f8692cdc7b18e239729bd8bce514ea35aab47 |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/a3b54e9bd33d2c706104c56fceb18f5fbc6154af |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d57bfc84079b395f1063fb219733884e3e2061eb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e9f5412fdf61313c6d30cb5e394b4967f0153650 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/0e51c15a9a8c24e4d86d677c5714725bb666add2 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/2c7e803219698ca1dd8654e32a44f9532a0d798b |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/e0702dfa469c9433f9f12e3abf02e732b67cc614 |     
microblazeel |      python-brotli-1.0.7       | NOK | http://autobuild.buildroot.net/results/24b23175ab27615fb377bb4d5f6c656dccf10a86 |     
  aarch64    |     python-cchardet-2.1.5      | NOK | http://autobuild.buildroot.net/results/14118090b1813c4e5779426c998bcf8b13de3521 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/236cd4ffa51e30b088e6600a2feb9c557df5d739 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/e9cce1c7f7fc4d83aeab2345c76447eaf1ff5884 |     
    sh4      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/9e4cea95c3a4495e8bfe056b431eb4d35ce745c9 |     
   xtensa    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/05379f2decf22e70314b5f0ba17f8973c2ce1698 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1e0299c257e08090d5274d4878c113255359ae7f |     
  mips64el   |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/84b9e3dfa34166ed1e74723eb2ce70dc4e95e526 |     
    arm      |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/133d6b4a6dc831a80ce0bf2c446fbaf6c49ff6bf |     
   xtensa    |             stella             | TIM | http://autobuild.buildroot.net/results/fd90df62b793a2f1d768224db43e8989e364f9b3 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/9ac1b7720bb77b4b8b09ba1cd7c163a664424ada |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/b91044144169d367d1579d3535ed1585da333448 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/d01d94bdc05e04e0511a7048ec9310cf4c37218f |     
    arm      |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/6ef7136bee3ad0f34080e6abdcf53af2bd7619d8 | ORPH
  riscv32    |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/c1ef16cb64ff6a583ee3de5f883211ea4d3fc8f2 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/6119d894d264454ae054e20079fc112987bc8d3e |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/5a733fbbff65aaf8b468c901058c8f3ee261ea83 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/a1b1bde302f9bd26851084c69f9a09ad598f847c |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/98e7121682a9096212f568dbe590994692e344f4 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/9cb4417e0e965eee21d35f4bc89c052d4f099735 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/2880d6b55c0903a2e9a8e3993efb4f94a5d83579 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/9f2ab85e45eca4c98cae6b1f8fa80487a5015e15 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c202cb54a4f296422a25e2ac10915c75b56caf9a |     
  mips64el   |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/4df03009e25c1bddfd666f58bddf20e5cd6e80ef |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/215044c6b95bca10994765c0c03725ebb8be974b |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.11.3 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/384329416105b3439dd77ab5886c45f6c060037e |     
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/2b1c2c08fb416625d1b87704ed7d9fec8d19f27a |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/3b119d8977bd36d5abc246d830ff304b5ec0ebb3 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 4 
                   dvblast-3.4 | 1 
                libcurl-7.66.0 | 1 
                 uclibc-1.0.31 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/e93bfca844fa73e4d400d8b77705ac815543bbe2 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/2478571848b51e51714fbc9ad3ffe18f62c0508a |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a5593ab44a214596a1c8f45046053bbf4a085a67 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ef95cedcb296f22adb1eb84b77e813dc8198e63d |     
    arc      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5e2bff0dcf495ab05457d2b11cd31c50e84e5528 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c90f4a59f3f0c141d62d5b8e2f20523c2cb0785d |     
    arm      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/c77126bfd4bcedbb43b28272b3c9a44f44f97347 |     



-- 
http://autobuild.buildroot.net
