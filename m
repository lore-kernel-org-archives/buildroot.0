From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Apr 2020 06:27:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-25
Message-ID: <20200426062745.72D46865C1@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  | 10  |  0  | 32  |
    master   | 188 | 157 |  0  | 345 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 28
              ibm-sw-tpm2-1563 | 13
             paho-mqtt-c-1.3.2 | 12
         host-exfatprogs-1.0.2 | 6 
     python-argon2-cffi-19.2.0 | 6 
                     avahi-0.8 | 5 
                    brltty-6.1 | 5 
    python-dataproperty-0.48.1 | 5 
                  assimp-5.0.1 | 4 
              host-grpc-1.25.0 | 4 
               apcupsd-3.14.14 | 3 
                   expat-2.2.9 | 3 
         libspatialindex-1.9.3 | 3 
               libtasn1-4.16.0 | 3 
                   mimic-1.1.0 | 3 
                    mpv-0.29.1 | 3 
                qt5base-5.14.2 | 3 
                       unknown | 3 
               apparmor-2.13.3 | 2 
              bitcoin-0.19.0.1 | 2 
                 exim-4.93.0.4 | 2 
                 openal-1.19.1 | 2 
            pkcs11-helper-1.26 | 2 
     python-mbstrdecoder-1.0.0 | 2 
                  rygel-0.38.3 | 2 
              spandsp-20180108 | 2 
                  zeromq-4.3.2 | 2 
               acpica-20191018 | 1 
                   atftp-0.7.2 | 1 
               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
              ejabberd-19.09.1 | 1 
                    gcr-3.34.0 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
              gr-osmosdr-0.2.0 | 1 
                 granite-0.4.1 | 1 
             host-pango-1.44.6 | 1 
             kismet-2016-07-R1 | 1 
               libgtk2-2.24.32 | 1 
              libostree-2020.3 | 1 
               libtheora-1.1.1 | 1 
                  monkey-1.6.9 | 1 
                   mpd-0.21.22 | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                 opencv3-3.4.9 | 1 
              pcsc-lite-1.8.26 | 1 
               protobuf-3.11.4 | 1 
              python-pyqt5-5.7 | 1 
                    qemu-4.2.0 | 1 
                   uacme-1.2.3 | 1 
                    wampcc-1.6 | 1 
 xdriver_xf86-video-tdfx-1.5.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/8f6355d4e08d9d44fe0f5fecc6b13977b947ffa4 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9c531a6872f25190588ddcae68396b78be552c91 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/38031a2e0909618c55c7a4f6989f50444c3b6526 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d35b67f03894c3a1b5fbcf468eb5124350ab7d34 |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/8bf5ce74721f828b01fd708443d020cdf8dc7d3a |     
    or1k     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/654cc0bb5e8e7433f0eaa674ddb987b58077c75e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/805d283d19d4f32d898cfb857ede670dbe9fb418 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7853ba43b00156a24251ea35b821d9dc335a4011 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/10865dc076556614be05e48174276c4ed2d25951 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c755d223ce28dce09a359f735c32bb99afab120a |     
   xtensa    |          atftp-0.7.2           | NOK | http://autobuild.buildroot.net/results/cad334587315ba41368a679484acd7ddc57fb313 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3c66c2857e4f451a9f910b64734b21e0446eb99e | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/65653118c22e7f12848677491db14415b5501769 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f691c39b3dbbe4c9ffab4b4d1e9cc8139359b418 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d7c31a68021d7de9efefbf3f8f08f2f817188b94 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b6f1bcfd2764bf8e0a3cb1e915d12877982f5195 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/08ab35ef1bb4992e676492e79682d82f7b70f1b9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6eedeead96c8060aaf4c72a5a53801831adc07a9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4747ad5ca151d99062a3e77360eb763ce4c3ed80 |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0a58e145d7fcb6bed99c7cbd1de79532e8e6da56 |     
    or1k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7d1b8d9a465a1b72341a3e0f0d519cd9cb15a591 |     
    sh4      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/4875011cb84a84d18fe043a153d49dfb7c89fd91 |     
  riscv64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/3fe0e9c89d05ac73b735164a4cd4fc7c36550bbc |     
   sparc     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/16b250a07eaf3bfe6ac1ae468848b5499840df1e |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/c06ee980f24980992b34f4940de084c553a6b107 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/d375c688783626e1902bcd87f702ebaccbc720db | ORPH
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/e58f09bf2fbb37b3be961908dc26885b562d2d83 |     
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/a3fc84ceb59acb089dcb89b5f9e8ab0a089ecc74 |     
microblazeel |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5287a63828476ce30a5828b47a633a575ebe687a |     
    i686     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c5d8f5548cfdc3661a1c368461d80c873ca90117 |     
    m68k     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2377df3fbc2bcf7984e62318af945c990626c1d0 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/0f95c13683f6d71451493a2be79d357943aa3bc0 |     
   sparc     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/81f7f85c54fc0b6285c9717881cdb49f7e1d905a |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a7686951b12000f1d58c7ded8b928a06e39838d6 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/f33c78dd5dceac53568b0c8c0df6682f88cf125f |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/4b75be8c4a8afbd4c689a3cecf98bfd1765609c5 |     
  powerpc    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/afb3cbb1c7bf155b9f8b85090fb1ccd686b61f8d |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c45e9566201dfb7d6b854ab74a5f93e8324fffa3 |     
    m68k     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/20d1f539c3d62d8984b7369cd313bbe712542800 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5c4638e5746dce85a5b73ccce4414a30e47c05e0 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/92a3d926d4d76dd13daf96fab4b148125f0ca351 |     
