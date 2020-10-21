From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Oct 2020 07:11:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-20
Message-ID: <20201021172205.6E3602E984@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  4  |  0  | 23  |
  2020.08.x  | 15  |  4  |  0  | 19  |
    master   | 92  | 50  |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 13
              asterisk-16.13.0 | 6 
                  boost-1.74.0 | 3 
docker-proxy-55685ba49593e6... | 2 
               domoticz-2020.1 | 2 
        host-sentry-cli-1.57.0 | 2 
              bitcoin-0.19.0.1 | 1 
                clamav-0.103.0 | 1 
                coreutils-8.32 | 1 
     dovecot-pigeonhole-0.5.11 | 1 
                    efl-1.25.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.64.1 | 1 
              host-guile-3.0.4 | 1 
             kismet-2020-09-R3 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
                   libcap-2.43 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                   ogre-1.12.0 | 1 
        python-m2crypto-0.36.0 | 1 
              sigrok-cli-0.7.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                  weston-9.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/53197832fe454c969e01ac231d80c7580fa78b7f |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/94cb2ac0d569b1518ccb4e92f56058fdb9003f98 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/75b464ab01d1cdfb3c7068ece67b3aeb245bc81d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3b46bb14054fdcf74a46d6af56ec2c449aef65e3 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5d4c0610dd4c954c5cd88577bc8bea60d0b8c723 |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fc688fd76c68e5f5dc74c84b667c3dd3349b9f9a |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f73d4c77e5fd6223abdbc83e344addcfc93227b8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/499a3a78f140ba3223201db478b56933396bf201 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a5f1578351a2cc8159c5269af526851a2c1d046f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/493425137cf6d0a566302bdb022869b2860cad95 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/d1a4f45bd56942744eb7e96666ca44caa99a7c1d |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6d1e3aef7866bbe85e4ee6ea45c28123292fe73f | ORPH
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/e69441eac474e4dc002251001d7cc96919f85c44 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/df7ff0ca296f4cea93c6e10fd8c38971c6151dd3 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/066794d2d07ab272931c7990d2dd0b0e590d3779 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/15aa34e20b0da952e064ba3ed76c65051bb07faa |     
    arm      |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/514ba1055d75f615063ba550414b5e46ad70d854 |     
  aarch64    |           efl-1.25.0           | NOK | http://autobuild.buildroot.net/results/02d1b297dec63548b311f9de9e063addd9b901b0 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/59a474eabffed34dcecb3621e8b0c2165c6f882f |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b56e9ac1d0199a4cbb315bb8aafdc6e1d7911d4e |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7c0cf553cdffa4c102657f0d4fc85b5386bd87ea |     
  nds32le    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c5547efd22777d32368495573cf72a3c69c1c348 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f24e7086e7a30dc03ecc040ffa9a03c4e01be8e5 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/befe0f001e5025865fa8005b7965b29f427d255e |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/bd39ab36b2ebc606a1a0b9b8b1c04eb4fbea8aea |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2bf527196d9f85652e514381afd6d2f1d9d45761 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/504971e6b3d7587a8b2cddbb3281b3b088e12e5c |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7156d819e570ab3e30312e91a0ccf39302424c83 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/33a2004afd64a6b15a8c6429d4dbe24203a53998 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5eb5986f3dd46a9942c6b22f68333101573808a7 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a2005a8a8f2f71bf11ea7d816a95f2ecf5b449de |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9b8435df3ba3f4ee589717537998a20b48d36ae9 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d7f6c711514c37adb7884618b38114c71eeab7e0 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/44762a185bf3c6a7c43253128067ae8684b477e3 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f0a9ae31a88ca7de6296731a71aefbbd135438d2 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ffca27bdbbfdf9aa90ba408b6f6fcc3ea96e4fd |     
    arm      |       kismet-2020-09-R3        | NOK | http://autobuild.buildroot.net/results/2444057ff4fa93ee1dee5ae2882b78f3a02cef7a | ORPH
    arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/82d10821eff3df8431d059b2962ef057bd2d92ef | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/1a1505f12578a5427c9d9c237ae13617d858043d |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/3ff6e7da4a6b48e8dc9191b5868655b9fa35c218 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1a808bcd9e9d26ecfeadeb9d7278d0f3db87775e |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/d28b662954cef132bfb28fdd67e2a283d856a4a3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ca8a84f1c1487f70f6893ca3266aa32bd3eb93e5 | ORPH
    i586     |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/46a078f4fdb608b07393b8e00efdb3777c7f26f5 |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/412199c98f7e1dc50675421f7b063cd5ddf6ee82 |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/99c02c0fce70071c9dea47d0b33c93fcbf442d99 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/c469403c65570894b930ca635785fe96cfd86103 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/bf7473c151500e3d84d835df00b24993f5477b2d |     
   x86_64    |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/a7f28e2167e78b9644c88a9c69d1605aae4c72de |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/0038aa83b1ef26ae64a58c8ff0a065cff04bc5de |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                host-gdb-8.2.1 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/63479d6cab172b7006b174da069d4305fe39b1bc | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f8ca9568c8a81a999ef81755b522a4d95385910c |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/37b28c53cedaae1d1d02b5c841347cd2b3e2c61b |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a934ae518c414fb7daad89e414daf485575cb710 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
          gstreamer1-mm-1.10.0 | 1 
               protobuf-3.12.4 | 1 
                    xen-4.13.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d653d7f3f35d30388cfb9d51d23ff5644423aac9 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/668f321f254e42b67d5e7157993fe9a523fe94f6 | ORPH
    or1k     |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/029ce2b18862a76bd9e0e6ddd1967091cfba02f9 |     
    arm      |           xen-4.13.1           | NOK | http://autobuild.buildroot.net/results/52aa492a6fea5146e16ebeadd1af2bb8e227909d |     


Gitlab CI results for 2020-10-20
================================


-- 
http://autobuild.buildroot.net
