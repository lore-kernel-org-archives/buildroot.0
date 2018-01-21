From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jan 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-20
Message-ID: <20180121070008.D29F620879@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-20
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 263 |  52 |   2 | 317 |
   2017.11.x |  22 |   3 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 7 
                  boost-1.66.0 | 4 
                   gconf-3.2.6 | 4 
               host-efl-1.20.6 | 3 
                    php-7.1.13 | 3 
             bluez5_utils-5.48 | 2 
                  ffmpeg-3.4.1 | 2 
                    mpv-0.27.0 | 2 
open-lldp-036e314bd93602f73... | 2 
           qt5multimedia-5.9.3 | 2 
                   systemd-236 | 2 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
           cups-filters-1.17.9 | 1 
               domoticz-3.8153 | 1 
                   erlang-20.0 | 1 
                    fftw-3.3.7 | 1 
              host-erlang-20.0 | 1 
               host-lz4-v1.7.5 | 1 
        host-xlib_libX11-1.6.5 | 1 
                   jamvm-2.0.0 | 1 
              jpeg-turbo-1.5.2 | 1 
              libsodium-1.0.16 | 1 
            libxkbcommon-0.7.1 | 1 
                 mesa3d-17.3.2 | 1 
net-tools-479bb4a7e11a4084e... | 1 
                    proj-4.9.3 | 1 
                 python3-3.6.3 | 1 
         qt5imageformats-5.9.3 | 1 
               qt5webkit-5.9.1 | 1 
                    xen-4.10.0 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ed72b577e10a5e1a6d356c4787b80cb073f01ef2 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/dbc6939194862da85ad8d76947068f706af2333d |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5d72b7c30d456277b9cb9f961c64b2d5bced0d25 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/933a9c0a0f7c7b82851f3a4a922ba6824b544d82 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/0735fce629eb2f5678b2852608741a566d1347fe |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a3d7ea8ba1d383892240d7a25f44f7d15ab46f01 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fdb6a13a121b3686401a0e6d0f1181d1d61ba83b |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/38d64d5db357b27f6efa64ce2fd2618d370ccf1c | ORPH
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/83e82653d8e1dcdb3305565d76ee5d61c8b4868f |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/0df81c343d4974f30c4b19a7b87eb2a3e4f58518 |     
         arm |                    erlang-20.0 | NOK | http://autobuild.buildroot.net/results/38d250abb57351b6f96cd4ff6ea966b3bac65a40 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/41188291d0dc5baa06de9420c8891c5a2c2eafe9 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/48e49b3b26fe72e54d8f14d62a2d117ed4b50588 |     
