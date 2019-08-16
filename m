From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Aug 2019 06:17:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-15
Message-ID: <20190816061806.D279B878FE@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  0  | 19  |
  2019.05.x  | 20  |  2  |  0  | 22  |
    master   | 175 | 54  |  0  | 229 |
     next    | 21  |  5  |  0  | 26  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                  quagga-1.2.3 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          quagga-1.2.3          | NOK | http://autobuild.buildroot.net/results/763d263c3cbfb9fda8a41d42cff5607f63949c53 | ORPH
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/6f330f656c6121e650eff1679938a3b36941456c |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              freeswitch-1.8.6 | 1 
               mono-5.14.0.177 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        freeswitch-1.8.6        | NOK | http://autobuild.buildroot.net/results/12cc06649cb7e74993f9f843f08c6090716b8c30 |     
    arm      |        mono-5.14.0.177         | NOK | http://autobuild.buildroot.net/results/84dbf25823b47f1489aab51e39c089a4dd01f327 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 8 
                    ffmpeg-4.2 | 6 
                 libdrm-2.4.99 | 5 
          qt5multimedia-5.12.4 | 4 
               libupnpp-0.17.1 | 3 
               wireshark-3.0.2 | 3 
                  flashrom-1.1 | 2 
                harfbuzz-2.5.3 | 2 
                      icu-64-2 | 2 
                   mimic-1.1.0 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                  cmocka-1.1.5 | 1 
       gst1-rtsp-server-1.16.0 | 1 
            host-mfgtools-0.02 | 1 
         libcpprestsdk-2.10.14 | 1 
               libsigsegv-2.12 | 1 
                mono-6.0.0.313 | 1 
                   mpd-0.21.11 | 1 
piglit-ef761094be04d14e258a... | 1 
           python-numpy-1.16.4 | 1 
                qt5base-5.12.4 | 1 
            qt5serialbus-5.6.3 | 1 
              qt5wayland-5.6.3 | 1 
             stellarium-0.19.1 | 1 
                 wolfssl-4.0.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/9c4c642422e56cea82ae362c67e3a22f5abe85d2 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b5978d759ccd025f1b94d98f803fda7b98421a3f |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/32b2642e58d5130c69812da069eaa06fc08e8aa1 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/4b1925f3aed2f3b8eb3c4588808efb54ff030761 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c1ab01d20b44816523696f9fcf711c66034f6f95 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/93cb5b8c6dd1d305d11840a4705f61961b37bc2c |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/49f58eb7f0a4236f50d55a08ec3fa86e070804ec |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/32c214b5e63150b63a5b381848020aa61918078a |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/110ab5a63dd7104581f1bc8bc86f8b4412cd6313 |     
    arm      |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/7a268af00535d0f93e94955a3beea2745cf93422 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/a405d0bc4fa6293bd57629c541c67fc73e043633 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/de8a0d3d4fa33cc897aef93895938a6cae260778 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/1ca0c5a722dc4a2413b4d7ff1c17c7698daaac6f |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/52835b34dd4d87b7d3ae3c58b7d22f2b44ed3d9e | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d962d9dd0e8635ff5affff3de972f00ce876f6c6 | ORPH
  aarch64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/33b82721f8638bcb0101a5b4ec3e765ceac95e58 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4e3e5a44a5d884e40572bc05eb6988a90a5dd5bf |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f2ecbc844d5b80fc84cbec5f52f2c893fc190440 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/8f82f855467f1567b3725b08cc65987c4275ca80 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4b64122b829f4d47387ed68951016c046227b18d |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3147b1e3eddcb4f8e343ca498031b71ab2ccac30 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/db3b34c835df733266acdd3500960c2613d7d255 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/d5cffcb7cc02f5e9ecc851cd0968f9e4aa3d55e9 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a5e80d97530c0d658cd85bb2ec185d2c17947da5 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/dd4721747d68de79913bdbe62bd7075f6db4cc71 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/72ca5f1fe0371f58898208cb6562024859a12d42 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1566549397b41fdacea89c804484be47eba1f6b1 |     
    arm      |         mono-6.0.0.313         | NOK | http://autobuild.buildroot.net/results/f66c983cb949a2f77309750a3909b1cc881d2d35 |     
 powerpc64   |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/0b67ea889f2db0da41301b8f8c8546a86621783c |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cd174b80aaa5b0bfc3ca20bf5d3df4d7365e2cdf |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/53c98005d2a14f35cf178c237d8e08e45e05e894 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6e53cff0937637fe7c38a61c54aa4fc4d30a97af |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f55f9b19ce5178259f0aeb159525d089ab0daa04 |     
   xtensa    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/56bba689187f9732b68123de5023985b427f4859 |     
  powerpc    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5f636fd68dd5536ea6546869a2d8eaf87b86c9bc |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2616b2d01cc6d2df23f1b6ce751e7fc686672f48 |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2c5d5e70f0b3fd6c6a53526042081fdda3d338ce |     
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/537de229bfbd3e809d4ab889190f1e58d6e1c5dd |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b6c6cc00042d24542bbf4ecd7749aeaf2f4e86f3 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/5878ae1a686e43291f7f640a20f2311c1cf0aa8a |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/fc7bcc6b3ccf1e075dce43296b36e7e1cac417db |     
    mips     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/d1bc7a81d69bfd9bfeed0872bec2f2ce790c90c7 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/d66c2a919800dcf0703e81dafc4b6cb0ad9adf00 |     
  aarch64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/3ceda4bdd6ef2890f699a0e4fb8e227df792883f |     
   xtensa    |       qt5serialbus-5.6.3       | NOK | http://autobuild.buildroot.net/results/ddacee1d09f34fc718ef05a6e4f0bbbe26cd56d1 |     
  aarch64    |        qt5wayland-5.6.3        | NOK | http://autobuild.buildroot.net/results/e5ba3451b2ffc40d3341281593cc542c8d968e4a |     
    arc      |       stellarium-0.19.1        | NOK | http://autobuild.buildroot.net/results/01452113e984de0ddf177a513d20287c96ebe0a3 |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/691c1b9dbb2e5eb713ea9874119bf268e44ec881 |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/b1a6e719c7650c237e87f8e9e7daef3d15ebadfe |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/3fdf127dfdc5e5e7b084c03489ce254b8b54a106 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/fba2c8b8d5f4459aa44a1af948b9dad2785c1ab1 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/e8128803797e8e46fad5ecba1dda10802caca62e | ORPH
    arm      |         wolfssl-4.0.0          | NOK | http://autobuild.buildroot.net/results/a6ec3f6410c6ec4848e36a1ebd72f0a20447542c |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/8f32623aa338ad29e5262921aec16d7552447e03 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 2 
                  flashrom-1.1 | 1 
                   mpd-0.21.11 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d3f0af8470836edce17994a146de657cca7ba8d6 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8e426a20997ecb70bdbb1b76b90c19d8063ab608 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/54fb732d25f299c8227990061d81ac4745934933 | ORPH
  riscv32    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/671698af968f28a840a5b570fb036a35860e94df |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/f1593616e9633f81c6f0d8245ef512a02c0288c0 |     



-- 
http://autobuild.buildroot.net
