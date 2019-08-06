From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 06 Aug 2019 06:15:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-05
Message-ID: <20190806061557.5BDD2859EA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 31  |  0  |  0  | 31  |
  2019.05.x  | 27  |  1  |  0  | 28  |
    master   | 205 | 76  |  0  | 281 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/eba4e5902c6eca192638229595184ce26fc6d197 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 15
                   mpd-0.21.11 | 8 
                collectd-5.9.0 | 6 
                     gpsd-3.19 | 6 
                harfbuzz-2.5.2 | 4 
                    dhcp-4.4.1 | 3 
                      icu-64-2 | 3 
                 libdrm-2.4.99 | 3 
           host-harfbuzz-2.5.2 | 2 
               libupnpp-0.17.1 | 2 
               mosquitto-1.6.4 | 2 
       python-matplotlib-3.0.3 | 2 
           python-numpy-1.16.4 | 2 
          qt5multimedia-5.12.4 | 2 
                       unknown | 2 
                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
       gst1-rtsp-server-1.16.0 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
              iputils-20190709 | 1 
                   libiio-0.18 | 1 
                   mimic-1.1.0 | 1 
                 python3-3.7.4 | 1 
                    qemu-3.1.0 | 1 
              qt5enginio-1.6.3 | 1 
                  rygel-0.36.2 | 1 
              spandsp-20180108 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/431cd929c2460697c0645653934793ac1665f372 |     
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/781a813339a46513f4d8a0492e3c4457dcf62cd2 | ORPH
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/a704f4a57edf864feaf93332c6902c26b0aeb7c8 | ORPH
 powerpc64   |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/0903a3466fe05c29db399e62f838c2989664300d | ORPH
  mips64el   |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/b58ba514bcb738ae7501310d7c66452681ac41ea | ORPH
  riscv32    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/f444e3c70bb8534186191209f9ef02c26fead7c0 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/3e24a7671e65974815072f92efaa490d2950b3d9 | ORPH
   nios2     |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/4ef4363bc692eeaee733dc0f6c94e2c74f247650 | ORPH
    or1k     |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/5581250842e4ba4c1652f91a33ac80e6b4532253 | ORPH
  nds32le    |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/1c5f401ce7eef13f5ca4603ca8d7c67da249d7c9 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a2e2e1b64a4a0a7accb88f3ac224a4aad1fd058e |     
   mipsel    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/31b3c24f897d555e6b9733544c9a7cc8154d6f9b | ORPH
   nios2     |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/ec555748d9a473ad2b4dc44ab15bcb5d15409cff | ORPH
   x86_64    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/f4a0e0625cfb139589dddc7dd377d0c468e131d9 | ORPH
powerpc64le  |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/cb94568611becd6b628cc3f07e6f9e62016b7937 | ORPH
    or1k     |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/415490a60484d6417a3f6176a50840062090065c | ORPH
   nios2     |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/07c7fb8b3b63d92f6725ee9588b52a1ad6a7bfed | ORPH
    arm      |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/a7a4d6e94844e0dcaa13ff93bf8e9f0ab36ca54c |     
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/b44784701d9b18004c660fd0fab94e7db3f68126 | ORPH
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/731c8a1050cbcf76764ced7065dc7b48975455a0 | ORPH
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/354fefa8f7a23d38f42738748288eb5609340844 | ORPH
    m68k     |         harfbuzz-2.5.2         | NOK | http://autobuild.buildroot.net/results/2851f64b116698b75e2f893db1201a9905f2c362 | ORPH
    arc      |      host-harfbuzz-2.5.2       | NOK | http://autobuild.buildroot.net/results/b87c2fd544b8b249b7af4eb59772cfbfd2c2b6cb | ORPH
    arc      |      host-harfbuzz-2.5.2       | NOK | http://autobuild.buildroot.net/results/b93da70abf0de4a47f3288cbd6fd765a33adf3bd | ORPH