microblazeel |                     fftw-3.3.7 | NOK | http://autobuild.buildroot.net/results/299cbf3f3e7db03bdb6330702253aeda11461a97 | ORPH
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/23211afea2eed3a8e30ce481521488196f0be670 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/54cb46d2dcc1764611bb1a409269cb6f280d0897 |     
      x86_64 |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/ad8a9b082006f0334010c9c4dc5a90c2071df121 |     
         arc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/7dd74b34a27a8b4fb273b95a2e8e8d571acc9436 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/c76a6c09a7d062a784c88f159f6b51a910c0c16a |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/ca77ab4e3d760b3879d3c6da0c0c0dd6b9fb8076 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/9e4f7ced78257ecacefe073f62ad6b9cdc89ea77 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/66a548539d39bf0f5dd961bfdfc615f6b0a433a0 |     
      x86_64 |                host-lz4-v1.7.5 | TIM | http://autobuild.buildroot.net/results/535c306cc249dbb5e8045ac08423e89e65d1f663 |     
     powerpc |         host-xlib_libX11-1.6.5 | NOK | http://autobuild.buildroot.net/results/fb4e80ccbd9a569d154ac399df0298b48e96b8d8 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/4c957a99b63045a144ca4fdcf9f9e7e3e1f36aa4 | ORPH
   powerpc64 |               jpeg-turbo-1.5.2 | NOK | http://autobuild.buildroot.net/results/22c2fcc0813ce6c3f5a035fd909fc923d08faa0c |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/76a1bb869e7ff72c7b66f70dc2355fa61869060c |     
        or1k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/5ac69cdb8a1320ee1340b658d296cd68b90cc805 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/8e7d32674feef44c4488e45e3ad4eb0262d79bee |     
        i686 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/4729c8b5a1f4d10a303142bd0e91cbce8593f20f |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/a321f5feee113f544a1b7e9e8aef7a77bdb59977 |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/98800b50d98188b39a04748f94127ff515016a1d |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/6e31e5779879139dab1078e28a38bffc18eaa264 |     
        m68k |               libsodium-1.0.16 | NOK | http://autobuild.buildroot.net/results/b4a14cc994ca9996882a5722286d0aea79aef044 |     
         arm |             libxkbcommon-0.7.1 | NOK | http://autobuild.buildroot.net/results/87a95d95d77b5fcc5abeb60fbef4e3f4d3d1579a |     
      x86_64 |                  mesa3d-17.3.2 | NOK | http://autobuild.buildroot.net/results/4c520a0cdc52fc1965dfcc7f0b057746451aa332 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/e28d33e9294958592e85aaf1b600ee468f31b0e2 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/6cebe4480a6722a922e21015b8feb29323e04c27 |     
         arm | net-tools-479bb4a7e11a4084e... | TIM | http://autobuild.buildroot.net/results/6f9bb202b66939d6ce500b4c366d74be9be6fb6b |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/7108dde565cf5b4d371706f08b351a96c07ff636 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/f7a2913ad834ccfdb59189c372980d20e0187d0f |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/e93c70287320804926cec8f88679caadc2f0b507 | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/3f30daed46fda6bdd78e1fcab541fd60944309c9 | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/cf79eab5013e67ff40ffa9f4832bc363757b2355 | ORPH
         arm |                     proj-4.9.3 | NOK | http://autobuild.buildroot.net/results/80243a2ae19190d75e84a2ed8aa4b95a20ea9ef0 |     
        i586 |                  python3-3.6.3 | NOK | http://autobuild.buildroot.net/results/b957f956100fc36c7d5ffab1d7df41a65ae52ded |     
     aarch64 |          qt5imageformats-5.9.3 | NOK | http://autobuild.buildroot.net/results/bda7d038030e75f5b4d8f6c1b48de5bc1471afc3 |     
         arm |            qt5multimedia-5.9.3 | NOK | http://autobuild.buildroot.net/results/6138763072ef335557bb32c336e2a3a8d3546af2 |     
     aarch64 |            qt5multimedia-5.9.3 | NOK | http://autobuild.buildroot.net/results/0be5414fabe11b25e0689a29053ef4a2386732cd |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/97820fc6df9c69d8ccf384e9ae0ee9b91ee3ba41 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/f06f1b670ff1311daa0709c45ee61f8270b75fcf |     
      mipsel |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/aa12480d7549e866bba6605f7ad82bccba8c7b87 |     
     aarch64 |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/29e308ce3cc9c83497ba1c1f98fcda3f48fd03c4 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d285005c1574246b65e330c73ace0e1561bdbff6 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

  refpolicy-RELEASE_2_20170204 | 2 
                    php-7.1.13 | 1 


Detail of failures
------------------

        i686 |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/2b305b85d27410876081f685f7c366d22ed88738 | ORPH
     aarch64 |   refpolicy-RELEASE_2_20170204 | NOK | http://autobuild.buildroot.net/results/9cc90788ddf94c3fa72de66f87365ab11b8a8132 |     
         arm |   refpolicy-RELEASE_2_20170204 | NOK | http://autobuild.buildroot.net/results/8f5dd71cac7b2104d76acdaf02f8e6a4086c5181 |     


-- 
http://autobuild.buildroot.net