microblazeel |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/516e1b5c2f07e9a3a38fe4c60b718630f2aac93a |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2b4de96c9715e9414b5f1e377d6df0a56efa3264 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9821ee31854adfd360b6b7e79d356c54abfd35b9 |     
    m68k     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9acb8ce6cc60f1b54f64859fb38a56e5defe6e26 |     
    arc      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8d57043f94a29cf16d42c7e6b253026f19685809 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/6d2983584662f3b2a6f3d245ef72c4640007d75c |     
    m68k     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/0f911ef254e02d502e3e080dc050f605e927964f |     
   xtensa    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c0f160ec20e5a7dedffff6eaf727f8d57df7fc4a |     
   x86_64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/03e57d435003fb232232056e568d1a1d6aa7b20b |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7904208dcd839083cf84fb04c7eaa65a96de22f9 |     
   xtensa    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1d211ead46904cadab672e3b9b4abf5fa4b36ce3 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8744af201a78bf6c2e170ff662c87b03f632f788 |     
    i686     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/0c8f585b9e46ae6b144d1dd857f1fa807bf9741c |     
   sparc     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/345522981b54e057c02239083bb601f7b9d27f57 |     
   mipsel    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a1df8b8f5324078d71f96ddaa9f5f05f5ab8f5ec |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/56a8457efcb32579ad6da99a769b6438dd0db267 |     
  riscv64    |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/ebfccad007e216564889645a07f5487747116331 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/e761ca2dcd42385626ee1720ab4b99d075642282 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/daef673992c58e5b33d39769188d8583bae2dd71 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/f219fc8b547e1dff64da2a389a4c6dfc5fa7b915 |     
