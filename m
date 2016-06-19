From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:10:43 +0200
Subject: [Buildroot] [PATCH 000/121] packages: bulk-add missing hashes
	(branch yem/more-hashes-novcs)
Message-ID: <cover.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series bulk-adds hashes to package that miss them.

The missing hashes were all computed locally without looking at whether
upstream provides hashes or not.

The corresponding archives were also downloaded from s.b.o. and the
hashes compared. When there was a mismatch, the commit log contains a
hint for Peter to remove them from s.b.o. Jsut grep for "Peter" in the
commit logs. ;-)

Note: only http/https/ftp packages have had hashes added; packages in a
VCS (git, hg, svn, cvs) were left alone for now. Patches can be added to
them in a later series.

Note-2: the patches have been excluded from patchwork, to avoid poluting
it. Besides, it's probably much easier to git-pull the branch rather
than apply all those 121 patches. ;-)

Note: wf111 is not included on purpose, since its source code can not be
automatically downloaded.

Regards,
Yann E. MORIN.


The following changes since commit 78448744f2ea14a89179032a1ae9561f61933277

  elfutils: do not override ELFUTILS_CFLAGS variable (2016-06-19 10:56:25 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to df8b229ce88812d9c28d1d61bc0c34ef044e479f

  package/ympd: add hash file (2016-06-19 13:01:20 +0200)


----------------------------------------------------------------
Yann E. MORIN (121):
      package/at91bootstrap: add hash file
      package/at91dataflashboot: add hash file
      package/cosmo: add hash file
      package/evtest: add hash file
      package/faifa: add hash file
      package/fbtft: add hash file
      package/gpu-amd-bin-mx51: add hash file
      package/gst-omx: add hash file
      package/gstreamer: add hash file
      package/gstreamer1: add hash file
      package/imx-usb-loader: add hash file
      package/ipkg: add hash file
      package/jquery-mobile: add hash file
      package/jquery-sparkline: add hash file
      package/jquery-ui: add hash file
      package/jquery-ui-themes: add hash file
      package/latencytop: add hash file
      package/libcofi: add hash file
      package/libglu: add hash file
      package/libhid: add hash file
      package/libphidget: add hash file
      package/libump: add hash file
      package/libz160: add hash file
      package/linux-headers: add hash file
      package/lua-msgpack-native: add hash file
      package/mxs-bootlets: add hash file
      package/omap-u-boot-utils: add hash file
      package/on2-8170-libs: add hash file
      package/on2-8170-modules: add hash file
      package/openvmtools: add hash file
      package/owl-linux: add hash file
      package/phidgetwebservice: add hash file
      package/python-configshell-fb: add hash file
      package/python-crc16: add hash file
      package/python-daemon: add hash file
      package/python-docopt: add hash file
      package/python-dpkt: add hash file
      package/python-ipy: add hash file
      package/python-ipython: add hash file
      package/python-json-schema-validator: add hash file
      package/python-keyring: add hash file
      package/python-libconfig: add hash file
      package/python-mad: add hash file
      package/python-markdown: add hash file
      package/python-meld3: add hash file
      package/python-pam: add hash file
      package/python-posix-ipc: add hash file
      package/python-protobuf: add hash file
      package/python-pydal: add hash file
      package/python-pypcap: add hash file
      package/python-pyro: add hash file
      package/python-pysnmp: add hash file
      package/python-pysnmp-apps: add hash file
      package/python-pysnmp-mibs: add hash file
      package/python-pyusb: add hash file
      package/python-pyzmq: add hash file
      package/python-rtslib-fb: add hash file
      package/python-simplejson: add hash file
      package/python-versiontools: add hash file
      package/qextserialport: add hash file
      package/qjson: add hash file
      package/qtuio: add hash file
      package/racehound: add hash file
      package/snowball-hdmiservice: add hash file
      package/sqlcipher: add hash file
      package/sunxi-boards: add hash file
      package/sunxi-cedarx: add hash file
      package/sunxi-mali-prop: add hash file
      package/sysdig: add hash file
      package/targetcli-fb: add hash file
      package/tidsp-binaries: add hash file
      package/tinyalsa: add hash file
      package/ti-utils: add hash file
      package/tzdump: add hash file
      package/webkit: add hash file
      package/wiringpi: add hash file
      package/wvdial: add hash file
      package/wvstreams: add hash file
      package/xapp_scripts: add hash file
      package/xapp_xinput-calibrator: add hash file
      package/xapp_xsetmode: add hash file
      package/xapp_xsetpointer: add hash file
      package/xcb-util: add hash file
      package/xcursor-transparent-theme: add hash file
      package/xdriver_xf86-video-fbturbo: add hash file
      package/xdriver_xf86-video-imx: add hash file
      package/xfont_font-adobe-100dpi: add hash file
      package/xfont_font-adobe-75dpi: add hash file
      package/xfont_font-adobe-utopia-100dpi: add hash file
      package/xfont_font-adobe-utopia-75dpi: add hash file
      package/xfont_font-adobe-utopia-type1: add hash file
      package/xfont_font-alias: add hash file
      package/xfont_font-arabic-misc: add hash file
      package/xfont_font-bh-100dpi: add hash file
      package/xfont_font-bh-75dpi: add hash file
      package/xfont_font-bh-lucidatypewriter-100dpi: add hash file
      package/xfont_font-bh-lucidatypewriter-75dpi: add hash file
      package/xfont_font-bh-type1: add hash file
      package/xfont_font-bitstream-100dpi: add hash file
      package/xfont_font-bitstream-75dpi: add hash file
      package/xfont_font-bitstream-type1: add hash file
      package/xfont_font-cronyx-cyrillic: add hash file
      package/xfont_font-cursor-misc: add hash file
      package/xfont_font-daewoo-misc: add hash file
      package/xfont_font-dec-misc: add hash file
      package/xfont_font-ibm-type1: add hash file
      package/xfont_font-isas-misc: add hash file
      package/xfont_font-jis-misc: add hash file
      package/xfont_font-micro-misc: add hash file
      package/xfont_font-misc-cyrillic: add hash file
      package/xfont_font-misc-ethiopic: add hash file
      package/xfont_font-misc-meltho: add hash file
      package/xfont_font-misc-misc: add hash file
      package/xfont_font-mutt-misc: add hash file
      package/xfont_font-schumacher-misc: add hash file
      package/xinetd: add hash file
      package/xl2tp: add hash file
      package/xxhash: add hash file
      package/yaffs2utils: add hash file
      package/yaml-cpp: add hash file
      package/ympd: add hash file

 boot/at91bootstrap/at91bootstrap.hash                                 | 2 ++
 boot/at91dataflashboot/at91dataflashboot.hash                         | 2 ++
 boot/mxs-bootlets/mxs-bootlets.hash                                   | 2 ++
 package/cosmo/cosmo.hash                                              | 2 ++
 package/evtest/evtest.hash                                            | 2 ++
 package/faifa/faifa.hash                                              | 2 ++
 package/fbtft/fbtft.hash                                              | 2 ++
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash          | 2 ++
 package/freescale-imx/libz160/libz160.hash                            | 2 ++
 package/gstreamer/gstreamer/gstreamer.hash                            | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.hash                               | 2 ++
 package/gstreamer1/gstreamer1/gstreamer1.hash                         | 4 ++--
 package/imx-usb-loader/imx-usb-loader.hash                            | 2 ++
 package/ipkg/ipkg.hash                                                | 2 ++
 package/jquery-mobile/jquery-mobile.hash                              | 2 ++
 package/jquery-sparkline/jquery-sparkline.hash                        | 2 ++
 package/jquery-ui-themes/jquery-ui-themes.hash                        | 2 ++
 package/jquery-ui/jquery-ui.hash                                      | 2 ++
 package/latencytop/latencytop.hash                                    | 2 ++
 package/libcofi/libcofi.hash                                          | 2 ++
 package/libglu/libglu.hash                                            | 2 ++
 package/libhid/libhid.hash                                            | 2 ++
 package/libphidget/libphidget.hash                                    | 2 ++
 package/libump/libump.hash                                            | 2 ++
 package/linux-headers/linux-headers.hash                              | 2 ++
 package/lua-msgpack-native/lua-msgpack-native.hash                    | 2 ++
 package/omap-u-boot-utils/omap-u-boot-utils.hash                      | 2 ++
 package/on2-8170-libs/on2-8170-libs.hash                              | 2 ++
 package/on2-8170-modules/on2-8170-modules.hash                        | 2 ++
 package/openvmtools/openvmtools.hash                                  | 2 ++
 package/owl-linux/owl-linux.hash                                      | 2 ++
 package/phidgetwebservice/phidgetwebservice.hash                      | 2 ++
 package/python-configshell-fb/python-configshell-fb.hash              | 2 ++
 package/python-crc16/python-crc16.hash                                | 2 ++
 package/python-daemon/python-daemon.hash                              | 2 ++
 package/python-docopt/python-docopt.hash                              | 2 ++
 package/python-dpkt/python-dpkt.hash                                  | 2 ++
 package/python-ipy/python-ipy.hash                                    | 2 ++
 package/python-ipython/python-ipython.hash                            | 2 ++
 .../python-json-schema-validator/python-json-schema-validator.hash    | 2 ++
 package/python-keyring/python-keyring.hash                            | 2 ++
 package/python-libconfig/python-libconfig.hash                        | 2 ++
 package/python-mad/python-mad.hash                                    | 2 ++
 package/python-markdown/python-markdown.hash                          | 2 ++
 package/python-meld3/python-meld3.hash                                | 2 ++
 package/python-pam/python-pam.hash                                    | 2 ++
 package/python-posix-ipc/python-posix-ipc.hash                        | 2 ++
 package/python-protobuf/python-protobuf.hash                          | 2 ++
 package/python-pydal/python-pydal.hash                                | 2 ++
 package/python-pypcap/python-pypcap.hash                              | 2 ++
 package/python-pyro/python-pyro.hash                                  | 2 ++
 package/python-pysnmp-apps/python-pysnmp-apps.hash                    | 2 ++
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash                    | 2 ++
 package/python-pysnmp/python-pysnmp.hash                              | 2 ++
 package/python-pyusb/python-pyusb.hash                                | 2 ++
 package/python-pyzmq/python-pyzmq.hash                                | 2 ++
 package/python-rtslib-fb/python-rtslib-fb.hash                        | 2 ++
 package/python-simplejson/python-simplejson.hash                      | 2 ++
 package/python-versiontools/python-versiontools.hash                  | 2 ++
 package/qextserialport/qextserialport.hash                            | 2 ++
 package/qjson/qjson.hash                                              | 2 ++
 package/qtuio/qtuio.hash                                              | 2 ++
 package/racehound/racehound.hash                                      | 2 ++
 package/snowball-hdmiservice/snowball-hdmiservice.hash                | 2 ++
 package/sqlcipher/sqlcipher.hash                                      | 2 ++
 package/sunxi-boards/sunxi-boards.hash                                | 2 ++
 package/sunxi-cedarx/sunxi-cedarx.hash                                | 2 ++
 package/sunxi-mali-prop/sunxi-mali-prop.hash                          | 2 ++
 package/sysdig/sysdig.hash                                            | 2 ++
 package/targetcli-fb/targetcli-fb.hash                                | 2 ++
 package/ti-utils/ti-utils.hash                                        | 2 ++
 package/tidsp-binaries/tidsp-binaries.hash                            | 2 ++
 package/tinyalsa/tinyalsa.hash                                        | 2 ++
 package/tzdump/tzdump.hash                                            | 2 ++
 package/webkit/webkit.hash                                            | 2 ++
 package/wiringpi/wiringpi.hash                                        | 2 ++
 package/wvdial/wvdial.hash                                            | 2 ++
 package/wvstreams/wvstreams.hash                                      | 2 ++
 package/x11r7/xapp_scripts/xapp_scripts.hash                          | 2 ++
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash      | 2 ++
 package/x11r7/xapp_xsetmode/xapp_xsetmode.hash                        | 2 ++
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash                  | 2 ++
 package/x11r7/xcb-util/xcb-util.hash                                  | 2 ++
 .../x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash    | 2 ++
 .../x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash  | 2 ++
 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.hash      | 2 ++
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash    | 2 ++
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash      | 2 ++
 .../xfont_font-adobe-utopia-100dpi.hash                               | 2 ++
 .../xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash  | 2 ++
 .../xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash  | 2 ++
 package/x11r7/xfont_font-alias/xfont_font-alias.hash                  | 2 ++
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash      | 2 ++
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash          | 2 ++
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash            | 2 ++
 .../xfont_font-bh-lucidatypewriter-100dpi.hash                        | 2 ++
 .../xfont_font-bh-lucidatypewriter-75dpi.hash                         | 2 ++
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash            | 2 ++
 .../xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash      | 2 ++
 .../x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash  | 2 ++
 .../x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash  | 2 ++
 .../x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash  | 2 ++
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash      | 2 ++
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash      | 2 ++
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash            | 2 ++
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash          | 2 ++
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash          | 2 ++
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash            | 2 ++
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash        | 2 ++
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash  | 2 ++
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash  | 2 ++
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash      | 2 ++
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash          | 2 ++
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash          | 2 ++
 .../x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash  | 2 ++
 package/xinetd/xinetd.hash                                            | 2 ++
 package/xl2tp/xl2tp.hash                                              | 2 ++
 package/xxhash/xxhash.hash                                            | 2 ++
 package/yaffs2utils/yaffs2utils.hash                                  | 2 ++
 package/yaml-cpp/yaml-cpp.hash                                        | 2 ++
 package/ympd/ympd.hash                                                | 2 ++
 121 files changed, 242 insertions(+), 4 deletions(-)
 create mode 100644 boot/at91bootstrap/at91bootstrap.hash
 create mode 100644 boot/at91dataflashboot/at91dataflashboot.hash
 create mode 100644 boot/mxs-bootlets/mxs-bootlets.hash
 create mode 100644 package/cosmo/cosmo.hash
 create mode 100644 package/evtest/evtest.hash
 create mode 100644 package/faifa/faifa.hash
 create mode 100644 package/fbtft/fbtft.hash
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.hash
 create mode 100644 package/freescale-imx/libz160/libz160.hash
 create mode 100644 package/gstreamer1/gst-omx/gst-omx.hash
 create mode 100644 package/imx-usb-loader/imx-usb-loader.hash
 create mode 100644 package/ipkg/ipkg.hash
 create mode 100644 package/jquery-mobile/jquery-mobile.hash
 create mode 100644 package/jquery-sparkline/jquery-sparkline.hash
 create mode 100644 package/jquery-ui-themes/jquery-ui-themes.hash
 create mode 100644 package/jquery-ui/jquery-ui.hash
 create mode 100644 package/latencytop/latencytop.hash
 create mode 100644 package/libcofi/libcofi.hash
 create mode 100644 package/libglu/libglu.hash
 create mode 100644 package/libhid/libhid.hash
 create mode 100644 package/libphidget/libphidget.hash
 create mode 100644 package/libump/libump.hash
 create mode 100644 package/linux-headers/linux-headers.hash
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native.hash
 create mode 100644 package/omap-u-boot-utils/omap-u-boot-utils.hash
 create mode 100644 package/on2-8170-libs/on2-8170-libs.hash
 create mode 100644 package/on2-8170-modules/on2-8170-modules.hash
 create mode 100644 package/openvmtools/openvmtools.hash
 create mode 100644 package/owl-linux/owl-linux.hash
 create mode 100644 package/phidgetwebservice/phidgetwebservice.hash
 create mode 100644 package/python-configshell-fb/python-configshell-fb.hash
 create mode 100644 package/python-crc16/python-crc16.hash
 create mode 100644 package/python-daemon/python-daemon.hash
 create mode 100644 package/python-docopt/python-docopt.hash
 create mode 100644 package/python-dpkt/python-dpkt.hash
 create mode 100644 package/python-ipy/python-ipy.hash
 create mode 100644 package/python-ipython/python-ipython.hash
 create mode 100644 package/python-json-schema-validator/python-json-schema-validator.hash
 create mode 100644 package/python-keyring/python-keyring.hash
 create mode 100644 package/python-libconfig/python-libconfig.hash
 create mode 100644 package/python-mad/python-mad.hash
 create mode 100644 package/python-markdown/python-markdown.hash
 create mode 100644 package/python-meld3/python-meld3.hash
 create mode 100644 package/python-pam/python-pam.hash
 create mode 100644 package/python-posix-ipc/python-posix-ipc.hash
 create mode 100644 package/python-protobuf/python-protobuf.hash
 create mode 100644 package/python-pydal/python-pydal.hash
 create mode 100644 package/python-pypcap/python-pypcap.hash
 create mode 100644 package/python-pyro/python-pyro.hash
 create mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.hash
 create mode 100644 package/python-pysnmp-mibs/python-pysnmp-mibs.hash
 create mode 100644 package/python-pysnmp/python-pysnmp.hash
 create mode 100644 package/python-pyusb/python-pyusb.hash
 create mode 100644 package/python-pyzmq/python-pyzmq.hash
 create mode 100644 package/python-rtslib-fb/python-rtslib-fb.hash
 create mode 100644 package/python-simplejson/python-simplejson.hash
 create mode 100644 package/python-versiontools/python-versiontools.hash
 create mode 100644 package/qextserialport/qextserialport.hash
 create mode 100644 package/qjson/qjson.hash
 create mode 100644 package/qtuio/qtuio.hash
 create mode 100644 package/racehound/racehound.hash
 create mode 100644 package/snowball-hdmiservice/snowball-hdmiservice.hash
 create mode 100644 package/sqlcipher/sqlcipher.hash
 create mode 100644 package/sunxi-boards/sunxi-boards.hash
 create mode 100644 package/sunxi-cedarx/sunxi-cedarx.hash
 create mode 100644 package/sunxi-mali-prop/sunxi-mali-prop.hash
 create mode 100644 package/sysdig/sysdig.hash
 create mode 100644 package/targetcli-fb/targetcli-fb.hash
 create mode 100644 package/ti-utils/ti-utils.hash
 create mode 100644 package/tidsp-binaries/tidsp-binaries.hash
 create mode 100644 package/tinyalsa/tinyalsa.hash
 create mode 100644 package/tzdump/tzdump.hash
 create mode 100644 package/webkit/webkit.hash
 create mode 100644 package/wiringpi/wiringpi.hash
 create mode 100644 package/wvdial/wvdial.hash
 create mode 100644 package/wvstreams/wvstreams.hash
 create mode 100644 package/x11r7/xapp_scripts/xapp_scripts.hash
 create mode 100644 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
 create mode 100644 package/x11r7/xapp_xsetmode/xapp_xsetmode.hash
 create mode 100644 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
 create mode 100644 package/x11r7/xcb-util/xcb-util.hash
 create mode 100644 package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.hash
 create mode 100644 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
 create mode 100644 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
 create mode 100644 package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
 create mode 100644 package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
 create mode 100644 package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
 create mode 100644 package/x11r7/xfont_font-alias/xfont_font-alias.hash
 create mode 100644 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
 create mode 100644 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
 create mode 100644 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
 create mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
 create mode 100644 package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
 create mode 100644 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
 create mode 100644 package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
 create mode 100644 package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
 create mode 100644 package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
 create mode 100644 package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
 create mode 100644 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.hash
 create mode 100644 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.hash
 create mode 100644 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
 create mode 100644 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
 create mode 100644 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
 create mode 100644 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.hash
 create mode 100644 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
 create mode 100644 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
 create mode 100644 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
 create mode 100644 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
 create mode 100644 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.hash
 create mode 100644 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
 create mode 100644 package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
 create mode 100644 package/xinetd/xinetd.hash
 create mode 100644 package/xl2tp/xl2tp.hash
 create mode 100644 package/xxhash/xxhash.hash
 create mode 100644 package/yaffs2utils/yaffs2utils.hash
 create mode 100644 package/yaml-cpp/yaml-cpp.hash
 create mode 100644 package/ympd/ympd.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
