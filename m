From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-11
Message-ID: <20150412063020.68757101071@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-11
===============================

        success : 218
       failures : 68 
       timeouts : 5  
          TOTAL : 291

Classification of failures by reason
====================================

                     vlc-2.2.0 | 6 
                elfutils-0.161 | 6 
                libtirpc-0.2.4 | 5 
                host-gdb-7.8.2 | 4 
              postgresql-9.4.1 | 3 
                     gdb-7.8.2 | 3 
                 leveldb-v1.18 | 3 
       gst-plugins-bad-0.10.23 | 3 
make: *** [target-finalize]... | 2 
                    webp-0.4.3 | 2 
                    fftw-3.3.4 | 2 
                      qt-4.8.6 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
               mongrel2-v1.9.1 | 2 
                  boost-1.57.0 | 2 
           libmemcached-1.0.18 | 2 
              xmlstarlet-1.5.0 | 1 
              xapp_xlogo-1.0.4 | 1 
                 cdrkit-1.1.11 | 1 
                ipmiutil-2.9.5 | 1 
                 clamav-0.98.6 | 1 
                protobuf-2.5.0 | 1 
               host-qemu-2.1.2 | 1 
                 rsyslog-8.8.0 | 1 
                    wine-1.6.2 | 1 
                   duma-2.5.15 | 1 
                 clapack-3.2.1 | 1 
                  poco-1.4.6p1 | 1 
open-plc-utils-1f6e7e372b31... | 1 
                    quota-4.01 | 1 
                    pppd-2.4.7 | 1 
              lirc-tools-0.9.2 | 1 
      host-gdb-arc-2014.12-gdb | 1 
checking for -Wl,--no-undef... | 1 
                 qt5base-5.4.1 | 1 
                 libpfm4-4.3.0 | 1 
                   mono-3.12.0 | 1 
               qt5script-5.4.1 | 1 
              strongswan-5.3.0 | 1 
               libedbus-1.7.10 | 1 