powerpc64le  |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/e3530b6377f992f6695c97e3fca6efc0ad9f84c3 | ORPH
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/efbee008bbd9ba2e3217992ad171dbe8b689382e |     
  mips64el   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/d225acdb5a754c648204b7c348fdbfc3586521cd |     
    arm      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/1df92b51902cfb5ae4cc989614a17d27b905c3a8 | ORPH
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/fe01136842295528e86538b6b62a54ff2c62ff76 |     
   x86_64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/4c695780f924f320eb2c69f7f9b84b2d7c4da4af |     
  sparc64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/00a88247d2bcca6a4a58c0cb536ecd935a0b1a6c |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/236c2d17cf7c109b436f36babe3ba7f90c3bef6f |     
   nios2     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/abee7f6be1f30ddb2ce33c54d88dcfc18da59cfb |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/85918bde6a7416189190bb703eed4aca6ec13ac8 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2e105c4f8d6199896fe69e01ed52209bfd0b458f |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0fa404f7f117a0d92637e95724a24087c786b924 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7f1f37821917c3df0cfbfb984f3d46e237297c7f |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0f824b34cff5c29acc2e0332cbc47db404f1a4ef |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/d59534be848c38b6019ce284a92b642be3b4a948 | ORPH
  nds32le    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/bcdec2e6113d0f1fc1b6b8ef3c73d745b5688168 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8becbfa49433ec7374921ea2c99f7947648a4588 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2fe80d152a1eff66805a5e5177e8411358b73634 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/dd11d12d6afd473ef8b2f24bc44a64ee2fd6c553 |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/04280ef5096941fcecc7d910829062cbc1554ede |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/115c21c1879716e1a0e28d6f8c3ef393cbae4b8c |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fa99374c5d6509d31105d6ad8d9bc0b68a734ab5 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5e97ca987a1c4e1f05a855db3c761bdf788a4970 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/62a7dad39dcf28bbe8f49e559477753570cfbfc9 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/876c0942f78da1bb0dbe98ef37fff9c9b6682ee2 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/611443dd7f1710f85f27c44cacfd46f9a19edddb |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/575ed0437ddd92004ad1c8d64856b9da91356b3d |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/cd864bb6e681923ac4bf6281b8a05e4ac8e7a969 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ec390fd350f53bb03b63d63ccee12669d5def3b3 | ORPH
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/6a651e9dd5a9205e24a446d868a634c47ce6ceca |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/a5e48aa9a5ffefbcb46a8a192c3074f2a6032e29 |     
microblazeel |     libspatialindex-1.9.3      | NOK | http://autobuild.buildroot.net/results/3a9dbece584901ee7e27a56b0e12eb4fde70f34d |     
microblazeel |     libspatialindex-1.9.3      | NOK | http://autobuild.buildroot.net/results/9e2bd9b7b6b67a8b58702dcbe1810e78c3178cda |     
microblazeel |     libspatialindex-1.9.3      | NOK | http://autobuild.buildroot.net/results/0b22bbea83b18384ee0fd556d808505fb95715c0 |     
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/5f7735fa2c0aae5e3c1d0f01a381c2a9bfe74016 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/4b409221c3e4caefe4c92ec6fc719c61c3c697e7 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/c44fd3cd15b716a378e3c3d16ede81ed28a97669 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6e7f5796b8887aaf26417229a88f62f6e8fdf154 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b6721260684f2d0fdcea44f7e0b44740aa84e5db |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/462641f1d67581f8f20ba539638e72311b7f3d80 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b36af428c265073a251b1332a5fe752e8109ac3d |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/586cd60f74e0ec01268428dd06a0c365817656ea | ORPH
   x86_64    |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/907aca272060a96ea2cc8b4d72c1d23a8b01f138 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b950495725335a2e01b4d22be05c66aa1680edaa |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/06f1209eaf0ad433e2f73e8594198a1110a1a538 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/41ef2159c6de52c8f1ca71c94cd29112bfea3e51 |     
    arm      | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/a30823f1388f37820d8a4f29b9b2c1de9b3992ac |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/7f50d68a30a55346910a2c06f096cb2098ae23bc |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/8d6d66681ebc3243bf883f0cefbb79c443a37bde |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f960d44e944c259f23b550e882b10bc48f746425 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1c663538d23ee86ab16b47453475ae37117cd040 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/81f82f91e3672ba693650deeb9b8c98e655f355c |     
    i686     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3cb69ee8b7b1b0b1c3585c20c765adbcf5f85d2e |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b86ece74051596629b6898804a5d80b88140427b |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0965157888071afb2b3d0304612628736a5e4305 |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1edba36f30a13e2a29b3f071a46cef53fb9b2a5a |     
    m68k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e172eb31f4452ec76a96c446713e044d9164a6bf |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/2bc74174ad3408e23b65ac051515fdffd41078c5 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9948fa30c338d17b130b4536bc1863146889ea6c |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/99a3e2a1e0c0fd36a46978ad29c27001eb9d1b4d |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/536d7b410956b284afbc69d397a3b3160c2d9735 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/90cd244a122602d31ce781fd343e175f050af284 |     
   xtensa    |        pcsc-lite-1.8.26        | NOK | http://autobuild.buildroot.net/results/7f34040e015a84a4d5cb65042ac8af0958f03b4e | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c01ae4f1a7babf94c841d4bb737408a9c8869845 |     
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7468e4003bc323e5d2bb1538c41314e5ceb6389c |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/2cd036ce41afd44a0e399dfb11de5e715a6706de |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/cd36756a4657a4216439e579c1647edf2afa3e53 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7cd739cd3381b4f9ca3bdd019db490235a880abc |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ec5b9f004d0a6f05e2b18a118e3a366806783834 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9e4dd9dc1c4328772816443c3d32b67edc60a6fd |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1956ca4fb35033a3a9ea9cd1beaf53f929332ba1 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ff46698429630ced074463f3e2c1db9f6bd8d930 |     
  mips64el   |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/e5d5f0f9ace5d2d688e5953949cefbd5d9cf1f60 |     
  riscv32    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/cbf90fed135c72446649fc41da02f9c3ce2e4793 |     
 powerpc64   |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/9599a1678e1e77237b1471f9bc95b09bb8d09c38 |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/80c8cf3dea6e8f37d25bb5c12003679ec736e69c |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/2aa3ae88afdaceeed62f204806b88b5808856b61 |     
    arm      |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/5d1f6ed0be6fa1087c4deb5b4f4a93c9ffe25184 |     
   mipsel    |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/08af698edbdb0de4cdfca3a94092d9e3fcca8f3e |     
  riscv64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/c605193469b5549d9425d828706a127adcf56aa7 |     
    arm      |           qemu-4.2.0           | NOK | http://autobuild.buildroot.net/results/af4c2655f2c4f2e63574319f16d8e318358553fe | ORPH
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c2d7654e0bf23668a970e9d2973c988b574c7b75 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/05e02e6aa9aef05424f2afc931e42c1ac9786d8d |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9c8f81321c4ad36033b04ea6523fc1de35525487 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/aca8c75c71698ecf87723850065bf6e9ee4f1e38 |     
   mipsel    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/ad7efacf540a98a6c1c24f1112e15880f9e3f520 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/be1c122ad70d9cb93e9897cca78f7b1a427e50df |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/73d6da69f99da1896fcc1f38c87378e6c0732df9 |     
 aarch64_be  |          uacme-1.2.3           | NOK | http://autobuild.buildroot.net/results/a23773ddad1ea52c61adb42a9206ecde31761f1b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d44eb8da03e9145f0d3a455f379fb898c4622bb3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/671effcf4d8887e45cc0defa09d1028110f809e8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/09bf377579b520667cc9254a83ac71f8ea30a63e |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/21bcdb8caa12cec716b623e48ed517ffa97994f3 | ORPH
  powerpc    | xdriver_xf86-video-tdfx-1.5.0  | NOK | http://autobuild.buildroot.net/results/e17363736b2340aeca5d692cf8849a332d067429 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/61517ecb27fc95e488f1a62a660ae03374459eb7 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2740523ea0af66cb14c3e927087c7153c00981a5 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035563  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035566  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035682  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035680  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035730  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035783  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035785  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035803  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526036036  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 augeas-1.12.0 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
           host-nodejs-12.16.1 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.3.4 | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/091c188a582d13c36b93ace8e80bd2a6d363f6dc |     
  sparc64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/16e473236285b2af26db1159eaf17e64e19c03c4 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/e66168593e1cd2889cd8bf1cb265a47f2b075de2 |     
   nios2     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/00d3cf02690288ea9b0164186fa83002af7a5074 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7b5791fe4659495e498f0d743dcae5e1ea87f535 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/53a4f56094686a237741cfc59db4dd78e7ec0a92 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/81e58ab03a71da6f8737458d06fc6e54a21c58ca | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/f60959808d84d5d9595c52b7833069a4f1a5e1d7 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b1bbf868c598848cadebd00f962d96e8fec74c6b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fd20c9aa9d3529c6b41d2f3b4309e445a308f1c2 |     



-- 
http://autobuild.buildroot.net
