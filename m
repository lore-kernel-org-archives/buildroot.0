From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Feb 2021 08:14:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-20
Message-ID: <20210221081432.0B60F834F1@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  0  |  0  | 12  |
  2020.11.x  | 11  |  3  |  0  | 14  |
    master   | 140 | 53  |  3  | 196 |
     next    | 34  | 19  |  0  | 53  |

Classification of failures by reason for master
-----------------------------------------------

                  dhcpcd-9.4.0 | 8 
        host-sentry-cli-1.57.0 | 6 
                    brltty-6.3 | 3 
                  monkey-1.6.9 | 3 
                clamav-0.103.1 | 2 
                     host-mono | 2 
             libopenssl-1.1.1j | 2 
               luasyslog-2.2.0 | 2 
                openblas-0.3.9 | 2 
            quickjs-2020-11-08 | 2 
                rocksdb-6.13.3 | 2 
                  zeromq-4.3.4 | 2 
              asterisk-16.14.1 | 1 
             babeltrace2-2.0.3 | 1 
                        bustle | 1 
                elfutils-0.181 | 1 
            erlang-jiffy-1.0.6 | 1 
  gobject-introspection-1.64.1 | 1 
       gst1-plugins-bad-1.18.3 | 1 
                 iftop-1.0pre4 | 1 
          libmicrohttpd-0.9.72 | 1 
                libshout-2.4.5 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
       python-matplotlib-3.0.3 | 1 
                 python3-3.9.1 | 1 
            qt5location-5.15.2 | 1 
                 rt-tests-1.10 | 1 
         s6-linux-init-1.0.3.1 | 1 
                   sdl2-2.0.14 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/697fdbe92bb38f76e9eb7111db7f6b27a70e0d62 |     
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/31770bf70f9ce4e3be8fb310d084b214820c6829 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/b758c6ffc7a14b24d5482e65ba6f90bc046ebd01 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/4423e5fecca8691ed8e3bce27c7ad484c7abbb86 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/58afeb50a0ecdb8b527d7c9946bcae290b79b055 |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/3261a1a7b31c366fc025e357a40f1fb421e504dc |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/512e72c7e2900d5f2e6e9880cfa5edb7d429b3c3 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/2f3170d74e5aa88d893d79982ada750e98b3b568 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/021756b008590261d049390e46b803f0183247ed |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/f127bf221fb3915e223096040ea3505641841663 |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/cd3aff17be907b03f8dced367d0fefb52efcc067 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/7b375fd10be861b0201ad9f6d8a7c2bbe53d3da7 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2af09374f75b4c696b1bbb2643865bf71285d707 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2120f5c109731065c055394804e302e2eb59d71d |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/daf95abe62c6bcd9025803ee990b8ec73ecb774f |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/984db6d4fa9e299728381b1013a32e416439e4b0 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/31ce9e3861c6229a7869a15d322f5d2f5bfc6165 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ee4feb9f145abf2f6c0ba99fc7880ae3c545efc4 |     
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/635733db6a200293ebccfe04aa403a2b082b74e7 | ORPH
   sparc     |    gst1-plugins-bad-1.18.3     | NOK | http://autobuild.buildroot.net/results/981b11ae9746d1eef40c1797398c4f6c16f005bd | ORPH
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/60497dd35933d64d6aff9b08d49815018bec9be8 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/373e5bfcca89d27d9e3a3733e7b89b11e8cbbb75 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/270949b6213145dc06f2741906e24aa9b1b5cdf7 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f8e2114b89d6fc18f86f870da8bb6baa442f2884 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/30aecf0a33052407f4a91f84d83465f9f0f60bfe |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/25e004d5a6ffcb73401d30be1eaf432655194022 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/54b2fb293e3f2141f34298f5744ad86c5a602b18 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0cf230263e436b62832f69c0e62e4824b070b477 |     
  riscv64    |         iftop-1.0pre4          | NOK | http://autobuild.buildroot.net/results/b48398193f13fa2b5f04a5e07e320b7a80f4c0e9 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/b0f38bdb04d55fa9de6d1811e11f888f2310cb43 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/fe1ab896112299108abf3a80587011f665ae111a |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/ba936d26101d33d581298a3a91042cf103b48eb5 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/8488dc1acdd2d20241276c1df503e5d92348b6f0 | ORPH
  powerpc    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/a6a9a2d6bf6af700531fde22bf758a60bb5f0e94 |     
   xtensa    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/2f80a8980676e824cdc38a5b633a76ee9a8ee4be |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ad4aafa09ab597c7daf08d2070792741769870bd | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a792ecfcb9f8af9032645bf937c3574be7126bc0 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/aeaaad723aa7b282a623fe3629762dfd9c9f8b66 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a3f2a8e89908ce7f6df5d0fbbef7500305774a74 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/6d7e4c51b0e530e8d21ed053b621324b9075c557 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/beab4c48531c36a7a7316d1aa9e304ff446d0f67 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/63f1371b6b995656cc45d527375d56876b0b6679 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3f512473ca8bb56233af0aa689fa412885148353 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/3294bc4daac9390969eb4befbcaa91eb0f295833 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/b68130a802c513d1ed73455d017fc0e19cc0ad27 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/b56600c7e3d6f389988e0b44d8e68df4e1d9158a |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7cf8edd7bd377dfa66bb5b00f6fc53253d30186f |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c47b0308dc38cf0d23e82a2a5a57e66fd4e0d3d3 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c662974e2d4ea008ba91940282fe307d01aaf799 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1ff25793f2bcc46ff4d98fb2e228037702607c08 |     
   mipsel    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/c8d542d23c407c6ed80b871d1bbd947cfe498964 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/4edcf1f498ed60f34e9dc60cc7b7f24759c035d2 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/e686885b338db6e8504004a3dc4976f27ae6c9e8 |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/a8b029d1c62ed490a39007a750fef1639477f4ff | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0bdaab7bc0ab694ded970c5cfe2ada6dd8c31709 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e76b7a59f161f8dad55e137bca85ebefd3e9fabe |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
             kismet-2020-09-R4 | 1 
                       unknown | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/02d319c5ec4e693f36872c68945c4732986400e0 |     
    arm      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/07a0f600a9b93f0f23af274e33ebd21554409bb7 | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4421e266baa2f3f2b973e14a0aec37759dd3ab70 |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 2 
              netopeer2-1.1.53 | 2 
                    brltty-6.3 | 1 
               capnproto-0.8.0 | 1 
                  dhcpcd-9.4.0 | 1 
                elfutils-0.181 | 1 
        host-sentry-cli-1.57.0 | 1 
             libgpg-error-1.41 | 1 
             libopenssl-1.1.1i | 1 
