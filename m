From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 06:17:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-10
Message-ID: <20190911061719.0FD8187BB6@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  1  |  0  | 20  |
  2019.05.x  | 15  |  3  |  0  | 18  |
  2019.08.x  | 25  |  7  |  0  | 32  |
    master   | 127 | 93  |  0  | 220 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 13
          host-capnproto-0.7.0 | 12
                 apache-2.4.41 | 10
                log4cxx-0.10.0 | 9 
                      icu-64-2 | 6 
             subversion-1.9.12 | 4 
                    ffmpeg-4.2 | 3 
                     apr-1.7.0 | 2 
                libgdiplus-5.6 | 2 
                  luv-1.30.1-0 | 2 
               wireshark-3.0.2 | 2 
                    xen-4.12.1 | 2 
                   dav1d-0.4.0 | 1 
                  exempi-2.5.1 | 1 
                    flac-1.3.3 | 1 
                  flashrom-1.1 | 1 
google-breakpad-7515ab13768... | 1 
       gst1-plugins-bad-1.16.0 | 1 
                     gzip-1.10 | 1 
                 haproxy-2.0.5 | 1 
           host-harfbuzz-2.5.3 | 1 
            host-mfgtools-0.02 | 1 
      intel-mediadriver-18.4.0 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
                   libnss-3.46 | 1 
               libsigsegv-2.12 | 1 
        ltp-testsuite-20190517 | 1 
                   mpd-0.21.14 | 1 
                 qt5base-5.6.3 | 1 
             qt5wayland-5.12.4 | 1 
          shairport-sync-3.2.2 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.2 | 1 
                suricata-4.1.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 
                   wget-1.20.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/705e824d71d72a01a90ed10312aa823f6b6fa2aa |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/210ab7925323e15773e0b2b979b9a18593dddb3b |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/fc5873b1eb91c7ab9d07d71becbcc9c93e095504 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/6d87d8698738ed3a69843840496f39c346a8eb38 |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1aebdb76e42db3c2a538f90c29437a68e802904f |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1b800e51a70c396c00e8c97c4036480001cd5fc3 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c54327a1ec4c2211ba525b915a66d25fc31b6878 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/bc08e9786ced2828de31d0d832c5a1aab52675bb |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5b4b0a5cf2e2b3ffa7df782652beb32b8cdff949 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ae9d51e8522181f42f1954560ab2b33c512971f3 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/83be98d252c80e8d4ad8c859fc8840e0370299c0 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/6a799cca20214786efee099f9b513a5c3ce76c44 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/b67962e0472656d92893130125c912e6b1e4d2d8 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/469b4c4541576c4edfb3c57a63a06f19a40a9df6 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a178fc1522790d59e0265e97c1f0d0b80d9690f9 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/269d9ecaf3776151532db4514793a17ad2e9c322 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/9ca35cf48490f22326f4e54bf951a78422270ab9 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/ddc9bc526f294d541d0444ed2e7060f0791340db |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d7fa9b9c3a99662d3eca109390f4245c1a90701b |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/fbb897db48adb91f8378aa903081618347c27b89 |     
    or1k     |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/118df94467628ca6488827c86a99495d0a32d7a2 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/bda642e96c341c5b819b64b033583a75e0300701 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/63c276b517c8a3f93edb2c43128d319a10271ae2 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/3255ab576c22f4e4d42493e56af4291b1ca0978e |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/bb58dbfba093334858eb0a5ed0a640f09c0263eb |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/354bbf49c46ec208b2efee9928018f55996df97e |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/93acaa1572cbba1389c929a975093fc6ccbb43f1 |     
   xtensa    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/4d5f640a2dee5de3c9f144038b8da8abd74ed7d6 |     
    i586     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/a48391d962bce728491fab1f7e2506bd3f47787e |     
    mips     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b9d02de54b2273da195e1ba332885bffc8a1e430 |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/600a534a567705872f3c241d3490f8ce63cc694b |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b2ecd167430f5e5e89e7c617134d7a39384f7dce |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f0f6b75a1c22e65ed3b51dc06dccd6337aa92760 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/275894ba65484639683a38c57ebb9b209b1e7cd5 |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/08791de09669484d91c6dd8a3d5ea5f94ce71389 |     
    arm      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/ccf6947ba359f1f17f721cb2866eff63ee35a146 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4fa51b80d00c467a4193b20a77fc6d8a20f9bd10 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/637658eec8eda7b6c046071c7a6bfd92e49956be | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7b0db028083c98439e8c9d8561e0b42dd83546ac | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/344c51333e12355f94c67e1f3d3354fbd10dcc68 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9c19852021973b69feb2de8fd93dae5159e24f51 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bd0da37e96f0ecfba52c7caab71a928cd3e2b623 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/65487c042cf97a7761227d587ca7096bdbf71fa5 | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/b9a52ff4a9a55c0a7447a1b20837b5e747a0cdce |     
   mipsel    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/862a355bab2bab587f58e6a810399918bfb66f1a |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f8534c74527e482d57a31ecff72c8a17670110da |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/fe596937fd7d9e5fd2539241e639722fb93cd6ff |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/b1a412a74d590cdac51736ba14ed2906dc6556c9 |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/00dcda3fb413ac0884083044b69a50ee195caf31 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/92319824195c0f660f846f28b28f1c238cc9bb6c |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/030c7712498fdb0d5506479c4dadfb8a12d1670a |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/445a66928f9139865b2cb73b19ede68dc6c44def |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/c28edaeca64365862a872bfb40b4d54017aa5633 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/b3dcd6bff44a8b5c3d2752c24c90c8c96966a838 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/f066abc4305d13441df01960caca842eef1d33d2 |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/43131027fc8fcebee96773b227a3bb31f11a162f |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/21ed4081b372cf608483f2cc538d32bfac001587 |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/7995befdd78664d75ac6ca42cbf7b90db1807f02 |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/319579200f23232c27132e6f009c5942c5e8798e |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/cb08db8574f1af6e1fff1f6fcaa77474ad266a98 |     
   x86_64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/595d1369794656509a85d31eef17c9839327239a |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/ea7d680720f938b12dff62e952609c90be2959de |     
   xtensa    |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/5b7670d2a01af332565e9b2875564d935ef2ce37 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/4b14750a7d1793b2b8484d2f6dba4b2700cd9fac |     
  aarch64    |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/8e21378bd3383f38d231293a2474ab1cdffdb8e4 |     
    arm      |      shairport-sync-3.2.2      | NOK | http://autobuild.buildroot.net/results/b5ea14036f95b1cc15a19e8d616a556e56bc34e3 |     
  powerpc    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2fee1973ea93bdcd61827dcdca4a0610b611c82e |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/21bae1178fabe3e6320b70dcd627cce845c15fab |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/26feed2edfa3c4b6b4567b4805cb183db6b350c5 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ae33c69d1d9bdbed512b68ccf16acc126aeef0ee |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d34e2a1793987a2a25cba4eeb87a030f223ea8e7 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/647096853ce553bc3977e5d37e17fae61757a93c |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/5ae7b83e9405711e69a55c68a8d025ecca0bcee7 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/673b2adc1ef4443d9344de963665f6a3045b6e48 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/40b5aa78011efddab6356352c97d643ced46e057 |     
   x86_64    |          wget-1.20.3           | NOK | http://autobuild.buildroot.net/results/30a7e3396c8e0927fa18916b6d841c3cea313057 | ORPH
   sparc     |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/d84c4b8e66d46fb45a5624175675f9b52a63cb39 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/1964a2657f8cc798e62fe9fb321ddbda20f32b84 | ORPH
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/a72873723700ca40f9e9914b8db258433cc3d4f5 |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1bafad088b1340aa3a87009f9cacd1b410213980 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/bb280dd4379eb4cc41768b06c93f563ed69e053f |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6c918c27f135a974ee4539aaeae7fc09a3cfd9e5 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8eda97c344d3b4e6a14707a63268c58d425b3783 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3c8eaad8f6b10dda2d908c6dc6917b0df415b5a8 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ef8b1da48a5d6fa42343c90bbb70592a5f92908a |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d19f25b57c66050caa3849d1d8207af1a3c1abcf |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/97c432ba7aa37f9d884bef6c0a664732c9373645 |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/2dc87bf65de2ba53b637693cd7bbc7b9f858514a |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/fa6ebdd29fdd6202e4e3f9a36e2cca4472b81d2a |     
  sparc64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ef138af180df2172d851b5dc9d6ed217d704b84a |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/b9515356cf7c1912c5bf87824a90d85dbc47d570 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/6866ac68341ed79806abcd337ceb6794d48ad5e5 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/8fe090dc9db493c2bdd5b8339d21754ff67188cb |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/972b9646bbdab4fc31a7abdedcfaf1777679c8f2 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 1 
                qt5base-5.12.2 | 1 
              webkitgtk-2.24.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/a15b1b11dd4df8f88dbefd80b7f2f0e39370fc0b | ORPH
 aarch64_be  |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/5e13f0e74a66680a959b5dca84fe90dd46342da2 |     
   mipsel    |        webkitgtk-2.24.4        | NOK | http://autobuild.buildroot.net/results/d4036ea2a1f515f9ace89b05625fe33e25a81b7e |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
            host-mfgtools-0.02 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
                   mpd-0.21.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/f47981f58f1e60951631e7b6fc3d56b0de97597c |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/acafd9c7a92bec1513d2ab4de56657071199d6ab |     
    or1k     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/40db13e0ed5e7a924c1f6c85fee2ad4876d15d1c |     
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4acae319d099888dd119002d09ecc9b045d2b1c5 |     
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/842d2e6c1a336125fba3c4a3df45478d6890b237 | ORPH
  riscv32    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/24a72751caeae0b1c1aa820580f8744b5da7cc92 | ORPH
   xtensa    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/f0bd443e22b30f3cb614d1ac48d1a948d6761326 |     



-- 
http://autobuild.buildroot.net
