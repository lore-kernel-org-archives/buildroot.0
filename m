From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Sep 2019 06:16:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-25
Message-ID: <20190926061635.076C087C89@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  4  |  0  | 24  |
  2019.05.x  | 17  |  2  |  0  | 19  |
  2019.08.x  | 14  |  4  |  0  | 18  |
    master   | 178 | 48  |  1  | 227 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 4 
                  flashrom-1.1 | 3 
                   hostapd-2.9 | 3 
                 libdrm-2.4.99 | 3 
                 mesa3d-19.1.7 | 3 
                  ffmpeg-4.2.1 | 2 
                    flac-1.3.3 | 2 
glmark2-9e01aef1a786b28aca7... | 2 
                glorytun-0.2.0 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
   openvmtools-10.3.5-10430147 | 2 
                  exempi-2.5.1 | 1 
                 haproxy-2.0.5 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
           host-nodejs-10.16.3 | 1 
                   i2pd-2.24.0 | 1 
                      icu-64-2 | 1 
              iputils-20190709 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
                  libssh-0.9.0 | 1 
                   libva-2.5.0 | 1 
              micropython-1.11 | 1 
                qt5base-5.12.4 | 1 
                     qt5webkit | 1 
               qt5webkit-5.9.1 | 1 
               wireshark-3.0.3 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/5693ba0d7785cbaf7d41df5caf5ec8f94f7d9d29 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/618f2485e52e29ec519f92497589a9f8ce9b9ac1 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/82fb2a0ca1a317c6ec1fc503d078606657f2d5a4 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/eea170c82e2847dfb19105c8830c278a25b090e9 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/512bbede567287aad9a46d4e0bc5820579162f2b |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/25f1f12c2e5e67040178cb6f8edcc4f0e5c46c71 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/3af2f5559822d11693322e8ee878360ed653064a |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/c269b5091d5fb647020561e8a42e4ec1d606a426 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/2caa88d6023d522ef7497ec3899210ff6857ef1b |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/389a9a82d17cb6c2151f1bd8c1d3a0f66a7170b9 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d5a78d478d97ca6b7d74cd6bf5814c16b2f019a1 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/bfbeb3b1f5a63c8b8a4143d24ca02483bcf5e7d4 |     
  riscv64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/829c2307ff9293c60efba81fd3a1709309931480 |     
   mipsel    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/5323ec8f321c6f43de0dc10a8b73a3725e29902f |     
  powerpc    |         glorytun-0.2.0         | NOK | http://autobuild.buildroot.net/results/43b9436487fe04e1a5e8607c7fe50cc81b3e2390 |     
    arm      |         glorytun-0.2.0         | NOK | http://autobuild.buildroot.net/results/d8fb5660efc44fc10874c5a9f05e93f0c2cb05fb |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/832008d07e96fa5db8802dae5de2bc9673cae1b4 |     
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/6fdaf86e49451a2fff115d7434b0167d36158641 | ORPH
  powerpc    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/4d3a6da404c445f3b0530997af0c143ecb05b42d | ORPH
   x86_64    |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/1c8e13ee4fe60e3ad97b28e36fa147cf34190832 |     
    arm      |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/36e6e2662f89024defa83749d102d093b1f0a637 |     
    arm      |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f39a45e1e6ddcd5b3438f52e14ee78872775823b |     
  sparc64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f5dff2e7321568f0555ee3b975ff83bb9536fedf |     
  riscv64    |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/0f1248f3b47a203b0ce06adb95fda3910720d876 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/52fd7dfc033a7747919213da9ed5e71167f95976 | ORPH
    i686     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/7086a16f0addd9c82198f0275ed5f66669e01383 |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d945c7957cddcf7d1819311cf39e17d224126bf1 |     
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/23ab928e85959ed4ed9c7a5c9cd66c4a94d98103 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d5eb4f149202ce6b16d0f7e6fed07bae547c0d2c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7aa9837f5f17893d782ff93cd5d4ac682d8cf566 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/2e7654ecc0005a8f62872b87d2f727ecb8425490 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/465dee17cbfa48a390e22dfdab55ec382b92f42f |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/9d0ce048a01ee2b8c76b00b417cddcd6945506cd |     
   nios2     |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/109d67756e8ab9b3144a163ca099ad5168d9ef54 |     
   x86_64    |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/c38b0e2223d3e00f2b986b2a4095960f8406f891 |     
   mipsel    |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/a51f2e43eb0ed4eb26cfc51032621efddd8924a1 |     
   x86_64    |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/0d34298e691ee38ad2bc853024161e59f17a023a |     
    arm      |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/189741fd83dd712c065d08eaaeab2c440037ef28 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f7965bbadaa83af925f2ae10a4ec0bd81c2432f8 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/54bb43d36488c63720d021b6b09a456cb530bc62 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c0fbeba8dd8206583377de92a2fedee928eece4d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3efa7f626570fb415445dfdc21d7916b74433ec8 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/379411226094250f13f56f4bcb5e16bbea6b19f7 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f1267c16543913d9bbe7084ea12f5dad98ce8343 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/10d765638838b68551700181d2e76dcf5e6e9f1d |     
  aarch64    |           qt5webkit            | TIM | http://autobuild.buildroot.net/results/69045b7faf01946c6dc7601306e40adaeb5145cb |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d5b351189c709462d036cd6406792d6be790c9ad |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/c3ef6c754a77f23b8d0a52b3f896b92bd3c40add | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/603907c959c4c452c3ac6b35f0063415015b8261 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                iptables-1.8.3 | 2 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/aea0d8777558ad60a0462d3132b4931925717762 | ORPH
    i586     |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/e96728857d7dab86b785ddbd47f4e24b756970dc | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/23760940b7ff0ffd9918cde5454f461ba90ee2a5 |     
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/b90a4fd44c71e97c6feaf1f1749a03c681c792a6 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                iptables-1.8.3 | 1 
                qt5base-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/4d2e5a1e3b17a043438faa58e12188d55557912c | ORPH
   x86_64    |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/7b28f58a605820917107cd89d2cd85dd67cadb04 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 2 
                    ffmpeg-4.2 | 1 
                   i2pd-2.24.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/26bac745ca1d92b42e5b87f8190dee2174c64885 |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/ea19025732e4a39965ecfe4cb58aba523be5fd93 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/acdc649c1c509030fd4e8318278410e026b486b8 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/49b92bb8ec2dbd0559a6c717a6978f28f382c23f |     



-- 
http://autobuild.buildroot.net
