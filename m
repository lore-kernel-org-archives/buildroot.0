From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-11
Message-ID: <20161112073017.9B76F20B4F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-11
================================

      successes : 247
       failures : 58 
       timeouts : 0  
          TOTAL : 305

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 9 
                    mpv-0.20.0 | 5 
                 mesa3d-13.0.0 | 3 
                  lcdapi-v0.10 | 2 
               openldap-2.4.44 | 2 
                privoxy-3.0.26 | 2 
          sane-backends-1.0.25 | 2 
                   taskd-1.1.0 | 2 
                 weston-1.12.0 | 2 
                  boost-1.61.0 | 1 
      docker-containerd-v0.2.4 | 1 
               domoticz-3.5837 | 1 
                flannel-v0.5.5 | 1 
                 fluxbox-1.3.7 | 1 
           host-mono-4.6.0.245 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
               libepoxy-v1.3.1 | 1 
          libmicrohttpd-0.9.50 | 1 
liquid-dsp-1191179b786703b3... | 1 
                 midori-0.5.11 | 1 
                    mpfr-3.1.5 | 1 
                 mplayer-1.3.0 | 1 
                    ola-0.10.2 | 1 
                  openjpeg-2.1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
                      qt-4.8.7 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.4.7 | 1 
                  squid-3.5.22 | 1 
             tinymembench-v0.3 | 1 
            xapp_sessreg-1.1.0 | 1 
                  xl2tp-v1.3.6 | 1 
              xmlstarlet-1.6.1 | 1 
    xserver_xorg-server-1.18.4 | 1 


Detail of failures
===================

      xtensa |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/14de24233e8d9be3999ccc3656ad11d3c5533470
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/230f52bc35f437836c7a76d4b58ef454635ee0d3
        sh4a |                domoticz-3.5837 | NOK | http://autobuild.buildroot.net/results/0eadf342f86ed71c3a4008f13a4d3e175143460d
   powerpc64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a6e9bac0a735f48d0ba0af081aeac4ed9fdfaca7
 powerpc64le |                  fluxbox-1.3.7 | NOK | http://autobuild.buildroot.net/results/67fa7326506043d3d59ca01b0b264f63e4cb3439
        mips |            host-mono-4.6.0.245 | NOK | http://autobuild.buildroot.net/results/0521cca5e9e5288582c41f506e93a10b123852a7
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2380cce801e4b5b45f21b89a5abb30bc2b74e12b
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/98e77d662a578481e381dbbe5653340bef23577b
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/8e81354e82a8c0495e2ca465eb79cb8cf4c9b153
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/0390af252e354721fd2c8d11bd3923dfeedc519b
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/2d3ee8c60ecb9afb79c1a96e317b3447ce38239d
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/c8ac6f2f4a67b627a9bc54cfac202a6385f89120
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/b053ba67ec6588a7dabf2e387e3b70668dc864a8
 powerpc64le | liquid-dsp-1191179b786703b3... | NOK | http://autobuild.buildroot.net/results/b734fb3790fceef2b803b52857c4482de28599f9
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/e65234622d01375015efbfc2c61c179eb4eaf2f0
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/daa74378ed3bcab419b6fc2ca99c646781585989
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/349fadbbda39ffff5fc3b5e293ae7ccd3a9f2a4d
    mips64el |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/21fd2c1209e371ba6ae8e8ac68d55ec9cbd2e622
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/538f994f3e7c015b8a50d4cc04b6a09cd2b205ee
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/36860c7e94cf218a85163b558e0d04d8fc95dcaf
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0dec8120e05fc188ee6541401c00101fa4b585d3
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/615f81e027588d44339b5564bf1d91c491b5d421
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0c833d03b31bfd6ac7eb0c78f5e101f21b5b50ca
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b0948b96a051293034b981c9a1e68e835632f463
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/97f87efcac9f77b2e0f96934985cea9cb99cc539
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/24ada1e0ec695cb12028048728a9d1e2bcf75a03
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/38d04eedfcf63111e10bdd75aecc5f315763c080
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/ccb3bf5d68991b52acf1d62fd4aae1a1933dc654
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/a38d971a7983cc2078600e9e87c05f36277041a7
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/17e49df99059b85f3187b4ae44a47ee312480a52
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/2a6f6d1e2312856d4964175d66c81f86c6e063c9
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eccb2b16ab46d04e1b358818546d805d60cb5b6e
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/e8db20ef6a753740ecf1bcce27cb4d6362fe8d97
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f64e90049883647de2bf0b595fc6616eddf027b
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/394d1d6592908729ac7a83834902c347edc46383
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6e5294525eec3a280ea1c28cfbe0820dfb0d9ca4
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/46ab9237d7ad8dd7f7f2c5fe1bdc58fad938e9ea
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9f1f1cb727b5c5407e69172280a3dee880e55cdf
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/a3fd6fbefc49147dc54e313489ce4a236db6003a
      mipsel |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/9dfb2d05ea3d7f033fa7f6af79740bbd30483f68
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/4a96c1e946c9bc7aa234c318205050590bec2c30
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/a95aa96643283e7fe078b988c59ea9aa7682c0e7
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/5f0148cef22b3b9aee691e1702722a0bbc68c8e8
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6ebcb3e261f3a2f0f161a0afce9fb88792b3d866
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d598cea7158721b9c9cfebe2fd4b41c5671c0ad5
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/ebaf3e2b52f4bd4556a86a3eef3fde068b2c4b44
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/3cc0d3c21fc5a717ec433b3aaeb4c22dd05f4e54
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/2be77ae9557a84ba1376a43a8776694b5baed8e5
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/7ac613ea50fd12bc3e0c5be36217a80028b7855a
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/3b7a04f90e5f813c41a474f86cb967f148ac3ebe
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6d4bc20dc51cac531113b0d391823bfd25585052
      mipsel | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/44577b05fd3ea762e6bbea11b66065b55e55d4dc
      x86_64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/3c25333d3c5838bea27540d8ac752c8bdf4db843
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/378ffddcebd0ab3dabfdb268614d1344a38e8dd1
        i586 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/04587d58169d1ea88a8b4dc020b9bfb98a070718
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/b2d71ca6867b1adcaa6f14ea745213620f46bb57
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/dc34c72dfed144a3ff5c0bf9d35773e93f2430f0
       sparc |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/dcee250cb65d38b92255eedd5efcab28ece6f653

-- 
http://autobuild.buildroot.net