powerpc64le  |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/1d82529c3e1cfc0b840113203fdd6059f3b37ae8 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1795331e63d499d3a13ebdc70c5fb66308b1efad | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e69753fa469863268be014085ed78cf2947c8231 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3376dd933a06361855ac4ba4b623a9f84d25d41c | ORPH
  powerpc    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/adcb0ef0861954afe1fcd4fc159e991169883691 |     
    or1k     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9b08b42a3fe55c1a7d057730d09413121f638c4f |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/295e96542fef634ea94b9a7b410aae60da8ad596 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7cbb4db09ff565e25282b3d07a7e9f364da6b468 |     
 powerpc64   |          libiio-0.18           | NOK | http://autobuild.buildroot.net/results/bb3cf1fd55b91e99e51c8b0171ee562c63b001c7 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/471de230b152df815e314a0d7963368826217b74 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/8a8fd6ca5ba6640613552da405e9b1d6cd88ac4e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/291742265cba111390eef1d347c7c510c89c9d4c |     
    m68k     |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/3427924913af6d24eab65e6c79561b768120e18e |     
    arm      |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/5b53fd6a588ea60b5b2a17a9d7d235c82a2023c5 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/b464e78fbff3653baff5f59d5f46f8c03713e0af |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/2cce73b59a1fc8cf31c4aa60d6647416b8baa07f |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/de000d253cd10454bb2c1fb842c48173ed9bb9e7 |     
   sparc     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/347992d110976a8263b4af652641787784f249fd |     
 powerpc64   |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/7b477db96ddb5bd85dc3fc2dc125a452fec94ca2 |     
  mips64el   |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/06b3db92ac26e6c7524ed5a3e35b3150f5e7c222 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/90754e7a03a42fc97e46ec579fecaee0fa7e1213 |     
    arm      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/a7ff5b5396717c71693fa6014dc7b3c4fe717fcd |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a545950eca27e087475bd52d8c75382a2b9e3eeb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fdd954b62cb3c5945a6fd0b2d19cb000a0a72bd3 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f6bcd98c3d70966a5ea11e806edaf6a6521bef08 |     
    sh4      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c8d8a6d30b630c519a8e5493682ba09ab8b6c9d3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8d19c601455bfcacb44402cfd2a541ed1e9c9e2d |     
    sh4      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2b8fd10a04f553c47f87c8ce1034e7c2b5a2bb41 |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/37f9e4a183a1d2641d8db3ec6c023e94f63a499e |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8c486db0085dda1572f51cc98ef1987fd61e43d2 |     
 powerpc64   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6379d934b2be290a6a62f340001ef3fdaa030741 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/27f5a44b3ae5652dc0dd4bb880342560dd8bbd13 |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ce5a35ba3dc2c89344c9ac5b00135365124ea180 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2ad8e7ef679008784f4f3289daf01f43093ee284 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/41e8fa498e06e6754f1eda9285edb519116c4a1f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cd177c04c042a632b3a020bed57e21d05cab2cfc |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fe350de2592a6c68d286a2343cc4d2b5b4cfac02 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/498b7bce18db0f3708898115dc7dbc85610cfa8d |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/6b545810b2911510c68429edc717df01b6104b69 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/58518bb3508d765a0d724fc36b87251cfc8c4aff |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d906567662414799b0120288f6664c5aaceda47e |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/bf71cb75039c14db1a2f248463a220d1ba1926ff |     
    arm      |           qemu-3.1.0           | NOK | http://autobuild.buildroot.net/results/48156180296ad35a16ea6d5d5388e2348b3109a1 | ORPH
  aarch64    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/6867e1ad462b7340ac8c9358ca5596111b669301 |     
    or1k     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/6ddeb2943d28be85b858869e70b6791306e4502b |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/95347aae45bface920fb78dcd59271a792be5778 |     
  powerpc    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/040c9e419d27bc3b37214ccc4c1f462cb0d2d498 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/de7ef25eec8c84b4fc83e4b0cdf67a97e2b2c3d6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d4d5ad025f87db6d20bf4c3de585ee43d0ac5adf |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b58bec76382663739c556914c4028145bf7e8501 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/bafc19fbfc81ab579e56512c451b93133db92971 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/d0be018d4eb9dd4c41109d804ae49a1a3b6ee295 |     


-- 
http://autobuild.buildroot.net
