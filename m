From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 08:30:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-20
Message-ID: <20170721063049.6DCD821EE7@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-20
================================

      successes : 212
       failures : 41 
       timeouts : 0  
          TOTAL : 253

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 4 
                   attr-2.4.47 | 3 
                 libssh2-1.8.0 | 3 
                      x265-2.4 | 3 
                    4th-3.62.4 | 2 
               acpica-20170531 | 2 
                  cppcms-1.0.5 | 2 
                dbus-cpp-0.9.0 | 2 
                libressl-2.5.5 | 2 
                 libusb-1.0.21 | 2 
             lttng-tools-2.9.5 | 2 
                  check-0.11.0 | 1 
                 efibootmgr-14 | 1 
                     gpsd-3.16 | 1 
                   libcap-2.25 | 1 
                  libffi-3.2.1 | 1 
                librsync-0.9.7 | 1 
         libspatialindex-1.8.5 | 1 
           linux-zigbee-v0.3.1 | 1 
                  nginx-1.12.1 | 1 
                    norm-1.5r6 | 1 
psplash-14c8f7b705de944beb4... | 1 
             qt5location-5.9.1 | 1 
                  snmppp-3.3.9 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/3960e25e3eb2379570d341fa61cb6a74a839a266 |     
    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/9a2b7898060b29e23fec3368e8a19d0109810917 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/a0208d6c8d5bd092e10aaec35d43483090faa8c6 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/713ef631aa291c9aac4c33da3b0a39788376aae8 |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2e7270f3a77aa60d63bfd870bab591980974bb97 |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/f1005554b0ec38788985c1f83dd9fd8a4e536310 |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/9aac4949edbfd4bf2a7c8fd16313e4c674899a55 |     
    mips64el |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/559d8eb3cfaa06aaed8fcbccb39ec23e3f181cf0 |     
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/22da5d3e301eb0ae7042de66df9e08ec4a73cbf1 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6ee45234cf81e38b40d9b6cd64257306f67248a9 | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/2a1ec982024f1853c9d355463adf4799fcb98c51 |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/a6b53e6d4de0a0a70b38ec155a1a57ae2371516f |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/cc096ee472368abf15ba0c8f68cb2f1011c03af4 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/b620b41d6d72fd05cb2546600b53e18ac5bb2c88 |     
    mips64el |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/cd7af52779786a50e0c4cb219cb68dcf32b10fb3 |     
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/33875004daba7e70751c5ee3af3fd58e430d0294 |     
      mipsel |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/988e03c4dfa3953f2e0a2daa5183cdb35c792b4b |     
        m68k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/942e51ff1371cea17f564c06edaede324c07861e |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/441bdb4c89cf11e8fa1bc8a7b7efe8c654325d96 | ORPH
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/57c6d0c9fddd13363a440a605e6a35b45ecfda3f |     
    mips64el |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/aedec7aa698c5a92219c20a4fd158bbb936cb96a | ORPH
    mips64el |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/67d274bf768d300296d503ca5eeeeb51a9808f5d | ORPH
      mipsel |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/fd54bbcb33b1ee997e668792022e52f6d9d05763 | ORPH
    mips64el |                  libusb-1.0.21 | NOK | http://autobuild.buildroot.net/results/a8526091666acc71c2e247bed6b16a6dc0d647bd | ORPH
    mips64el |                  libusb-1.0.21 | NOK | http://autobuild.buildroot.net/results/8e6defb8ae932443873c259070e87cb05f1cb46e | ORPH
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/29c72bc38042305310576be945c721b2fad95894 |     
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/861ee8add1f6b395ec2890b451bec7cdecc577ba |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/042eeb5a3e063a5add3f6334f62f3152b16d64d2 |     
      xtensa |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/302516e03f7d12cf4a63fcd251c3e40bffd727c7 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/39fb0ffc9efb7dc0d9dd063c0e30cdff1b81fa21 |     
         arm | psplash-14c8f7b705de944beb4... | NOK | http://autobuild.buildroot.net/results/6c2b77ad710ae95f2c2e126a536542ad00bc2913 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f0a30d89f80b9d704ef6ae1cb5ab44402eec6fd3 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c47f0c95eba729b114c1bde54bff9422dbb8e1d4 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0edbfb21293bdbbc053f003f4fb01de0bb3985c3 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c168637a2403ae66ab92a4769bb6f0ee5c7ff7cf |     
     aarch64 |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5 |     
    mips64el |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/871079b851ff22d63c62a9e614ad18509516a1a0 |     
     aarch64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/670c93bba240a8040988edfd82e876610256488b |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/b487f05c9ff87a2dd2d82878e3babf2b56988a30 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/f707be973f9233fbbc210744453630838ac5a124 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/a0fb3ea7580be3403604e50c3efcc596f972f8f4 |     

-- 
http://autobuild.buildroot.net