Detail of failures
===================

       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1041170e00fb55108ecac3f5d207a5bac9898c25/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/88342f4d394addffcc16f4d4942c8dbc537ba810/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c4a62e051ad7b147310593d2ed6746d91751b41d/
        i686 | checking for -Wl,--no-undef... | TIM | http://autobuild.buildroot.net/results/ca233796cdd1c3c7f1b937fa74c86b0703ed1803/
        i686 |                  clamav-0.98.6 | NOK | http://autobuild.buildroot.net/results/4ac5a70bf3a7eecb44c7c7b9793f01eadf7b190d/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/0f71644303c342caec73d62edca7495d4e301ee8/
         arc |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/55f932eac31cc72ed654de2db55eb7091639a10d/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/55085e59fa7c84cac27b08225cb6302b433696fd/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/a47e0c7999e48ac46bbbefe11b80d4c46d332f74/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7f0c7c9cb746104f93907544247bc1008d6ad0dc/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/950e237947313b27b57ad1a64e04b374c6a7ebb9/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/579076c5680527c09ae2b37623001aee32de77b5/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/56ec047b294a1ba200a9bfc666cc3d94f8cc301b/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/c23ff7ee4f52877a3764e0d88fed091dc99d7248/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/207a20a3ca5e62029823b1361479d5cd38fefeb0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b7f168f27c28599754b3f77377a7c72433e15b37/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/fff0be7f7f67eba9b6906e0e2f2c2d65ce8ec1e7/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/6fc66572eba99045ae24d55695e0ec2a10f119da/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/4c28c80a59b681b28d8dfce1fa16bcc654870e95/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/6106e9a9a9d76c7c568b34ee911bc04fb0649bb3/
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/305bac841da47c8ef40f3e773d03582e2476f960/
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/c539df70fd279035ee2dbc79989f95763666b252/
         arc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/d3019fc1ece6ec3a2128e88784ec6e2f7cbba440/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/ba89a4fa8610ee15ac1e895b1c5c0af311dbb97d/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/67e0b22174de07af1356c027b4e7cb4b0d84ef7c/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9abcd839b4957bfc12addac4f3ec7530bb18d8a0/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/64b27c3de20780cd93418052d17099c2904409c3/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/eff7620e6c80160bbad75a196dbe80031ee09ae1/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5bd734c82bb327add8e97f6c2d723576e01eb753/
        i486 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/18ea9b74500ab9e7d08a2eb76c17a75898dfb6ab/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/53d55f3e9e531856bab0d8080ce16df6ad9a33ee/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/cb897eef0e6881aa180ac0517a3acf212d9999e0/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/fe6d367d1200ba3b63f4d1535b707ed5508404f6/
         arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/f83253fcdebb8cbe6a471eb40d5cb301d73d71b0/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5f6a81b755f5eaa7293f5aaf71d97597e53d9b4b/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d190b9f6c092a1dddbed40ecac6f211d982b667f/
      xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/6a311b36f3b566436421a2aa3cea261d13bf4c95/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9b6a25b9171c7db6a5618b7637acfa69190244b7/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ff60bc7be4325610f40a5bcc4e4d2181ae2a7994/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/02111c37c82635e3e3af0169dd177cf0d8ac0ebc/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/1e18da7fc353d6472138b882c7af3aee23ae704f/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/65f454616d3244fe72bf1489282e30350efc81c9/
     powerpc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/586d2d0519b18f36e78cf581fd8a28010f62fdbb/
         arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/7f0597fda92f24bdee9061fb2b3155620a6829f5/
         arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9f14095825d71317d9087674d243a8129d03ffdc/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/decc40aea4a11331c32f603354b0d5fa473fdd94/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/d7c9a8bc4ce31d0ea1184744e4d17287d8615a49/
     powerpc |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/6ad9b7d9819ef2c413e650fad6531f7b60ca4253/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/76c690aa792078c2b9a30e98153d08f19926778d/
      x86_64 |                   poco-1.4.6p1 | TIM | http://autobuild.buildroot.net/results/d7a60526ff032fd121f070f92fd4aac274cfdaff/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/cb3aa9bf4c7e38649f1a62be67c58e34cc786595/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/1fc251eaefd56b1fc18e885debd5d97cc1261b42/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/575fcea8b082a91c08d75db13d478b271c68083c/
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/257a2e6b7265fb476b4d13d90b782590e5641abe/
         arm |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/325054b68884dd0e76cd87c048e7a0e9e913f1d4/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/be7c4df4e51938a25f28dbb98f52301256dadba6/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/99379631aa0617b34ecc0f7c02c45403c89ba79e/
       nios2 |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/3367cfaa485d903769c00af57aebf55ac36d4913/
         arm |                qt5script-5.4.1 | TIM | http://autobuild.buildroot.net/results/476200e84ec75943bb2934054c161b071ae7da61/
     powerpc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/4731f4cbf1cb9de4f9a29a63a44459b858fe3055/
        i486 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/81e6dd9d5bce3ecaa11765fb94ca538991b1e174/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/7431da99e90de16ecdfe6e120060240c57bb49eb/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b4c011bfd26cc8d52ded662fe52e871d4313f594/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/06e656fff7e2e1060778acbf1f45802577ef99f2/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/69a1c216d36fe165bd9a34b85662ddca976a898a/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/483c31d55431353f4437f076a45c72bb33e5513b/
      x86_64 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/37139ce67d2fb93572bf03aca3b978b3250b2558/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/d7a7ba64f36fc79655742656e95cbc20388c7cba/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/6977e8420d9ba1c13c027a078ee6e46c44e77637/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/8b150619b60dacc1c264d8159268bb4c5a325659/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/628b24ae7e141e87a69a1f33ea82c8fe7a6e8382/
         sh4 |               xapp_xlogo-1.0.4 | TIM | http://autobuild.buildroot.net/results/c6e0a220872387168ebcbc53bf84131dfdf39321/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/a7500af5b52d5c669a0537bfbd391cf7bdc0b6e3/


-- 
http://autobuild.buildroot.net