make: *** wait: No child pr... | 1 
                    mpv-0.33.0 | 1 
                    orc-0.4.32 | 1 
package/libxcrypt/libxcrypt... | 1 
                  perl-gd-2.73 | 1 
                 pixman-0.40.0 | 1 
                    ruby-2.7.2 | 1 
                      tio-1.32 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/fa2b61a3df52e9130f8ff66e3ee455488cef8637 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/043fa1b342cfa72679887c56e8f0aa0e83bdf0c0 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8328699e8aa8ce30ad0b1dc7f43aac5581327ecb |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/fc985479442cc94bf063b339c5f74cb343281b74 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/467d2fb7371e2192d00044db3be69513628ea8c6 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/ba57bb51654db7e35394ad43cb4f5c9730456d15 | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/ccca103cf05155aaf525134a055a485925cae564 |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/a88432c2b2e166434608639c4b7a5142b9950ee2 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e88f20544bd1f241781e9d0d374c8b1165b1bf1f |     
  riscv32    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c34100c070c15a0b6af96461ea7ce9b02f9c7852 |     
   x86_64    |           mpv-0.33.0           | NOK | http://autobuild.buildroot.net/results/2d4f36caf3cf3516d956fa1fab3c40702fae3cee |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/cc6a5b8cff0a1fc30604044a29dd661c20caf7b6 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/de818edc1edea59dae21bb219ef197a752098c33 |     
  powerpc    |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/6a6852328f3d3a6d80f434751a1ae300eb4af81d | ORPH
    arm      | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/2d3d7048739180bc8f07397668e1c655bcbb4e75 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/df40742aa35c74932ac42581622788953382bceb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e52c07770f9d57d9e1a1919c30c97f9248296dab |     
   nios2     |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/83e394f45bef0eadafa3fc973b4afd74e86a162b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/fc0e038df55b8992d8d4efdcbb2eb218fe61b747 |     


Gitlab CI results for 2021-02-20
================================

Detail of defconfig failures for 2021.02-rc2
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1037228696  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1037228863  |      


Detail of runtime-test failures for 2021.02-rc2
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1043853548  | ORPH 



-- 
http://autobuild.buildroot.net
