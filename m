From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 08:08:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-18
Message-ID: <20201119080857.52EA7871C9@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  6  |  0  | 25  |
  2020.08.x  | 16  |  0  |  0  | 16  |
    master   | 96  | 29  |  1  | 126 |
     next    | 18  | 25  |  1  | 44  |

Classification of failures by reason for master
-----------------------------------------------

            resiprocate-1.12.0 | 7 
                  boost-1.74.0 | 3 
        host-sentry-cli-1.57.0 | 3 
              libeXosip2-5.1.1 | 3 
                 mesa3d-20.2.2 | 2 
                   mimic-1.1.0 | 2 
package/jpeg-turbo/jpeg-tur... | 2 
                        bustle | 1 
                 dc3dd-7.2.641 | 1 
             kismet-2020-09-R4 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
                openblas-0.3.9 | 1 
                    php-7.4.12 | 1 
       shadowsocks-libev-3.3.4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/26c2cb5a33eebdf0cd1e801fd8232f752faa9b73 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/64bc3cb040f6e5ad7ee01841c09745510ed0716f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/048e54a1a9f45200ab51916e2cce88b8563be579 |     
 powerpc64   |             bustle             | TIM | http://autobuild.buildroot.net/results/9aefd486b1ed126a723384b36aaa122742499278 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/975f2300b3dfb4bdfdf9511606ba02a7fe5ae75f | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3cb1f3b8de937646dc37d183f9bcf142f7bd7ed0 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1519aea3b023affb0d446ea18c06c349b999642c |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/007e808e883e5d9f57190122f66772ea43c6f7e5 |     
    arm      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/bc170c16554797df5e34158855038722709253bd | ORPH
    arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/59f70fb725c2f07e27dc818839e02f2788ee490c | ORPH
microblazeel |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/c47d23f2b98786f71b36098a6149f074b5204fc3 |     
  mips64el   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/51573434303118fd92f32819e038971edee8bc28 |     
 powerpc64   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/cf831394de11bafa581749d904e285d3233f1660 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/4fa1df80618d5ef4add0da3631f8b0066fb36b14 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/05850ed8ccc290673da7c06438619b5478bc07fc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5379ec4a6c744e463e511fc6c922dd9705f9ec34 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/62b970377464f61ee76c6ebec974c5b31bdc6cbd |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/3fed8fe790e9e86d7cbdb4c6601ce004229acada | ORPH
 powerpc64   | package/jpeg-turbo/jpeg-tur... | NOK | http://autobuild.buildroot.net/results/5eb4bf8ae61a3fda0527f25fffd0e2cf221e4ba3 |     
   x86_64    | package/jpeg-turbo/jpeg-tur... | NOK | http://autobuild.buildroot.net/results/66fb5c0171af73d4c1c93241b285fac8f8f494f7 |     
  mips64el   |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/9e3d193ac45b37365876bb9c4b3e8d91d8859f0b | ORPH
  riscv64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/6c2c4379b8e02c9ec014c1e93ab0222cb50a0de6 |     
  aarch64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/1eeee9fb889b0888704ceaa9d8fd90eeaf803774 |     
 aarch64_be  |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/b4b81ec57702974b882c9d47eab6cc27c08e6a74 |     
  mips64el   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/ed4fcb045844dcb2fb17b28aa8b6b8c62a31e8a7 |     
   x86_64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/cbf158f0c037d44ef293a8804d18c84e3b731059 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/ea63c5d4704afedcaef63c045af6ee0efdbbcb69 |     
   nios2     |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/d351e94c47a7e0a10c5a3f8c6ff3cdaf78cad1fb |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/b31bed90a3e530a4658dea6362fd2a3a08a13bd0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/480e86f899dc2ddb2a874e545a37e1de87fa8869 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libopenssl-1.1.1g | 2 
              ejabberd-19.09.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
             libnetconf2-1.1.3 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/85c94d5d3bd3046e80c778116ea3e074c3685e88 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/d19f6dd09064768660d34dd52e8d596df5ec6447 |     
  mips64el   |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/6b088bf7d92388cb440b3a7d7eccd878c1922e73 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/44d20bd8656af032b7788fb2df8525f2617b89a8 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/fb3677599026d88a7e7f83884b2ac820a0a02f82 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/494d29af9c196a9beadf1a1041303d57c104f287 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 10
              libeXosip2-5.1.1 | 4 
package/jpeg-turbo/jpeg-tur... | 2 
               bind-legal-info | 1 
       docker-containerd-1.4.1 | 1 
                  ffmpeg-4.3.1 | 1 
        host-sentry-cli-1.57.0 | 1 
         jpeg-turbo-legal-info | 1 
                       mongodb | 1 
                opencv3-3.4.12 | 1 
                    radvd-2.19 | 1 
            resiprocate-1.12.0 | 1 
                   rhash-1.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2a66d0cfc04814df2d5aca1dccaba938d59bf396 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/61390b60e0ca620d42c9e8c8238beedd55ea53a3 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/565af6d14561380a2ea694d311ce0142673a4d54 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/99748d3350e34d6481f31e214a03ff8a80fc56b8 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0c8139c6e6d76553dfb818cce064edfc5ea57f59 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/95996b4f403389c38f0ca8fa3251d2a0a3b4a750 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4ef9950335830aaf880a4c9c80dcfeee8bfc78c0 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/838c43c0676efe7c04bde220b2a00b18216a226a | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/28b51f1c0712ac559d55989320e6572e607351ef | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f2d531c8a33af4f642f6fd4a6e0a6526471d02ba | ORPH
   mipsel    |        bind-legal-info         | NOK | http://autobuild.buildroot.net/results/db614a6fa1e17af2fa5c1d4a0d51cdf770893ca9 | ORPH
   x86_64    |    docker-containerd-1.4.1     | NOK | http://autobuild.buildroot.net/results/86d6d9cfeb94a219b25fce59b27aae5daeccf13d |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/e0dac9027284a2b25f31e7658b6a1e9552449869 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e20da7ded3378286c1b21c617652394446360397 |     
    i686     |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/b191819f180cc894686718b893126621b10a6d83 |     
 powerpc64   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/1eae71a67c0b77afc991d138138f10eb3acf4cdc |     
  aarch64    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/aef5123118eaa13b1a3d236944f8b03002d6e73b |     
    arc      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/de27a22945fa2cd64363ab52eb81ce8a01070c13 |     
   x86_64    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/adb853a537dd56ede3c09fa89adac8c0073a2615 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/32e8395dbecf68bf8653abf5d0f69f2a0e6893c9 |     
  mips64el   |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/7caf175af039054a032b8f63b458b3940d9ec0f3 |     
 aarch64_be  | package/jpeg-turbo/jpeg-tur... | NOK | http://autobuild.buildroot.net/results/1a43e59b3452f48e8e98573ea840135f066f8578 |     
 powerpc64   | package/jpeg-turbo/jpeg-tur... | NOK | http://autobuild.buildroot.net/results/9d84cbbd41015a2392268ecb686a33d96f8c6e0e |     
    arc      |           radvd-2.19           | NOK | http://autobuild.buildroot.net/results/3d738c5878ed861fb1f6773c1524f4432252a3e9 | ORPH
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/99c5c132da846f538f6478a854e9ce2c6f5f1fa0 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/9eca7cd52d2569cb3aff9db93214e1a2ad826ed9 | ORPH


Gitlab CI results for 2020-11-18
================================

Detail of defconfig failures for 2020.08.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/852879064  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/852879183  | ORPH 



-- 
http://autobuild.buildroot.net
