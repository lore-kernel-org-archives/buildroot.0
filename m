From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  6 Jun 2013 11:53:30 +0200
Subject: [Buildroot] [PATCH 7/7] Normalize separator size to 80
In-Reply-To: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370512410-8553-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1370512410-8553-8-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 package/acl/acl.mk                                                | 4 ++--
 package/acpid/acpid.mk                                            | 4 ++--
 package/aespipe/aespipe.mk                                        | 4 ++--
 package/aircrack-ng/aircrack-ng.mk                                | 4 ++--
 package/alsa-lib/alsa-lib.mk                                      | 4 ++--
 package/alsamixergui/alsamixergui.mk                              | 4 ++--
 package/am33x-cm3/am33x-cm3.mk                                    | 4 ++--
 package/apr-util/apr-util.mk                                      | 4 ++--
 package/apr/apr.mk                                                | 4 ++--
 package/argp-standalone/argp-standalone.mk                        | 4 ++--
 package/argus/argus.mk                                            | 4 ++--
 package/arptables/arptables.mk                                    | 4 ++--
 package/at/at.mk                                                  | 4 ++--
 package/atk/atk.mk                                                | 4 ++--
 package/attr/attr.mk                                              | 4 ++--
 package/audiofile/audiofile.mk                                    | 4 ++--
 package/autoconf/autoconf.mk                                      | 4 ++--
 package/automake/automake.mk                                      | 4 ++--
 package/avahi/avahi.mk                                            | 4 ++--
 package/axel/axel.mk                                              | 4 ++--
 package/b43-firmware/b43-firmware.mk                              | 4 ++--
 package/b43-fwcutter/b43-fwcutter.mk                              | 4 ++--
 package/bash/bash.mk                                              | 4 ++--
 package/bcusdk/bcusdk.mk                                          | 4 ++--
 package/beecrypt/beecrypt.mk                                      | 4 ++--
 package/berkeleydb/berkeleydb.mk                                  | 4 ++--
 package/bind/bind.mk                                              | 4 ++--
 package/binutils/binutils.mk                                      | 4 ++--
 package/bison/bison.mk                                            | 4 ++--
 package/blackbox/blackbox.mk                                      | 4 ++--
 package/bluez_utils/bluez_utils.mk                                | 4 ++--
 package/bmon/bmon.mk                                              | 4 ++--
 package/boa/boa.mk                                                | 4 ++--
 package/boost/boost.mk                                            | 4 ++--
 package/bootutils/bootutils.mk                                    | 4 ++--
 package/bridge-utils/bridge-utils.mk                              | 4 ++--
 package/bsdiff/bsdiff.mk                                          | 4 ++--
 package/bustle/bustle.mk                                          | 4 ++--
 package/busybox/busybox.mk                                        | 4 ++--
 package/bwm-ng/bwm-ng.mk                                          | 4 ++--
 package/bzip2/bzip2.mk                                            | 4 ++--
 package/cache-calibrator/cache-calibrator.mk                      | 4 ++--
 package/cairo/cairo.mk                                            | 4 ++--
 package/can-utils/can-utils.mk                                    | 4 ++--
 package/ccache/ccache.mk                                          | 4 ++--
 package/ccid/ccid.mk                                              | 4 ++--
 package/cdrkit/cdrkit.mk                                          | 4 ++--
 package/cegui06/cegui06.mk                                        | 4 ++--
 package/celt051/celt.mk                                           | 4 ++--
 package/cgilua/cgilua.mk                                          | 4 ++--
 package/chrony/chrony.mk                                          | 4 ++--
 package/cjson/cjson.mk                                            | 4 ++--
 package/cmake/cmake.mk                                            | 4 ++--
 package/collectd/collectd.mk                                      | 4 ++--
 package/connman/connman.mk                                        | 4 ++--
 package/conntrack-tools/conntrack-tools.mk                        | 4 ++--
 package/copas/copas.mk                                            | 4 ++--
 package/coreutils/coreutils.mk                                    | 4 ++--
 package/coxpcall/coxpcall.mk                                      | 4 ++--
 package/cpanminus/cpanminus.mk                                    | 4 ++--
 package/cppzmq/cppzmq.mk                                          | 4 ++--
 package/cpuload/cpuload.mk                                        | 4 ++--
 package/cramfs/cramfs.mk                                          | 4 ++--
 package/crda/crda.mk                                              | 4 ++--
 package/cryptodev-linux/cryptodev-linux.mk                        | 4 ++--
 package/cryptodev/cryptodev.mk                                    | 4 ++--
 package/ctorrent/ctorrent.mk                                      | 4 ++--
 package/curlftpfs/curlftpfs.mk                                    | 4 ++--
 package/cvs/cvs.mk                                                | 4 ++--
 package/czmq/czmq.mk                                              | 4 ++--
 package/dash/dash.mk                                              | 4 ++--
 package/dbus-glib/dbus-glib.mk                                    | 4 ++--
 package/dbus-python/dbus-python.mk                                | 4 ++--
 package/dbus/dbus.mk                                              | 4 ++--
 package/devmem2/devmem2.mk                                        | 4 ++--
 package/dfu-util/dfu-util.mk                                      | 4 ++--
 package/dhcp/dhcp.mk                                              | 4 ++--
 package/dhcpdump/dhcpdump.mk                                      | 4 ++--
 package/dhrystone/dhrystone.mk                                    | 4 ++--
 package/dialog/dialog.mk                                          | 4 ++--
 package/diffutils/diffutils.mk                                    | 4 ++--
 package/directfb-examples/directfb-examples.mk                    | 4 ++--
 package/directfb/directfb.mk                                      | 4 ++--
 package/distcc/distcc.mk                                          | 4 ++--
 package/divine/divine.mk                                          | 4 ++--
 package/dmalloc/dmalloc.mk                                        | 4 ++--
 package/dmidecode/dmidecode.mk                                    | 4 ++--
 package/dmraid/dmraid.mk                                          | 4 ++--
 package/dnsmasq/dnsmasq.mk                                        | 4 ++--
 package/docker/docker.mk                                          | 4 ++--
 package/doom-wad/doom-wad.mk                                      | 4 ++--
 package/dosfstools/dosfstools.mk                                  | 4 ++--
 package/dropbear/dropbear.mk                                      | 4 ++--
 package/dstat/dstat.mk                                            | 4 ++--
 package/dtach/dtach.mk                                            | 4 ++--
 package/dtc/dtc.mk                                                | 4 ++--
 package/dvb-apps/dvb-apps.mk                                      | 4 ++--
 package/dvbsnoop/dvbsnoop.mk                                      | 4 ++--
 package/e2fsprogs/e2fsprogs.mk                                    | 4 ++--
 package/ebtables/ebtables.mk                                      | 4 ++--
 package/ecryptfs-utils/ecryptfs-utils.mk                          | 4 ++--
 package/ed/ed.mk                                                  | 4 ++--
 package/eeprog/eeprog.mk                                          | 4 ++--
 package/efl/expedite/expedite.mk                                  | 4 ++--
 package/efl/libecore/libecore.mk                                  | 4 ++--
 package/efl/libedbus/libedbus.mk                                  | 4 ++--
 package/efl/libedje/libedje.mk                                    | 4 ++--
 package/efl/libeet/libeet.mk                                      | 4 ++--
 package/efl/libeina/libeina.mk                                    | 4 ++--
 package/efl/libeio/libeio.mk                                      | 4 ++--
 package/efl/libembryo/libembryo.mk                                | 4 ++--
 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk    | 4 ++--
 package/efl/libevas/libevas.mk                                    | 4 ++--
 package/elftosb/elftosb.mk                                        | 4 ++--
 package/elfutils/elfutils.mk                                      | 4 ++--
 package/empty/empty.mk                                            | 4 ++--
 package/enchant/enchant.mk                                        | 4 ++--
 package/enlightenment/enlightenment.mk                            | 4 ++--
 package/enscript/enscript.mk                                      | 4 ++--
 package/erlang/erlang.mk                                          | 4 ++--
 package/ethtool/ethtool.mk                                        | 4 ++--
 package/evtest/evtest.mk                                          | 4 ++--
 package/exfat-utils/exfat-utils.mk                                | 4 ++--
 package/exfat/exfat.mk                                            | 4 ++--
 package/expat/expat.mk                                            | 4 ++--
 package/ezxml/ezxml.mk                                            | 4 ++--
 package/f2fs-tools/f2fs-tools.mk                                  | 4 ++--
 package/fakeroot/fakeroot.mk                                      | 4 ++--
 package/fan-ctrl/fan-ctrl.mk                                      | 4 ++--
 package/fb-test-app/fb-test-app.mk                                | 4 ++--
 package/fbdump/fbdump.mk                                          | 4 ++--
 package/fbset/fbset.mk                                            | 4 ++--
 package/fbterm/fbterm.mk                                          | 4 ++--
 package/fbv/fbv.mk                                                | 4 ++--
 package/fconfig/fconfig.mk                                        | 4 ++--
 package/file/file.mk                                              | 4 ++--
 package/filemq/filemq.mk                                          | 4 ++--
 package/findutils/findutils.mk                                    | 4 ++--
 package/fis/fis.mk                                                | 4 ++--
 package/flashbench/flashbench.mk                                  | 4 ++--
 package/flashrom/flashrom.mk                                      | 4 ++--
 package/flex/flex.mk                                              | 4 ++--
 package/fltk/fltk.mk                                              | 4 ++--
 package/fluxbox/fluxbox.mk                                        | 4 ++--
 package/fmtools/fmtools.mk                                        | 4 ++--
 package/fontconfig/fontconfig.mk                                  | 4 ++--
 package/foomatic-filters/foomatic-filters.mk                      | 4 ++--
 package/freerdp/freerdp.mk                                        | 4 ++--
 package/freescale-imx/firmware-imx/firmware-imx.mk                | 4 ++--
 package/freescale-imx/freescale-imx.mk                            | 4 ++--
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk        | 4 ++--
 package/freescale-imx/imx-lib/imx-lib.mk                          | 4 ++--
 package/freetype/freetype.mk                                      | 4 ++--
 package/fxload/fxload.mk                                          | 4 ++--
 package/gadgetfs-test/gadgetfs-test.mk                            | 4 ++--
 package/gamin/gamin.mk                                            | 4 ++--
 package/gawk/gawk.mk                                              | 4 ++--
 package/gdb/gdb.mk                                                | 4 ++--
 package/gdbm/gdbm.mk                                              | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                                  | 4 ++--
 package/genext2fs/genext2fs.mk                                    | 4 ++--
 package/genimage/genimage.mk                                      | 4 ++--
 package/genpart/genpart.mk                                        | 4 ++--
 package/genromfs/genromfs.mk                                      | 4 ++--
 package/gesftpserver/gesftpserver.mk                              | 4 ++--
 package/gettext/gettext.mk                                        | 4 ++--
 package/giblib/giblib.mk                                          | 4 ++--
 package/git/git.mk                                                | 4 ++--
 package/glib-networking/glib-networking.mk                        | 4 ++--
 package/glibmm/glibmm.mk                                          | 4 ++--
 package/gmp/gmp.mk                                                | 4 ++--
 package/gmpc/gmpc.mk                                              | 4 ++--
 package/gnuchess/gnuchess.mk                                      | 4 ++--
 package/gnupg/gnupg.mk                                            | 4 ++--
 package/gnuplot/gnuplot.mk                                        | 4 ++--
 package/gnutls/gnutls.mk                                          | 4 ++--
 package/gob2/gob2.mk                                              | 4 ++--
 package/googlefontdirectory/googlefontdirectory.mk                | 4 ++--
 package/gperf/gperf.mk                                            | 4 ++--
 package/gpsd/gpsd.mk                                              | 4 ++--
 package/gptfdisk/gptfdisk.mk                                      | 4 ++--
 package/gqview/gqview.mk                                          | 4 ++--
 package/grantlee/grantlee.mk                                      | 4 ++--
 package/grep/grep.mk                                              | 4 ++--
 package/gsl/gsl.mk                                                | 4 ++--
 package/gtest/gtest.mk                                            | 4 ++--
 package/gtk2-engines/gtk2-engines.mk                              | 4 ++--
 package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk      | 4 ++--
 package/gtkperf/gtkperf.mk                                        | 4 ++--
 package/gutenprint/gutenprint.mk                                  | 4 ++--
 package/gvfs/gvfs.mk                                              | 4 ++--
 package/gzip/gzip.mk                                              | 4 ++--
 package/haserl/haserl.mk                                          | 4 ++--
 package/hdparm/hdparm.mk                                          | 4 ++--
 package/heirloom-mailx/heirloom-mailx.mk                          | 4 ++--
 package/hostapd/hostapd.mk                                        | 4 ++--
 package/hplip/hplip.mk                                            | 4 ++--
 package/htop/htop.mk                                              | 4 ++--
 package/httping/httping.mk                                        | 4 ++--
 package/hwdata/hwdata.mk                                          | 4 ++--
 package/i2c-tools/i2c-tools.mk                                    | 4 ++--
 package/icu/icu.mk                                                | 4 ++--
 package/ifplugd/ifplugd.mk                                        | 4 ++--
 package/iftop/iftop.mk                                            | 4 ++--
 package/imagemagick/imagemagick.mk                                | 4 ++--
 package/imlib2/imlib2.mk                                          | 4 ++--
 package/inadyn/inadyn.mk                                          | 4 ++--
 package/infozip/infozip.mk                                        | 4 ++--
 package/inotify-tools/inotify-tools.mk                            | 4 ++--
 package/input-event-daemon/input-event-daemon.mk                  | 4 ++--
 package/input-tools/input-tools.mk                                | 4 ++--
 package/intltool/intltool.mk                                      | 4 ++--
 package/iostat/iostat.mk                                          | 4 ++--
 package/iozone/iozone.mk                                          | 4 ++--
 package/iperf/iperf.mk                                            | 4 ++--
 package/ipkg/ipkg.mk                                              | 4 ++--
 package/iproute2/iproute2.mk                                      | 4 ++--
 package/ipsec-tools/ipsec-tools.mk                                | 4 ++--
 package/ipset/ipset.mk                                            | 4 ++--
 package/iptables/iptables.mk                                      | 4 ++--
 package/irda-utils/irda-utils.mk                                  | 4 ++--
 package/iw/iw.mk                                                  | 4 ++--
 package/jansson/jansson.mk                                        | 4 ++--
 package/jhead/jhead.mk                                            | 4 ++--
 package/jpeg-turbo/jpeg-turbo.mk                                  | 4 ++--
 package/jpeg/jpeg.mk                                              | 4 ++--
 package/jquery-keyboard/jquery-keyboard.mk                        | 4 ++--
 package/jquery-ui-themes/jquery-ui-themes.mk                      | 4 ++--
 package/jquery-ui/jquery-ui.mk                                    | 4 ++--
 package/json-glib/json-glib.mk                                    | 4 ++--
 package/json-javascript/json-javascript.mk                        | 4 ++--
 package/kbd/kbd.mk                                                | 4 ++--
 package/kexec/kexec.mk                                            | 4 ++--
 package/keyutils/keyutils.mk                                      | 4 ++--
 package/kismet/kismet.mk                                          | 4 ++--
 package/kmod/kmod.mk                                              | 4 ++--
 package/latencytop/latencytop.mk                                  | 4 ++--
 package/lcdapi/lcdapi.mk                                          | 4 ++--
 package/lcdproc/lcdproc.mk                                        | 4 ++--
 package/lcms2/lcms2.mk                                            | 4 ++--
 package/leafpad/leafpad.mk                                        | 4 ++--
 package/less/less.mk                                              | 4 ++--
 package/libaio/libaio.mk                                          | 4 ++--
 package/libao/libao.mk                                            | 4 ++--
 package/libarchive/libarchive.mk                                  | 4 ++--
 package/libargtable2/libargtable2.mk                              | 4 ++--
 package/libart/libart.mk                                          | 4 ++--
 package/libatasmart/libatasmart.mk                                | 4 ++--
 package/libatomic_ops/libatomic_ops.mk                            | 4 ++--
 package/libbsd/libbsd.mk                                          | 4 ++--
 package/libcap-ng/libcap-ng.mk                                    | 4 ++--
 package/libcap/libcap.mk                                          | 4 ++--
 package/libcdaudio/libcdaudio.mk                                  | 4 ++--
 package/libcgi/libcgi.mk                                          | 4 ++--
 package/libcgicc/libcgicc.mk                                      | 4 ++--
 package/libcofi/libcofi.mk                                        | 4 ++--
 package/libconfig/libconfig.mk                                    | 4 ++--
 package/libconfuse/libconfuse.mk                                  | 4 ++--
 package/libcurl/libcurl.mk                                        | 4 ++--
 package/libdaemon/libdaemon.mk                                    | 4 ++--
 package/libdmtx/libdmtx.mk                                        | 4 ++--
 package/libdnet/libdnet.mk                                        | 4 ++--
 package/libdrm/libdrm.mk                                          | 4 ++--
 package/libdvdnav/libdvdnav.mk                                    | 4 ++--
 package/libdvdread/libdvdread.mk                                  | 4 ++--
 package/libeXosip2/libeXosip2.mk                                  | 4 ++--
 package/libebml/libebml.mk                                        | 4 ++--
 package/libedit/libedit.mk                                        | 4 ++--
 package/libelf/libelf.mk                                          | 4 ++--
 package/liberation/liberation.mk                                  | 4 ++--
 package/libesmtp/libesmtp.mk                                      | 4 ++--
 package/libev/libev.mk                                            | 4 ++--
 package/libevent/libevent.mk                                      | 4 ++--
 package/libexif/libexif.mk                                        | 4 ++--
 package/libfcgi/libfcgi.mk                                        | 4 ++--
 package/libffi/libffi.mk                                          | 4 ++--
 package/libfreefare/libfreefare.mk                                | 4 ++--
 package/libfribidi/libfribidi.mk                                  | 4 ++--
 package/libfslcodec/libfslcodec.mk                                | 4 ++--
 package/libfslparser/libfslparser.mk                              | 4 ++--
 package/libfslvpuwrap/libfslvpuwrap.mk                            | 4 ++--
 package/libftdi/libftdi.mk                                        | 4 ++--
 package/libfuse/libfuse.mk                                        | 4 ++--
 package/libgail/libgail.mk                                        | 4 ++--
 package/libgcrypt/libgcrypt.mk                                    | 4 ++--
 package/libgeotiff/libgeotiff.mk                                  | 4 ++--
 package/libglade/libglade.mk                                      | 4 ++--
 package/libglib2/libglib2.mk                                      | 4 ++--
 package/libgpg-error/libgpg-error.mk                              | 4 ++--
 package/libgsasl/libgsasl.mk                                      | 4 ++--
 package/libgtk2/libgtk2.mk                                        | 4 ++--
 package/libhid/libhid.mk                                          | 4 ++--
 package/libical/libical.mk                                        | 4 ++--
 package/libiconv/libiconv.mk                                      | 4 ++--
 package/libid3tag/libid3tag.mk                                    | 4 ++--
 package/libidn/libidn.mk                                          | 4 ++--
 package/libiqrf/libiqrf.mk                                        | 4 ++--
 package/libiscsi/libiscsi.mk                                      | 4 ++--
 package/libjpeg/libjpeg.mk                                        | 4 ++--
 package/libjson/libjson.mk                                        | 4 ++--
 package/liblo/liblo.mk                                            | 4 ++--
 package/liblockfile/liblockfile.mk                                | 4 ++--
 package/liblog4c-localtime/liblog4c-localtime.mk                  | 4 ++--
 package/libmad/libmad.mk                                          | 4 ++--
 package/libmatroska/libmatroska.mk                                | 4 ++--
 package/libmbus/libmbus.mk                                        | 4 ++--
 package/libmcrypt/libmcrypt.mk                                    | 4 ++--
 package/libmhash/libmhash.mk                                      | 4 ++--
 package/libmicrohttpd/libmicrohttpd.mk                            | 4 ++--
 package/libmms/libmms.mk                                          | 4 ++--
 package/libmnl/libmnl.mk                                          | 4 ++--
 package/libmodbus/libmodbus.mk                                    | 4 ++--
 package/libmpd/libmpd.mk                                          | 4 ++--
 package/libmpeg2/libmpeg2.mk                                      | 4 ++--
 package/libnetfilter_acct/libnetfilter-acct.mk                    | 4 ++--
 package/libnetfilter_conntrack/libnetfilter-conntrack.mk          | 4 ++--
 package/libnetfilter_cthelper/libnetfilter-cthelper.mk            | 4 ++--
 package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk          | 4 ++--
 package/libnetfilter_log/libnetfilter-log.mk                      | 4 ++--
 package/libnetfilter_queue/libnetfilter-queue.mk                  | 4 ++--
 package/libnfc-llcp/libnfc-llcp.mk                                | 4 ++--
 package/libnfc/libnfc.mk                                          | 4 ++--
 package/libnfnetlink/libnfnetlink.mk                              | 4 ++--
 package/libnl/libnl.mk                                            | 4 ++--
 package/libnspr/libnspr.mk                                        | 4 ++--
 package/libnss/libnss.mk                                          | 4 ++--
 package/liboauth/liboauth.mk                                      | 4 ++--
 package/libogg/libogg.mk                                          | 4 ++--
 package/liboping/liboping.mk                                      | 4 ++--
 package/libosip2/libosip2.mk                                      | 4 ++--
 package/libpcap/libpcap.mk                                        | 4 ++--
 package/libpfm4/libpfm4.mk                                        | 4 ++--
 package/libplayer/libplayer.mk                                    | 4 ++--
 package/libpng/libpng.mk                                          | 4 ++--
 package/libpthsem/libpthsem.mk                                    | 4 ++--
 package/libraw/libraw.mk                                          | 4 ++--
 package/libraw1394/libraw1394.mk                                  | 4 ++--
 package/librsvg/librsvg.mk                                        | 4 ++--
 package/librsync/librsync.mk                                      | 4 ++--
 package/libseccomp/libseccomp.mk                                  | 4 ++--
 package/libserial/libserial.mk                                    | 4 ++--
 package/libsha1/libsha1.mk                                        | 4 ++--
 package/libsigc/libsigc.mk                                        | 4 ++--
 package/libsigsegv/libsigsegv.mk                                  | 4 ++--
 package/libsndfile/libsndfile.mk                                  | 4 ++--
 package/libsoup/libsoup.mk                                        | 4 ++--
 package/libsvgtiny/libsvgtiny.mk                                  | 4 ++--
 package/libsysfs/libsysfs.mk                                      | 4 ++--
 package/libtasn1/libtasn1.mk                                      | 4 ++--
 package/libtheora/libtheora.mk                                    | 4 ++--
 package/libtirpc/libtirpc.mk                                      | 4 ++--
 package/libtool/libtool.mk                                        | 4 ++--
 package/libtorrent/libtorrent.mk                                  | 4 ++--
 package/libtpl/libtpl.mk                                          | 4 ++--
 package/libungif/libungif.mk                                      | 4 ++--
 package/libupnp/libupnp.mk                                        | 4 ++--
 package/liburcu/liburcu.mk                                        | 4 ++--
 package/libusb-compat/libusb-compat.mk                            | 4 ++--
 package/libusb/libusb.mk                                          | 4 ++--
 package/libv4l/libv4l.mk                                          | 4 ++--
 package/libvncserver/libvncserver.mk                              | 4 ++--
 package/libvorbis/libvorbis.mk                                    | 4 ++--
 package/libxkbcommon/libxkbcommon.mk                              | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk                  | 4 ++--
 package/libxml2/libxml2.mk                                        | 4 ++--
 package/libxmlpp/libxmlpp.mk                                      | 4 ++--
 package/libxslt/libxslt.mk                                        | 4 ++--
 package/libyaml/libyaml.mk                                        | 4 ++--
 package/lighttpd/lighttpd.mk                                      | 4 ++--
 package/linenoise/linenoise.mk                                    | 4 ++--
 package/linknx/linknx.mk                                          | 4 ++--
 package/links/links.mk                                            | 4 ++--
 package/linphone/linphone.mk                                      | 4 ++--
 package/linux-firmware/linux-firmware.mk                          | 4 ++--
 package/linux-fusion/linux-fusion.mk                              | 4 ++--
 package/linux-pam/linux-pam.mk                                    | 4 ++--
 package/lite/lite.mk                                              | 4 ++--
 package/live555/live555.mk                                        | 4 ++--
 package/lm-sensors/lm-sensors.mk                                  | 4 ++--
 package/lmbench/lmbench.mk                                        | 4 ++--
 package/localedef/localedef.mk                                    | 4 ++--
 package/lockfile-progs/lockfile-progs.mk                          | 4 ++--
 package/log4cxx/log4cxx.mk                                        | 4 ++--
 package/logrotate/logrotate.mk                                    | 4 ++--
 package/logsurfer/logsurfer.mk                                    | 4 ++--
 package/lrzsz/lrzsz.mk                                            | 4 ++--
 package/lshw/lshw.mk                                              | 4 ++--
 package/lsof/lsof.mk                                              | 4 ++--
 package/lsuio/lsuio.mk                                            | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk                            | 4 ++--
 package/ltrace/ltrace.mk                                          | 4 ++--
 package/lttng-libust/lttng-libust.mk                              | 4 ++--
 package/lttng-modules/lttng-modules.mk                            | 4 ++--
 package/lttng-tools/lttng-tools.mk                                | 4 ++--
 package/lua-msgpack-native/lua-msgpack-native.mk                  | 4 ++--
 package/lua/lua.mk                                                | 4 ++--
 package/luacjson/luacjson.mk                                      | 4 ++--
 package/luaexpat/luaexpat.mk                                      | 4 ++--
 package/luafilesystem/luafilesystem.mk                            | 4 ++--
 package/luajit/luajit.mk                                          | 4 ++--
 package/luasocket/luasocket.mk                                    | 4 ++--
 package/lvm2/lvm2.mk                                              | 4 ++--
 package/lzma/lzma.mk                                              | 4 ++--
 package/lzo/lzo.mk                                                | 4 ++--
 package/lzop/lzop.mk                                              | 4 ++--
 package/m4/m4.mk                                                  | 4 ++--
 package/macchanger/macchanger.mk                                  | 4 ++--
 package/make/make.mk                                              | 4 ++--
 package/makedevs/makedevs.mk                                      | 4 ++--
 package/matchbox/matchbox-common/matchbox-common.mk               | 6 +++---
 package/matchbox/matchbox-desktop/matchbox-desktop.mk             | 8 ++++----
 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk             | 6 +++---
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk           | 8 ++++----
 package/matchbox/matchbox-lib/matchbox-lib.mk                     | 8 ++++----
 package/matchbox/matchbox-panel/matchbox-panel.mk                 | 8 ++++----
 .../matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk | 6 +++---
 package/matchbox/matchbox-wm/matchbox-wm.mk                       | 8 ++++----
 package/mcrypt/mcrypt.mk                                          | 4 ++--
 package/mdadm/mdadm.mk                                            | 4 ++--
 package/media-ctl/media-ctl.mk                                    | 4 ++--
 package/mediastreamer/mediastreamer.mk                            | 4 ++--
 package/memstat/memstat.mk                                        | 4 ++--
 package/memtester/memtester.mk                                    | 4 ++--
 package/metacity/metacity.mk                                      | 4 ++--
 package/midori/midori.mk                                          | 4 ++--
 package/mii-diag/mii-diag.mk                                      | 4 ++--
 package/minicom/minicom.mk                                        | 4 ++--
 .../mobile_broadband_provider_info.mk                             | 4 ++--
 package/module-init-tools/module-init-tools.mk                    | 4 ++--
 package/mongoose/mongoose.mk                                      | 4 ++--
 package/mongrel2/mongrel2.mk                                      | 4 ++--
 package/monit/monit.mk                                            | 4 ++--
 package/mpc/mpc.mk                                                | 4 ++--
 package/mpfr/mpfr.mk                                              | 4 ++--
 package/mrouted/mrouted.mk                                        | 4 ++--
 package/msmtp/msmtp.mk                                            | 4 ++--
 package/mtd/mtd.mk                                                | 4 ++--
 package/mtdev/mtdev.mk                                            | 4 ++--
 package/mtdev2tuio/mtdev2tuio.mk                                  | 4 ++--
 package/mtools/mtools.mk                                          | 4 ++--
 package/multimedia/alsa-utils/alsa-utils.mk                       | 4 ++--
 package/multimedia/aumix/aumix.mk                                 | 4 ++--
 package/multimedia/bellagio/bellagio.mk                           | 4 ++--
 package/multimedia/ffmpeg/ffmpeg.mk                               | 4 ++--
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk                       | 4 ++--
 package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk             | 4 ++--
 package/multimedia/gst-plugins-bad/gst-plugins-bad.mk             | 4 ++--
 package/multimedia/gst-plugins-base/gst-plugins-base.mk           | 4 ++--
 package/multimedia/gst-plugins-good/gst-plugins-good.mk           | 4 ++--
 package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk           | 4 ++--
 package/multimedia/gstreamer/gstreamer.mk                         | 4 ++--
 package/multimedia/lame/lame.mk                                   | 4 ++--
 package/multimedia/libvpx/libvpx.mk                               | 4 ++--
 package/multimedia/madplay/madplay.mk                             | 4 ++--
 package/multimedia/mpd/mpd.mk                                     | 4 ++--
 package/multimedia/mpg123/mpg123.mk                               | 4 ++--
 package/multimedia/mplayer/mplayer.mk                             | 4 ++--
 package/multimedia/vorbis-tools/vorbis-tools.mk                   | 4 ++--
 package/mutt/mutt.mk                                              | 4 ++--
 package/mxml/mxml.mk                                              | 4 ++--
 package/mysql_client/mysql_client.mk                              | 4 ++--
 package/nano/nano.mk                                              | 4 ++--
 package/nanocom/nanocom.mk                                        | 4 ++--
 package/nasm/nasm.mk                                              | 4 ++--
 package/nbd/nbd.mk                                                | 4 ++--
 package/ncdu/ncdu.mk                                              | 4 ++--
 package/ncftp/ncftp.mk                                            | 4 ++--
 package/ncurses/ncurses.mk                                        | 4 ++--
 package/ndisc6/ndisc6.mk                                          | 4 ++--
 package/ne10/ne10.mk                                              | 4 ++--
 package/neard/neard.mk                                            | 4 ++--
 package/neardal/neardal.mk                                        | 4 ++--
 package/neon/neon.mk                                              | 4 ++--
 package/netatalk/netatalk.mk                                      | 4 ++--
 package/netcat/netcat.mk                                          | 4 ++--
 package/netkitbase/netkitbase.mk                                  | 4 ++--
 package/netkittelnet/netkittelnet.mk                              | 4 ++--
 package/netperf/netperf.mk                                        | 4 ++--
 package/netplug/netplug.mk                                        | 4 ++--
 package/netsnmp/netsnmp.mk                                        | 4 ++--
 package/netstat-nat/netstat-nat.mk                                | 4 ++--
 package/network-manager/network-manager.mk                        | 4 ++--
 package/newt/newt.mk                                              | 4 ++--
 package/nfacct/nfacct.mk                                          | 4 ++--
 package/nfs-utils/nfs-utils.mk                                    | 4 ++--
 package/ngircd/ngircd.mk                                          | 4 ++--
 package/ngrep/ngrep.mk                                            | 4 ++--
 package/nmap/nmap.mk                                              | 4 ++--
 package/nodejs/nodejs.mk                                          | 4 ++--
 package/noip/noip.mk                                              | 4 ++--
 package/nss-mdns/nss-mdns.mk                                      | 4 ++--
 package/ntfs-3g/ntfs-3g.mk                                        | 4 ++--
 package/ntp/ntp.mk                                                | 4 ++--
 package/numactl/numactl.mk                                        | 4 ++--
 package/nuttcp/nuttcp.mk                                          | 4 ++--
 package/ocf-linux/ocf-linux.mk                                    | 4 ++--
 package/ofono/ofono.mk                                            | 4 ++--
 package/olsr/olsr.mk                                              | 4 ++--
 package/omap-u-boot-utils/omap-u-boot-utils.mk                    | 4 ++--
 package/open2300/open2300.mk                                      | 4 ++--
 package/opencv/opencv.mk                                          | 4 ++--
 package/opengl/libegl/libegl.mk                                   | 4 ++--
 package/opengl/libgles/libgles.mk                                 | 4 ++--
 package/opengl/libopenmax/libopenmax.mk                           | 4 ++--
 package/opengl/libopenvg/libopenvg.mk                             | 4 ++--
 package/openntpd/openntpd.mk                                      | 4 ++--
 package/openobex/openobex.mk                                      | 4 ++--
 package/openocd/openocd.mk                                        | 4 ++--
 package/openpgm/openpgm.mk                                        | 4 ++--
 package/openssh/openssh.mk                                        | 4 ++--
 package/openssl/openssl.mk                                        | 4 ++--
 package/openswan/openswan.mk                                      | 4 ++--
 package/openvpn/openvpn.mk                                        | 4 ++--
 package/opkg/opkg.mk                                              | 4 ++--
 package/oprofile/oprofile.mk                                      | 4 ++--
 package/opus-tools/opus-tools.mk                                  | 4 ++--
 package/opus/opus.mk                                              | 4 ++--
 package/orc/orc.mk                                                | 4 ++--
 package/owl-linux/owl-linux.mk                                    | 4 ++--
 package/p11-kit/p11-kit.mk                                        | 4 ++--
 package/pango/pango.mk                                            | 4 ++--
 package/parted/parted.mk                                          | 4 ++--
 package/patch/patch.mk                                            | 4 ++--
 package/pciutils/pciutils.mk                                      | 4 ++--
 package/pcmanfm/pcmanfm.mk                                        | 4 ++--
 package/pcre/pcre.mk                                              | 4 ++--
 package/pcsc-lite/pcsc-lite.mk                                    | 4 ++--
 package/perf/perf.mk                                              | 4 ++--
 package/perl/perl.mk                                              | 4 ++--
 package/php/php.mk                                                | 4 ++--
 package/picocom/picocom.mk                                        | 4 ++--
 package/pkg-config/pkg-config.mk                                  | 4 ++--
 package/pkg-download.mk                                           | 4 ++--
 package/pkg-utils.mk                                              | 4 ++--
 package/pkgconf/pkgconf.mk                                        | 4 ++--
 package/pmake/pmake.mk                                            | 4 ++--
 package/poco/poco.mk                                              | 4 ++--
 package/polkit/polkit.mk                                          | 4 ++--
 package/poppler/poppler.mk                                        | 4 ++--
 package/popt/popt.mk                                              | 4 ++--
 package/portmap/portmap.mk                                        | 4 ++--
 package/pppd/pppd.mk                                              | 4 ++--
 package/pptp-linux/pptp-linux.mk                                  | 4 ++--
 package/prboom/prboom.mk                                          | 4 ++--
 package/procps/procps.mk                                          | 4 ++--
 package/proftpd/proftpd.mk                                        | 4 ++--
 package/protobuf-c/protobuf-c.mk                                  | 4 ++--
 package/protobuf/protobuf.mk                                      | 4 ++--
 package/proxychains-ng/proxychains-ng.mk                          | 4 ++--
 package/psmisc/psmisc.mk                                          | 4 ++--
 package/ptpd/ptpd.mk                                              | 4 ++--
 package/ptpd2/ptpd2.mk                                            | 4 ++--
 package/pv/pv.mk                                                  | 4 ++--
 package/python-bottle/python-bottle.mk                            | 4 ++--
 package/python-distutilscross/python-distutilscross.mk            | 4 ++--
 package/python-dpkt/python-dpkt.mk                                | 4 ++--
 package/python-id3/python-id3.mk                                  | 4 ++--
 package/python-m2crypto/python-m2crypto.mk                        | 4 ++--
 package/python-mad/python-mad.mk                                  | 4 ++--
 package/python-meld3/python-meld3.mk                              | 4 ++--
 package/python-netifaces/python-netifaces.mk                      | 4 ++--
 package/python-nfc/python-nfc.mk                                  | 4 ++--
 package/python-protobuf/python-protobuf.mk                        | 4 ++--
 package/python-pygame/python-pygame.mk                            | 4 ++--
 package/python-pyparsing/python-pyparsing.mk                      | 4 ++--
 package/python-serial/python-serial.mk                            | 4 ++--
 package/python-setuptools/python-setuptools.mk                    | 4 ++--
 package/python-thrift/python-thrift.mk                            | 4 ++--
 package/python/python.mk                                          | 4 ++--
 package/python3/python3.mk                                        | 4 ++--
 package/qemu/qemu.mk                                              | 4 ++--
 package/qextserialport/qextserialport.mk                          | 4 ++--
 package/qjson/qjson.mk                                            | 4 ++--
 package/qt/qt.mk                                                  | 4 ++--
 package/qt5/qt5base/qt5base.mk                                    | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk                      | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk            | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk                    | 4 ++--
 package/qt5/qt5jsbackend/qt5jsbackend.mk                          | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk                        | 4 ++--
 package/qt5/qt5quick1/qt5quick1.mk                                | 4 ++--
 package/qt5/qt5script/qt5script.mk                                | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                                      | 4 ++--
 package/qt5/qt5webkit/qt5webkit.mk                                | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                      | 4 ++--
 package/qtuio/qtuio.mk                                            | 4 ++--
 package/quagga/quagga.mk                                          | 4 ++--
 package/quota/quota.mk                                            | 4 ++--
 package/qwt/qwt.mk                                                | 4 ++--
 package/radvd/radvd.mk                                            | 4 ++--
 package/ramspeed/ramspeed.mk                                      | 4 ++--
 package/rapidjson/rapidjson.mk                                    | 4 ++--
 package/rdesktop/rdesktop.mk                                      | 4 ++--
 package/read-edid/read-edid.mk                                    | 4 ++--
 package/readline/readline.mk                                      | 4 ++--
 package/redis/redis.mk                                            | 4 ++--
 package/rings/rings.mk                                            | 4 ++--
 package/rng-tools/rng-tools.mk                                    | 4 ++--
 package/rp-pppoe/rp-pppoe.mk                                      | 4 ++--
 package/rpcbind/rpcbind.mk                                        | 4 ++--
 package/rpi-firmware/rpi-firmware.mk                              | 4 ++--
 package/rpi-userland/rpi-userland.mk                              | 4 ++--
 package/rpm/rpm.mk                                                | 4 ++--
 package/rrdtool/rrdtool.mk                                        | 4 ++--
 package/rsh-redone/rsh-redone.mk                                  | 4 ++--
 package/rsync/rsync.mk                                            | 4 ++--
 package/rsyslog/rsyslog.mk                                        | 4 ++--
 package/rtorrent/rtorrent.mk                                      | 4 ++--
 package/rubix/rubix.mk                                            | 4 ++--
 package/ruby/ruby.mk                                              | 4 ++--
 package/sam-ba/sam-ba.mk                                          | 4 ++--
 package/samba/samba.mk                                            | 4 ++--
 package/sane-backends/sane-backends.mk                            | 4 ++--
 package/sawman/sawman.mk                                          | 4 ++--
 package/schifra/schifra.mk                                        | 4 ++--
 package/sconeserver/sconeserver.mk                                | 4 ++--
 package/screen/screen.mk                                          | 4 ++--
 package/sdl/sdl.mk                                                | 4 ++--
 package/sdl_gfx/sdl_gfx.mk                                        | 4 ++--
 package/sdl_image/sdl_image.mk                                    | 4 ++--
 package/sdl_mixer/sdl_mixer.mk                                    | 4 ++--
 package/sdl_net/sdl_net.mk                                        | 4 ++--
 package/sdl_sound/sdl_sound.mk                                    | 4 ++--
 package/sdl_ttf/sdl_ttf.mk                                        | 4 ++--
 package/sed/sed.mk                                                | 4 ++--
 package/ser2net/ser2net.mk                                        | 4 ++--
 package/setserial/setserial.mk                                    | 4 ++--
 package/sg3_utils/sg3_utils.mk                                    | 4 ++--
 package/shared-mime-info/shared-mime-info.mk                      | 4 ++--
 package/slang/slang.mk                                            | 4 ++--
 package/slirp/slirp.mk                                            | 4 ++--
 package/smartmontools/smartmontools.mk                            | 4 ++--
 package/snappy/snappy.mk                                          | 4 ++--
 package/snowball-hdmiservice/snowball-hdmiservice.mk              | 4 ++--
 package/snowball-init/snowball-init.mk                            | 4 ++--
 package/socat/socat.mk                                            | 4 ++--
 package/socketcand/socketcand.mk                                  | 4 ++--
 package/sound-theme-borealis/sound-theme-borealis.mk              | 4 ++--
 package/sound-theme-freedesktop/sound-theme-freedesktop.mk        | 4 ++--
 package/spawn-fcgi/spawn-fcgi.mk                                  | 4 ++--
 package/speex/speex.mk                                            | 4 ++--
 package/spice-protocol/spice-protocol.mk                          | 4 ++--
 package/spice/spice.mk                                            | 4 ++--
 package/sqlcipher/sqlcipher.mk                                    | 4 ++--
 package/sqlite/sqlite.mk                                          | 4 ++--
 package/squid/squid.mk                                            | 4 ++--
 package/sredird/sredird.mk                                        | 4 ++--
 package/sshfs/sshfs.mk                                            | 4 ++--
 package/sstrip/sstrip.mk                                          | 4 ++--
 package/startup-notification/startup-notification.mk              | 4 ++--
 package/statserial/statserial.mk                                  | 4 ++--
 package/strace/strace.mk                                          | 4 ++--
 package/stress/stress.mk                                          | 4 ++--
 package/stunnel/stunnel.mk                                        | 4 ++--
 package/sudo/sudo.mk                                              | 4 ++--
 package/sunxi-boards/sunxi-boards.mk                              | 4 ++--
 package/sunxi-tools/sunxi-tools.mk                                | 4 ++--
 package/supervisor/supervisor.mk                                  | 4 ++--
 package/swig/swig.mk                                              | 4 ++--
 package/sylpheed/sylpheed.mk                                      | 4 ++--
 package/synergy/synergy.mk                                        | 4 ++--
 package/sysklogd/sysklogd.mk                                      | 4 ++--
 package/sysprof/sysprof.mk                                        | 4 ++--
 package/sysstat/sysstat.mk                                        | 4 ++--
 package/systemd/systemd.mk                                        | 4 ++--
 package/sysvinit/sysvinit.mk                                      | 4 ++--
 package/taglib/taglib.mk                                          | 4 ++--
 package/tar/tar.mk                                                | 4 ++--
 package/tcl/tcl.mk                                                | 4 ++--
 package/tcllib/tcllib.mk                                          | 4 ++--
 package/tcpdump/tcpdump.mk                                        | 4 ++--
 package/tcpreplay/tcpreplay.mk                                    | 4 ++--
 package/texinfo/texinfo.mk                                        | 4 ++--
 package/tftpd/tftpd.mk                                            | 4 ++--
 package/thttpd/thttpd.mk                                          | 4 ++--
 package/ti-utils/ti-utils.mk                                      | 4 ++--
 package/tiff/tiff.mk                                              | 4 ++--
 package/time/time.mk                                              | 4 ++--
 package/tinyhttpd/tinyhttpd.mk                                    | 4 ++--
 package/tn5250/tn5250.mk                                          | 4 ++--
 package/torsmo/torsmo.mk                                          | 4 ++--
 package/transmission/transmission.mk                              | 4 ++--
 package/tremor/tremor.mk                                          | 4 ++--
 package/tslib/tslib.mk                                            | 4 ++--
 package/ttcp/ttcp.mk                                              | 4 ++--
 package/tvheadend/tvheadend.mk                                    | 4 ++--
 package/tzdata/tzdata.mk                                          | 4 ++--
 package/uboot-tools/uboot-tools.mk                                | 4 ++--
 package/udev/udev.mk                                              | 4 ++--
 package/udisks/udisks.mk                                          | 4 ++--
 package/udpcast/udpcast.mk                                        | 4 ++--
 package/uemacs/uemacs.mk                                          | 4 ++--
 package/ulogd/ulogd.mk                                            | 4 ++--
 package/unionfs/unionfs.mk                                        | 4 ++--
 package/urg/urg.mk                                                | 4 ++--
 package/usb_modeswitch/usb_modeswitch.mk                          | 4 ++--
 package/usb_modeswitch_data/usb_modeswitch_data.mk                | 4 ++--
 package/usbmount/usbmount.mk                                      | 4 ++--
 package/usbredir/usbredir.mk                                      | 4 ++--
 package/usbutils/usbutils.mk                                      | 4 ++--
 package/ushare/ushare.mk                                          | 4 ++--
 package/ussp-push/ussp-push.mk                                    | 4 ++--
 package/util-linux/util-linux.mk                                  | 4 ++--
 package/ux500-firmware/ux500-firmware.mk                          | 4 ++--
 package/vala/vala.mk                                              | 4 ++--
 package/valgrind/valgrind.mk                                      | 4 ++--
 package/vde2/vde2.mk                                              | 4 ++--
 package/vim/vim.mk                                                | 4 ++--
 package/vpnc/vpnc.mk                                              | 4 ++--
 package/vsftpd/vsftpd.mk                                          | 4 ++--
 package/vtun/vtun.mk                                              | 4 ++--
 package/wayland/wayland.mk                                        | 4 ++--
 package/webkit/webkit.mk                                          | 4 ++--
 package/webp/webp.mk                                              | 4 ++--
 package/weston/weston.mk                                          | 4 ++--
 package/wget/wget.mk                                              | 4 ++--
 package/whetstone/whetstone.mk                                    | 4 ++--
 package/which/which.mk                                            | 4 ++--
 package/wipe/wipe.mk                                              | 4 ++--
 package/wireless-regdb/wireless-regdb.mk                          | 4 ++--
 package/wireless_tools/wireless_tools.mk                          | 4 ++--
 package/wireshark/wireshark.mk                                    | 4 ++--
 package/wpa_supplicant/wpa_supplicant.mk                          | 4 ++--
 package/wsapi/wsapi.mk                                            | 4 ++--
 package/wvdial/wvdial.mk                                          | 4 ++--
 package/wvstreams/wvstreams.mk                                    | 4 ++--
 package/x11r7/libxcb/libxcb.mk                                    | 4 ++--
 package/x11r7/mcookie/mcookie.mk                                  | 4 ++--
 package/x11r7/mesa3d/mesa3d.mk                                    | 4 ++--
 package/x11r7/xapp_xman/xapp_xman.mk                              | 4 ++--
 package/x11r7/xcb-proto/xcb-proto.mk                              | 4 ++--
 package/x11r7/xcb-util-image/xcb-util-image.mk                    | 4 ++--
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk                | 4 ++--
 package/x11r7/xcb-util-wm/xcb-util-wm.mk                          | 4 ++--
 package/x11r7/xcb-util/xcb-util.mk                                | 4 ++--
 .../x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk  | 4 ++--
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk        | 4 ++--
 .../xdriver_xf86-video-openchrome.mk                              | 4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk                | 4 ++--
 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk      | 4 ++--
 package/x11vnc/x11vnc.mk                                          | 4 ++--
 package/xavante/xavante.mk                                        | 4 ++--
 package/xenomai/xenomai.mk                                        | 4 ++--
 package/xerces/xerces.mk                                          | 4 ++--
 package/xfsprogs/xfsprogs.mk                                      | 4 ++--
 package/xinetd/xinetd.mk                                          | 4 ++--
 package/xl2tp/xl2tp.mk                                            | 4 ++--
 package/xmlstarlet/xmlstarlet.mk                                  | 4 ++--
 package/xstroke/xstroke.mk                                        | 4 ++--
 package/xterm/xterm.mk                                            | 4 ++--
 package/xvkbd/xvkbd.mk                                            | 4 ++--
 package/xz/xz.mk                                                  | 4 ++--
 package/yasm/yasm.mk                                              | 4 ++--
 package/yavta/yavta.mk                                            | 4 ++--
 package/zd1211-firmware/zd1211-firmware.mk                        | 4 ++--
 package/zeromq/zeromq.mk                                          | 4 ++--
 package/zic/zic.mk                                                | 4 ++--
 package/zlib/zlib.mk                                              | 4 ++--
 package/zmqpp/zmqpp.mk                                            | 4 ++--
 package/zxing/zxing.mk                                            | 4 ++--
 package/zyre/zyre.mk                                              | 4 ++--
 761 files changed, 1535 insertions(+), 1535 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index f2b2828..130ad10 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # acl
 #
-#############################################################
+################################################################################
 
 ACL_VERSION = 2.2.52
 ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index b64fa7d..6a18f46 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # acpid
 #
-#############################################################
+################################################################################
 
 ACPID_VERSION = 2.0.11
 ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index c901708..ed40568 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # aespipe
 #
-#############################################################
+################################################################################
 
 AESPIPE_VERSION = 2.4c
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 7543c6c..fbefd74 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # aircrack-ng
 #
-#############################################################
+################################################################################
 
 AIRCRACK_NG_VERSION = 1.1
 AIRCRACK_NG_SOURCE = aircrack-ng-$(AIRCRACK_NG_VERSION).tar.gz
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2856407..a7ffd77 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # alsa-lib
 #
-#############################################################
+################################################################################
 
 ALSA_LIB_VERSION = 1.0.26
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index eca3dd0..c61e902 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # alsamixergui
 #
-#############################################################
+################################################################################
 
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 3805c80..929c4a5 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # am33x-cm3
 #
-#############################################################
+################################################################################
 
 AM33X_CM3_VERSION = AM335xPSP_04.06.00.10-rc1
 AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index f7313b0..11551d6 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # apr-util
 #
-#############################################################
+################################################################################
 
 APR_UTIL_VERSION = 1.4.1
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index ef5c486..6394882 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # apr
 #
-#############################################################
+################################################################################
 
 APR_VERSION = 1.4.6
 APR_SITE = http://archive.apache.org/dist/apr
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 4fc4321..b87b923 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # argp-standalone
 #
-#############################################################
+################################################################################
 
 ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index ba69794..f169506 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # argus
 #
-#############################################################
+################################################################################
 
 ARGUS_VERSION = 3.0.0.rc.34
 ARGUS_SOURCE = argus_$(ARGUS_VERSION).orig.tar.gz
diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index bf68670..4f101c7 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # arptables
 #
-#############################################################
+################################################################################
 
 ARPTABLES_VERSION = 0.0.4
 ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
diff --git a/package/at/at.mk b/package/at/at.mk
index ad024e3..3bed6d5 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # at
 #
-#############################################################
+################################################################################
 
 AT_VERSION = 3.1.13
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index f5b2e91..91fe6a3 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # atk
 #
-#############################################################
+################################################################################
 
 ATK_VERSION_MAJOR = 1.33
 ATK_VERSION = $(ATK_VERSION_MAJOR).6
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 2b67010..f7179a2 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # attr
 #
-#############################################################
+################################################################################
 
 ATTR_VERSION = 2.4.47
 ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index e49106e..cfd87dc 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # audiofile
 #
-#############################################################
+################################################################################
 
 AUDIOFILE_VERSION = 0.3.6
 AUDIOFILE_SITE = http://audiofile.68k.org
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index daac1f2..bc6f65f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # autoconf
 #
-#############################################################
+################################################################################
 
 AUTOCONF_VERSION = 2.68
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index faa1b36..98e0336 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # automake
 #
-#############################################################
+################################################################################
 
 AUTOMAKE_VERSION = 1.11.6
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index fac3be8..89dfc33 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # avahi
 #
-#############################################################
+################################################################################
 
 #
 # This program is free software; you can redistribute it
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 58ce774..e8fa756 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # axel
 #
-#############################################################
+################################################################################
 
 AXEL_VERSION = 2.4
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index a4383e4..5d036e0 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # b43-firmware
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
 B43_FIRMWARE_VERSION = 5.100.138
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index b48eb45..bc11c0b 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # b43-fwcutter
 #
-#############################################################
+################################################################################
 
 B43_FWCUTTER_VERSION = 015
 B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter/
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index fff0604..d51e203 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bash
 #
-#############################################################
+################################################################################
 
 BASH_VERSION = 4.2
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 3e07143..31cbf90 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bcusck
 #
-#############################################################
+################################################################################
 
 BCUSDK_VERSION = 0.0.5
 BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 9f145b7..5805bda 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # beecrypt
 #
-#############################################################
+################################################################################
 
 BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e303434..5d0e747 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # berkeleydb
 #
-#############################################################
+################################################################################
 
 BERKELEYDB_VERSION = 5.3.21
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index f689594..973981a 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bind
 #
-#############################################################
+################################################################################
 
 BIND_VERSION = 9.6-ESV-R8
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a2c4150..377bb79 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # binutils
 #
-#############################################################
+################################################################################
 
 # Version is set when using buildroot toolchain.
 # If not, we do like other packages
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 24c2576..1eb4fa5 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bison
 #
-#############################################################
+################################################################################
 
 BISON_VERSION = 2.7.1
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 7e5c73a..09d15f1 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # blackbox
 #
-#############################################################
+################################################################################
 
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 89e88e7..3c25042 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bluez_utils
 #
-#############################################################
+################################################################################
 
 BLUEZ_UTILS_VERSION = 4.101
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 4ff2f1a..bb6f17e 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bmon
 #
-#############################################################
+################################################################################
 
 BMON_VERSION = 2.1.0
 BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 8789e8a..9308b54 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # boa
 #
-#############################################################
+################################################################################
 
 BOA_VERSION = 0.94.14rc21
 BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b5b5869..57d021a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # boost
 #
-#############################################################
+################################################################################
 
 BOOST_VERSION = 1.53.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index 7ac11fc..caee2fd 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bootutils
 #
-#############################################################
+################################################################################
 
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 685b657..b1744a4 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bridge-utils
 #
-#############################################################
+################################################################################
 
 BRIDGE_UTILS_VERSION = 1.5
 BRIDGE_UTILS_SOURCE = bridge-utils-$(BRIDGE_UTILS_VERSION).tar.gz
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 9a39ed5..13c7c16 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bsdiff
 #
-#############################################################
+################################################################################
 
 BSDIFF_VERSION = 4.3
 BSDIFF_SOURCE = bsdiff-$(BSDIFF_VERSION).tar.gz
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 88d49b6..68b7b24 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bustle
 #
-#############################################################
+################################################################################
 
 BUSTLE_VERSION = 0.4.2
 BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)/
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 985203c..cfefdbb 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # busybox
 #
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 BUSYBOX_VERSION = snapshot
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 7ec7d7f..b7dc8b2 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bwm-ng
 #
-#############################################################
+################################################################################
 
 BWM_NG_VERSION = 0.6
 BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 5f8c35e..45d5108 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bzip2
 #
-#############################################################
+################################################################################
 
 BZIP2_VERSION = 1.0.6
 BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
diff --git a/package/cache-calibrator/cache-calibrator.mk b/package/cache-calibrator/cache-calibrator.mk
index 35c9f94..d062065 100644
--- a/package/cache-calibrator/cache-calibrator.mk
+++ b/package/cache-calibrator/cache-calibrator.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cache-calibrator
 #
-#############################################################
+################################################################################
 
 CACHE_CALIBRATOR_SOURCE = calibrator.c
 CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 445b554..347bb75 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cairo
 #
-#############################################################
+################################################################################
 
 CAIRO_VERSION = 1.12.10
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 321dc52..c4a777b 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # can-utils
 #
-#############################################################
+################################################################################
 
 CAN_UTILS_VERSION = 836d3cc0122ce31a1b732d369cbd27b690c3110f
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index faa7c9f..c5cb966 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ccache
 #
-#############################################################
+################################################################################
 
 CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 735e689..d6c2213 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -1,8 +1,8 @@
-##########################################################
+################################################################################
 #
 # CCID
 #
-##########################################################
+################################################################################
 
 CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index bade956..ee98013 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cdrkit
 #
-#############################################################
+################################################################################
 
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SITE = http://www.cdrkit.org/releases
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index 817254f..d44b8c4 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcegui
 #
-#############################################################
+################################################################################
 
 # Do not update the version, we need exactly that one for Spice.
 CEGUI06_VERSION_MAJOR   = 0.6.2
diff --git a/package/celt051/celt.mk b/package/celt051/celt.mk
index 9baaa82..b2fa951 100644
--- a/package/celt051/celt.mk
+++ b/package/celt051/celt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # celt051
 #
-#############################################################
+################################################################################
 
 # Although version newer than 0.5.1.3 exists, we're
 # stuck with 0.5.1.3 for use by Spice (coming later)
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 48ee005..a9c8874 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cgilua
 #
-#############################################################
+################################################################################
 
 CGILUA_VERSION = 5.1.4
 CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 1cf94a3..59fd3cb 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # chrony
 #
-#############################################################
+################################################################################
 
 CHRONY_VERSION = 1.27
 CHRONY_SITE = http://download.tuxfamily.org/chrony/
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index fa815ed..ec976db 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cjson
 #
-#############################################################
+################################################################################
 
 CJSON_VERSION         = 42
 CJSON_SITE_METHOD     = svn
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8e3e751..fd1cdd2 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cmake
 #
-#############################################################
+################################################################################
 
 CMAKE_VERSION = 2.8.10.2
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 4dfa1d1..b63d430 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # collectd
 #
-#############################################################
+################################################################################
 
 COLLECTD_VERSION = 5.3.0
 COLLECTD_SITE = http://collectd.org/files
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1b7548a..d88b3b6 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -1,8 +1,8 @@
-#######################################################
+################################################################################
 #
 # connman
 #
-#######################################################
+################################################################################
 
 CONNMAN_VERSION = 1.12
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index bbf6eae..614bbd1 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # conntrack-tools
 #
-#############################################################
+################################################################################
 
 CONNTRACK_TOOLS_VERSION = 1.4.1
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index c84a6cc..347b575 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # copas
 #
-#############################################################
+################################################################################
 
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 079ec12..17c81f7 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # coreutils
 #
-#############################################################
+################################################################################
 
 COREUTILS_VERSION = 8.18
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index e7fb76d..c3e4a7f 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # coxpcall
 #
-#############################################################
+################################################################################
 
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index 7e7b47d..a2cd44b 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cpanminus
 #
-#############################################################
+################################################################################
 
 CPANMINUS_VERSION = 1.6002
 CPANMINUS_SOURCE = $(CPANMINUS_VERSION).tar.gz
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index d4609bf..267a5d8 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cppzmq
 #
-#############################################################
+################################################################################
 
 CPPZMQ_VERSION = b232978
 CPPZMQ_SITE = git://github.com/zeromq/cppzmq.git
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index 494cbb1..65be513 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cpuload
 #
-#############################################################
+################################################################################
 
 CPULOAD_VERSION = v0.3
 CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 519a179..19ecde4 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cramfs
 #
-#############################################################
+################################################################################
 
 CRAMFS_VERSION=1.1
 CRAMFS_SOURCE=cramfs-$(CRAMFS_VERSION).tar.gz
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 0c9391d..44fd0f2 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # crda
 #
-#############################################################
+################################################################################
 
 CRDA_VERSION = 1.1.3
 CRDA_SOURCE = crda-$(CRDA_VERSION).tar.bz2
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 1a78228..7ec327e 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cryptodev-linux
 #
-#############################################################
+################################################################################
 
 CRYPTODEV_LINUX_VERSION = 1.6
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
index a367293..1e0cbde 100644
--- a/package/cryptodev/cryptodev.mk
+++ b/package/cryptodev/cryptodev.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # virtual cryptodev package
 #
-#############################################################
+################################################################################
 
 CRYPTODEV_SOURCE =
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 216b142..aebf123 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ctorrent
 #
-#############################################################
+################################################################################
 
 CTORRENT_VERSION = dnh3.3.2
 CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
index ff70f3b..117e041 100644
--- a/package/curlftpfs/curlftpfs.mk
+++ b/package/curlftpfs/curlftpfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # curlftpfs
 #
-#############################################################
+################################################################################
 
 CURLFTPFS_VERSION = 0.9.2
 CURLFTPFS_SITE = http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/$(CURLFTPFS_VERSION)
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index d8eee42..e48be41 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # cvs
 #
-#############################################################
+################################################################################
 
 CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index d63fb78..c0f97ba 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # czmq
 #
-#############################################################
+################################################################################
 
 CZMQ_VERSION = cb9839cf90
 CZMQ_SITE = git://github.com/zeromq/czmq.git
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 64f72e0..2765ed4 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dash
 #
-#############################################################
+################################################################################
 
 DASH_VERSION = 0.5.7
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 447fc0c..d4685f6 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dbus-glib
 #
-#############################################################
+################################################################################
 
 DBUS_GLIB_VERSION = 0.98
 DBUS_GLIB_SOURCE = dbus-glib-$(DBUS_GLIB_VERSION).tar.gz
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 06a48e4..6e260d0 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dbus-python
 #
-#############################################################
+################################################################################
 
 DBUS_PYTHON_VERSION = 0.83.0
 DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 3aa1345..cb72f1f 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dbus
 #
-#############################################################
+################################################################################
 
 DBUS_VERSION = 1.4.24
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index cc9b218..3e55d69 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # devmem2
 #
-#############################################################
+################################################################################
 
 DEVMEM2_SITE = http://free-electrons.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index bc94264..2f596b1 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dfu-util
 #
-#############################################################
+################################################################################
 
 DFU_UTIL_VERSION = 0.6
 DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 34c0afa..ce0cf23 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dhcp
 #
-#############################################################
+################################################################################
 
 DHCP_VERSION = 4.1-ESV-R8
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 06ecec4..0c47d06 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dhcpdump
 #
-#############################################################
+################################################################################
 
 DHCPDUMP_VERSION = 1.8
 DHCPDUMP_SITE    = http://www.mavetju.org/download/
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 6d3ddfa..47c2ef2 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dhrystone
 #
-#############################################################
+################################################################################
 
 DHRYSTONE_VERSION = 2
 DHRYSTONE_SOURCE = dhry-c
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 6d46299..c6ea023 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dialog
 #
-#############################################################
+################################################################################
 
 DIALOG_VERSION = 1.1-20111020
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 2530763..1de9db4 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # diffutils
 #
-#############################################################
+################################################################################
 
 DIFFUTILS_VERSION = 3.2
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index bcd3c1c..c39d411 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # directfb examples
 #
-#############################################################
+################################################################################
 
 DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index dc1071b..e9e4706 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # directfb
 #
-#############################################################
+################################################################################
 
 DIRECTFB_VERSION_MAJOR = 1.6
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 006c0aa..9e1c669 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # distcc
 #
-#############################################################
+################################################################################
 
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index adbef37..322e5fc 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # divine
 #
-#############################################################
+################################################################################
 
 # tagged version 1.6.3, tarball is missing files
 DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index fd4e976..1d23f66 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dmalloc
 #
-#############################################################
+################################################################################
 
 DMALLOC_VERSION = 5.4.3
 DMALLOC_SOURCE = dmalloc-$(DMALLOC_VERSION).tgz
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 5d84294..86a3be5 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dmidecode
 #
-#############################################################
+################################################################################
 
 DMIDECODE_VERSION = 2.11
 DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 66a9d70..3c84aa4 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dmraid
 #
-#############################################################
+################################################################################
 
 DMRAID_VERSION = 1.0.0.rc15
 DMRAID_SOURCE = dmraid-$(DMRAID_VERSION).tar.bz2
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 04e3630..765de78 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dnsmasq
 #
-#############################################################
+################################################################################
 
 DNSMASQ_VERSION = 2.66
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 015cd36..9c8ded4 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # docker
 #
-#############################################################
+################################################################################
 
 DOCKER_VERSION = 1.5
 DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index ae5dcef..b21fed8 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # doom-wad
 #
-#############################################################
+################################################################################
 
 DOOM_WAD_VERSION = 1.8
 DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 79d1c7a..624198c 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dosfstools
 #
-#############################################################
+################################################################################
 
 DOSFSTOOLS_VERSION = 3.0.16
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e00890e..34dd79b 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dropbear
 #
-#############################################################
+################################################################################
 
 DROPBEAR_VERSION = 2013.58
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index 67db63a..de0f0a8 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dstat
 #
-#############################################################
+################################################################################
 
 DSTAT_VERSION = 0.7.2
 DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
index 77ad7c0..56ab175 100644
--- a/package/dtach/dtach.mk
+++ b/package/dtach/dtach.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dtach
 #
-#############################################################
+################################################################################
 
 DTACH_VERSION = 0.8
 DTACH_SITE = http://downloads.sourceforge.net/project/dtach/dtach/$(DTACH_VERSION)
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 76ff361..32cc3ae 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dtc
 #
-#############################################################
+################################################################################
 
 DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
 DTC_SITE            = git://git.jdl.com/software/dtc.git
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 31a4ff8..1e50aa4 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dvb-apps
 #
-#############################################################
+################################################################################
 
 DVB_APPS_VERSION        = 83c746462ccb
 DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
index dd62e8c..0b06128 100644
--- a/package/dvbsnoop/dvbsnoop.mk
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # dvbsnoop
 #
-#############################################################
+################################################################################
 
 DVBSNOOP_VERSION        = 1.4.50
 DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index edc3e8e..790cb43 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # e2fsprogs
 #
-#############################################################
+################################################################################
 
 E2FSPROGS_VERSION = 1.42.7
 E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 7ccdcb4..0b3fba6 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ebtables
 #
-#############################################################
+################################################################################
 
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 226c929..f3f46e1 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ecryptfs-utils
 #
-##############################################################
+################################################################################
 
 ECRYPTFS_UTILS_VERSION         = 103
 ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 52ae1f0..306e918 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ed
 #
-#############################################################
+################################################################################
 
 ED_VERSION = 1.7
 ED_SITE = $(BR2_GNU_MIRROR)/ed
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 3b1b3e9..950cf80 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # eeprog
 #
-#############################################################
+################################################################################
 
 EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://www.codesink.org/download
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index 4b245ec..68c7d34 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # expedite
 #
-#############################################################
+################################################################################
 
 EXPEDITE_VERSION = 1.7.4
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index dfc5750..0943a20 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libecore
 #
-#############################################################
+################################################################################
 
 LIBECORE_VERSION = 1.7.4
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 9c62ead..0d34fc0 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libedbus
 #
-#############################################################
+################################################################################
 
 LIBEDBUS_VERSION = 1.7.4
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index a02eaa9..c2f05f0 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libedje
 #
-#############################################################
+################################################################################
 
 LIBEDJE_VERSION = 1.7.4
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index db3ec6e..e7edd9e 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libeet
 #
-#############################################################
+################################################################################
 
 LIBEET_VERSION = 1.7.4
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index d99a237..ee40c14 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libeina
 #
-#############################################################
+################################################################################
 
 LIBEINA_VERSION = 1.7.4
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
index f5e08de..ba908ea 100644
--- a/package/efl/libeio/libeio.mk
+++ b/package/efl/libeio/libeio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libeio
 #
-#############################################################
+################################################################################
 
 LIBEIO_VERSION = 1.7.4
 LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index ce5c968..298b9f7 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libembryo
 #
-#############################################################
+################################################################################
 
 LIBEMBRYO_VERSION = 1.7.4
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index 76236b1..c010348 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libevas-generic-loaders
 #
-#############################################################
+################################################################################
 
 LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.4
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 5bdcba5..34a839a 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libevas
 #
-#############################################################
+################################################################################
 
 LIBEVAS_VERSION = 1.7.4
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index d540afb..1e17c5b 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # elftosb
 #
-#############################################################
+################################################################################
 
 ELFTOSB_VERSION = 10.12.01
 ELFTOSB_SOURCE = elftosb-$(ELFTOSB_VERSION).tar.gz
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index fbde905..2658786 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # elfutils
 #
-#############################################################
+################################################################################
 
 ELFUTILS_VERSION = 0.155
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index cf1e737..4294777 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # empty
 #
-#############################################################
+################################################################################
 
 EMPTY_VERSION = 0.6.18b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 3425c56..50a8a6c 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # enchant
 #
-#############################################################
+################################################################################
 
 ENCHANT_VERSION = 1.5.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 5d77869..1163aa5 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # enlightenment
 #
-#############################################################
+################################################################################
 
 ENLIGHTENMENT_VERSION = 0.17.0-omega
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases/
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index 93e4d6d..3b15d55 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # enscript
 #
-#############################################################
+################################################################################
 
 ENSCRIPT_VERSION = 1.6.6
 ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 6d51376..3a5752e 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # erlang
 #
-#############################################################
+################################################################################
 
 ERLANG_VERSION = R15B01
 ERLANG_SITE = http://www.erlang.org/download
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 12cc524..bb2dc9f 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ethtool
 #
-#############################################################
+################################################################################
 
 ETHTOOL_VERSION = 3.9
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index ffda1bf..2a87553 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # evtest
 #
-#############################################################
+################################################################################
 
 EVTEST_VERSION = 1.30
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index de66d55..a3a80f2 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # exfat-utils
 #
-#############################################################
+################################################################################
 
 EXFAT_UTILS_VERSION = 1.0.1
 EXFAT_UTILS_SITE = http://exfat.googlecode.com/files
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index bc794a0..3c0dece 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # exfat
 #
-#############################################################
+################################################################################
 
 EXFAT_VERSION = 1.0.1
 EXFAT_SITE = http://exfat.googlecode.com/files
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index e650723..4c37ba2 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # expat
 #
-#############################################################
+################################################################################
 
 EXPAT_VERSION = 2.1.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 2f6f793..de86305 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ezxml
 #
-#############################################################
+################################################################################
 
 EZXML_VERSION = 0.8.6
 EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index aa0c103..d8186a1 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # f2fs-tools
 #
-#############################################################
+################################################################################
 
 F2FS_TOOLS_VERSION = fef98ebdf3a7728017cb3d0ae4ffedc5405e531d
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 0a36181..e655b8f 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fakeroot
 #
-#############################################################
+################################################################################
 
 FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index b7bfa79..5f39813 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fan-ctrl
 #
-#############################################################
+################################################################################
 
 # no release, so grab .c file directly from viewvc
 FAN_CTRL_VERSION = 1.3
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 7f17512..a2183e0 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fb-test-app
 #
-#############################################################
+################################################################################
 
 FB_TEST_APP_VERSION = v1.0.0
 FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index f80cb1b..e9828df 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fbdump
 #
-#############################################################
+################################################################################
 
 FBDUMP_VERSION = 0.4.2
 FBDUMP_SOURCE = fbdump-$(FBDUMP_VERSION).tar.gz
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 920ccc8..59284ee 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fbset
 #
-#############################################################
+################################################################################
 
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index fcb2570..6fc4d7f 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -1,8 +1,8 @@
-############################################
+################################################################################
 #
 # fbterm
 #
-############################################
+################################################################################
 
 FBTERM_VERSION = 1.7.0
 FBTERM_SITE = http://fbterm.googlecode.com/files/
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 2a4029e..010e79e 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fbv
 #
-#############################################################
+################################################################################
 
 FBV_VERSION = 1.0b
 FBV_SOURCE = fbv-$(FBV_VERSION).tar.gz
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index e6ccb32..45fd2a0 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fconfig
 #
-#############################################################
+################################################################################
 
 FCONFIG_VERSION = 20080329
 FCONFIG_SOURCE = fconfig-$(FCONFIG_VERSION).tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 5422e2f..d423d56 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # file
 #
-#############################################################
+################################################################################
 
 FILE_VERSION = 5.14
 FILE_SITE = ftp://ftp.astron.com/pub/file
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index c715292..ace0ca4 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # filemq
 #
-#############################################################
+################################################################################
 
 FILEMQ_VERSION = 8fac5140dd
 FILEMQ_SITE = git://github.com/zeromq/filemq.git
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 43aef75..464f28b 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # findutils
 #
-#############################################################
+################################################################################
 
 FINDUTILS_VERSION = 4.4.2
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 60c2ae8..0e2d7d0 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fis
 #
-#############################################################
+################################################################################
 
 FIS_SITE = http://svn.chezphil.org/utils/trunk
 FIS_SITE_METHOD = svn
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index 45d0540..6759338 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # flashbench
 #
-#############################################################
+################################################################################
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
 FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 7689a8f..bca800b 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # flashrom
 #
-#############################################################
+################################################################################
 
 FLASHROM_VERSION = 0.9.6.1
 FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2361536..17f651b 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # flex
 #
-#############################################################
+################################################################################
 
 FLEX_VERSION = 2.5.37
 FLEX_SITE = http://download.sourceforge.net/project/flex
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 697eb91..08781fb 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fltk
 #
-#############################################################
+################################################################################
 
 FLTK_VERSION = 1.1.7
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index a0728fa..262cb0d 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fluxbox
 #
-#############################################################
+################################################################################
 
 FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index c79ecfe..407b702 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fmtools
 #
-#############################################################
+################################################################################
 
 FMTOOLS_VERSION = 1.0.2
 FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 299a86b..0abf865 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fontconfig
 #
-#############################################################
+################################################################################
 
 FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
index 6e13486..80daea5 100644
--- a/package/foomatic-filters/foomatic-filters.mk
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # foomatic_filters
 #
-#############################################################
+################################################################################
 
 FOOMATIC_FILTERS_VERSION = 4.0.17
 FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 79b2a23..efb6fc9 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # FreeRDP
 #
-#############################################################
+################################################################################
 
 FREERDP_VERSION = 1.0.1
 FREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 85f8dc2..d9fcb89 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # firmware-imx
 #
-#############################################################
+################################################################################
 
 FIRMWARE_IMX_VERSION = $(FREESCALE_IMX_VERSION)
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_MIRROR_SITE)
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 2553f67..9f63ce3 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # freescale-imx
 #
-#############################################################
+################################################################################
 
 FREESCALE_IMX_VERSION = 1.1.0
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index f988d25..0338e13 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gpu-viv-bin-mx6q
 #
-#############################################################
+################################################################################
 
 GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
 GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 67e8db3..bd7e174 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # imx-lib
 #
-#############################################################
+################################################################################
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index b08bbf7..997f906 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # freetype
 #
-#############################################################
+################################################################################
 
 FREETYPE_VERSION = 2.4.11
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 7df9da5..26feec3 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fxload
 #
-#############################################################
+################################################################################
 
 FXLOAD_VERSION = 2008_10_13
 FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 356c2cb..2ff50ca 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gadgetfs-test
 #
-#############################################################
+################################################################################
 
 GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
 GADGETFS_TEST_SITE=http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 36e10d3..7939992 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gamin
 #
-#############################################################
+################################################################################
 
 GAMIN_VERSION = 0.1.10
 GAMIN_SOURCE = gamin-$(GAMIN_VERSION).tar.gz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index b26430e..3f79040 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gawk
 #
-#############################################################
+################################################################################
 
 GAWK_VERSION = 4.1.0
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5f4a753..fbb2fae 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gdb
 #
-#############################################################
+################################################################################
 
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 6aeffe3..60b46c7 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gdbm
 #
-#############################################################
+################################################################################
 
 GDBM_VERSION = 1.10
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 5abb39d..49d3840 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gdk-pixbuf
 #
-#############################################################
+################################################################################
 
 GDK_PIXBUF_MAJOR_VERSION = 2.24
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 45e9695..b2a301b 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # genext2fs
 #
-#############################################################
+################################################################################
 
 GENEXT2FS_VERSION = 1.4.1
 GENEXT2FS_SOURCE = genext2fs-$(GENEXT2FS_VERSION).tar.gz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 2c45a8d..e9ad52e 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # genimage
 #
-##############################################################
+################################################################################
 
 GENIMAGE_VERSION        = 4
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index 7757ae4..3c26af2 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # genpart
 #
-#############################################################
+################################################################################
 
 GENPART_VERSION       = 1.0.2
 GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 3f5d44e..119d660 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # genromfs
 #
-#############################################################
+################################################################################
 
 GENROMFS_VERSION=0.5.2
 GENROMFS_SOURCE=genromfs-$(GENROMFS_VERSION).tar.gz
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 22035a8..2a09927 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gesftpserver
 #
-#############################################################
+################################################################################
 
 GESFTPSERVER_VERSION = 0.1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 9061928..1c2a6ec 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gettext
 #
-#############################################################
+################################################################################
 
 GETTEXT_VERSION = 0.18.2.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 5a90170..69100c0 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # giblib
 #
-#############################################################
+################################################################################
 
 GIBLIB_VERSION = 1.2.4
 GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
diff --git a/package/git/git.mk b/package/git/git.mk
index 7e2f114..b8a7623 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # git
 #
-#############################################################
+################################################################################
 
 GIT_VERSION         = 1.8.3
 GIT_SITE            = http://git-core.googlecode.com/files/
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 4812fd6..12eb344 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # glib-networking
 #
-#############################################################
+################################################################################
 
 GLIB_NETWORKING_MAJOR_VERSION = 2.30
 GLIB_NETWORKING_MINOR_VERSION = 2
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index abd8b6c..a1bd8b5 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Glibmm
 #
-#############################################################
+################################################################################
 
 GLIBMM_VERSION_MAJOR = 2.30
 GLIBMM_VERSION_MINOR = 1
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cf5c310..439ad4d 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gmp
 #
-#############################################################
+################################################################################
 
 GMP_VERSION = 5.1.2
 GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 81e9f1f..cf7deb6 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gmpc
 #
-#############################################################
+################################################################################
 
 GMPC_VERSION = 11.8.16
 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 90d2274..9d7dd79 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gnuchess
 #
-#############################################################
+################################################################################
 
 GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 7c25ad1..39088c3 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gnupg
 #
-#############################################################
+################################################################################
 
 GNUPG_VERSION = 1.4.13
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 25ba90d..d5fe01c 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gnuplot
 #
-#############################################################
+################################################################################
 
 GNUPLOT_VERSION = 4.6.2
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3089979..0332d07 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gnutls
 #
-#############################################################
+################################################################################
 
 GNUTLS_VERSION = 3.2.1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index c52f26c..9f6cc3e 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gob2
 #
-#############################################################
+################################################################################
 
 GOB2_VERSION = 2.0.18
 GOB2_SITE = http://ftp.5z.com/pub/gob
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index ddc832a..65ad29f 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # googlefontdirectory
 #
-#############################################################
+################################################################################
 
 GOOGLEFONTDIRECTORY_SITE = \
 	https://s3.amazonaws.com/joemaller_google_webfonts
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 59c5a09..8ce3c95 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gperf
 #
-#############################################################
+################################################################################
 
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 384726d..33aff5e 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gpsd
 #
-#############################################################
+################################################################################
 
 GPSD_VERSION = 3.9
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 15ec842..7fad983 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gptfdisk
 #
-#############################################################
+################################################################################
 
 GPTFDISK_VERSION = 0.8.6
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 178f4ad..c5131a4 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gqview
 #
-#############################################################
+################################################################################
 
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 10adfd9..edaab2b 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # grantlee
 #
-#############################################################
+################################################################################
 
 GRANTLEE_VERSION = 0.2.0
 GRANTLEE_SITE = http://downloads.grantlee.org
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2636c83..2d815fe 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # grep
 #
-#############################################################
+################################################################################
 
 GREP_VERSION = 2.14
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index a63753d..68b9948 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gsl
 #
-#############################################################
+################################################################################
 
 GSL_VERSION = 1.15
 GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 6ede137..63a2360 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # googletest
 #
-#############################################################
+################################################################################
 
 GTEST_VERSION = 1.6.0
 GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index a7e2a3f..ad48ddd 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gtk2-engines.0
 #
-#############################################################
+################################################################################
 
 GTK2_ENGINES_VERSION = 2.20.2
 GTK2_ENGINES_SOURCE  = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index fd55a37..a250d57 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # GTK Theme - Hicolour
 #
-#############################################################
+################################################################################
 
 GTK2_THEME_HICOLOR_VERSION = 0.10
 GTK2_THEME_HICOLOR_SOURCE = hicolor-icon-theme-$(GTK2_THEME_HICOLOR_VERSION).tar.gz
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index ac18f7b..a69fc76 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # GtkPerf
 #
-#############################################################
+################################################################################
 
 GTKPERF_VERSION = 0.40
 GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 84f5a6d..c9ac046 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gutenprint
 #
-#############################################################
+################################################################################
 
 GUTENPRINT_VERSION = 5.2.9
 GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 14f3104..32d8b49 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gvfs
 #
-#############################################################
+################################################################################
 
 GVFS_VERSION_MAJOR = 1.8
 GVFS_VERSION_MINOR = 2
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 821f694..5ece73a 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gzip
 #
-#############################################################
+################################################################################
 
 GZIP_VERSION = 1.5
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 7627917..767ce24 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # haserl
 #
-#############################################################
+################################################################################
 
 HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel/$(HASERL_VERSION)
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index f70d232..fc053ae 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # hdparm
 #
-#############################################################
+################################################################################
 
 HDPARM_VERSION = 9.43
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index f3779af..a4d94b6 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # heirloom-mailx
 #
-#############################################################
+################################################################################
 
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index e00ad5a..4d31df5 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -1,8 +1,8 @@
-##############################################################
+################################################################################
 #
 # hostapd
 #
-#############################################################
+################################################################################
 
 HOSTAPD_VERSION = 2.0
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 6944f50..b3b798d 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # hplip
 #
-#############################################################
+################################################################################
 
 HPLIP_VERSION = 3.13.3
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index fd78662..fe9b302 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # htop
 #
-#############################################################
+################################################################################
 
 HTOP_VERSION = 1.0.2
 HTOP_SITE = http://downloads.sourceforge.net/project/htop/htop/$(HTOP_VERSION)
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 8f7cb97..12e2582 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # httping
 #
-#############################################################
+################################################################################
 
 HTTPING_VERSION = 2.2.1
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 517ca5f..bcac8c9 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # hwdata
 #
-#############################################################
+################################################################################
 
 HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 3e1d9ee..1589d04 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # i2c-tools
 #
-#############################################################
+################################################################################
 
 I2C_TOOLS_VERSION = 3.1.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7658589..00eacc7 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # International Components for Unicode
 #
-#############################################################
+################################################################################
 
 ICU_VERSION = 4.8.1.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index d031a97..ee5bd25 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ifplugd
 #
-#############################################################
+################################################################################
 
 IFPLUGD_VERSION = 0.28
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index f6f2af2..de2f1b1 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iftop
 #
-#############################################################
+################################################################################
 
 IFTOP_VERSION = 1.0pre2
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index def7a5d..e2259e6 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # imagemagick
 #
-#############################################################
+################################################################################
 
 IMAGEMAGICK_MAJOR = 6.7.8
 IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index e69503b..5b9d6b0 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # imlib2
 #
-##############################################################
+################################################################################
 
 IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index ea25e01..221a3d1 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # inadyn
 #
-#############################################################
+################################################################################
 
 INADYN_VERSION = 1.98.1
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 2b8052e..d73edd4 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # infozip
 #
-#############################################################
+################################################################################
 
 INFOZIP_VERSION = 30
 INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index a5668a3..9d10b94 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # inotify-utils
 #
-#############################################################
+################################################################################
 
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index fdff557..762d3c2 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # input-event-daemon
 #
-#############################################################
+################################################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
 INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 6f15da6..503f16a 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # input-tools
 #
-#############################################################
+################################################################################
 
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 0bed315..f3c1e67 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # intltool
 #
-#############################################################
+################################################################################
 
 INTLTOOL_VERSION = 0.50.2
 INTLTOOL_SOURCE = intltool-$(INTLTOOL_VERSION).tar.gz
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 8d17af5..3297b3e 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iostat
 #
-#############################################################
+################################################################################
 
 IOSTAT_VERSION = 2.2
 IOSTAT_SITE = http://www.linuxinsight.com/files
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index a07571b..eb0a6d8 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iozone
 #
-#############################################################
+################################################################################
 
 IOZONE_VERSION = 3_414
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 7cd4c63..7fa7d3e 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iperf
 #
-#############################################################
+################################################################################
 
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index c63f03f..9572d54 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ipkg
 #
-#############################################################
+################################################################################
 
 IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a83133b..cbbbc56 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iproute2
 #
-#############################################################
+################################################################################
 
 IPROUTE2_VERSION = 3.7.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index ba92410..1458909 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ipsec-tools
 #
-#############################################################
+################################################################################
 
 IPSEC_TOOLS_VERSION = 0.8.0
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index daadc9e..c411a6e 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ipset
 #
-#############################################################
+################################################################################
 
 IPSET_VERSION = 6.19
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 5a21412..cfb227a 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iptables
 #
-#############################################################
+################################################################################
 
 IPTABLES_VERSION = 1.4.19.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 34612c2..333aa58 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # irda-utils
 #
-#############################################################
+################################################################################
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SOURCE = irda-utils-$(IRDA_UTILS_VERSION).tar.gz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 6078632..c8d9561 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # iw
 #
-#############################################################
+################################################################################
 
 IW_VERSION = 3.10
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 9564fc0..49e8571 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jansson
 #
-#############################################################
+################################################################################
 
 JANSSON_VERSION = 2.4
 JANSSON_SITE = http://www.digip.org/jansson/releases
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index e9843ae..27ac5f3 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jhead
 #
-#############################################################
+################################################################################
 
 JHEAD_VERSION = 2.97
 JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 19a0292..c19959c 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jpeg-turbo
 #
-#############################################################
+################################################################################
 
 JPEG_TURBO_VERSION = 1.2.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 207edc8..caea98c 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # virtual jpeg package
 #
-#############################################################
+################################################################################
 
 JPEG_SOURCE =
 
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index 22d1a00..769fdba 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jquery-keyboard
 #
-#############################################################
+################################################################################
 
 JQUERY_KEYBOARD_VERSION = 1.17.4
 JQUERY_KEYBOARD_SITE = \
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
index c410b64..44fb7f7 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.mk
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jquery-ui-themes
 #
-#############################################################
+################################################################################
 
 JQUERY_UI_THEMES_VERSION = 1.10.3
 JQUERY_UI_THEMES_SITE = http://jqueryui.com/resources/download
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 9375ec2..ece8608 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # jquery-ui
 #
-#############################################################
+################################################################################
 
 JQUERY_UI_VERSION = 1.10.3
 JQUERY_UI_SITE = http://jqueryui.com/resources/download
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 4e3f987..24cc9ab 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # json-glib
 #
-#############################################################
+################################################################################
 
 JSON_GLIB_MAJOR_VERSION = 0.14
 JSON_GLIB_MINOR_VERSION = 2
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
index a700e07..b40d61b 100644
--- a/package/json-javascript/json-javascript.mk
+++ b/package/json-javascript/json-javascript.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # json-javascript
 #
-#############################################################
+################################################################################
 
 JSON_JAVASCRIPT_VERSION = 42c18c621a411c3f39a81bb0a387fc50dcd738d9
 JSON_JAVASCRIPT_SITE = git://github.com/douglascrockford/JSON-js.git
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 08cb077..2969f88 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # kbd
 #
-#############################################################
+################################################################################
 
 KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 6510b17..6ddf435 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # kexec
 #
-#############################################################
+################################################################################
 
 KEXEC_VERSION = 2.0.4
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 184b58d..7097529 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # keyutils
 #
-##############################################################
+################################################################################
 
 KEYUTILS_VERSION         = 1.5.5
 KEYUTILS_SOURCE          = keyutils-$(KEYUTILS_VERSION).tar.bz2
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 1fb3f5a..ceb9fcd 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # kismet
 #
-#############################################################
+################################################################################
 
 KISMET_VERSION = 2013-03-R1b
 KISMET_SITE = http://www.kismetwireless.net/code
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 2fe9942..6cd2a20 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # kmod
 #
-#############################################################
+################################################################################
 
 KMOD_VERSION = 13
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 84e75db..a19f48a 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # latencytop
 #
-#############################################################
+################################################################################
 
 LATENCYTOP_VERSION = 0.5
 LATENCYTOP_SITE = http://www.latencytop.org/download/
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 344225b..1b7ea43 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lcdapi
 #
-#############################################################
+################################################################################
 
 LCDAPI_VERSION = v0.4
 LCDAPI_SITE = http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 95c6fe5..8fab979 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lcdproc
 #
-#############################################################
+################################################################################
 
 LCDPROC_VERSION = 0.5.6
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 0d222c0..c997ac3 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lcms2
 #
-#############################################################
+################################################################################
 
 LCMS2_VERSION = 2.4
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index e37f6c8..a34a2d7 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # leafpad
 #
-#############################################################
+################################################################################
 
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
diff --git a/package/less/less.mk b/package/less/less.mk
index f811733..4f92213 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # less
 #
-#############################################################
+################################################################################
 
 LESS_VERSION = 458
 LESS_SITE = http://www.greenwoodsoftware.com/less
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 243c975..a046157 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libaio
 #
-#############################################################
+################################################################################
 
 LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index d0234d5..8e9ee35 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libao
 #
-#############################################################
+################################################################################
 
 LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 98dd486..1b25013 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libarchive
 #
-#############################################################
+################################################################################
 
 LIBARCHIVE_VERSION = 3.0.4
 LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 900a8b5..da94824 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libargtable2
 #
-#############################################################
+################################################################################
 
 LIBARGTABLE2_VERSION = 13
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 822dbf1..53dfe5a 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libart
 #
-#############################################################
+################################################################################
 
 LIBART_VERSION = 2.3.21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
index a7c4e5d..fbfad1c 100644
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libatasmart
 #
-#############################################################
+################################################################################
 
 LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 3216ddc..d3e4f66 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # atomic_ops library
 #
-#############################################################
+################################################################################
 
 LIBATOMIC_OPS_VERSION = 7.2
 LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 2466b01..dc4d88f 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libbsd
 #
-#############################################################
+################################################################################
 
 LIBBSD_VERSION         = 0.4.2
 LIBBSD_SOURCE          = libbsd-$(LIBBSD_VERSION).tar.gz
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 7a1650c..d1c4462 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcap-ng
 #
-#############################################################
+################################################################################
 
 LIBCAP_NG_VERSION = 0.6.6
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 15a2cfb..16afaef 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcap
 #
-#############################################################
+################################################################################
 
 LIBCAP_VERSION = 2.22
 # Until kernel.org is completely back up use debian mirror
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 92efabc..151bb8c 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcdaudio
 #
-#############################################################
+################################################################################
 
 LIBCDAUDIO_VERSION = 0.99.12p2
 LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 286a8cd..f027d31 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcgi
 #
-#############################################################
+################################################################################
 
 LIBCGI_VERSION = 1.0
 LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index ec8b6ee..4d8ae37 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcgicc
 #
-#############################################################
+################################################################################
 
 LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index e2ce702..6e9c564 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcofi
 #
-#############################################################
+################################################################################
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
 LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 6d0abbb..7a80df3 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libconfig
 #
-#############################################################
+################################################################################
 
 LIBCONFIG_VERSION = 1.4.9
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 5b64eb1..66cabd3 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libconfuse
 #
-#############################################################
+################################################################################
 
 LIBCONFUSE_VERSION = 2.7
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index f0236d9..56f13ba 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libcurl
 #
-#############################################################
+################################################################################
 
 LIBCURL_VERSION = 7.28.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 419692a..a45be4b 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdaemon
 #
-#############################################################
+################################################################################
 
 LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 7cea168..a1e0c5b 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdmtx
 #
-#############################################################
+################################################################################
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 03955a7..78f0ae0 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdnet
 #
-#############################################################
+################################################################################
 
 LIBDNET_VERSION = 1.11
 LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 380bc1d..d3d2b2d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdrm
 #
-#############################################################
+################################################################################
 
 LIBDRM_VERSION = 2.4.38
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index e975313..9a29d6d 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdvdnav
 #
-#############################################################
+################################################################################
 
 LIBDVDNAV_VERSION = 4.1.3
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 29c3472..f7c59af 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libdvdread
 #
-#############################################################
+################################################################################
 
 LIBDVDREAD_VERSION = 4.1.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index c500da7..4be2f05 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libexosip2
 #
-#############################################################
+################################################################################
 
 LIBEXOSIP2_VERSION = 3.6.0
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 0a04635..9aeab77 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libebml
 #
-#############################################################
+################################################################################
 
 LIBEBML_VERSION = 1.2.2
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 575ca49..c344b73 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libedit
 #
-#############################################################
+################################################################################
 
 # Note: libedit does not have a regular homepage, and it seems
 # there is no place where to download a tarball from. That's
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index c11045a..725035f 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libelf
 #
-#############################################################
+################################################################################
 
 LIBELF_VERSION=0.8.12
 LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 5464b66..408fd70 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liberation
 #
-#############################################################
+################################################################################
 
 LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 3e62e9e..f3f5611 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libesmtp
 #
-#############################################################
+################################################################################
 
 LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index e1063bd..0056501 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libev
 #
-#############################################################
+################################################################################
 
 LIBEV_VERSION = 4.11
 LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 6b31b20..94882b5 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libevent
 #
-#############################################################
+################################################################################
 
 LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 1c51564..a1d4475 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libexif
 #
-#############################################################
+################################################################################
 
 LIBEXIF_VERSION = 0.6.21
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 0568d45..ced850c 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -1,8 +1,8 @@
-##############################################################################
+################################################################################
 #
 # libfcgi
 #
-##############################################################################
+################################################################################
 
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 791c464..51cbbce 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libffi
 #
-#############################################################
+################################################################################
 
 LIBFFI_VERSION = 3.0.13
 LIBFFI_SITE    = ftp://sourceware.org/pub/libffi/
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 4e0514b..859b5e3 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfreefare
 #
-#############################################################
+################################################################################
 
 LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 45568ca..99005c2 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfribidi
 #
-#############################################################
+################################################################################
 
 LIBFRIBIDI_VERSION = 0.19.5
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index 0ff0bc1..c18332a 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfslcodec
 #
-#############################################################
+################################################################################
 
 LIBFSLCODEC_VERSION = 3.0.1
 # No official download site from freescale, just this mirror
diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index de83832..3e27a6a 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfslparser
 #
-#############################################################
+################################################################################
 
 LIBFSLPARSER_VERSION = 3.0.1
 # No official download site from freescale, just this mirror
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index d49cae4..1bc7129 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfslvpuwrap
 #
-#############################################################
+################################################################################
 
 LIBFSLVPUWRAP_VERSION = 1.0.17
 # No official download site from freescale, just this mirror
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 3c4dcbc..3cf11a2 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libftdi
 #
-#############################################################
+################################################################################
 
 LIBFTDI_VERSION = 0.19
 LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index ccd49fe..d422504 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libfuse
 #
-#############################################################
+################################################################################
 
 LIBFUSE_VERSION = 2.9.2
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 8db2476..4142c7f 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgail
 #
-#############################################################
+################################################################################
 
 LIBGAIL_VERSION_MAJOR = 1.22
 LIBGAIL_VERSION_MINOR = 3
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 6a3bc7c..f8c0860 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgcrypt
 #
-#############################################################
+################################################################################
 
 LIBGCRYPT_VERSION = 1.5.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 115256f..bd953ef 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgeotiff
 #
-#############################################################
+################################################################################
 
 LIBGEOTIFF_VERSION = 1.3.0
 LIBGEOTIFF_SOURCE = libgeotiff-$(LIBGEOTIFF_VERSION).tar.gz
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 3197d44..343ecc4 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libglade
 #
-#############################################################
+################################################################################
 
 LIBGLADE_VERSION = 2.6.4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2c16f6a..c7ffdce 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libglib2
 #
-#############################################################
+################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.30
 LIBGLIB2_VERSION_MINOR = 3
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 4114310..04874a7 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgpg-error
 #
-#############################################################
+################################################################################
 
 LIBGPG_ERROR_VERSION = 1.10
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 8f9a510..ea634bc 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgsasl
 #
-#############################################################
+################################################################################
 
 LIBGSASL_VERSION = 1.8.0
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index ceafc50..8192958 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libgtk2.0
 #
-#############################################################
+################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
 LIBGTK2_VERSION_MINOR = 10
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 484cdcc..530ef50 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libhid
 #
-#############################################################
+################################################################################
 
 LIBHID_VERSION = 0.2.16
 LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index e95a702..dd2fff7 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libical
 #
-#############################################################
+################################################################################
 
 LIBICAL_VERSION = 0.48
 LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 6f63469..d6a1d6f 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libiconv
 #
-#############################################################
+################################################################################
 
 LIBICONV_VERSION = 1.14
 LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index fff8d8b..e67a46e 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libid3tag
 #
-#############################################################
+################################################################################
 
 LIBID3TAG_VERSION = 0.15.1b
 LIBID3TAG_SOURCE = libid3tag-$(LIBID3TAG_VERSION).tar.gz
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 39f3973..70cdcd0 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libidn
 #
-#############################################################
+################################################################################
 
 LIBIDN_VERSION = 1.26
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 0592762..f2d5b4c 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libiqrf
 #
-#############################################################
+################################################################################
 
 LIBIQRF_VERSION = v0.1.0
 LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index bfebd7e..11b92ca 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libiscsi
 #
-#############################################################
+################################################################################
 
 LIBISCSI_VERSION         = 1.6.0
 LIBISCSI_SOURCE          = libiscsi-$(LIBISCSI_VERSION).tar.gz
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index cee3408..b0b02ad 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libjpeg
 #
-#############################################################
+################################################################################
 
 LIBJPEG_VERSION = 8d
 LIBJPEG_SITE = http://www.ijg.org/files/
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index 9b1aca3..73324ae 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libjson
 #
-#############################################################
+################################################################################
 
 LIBJSON_VERSION = 7.6.1
 LIBJSON_SITE = http://downloads.sourceforge.net/project/libjson
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 584867f..dcf72ff 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liblo
 #
-#############################################################
+################################################################################
 
 LIBLO_VERSION = 0.26
 LIBLO_SOURCE = liblo-$(LIBLO_VERSION).tar.gz
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 568d010..6e07704 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liblockfile
 #
-#############################################################
+################################################################################
 
 LIBLOCKFILE_VERSION = 1.08
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index e879b4c..0b5bac2 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liblog4c
 #
-#############################################################
+################################################################################
 
 LIBLOG4C_LOCALTIME_VERSION = 1.0
 LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 09f3cdb..5674749 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmad
 #
-#############################################################
+################################################################################
 
 LIBMAD_VERSION = 0.15.1b
 LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 605a2fb..2833ea7 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmatroska
 #
-#############################################################
+################################################################################
 
 LIBMATROSKA_VERSION = 1.3.0
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index b3cae97..e1b02e0 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmbus
 #
-#############################################################
+################################################################################
 
 LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.freescada.com/public-dist
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
index b67b1c7..1a2645b 100644
--- a/package/libmcrypt/libmcrypt.mk
+++ b/package/libmcrypt/libmcrypt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmcrypt
 #
-#############################################################
+################################################################################
 
 LIBMCRYPT_VERSION = 2.5.8
 LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
diff --git a/package/libmhash/libmhash.mk b/package/libmhash/libmhash.mk
index aa05f93..f7b8e72 100644
--- a/package/libmhash/libmhash.mk
+++ b/package/libmhash/libmhash.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmhash
 #
-#############################################################
+################################################################################
 
 LIBMHASH_VERSION = 0.9.9.9
 LIBMHASH_SITE = http://downloads.sourceforge.net/project/mhash/mhash/$(LIBMHASH_VERSION)
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 2fb79c5..697cbf5 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmicrohttpd
 #
-#############################################################
+################################################################################
 
 LIBMICROHTTPD_VERSION = 0.9.27
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index ffa695e..37447be 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmms
 #
-#############################################################
+################################################################################
 
 LIBMMS_VERSION = 0.6.2
 LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 1f71347..c60c60c 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmnl
 #
-#############################################################
+################################################################################
 
 LIBMNL_VERSION = 1.0.3
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index a2d719a..8f93c2b 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmodbus
 #
-#############################################################
+################################################################################
 
 LIBMODBUS_VERSION = 3.0.3
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index 9b4a1ed..b78a36f 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmpd
 #
-#############################################################
+################################################################################
 
 LIBMPD_VERSION = 11.8.17
 LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index 32a3d06..e8d7192 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libmpeg2
 #
-#############################################################
+################################################################################
 
 LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter-acct.mk
index f08fc44..c89c5ed 100644
--- a/package/libnetfilter_acct/libnetfilter-acct.mk
+++ b/package/libnetfilter_acct/libnetfilter-acct.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-acct
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_ACCT_VERSION = 1.0.2
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 989a34e..41b0640 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-conntrack
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_CONNTRACK_VERSION = 1.0.3
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
index 1414156..11f7e69 100644
--- a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-cthelper
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_CTHELPER_VERSION = 1.0.0
 LIBNETFILTER_CTHELPER_SOURCE = libnetfilter_cthelper-$(LIBNETFILTER_CTHELPER_VERSION).tar.bz2
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
index ff155eb..d751c3b 100644
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-cttimeout
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.0
 LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_VERSION).tar.bz2
diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
index 0d98e12..74a32d7 100644
--- a/package/libnetfilter_log/libnetfilter-log.mk
+++ b/package/libnetfilter_log/libnetfilter-log.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-log
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_LOG_VERSION = 1.0.1
 LIBNETFILTER_LOG_SOURCE = libnetfilter_log-$(LIBNETFILTER_LOG_VERSION).tar.bz2
diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
index 8f9ad5c..7cd2bb7 100644
--- a/package/libnetfilter_queue/libnetfilter-queue.mk
+++ b/package/libnetfilter_queue/libnetfilter-queue.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnetfilter-queue
 #
-#############################################################
+################################################################################
 
 LIBNETFILTER_QUEUE_VERSION = 1.0.2
 LIBNETFILTER_QUEUE_SOURCE = libnetfilter_queue-$(LIBNETFILTER_QUEUE_VERSION).tar.bz2
diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
index 6975e78..d410b55 100644
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnfc-llcp
 #
-#############################################################
+################################################################################
 
 LIBNFC_LLCP_VERSION = 1103
 LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index df52fa3..2530668 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnfc
 #
-#############################################################
+################################################################################
 
 LIBNFC_VERSION = fda8d60ce062
 LIBNFC_SITE = http://libnfc.googlecode.com/git/
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 2d79cdb..192fa8f 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnfnetlink
 #
-#############################################################
+################################################################################
 
 LIBNFNETLINK_VERSION = 1.0.1
 LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 681d364..5c884d7 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnl
 #
-#############################################################
+################################################################################
 
 LIBNL_VERSION = 3.2.21
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index d2db183..5aa9bdc 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnspr
 #
-#############################################################
+################################################################################
 
 LIBNSPR_VERSION = 4.9.6
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8bb46e2..9989b6d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libnss
 #
-#############################################################
+################################################################################
 
 LIBNSS_VERSION = 3.14.3
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index b5fa68f..330bec0 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liboauth
 #
-#############################################################
+################################################################################
 
 LIBOAUTH_VERSION = 0.9.6
 LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 2d5f2c1..6e03f3a 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libogg
 #
-#############################################################
+################################################################################
 
 LIBOGG_VERSION = 1.3.0
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 3198b71..dea4187 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liboping
 #
-#############################################################
+################################################################################
 
 LIBOPING_VERSION = 1.6.2
 LIBOPING_SITE = http://verplant.org/liboping/files
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 182fa18..6ae8149 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libosip2
 #
-#############################################################
+################################################################################
 
 LIBOSIP2_VERSION = 3.6.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 5e077a2..26f807b 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libpcap
 #
-#############################################################
+################################################################################
 
 LIBPCAP_VERSION = 1.3.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 8689bbe..1110672 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libpfm4
 #
-#############################################################
+################################################################################
 
 LIBPFM4_VERSION = 4.3.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 8e8e503..061c87a 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libplayer
 #
-#############################################################
+################################################################################
 
 LIBPLAYER_VERSION = 2.0.1
 LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 55567cb..f5bf956 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libpng
 #
-#############################################################
+################################################################################
 
 LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index 2c6e239..dbfab34 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libpthsem
 #
-#############################################################
+################################################################################
 
 LIBPTHSEM_VERSION = 2.0.8
 LIBPTHSEM_SOURCE = pthsem_$(LIBPTHSEM_VERSION).tar.gz
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index d0d1700..bd52cc0 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libraw
 #
-#############################################################
+################################################################################
 
 LIBRAW_VERSION = 0.13.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index fd255ca..9a95265 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libraw1394
 #
-#############################################################
+################################################################################
 
 LIBRAW1394_VERSION = 2.0.7
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index c574f5a..8cf2823 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # librsvg
 #
-#############################################################
+################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.26
 LIBRSVG_VERSION_MINOR = 3
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index d80385c..dca5667 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # librsync
 #
-#############################################################
+################################################################################
 
 LIBRSYNC_VERSION = 0.9.7
 LIBRSYNC_SOURCE = librsync-$(LIBRSYNC_VERSION).tar.gz
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 73fe632..a69af97 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libseccomp
 #
-#############################################################
+################################################################################
 
 LIBSECCOMP_VERSION         = 1.0.0
 LIBSECCOMP_SOURCE          = libseccomp-$(LIBSECCOMP_VERSION).tar.gz
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index a835439..c5142c5 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libserial
 #
-#############################################################
+################################################################################
 
 LIBSERIAL_VERSION = 0.6.0rc1
 LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index da6a7b2..6976a8f 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsha1
 #
-#############################################################
+################################################################################
 
 LIBSHA1_VERSION = 0.3
 LIBSHA1_SITE = http://github.com/dottedmag/libsha1/tarball/$(LIBSHA1_VERSION)
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index c0a0835..86a3a61 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsigc++
 #
-#############################################################
+################################################################################
 
 LIBSIGC_VERSION = 2.2.11
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index b71e572..2cc2544 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsigsegv
 #
-#############################################################
+################################################################################
 
 LIBSIGSEGV_VERSION = 2.10
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index e5fbb5e..97a8c17 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsndfile
 #
-#############################################################
+################################################################################
 
 LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2f173df..2f7233a 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsoup
 #
-#############################################################
+################################################################################
 
 LIBSOUP_MAJOR_VERSION = 2.36
 LIBSOUP_MINOR_VERSION = 1
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 076a783..df85726 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -1,8 +1,8 @@
-############################################################
+################################################################################
 #
 # libsvgtiny
 #
-############################################################
+################################################################################
 
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
 LIBSVGTINY_VERSION = 12121
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index da4db6f..6bd3c5c 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libsysfs
 #
-#############################################################
+################################################################################
 
 LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index d874b9a..12c4e3b 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtasn1
 #
-#############################################################
+################################################################################
 
 LIBTASN1_VERSION = 3.2
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 37f839c..d31dac3 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtheora
 #
-#############################################################
+################################################################################
 
 LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 5b3c728..6b9a3d2 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtirpc
 #
-#############################################################
+################################################################################
 
 LIBTIRPC_VERSION = 0.2.2
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 1c31ee8..f7e274f 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtool
 #
-#############################################################
+################################################################################
 
 LIBTOOL_VERSION = 2.4.2
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index e58de5d..9d0f8f8 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtorrent
 #
-#############################################################
+################################################################################
 
 LIBTORRENT_VERSION = 0.13.3
 LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index c83286a..0016c31 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libtpl
 #
-#############################################################
+################################################################################
 
 LIBTPL_VERSION = 1.5
 LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 5196ccd..019a489 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libungif
 #
-#############################################################
+################################################################################
 
 LIBUNGIF_VERSION = 4.1.4
 LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 295dace..d4777b5 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libupnp
 #
-#############################################################
+################################################################################
 
 LIBUPNP_VERSION = 1.6.18
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index b6bca65..3c684ea 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # liburc
 #
-#############################################################
+################################################################################
 
 LIBURCU_VERSION = 0.7.6
 LIBURCU_SITE    = http://lttng.org/files/urcu/
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 33f113e..8b4b0f6 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libusb-compat
 #
-#############################################################
+################################################################################
 
 LIBUSB_COMPAT_VERSION = 0.1.4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 806f2d3..68e44ec 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libusb
 #
-#############################################################
+################################################################################
 
 LIBUSB_VERSION = 1.0.9
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 8ab99f8..9362404 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libv4l
 #
-#############################################################
+################################################################################
 
 LIBV4L_VERSION = 0.8.9
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index a450632..fe48838 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libvncserver
 #
-#############################################################
+################################################################################
 
 LIBVNCSERVER_VERSION = 0.9.9
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 5b9048e..2156487 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libvorbis
 #
-#############################################################
+################################################################################
 
 LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 6f66824..27c73ae 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libxkbcommon
 #
-#############################################################
+################################################################################
 
 LIBXKBCOMMON_VERSION = 0.3.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download/
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 4454e57..a863f48 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libxml-parser-perl
 #
-#############################################################
+################################################################################
 
 LIBXML_PARSER_PERL_VERSION = 2.36
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 7800d94..b714234 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libxml2
 #
-#############################################################
+################################################################################
 
 LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 41ae7f0..9194274 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # LibXML++
 #
-#############################################################
+################################################################################
 
 LIBXMLPP_VERSION_MAJOR = 2.34
 LIBXMLPP_VERSION_MINOR = 2
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index b6c6aad..9139c8e 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libxslt
 #
-#############################################################
+################################################################################
 
 LIBXSLT_VERSION = 1.1.28
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index c1b5bdd..ef006dd 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libyaml
 #
-#############################################################
+################################################################################
 
 LIBYAML_VERSION = 0.1.4
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 18ffbef..2b5949e 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lighttpd
 #
-#############################################################
+################################################################################
 
 LIGHTTPD_VERSION = 1.4.32
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 293208a..0265e10 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # linenoise
 #
-#############################################################
+################################################################################
 
 LINENOISE_VERSION = g27a3b4d
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 701eabf..6892004 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # linknx
 #
-#############################################################
+################################################################################
 
 LINKNX_VERSION = 0.0.1.30
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
diff --git a/package/links/links.mk b/package/links/links.mk
index f7401bb..6e683dd 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # links
 #
-#############################################################
+################################################################################
 
 LINKS_VERSION = 2.7
 LINKS_SITE = http://links.twibright.com/download
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index efe70a9..bbab1e5 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # linphone
 #
-#############################################################
+################################################################################
 
 LINPHONE_VERSION = 3.5.2
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0ba2b82..4ff0e0a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # linux-firmware
 #
-#############################################################
+################################################################################
 
 LINUX_FIRMWARE_VERSION = 07ea598af5b9dde3acdf279846b062fa1b2987b8
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 80b14ca..ff31934 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # linux-fusion
 #
-#############################################################
+################################################################################
 
 LINUX_FUSION_VERSION = 9.0.0
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index f5388c1..aa9fa36 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -1,8 +1,8 @@
-############################################
+################################################################################
 #
 # linux-pam
 # 
-############################################
+################################################################################
 
 LINUX_PAM_VERSION = 1.1.4
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 03d5eb6..262b2d4 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # LiTE
 #
-#############################################################
+################################################################################
 
 LITE_VERSION = 0.8.10
 LITE_SOURCE = LiTE-$(LITE_VERSION).tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index ecbac60..83fe0e0 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # live555
 #
-#############################################################
+################################################################################
 
 LIVE555_VERSION = 2011.06.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index b4339a3..1f752be 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lm-sensors
 #
-#############################################################
+################################################################################
 
 LM_SENSORS_VERSION = 3.3.4
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 65ef62b..3d3d68f 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lmbench
 #
-#############################################################
+################################################################################
 
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ad1bcad..cc38559 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # localedef
 #
-#############################################################
+################################################################################
 
 LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 3d6e459..35bb881 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lockfile-progs
 #
-#############################################################
+################################################################################
 
 LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 83afded..4385962 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # log4cxx
 #
-#############################################################
+################################################################################
 
 LOG4CXX_VERSION = 0.10.0
 LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 6d2d90a..f5ef0b9 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # logrotate
 #
-#############################################################
+################################################################################
 
 LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
index 4d9a8d4..c0daa24 100644
--- a/package/logsurfer/logsurfer.mk
+++ b/package/logsurfer/logsurfer.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # logsurfer
 #
-#############################################################
+################################################################################
 
 LOGSURFER_VERSION = 1.8
 LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index c579215..2ecd280 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lrzsz
 #
-#############################################################
+################################################################################
 
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 68daa0d..71f52a5 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lshw
 #
-#############################################################
+################################################################################
 
 LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f74eca4..f1c9474 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lsof
 #
-#############################################################
+################################################################################
 
 LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 4479bbc..ae44a78 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lsuio
 #
-#############################################################
+################################################################################
 
 LSUIO_VERSION = 0.2.0
 LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 093c2c3..16d1fe8 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ltp-testsuite
 #
-#############################################################
+################################################################################
 
 LTP_TESTSUITE_VERSION = 20130109
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 41d48ba..78b5a9d 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ltrace
 #
-#############################################################
+################################################################################
 
 LTRACE_VERSION = 0.7.2
 LTRACE_SITE = http://alioth.debian.org/frs/download.php/3848
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 59d3963..625475f 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # LTTng-UST
 #
-#############################################################
+################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
 LTTNG_LIBUST_VERSION = 2.1.1
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index f01d529..c1dfff9 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # LTTng-modules
 #
-#############################################################
+################################################################################
 
 LTTNG_MODULES_VERSION = 2.1.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 6142666..77bf7d6 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # LTTng-Tools
 #
-#############################################################
+################################################################################
 
 LTTNG_TOOLS_VERSION = 2.1.1
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index bde7708..4979a11 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lua-msgpack-native
 #
-#############################################################
+################################################################################
 
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 32acc99..2098de2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lua
 #
-#############################################################
+################################################################################
 
 LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index dc70cee..f976ec6 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luacjson
 #
-#############################################################
+################################################################################
 
 LUACJSON_VERSION       = 2.1.0
 LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 2d4c517..5c45f34 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luaexpat
 #
-#############################################################
+################################################################################
 
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index d23fbce..2f7b4d8 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luafilesystem
 #
-#############################################################
+################################################################################
 
 LUAFILESYSTEM_VERSION = 1.6.2
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 8078a51..e4022a1 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luajit
 #
-#############################################################
+################################################################################
 
 LUAJIT_VERSION = 2.0.2
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 45fb9a3..b0c0be5 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # luasocket
 #
-#############################################################
+################################################################################
 
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 69df260..873216c 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lvm2
 #
-#############################################################
+################################################################################
 
 LVM2_VERSION = 2.02.79
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 110437c..648a579 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lzma
 #
-#############################################################
+################################################################################
 
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.gz
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 6809f30..10107fe 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lzo
 #
-#############################################################
+################################################################################
 
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 9803b39..1ac85eb 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lzop
 #
-#############################################################
+################################################################################
 
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index f0d5019..8e41627 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # m4
 #
-#############################################################
+################################################################################
 
 M4_VERSION = 1.4.16
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 93b5549..8656183 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # macchanger
 #
-#############################################################
+################################################################################
 
 MACCHANGER_VERSION = 1.5.0
 MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
diff --git a/package/make/make.mk b/package/make/make.mk
index a24a28e..74726e2 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # make
 #
-#############################################################
+################################################################################
 
 MAKE_VERSION = 3.82
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 5e984c6..a426e7d 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # makedevs
 #
-#############################################################
+################################################################################
 
 # source included in buildroot
 MAKEDEVS_SOURCE =
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 61b9e95..0a169d7 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Common
 #
-#############################################################
+################################################################################
 
 MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
@@ -16,6 +16,6 @@ ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
 	MATCHBOX_COMMON_CONF_OPT += --enable-pda-folders
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 13ea730..9e1e055 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Desktop
 #
-#############################################################
+################################################################################
 
 MATCHBOX_DESKTOP_VERSION_MAJOR = 0.9
 MATCHBOX_DESKTOP_VERSION = $(MATCHBOX_DESKTOP_VERSION_MAJOR).1
@@ -18,7 +18,7 @@ MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 # configure.ac/Makefile.am.
 MATCHBOX_DESKTOP_AUTORECONF = YES
 
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
   MATCHBOX_DESKTOP_CONF_OPT+=--enable-startup-notification
@@ -27,6 +27,6 @@ else
   MATCHBOX_DESKTOP_CONF_OPT+=--disable-startup-notification
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index c3165e0..ebae9d2 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Fakekey
 #
-#############################################################
+################################################################################
 
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
@@ -20,6 +20,6 @@ endef
 
 MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 97e3a36..94782df 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Keyboard
 #
-#############################################################
+################################################################################
 
 MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
@@ -20,7 +20,7 @@ endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_PANGO),y)
   MATCHBOX_PKEYBOARD_CONF_OPT+=--enable-pango
@@ -28,6 +28,6 @@ else
   MATCHBOX_KEYBOARD_DEPENDENCIES+=xlib_libXft
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 9855c8a..768f29e 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox LIB
 #
-#############################################################
+################################################################################
 
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
@@ -20,7 +20,7 @@ endef
 
 MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
 
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
@@ -56,6 +56,6 @@ else
   MATCHBOX_LIB_CONF_OPT+=--disable-xft
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 9b12c3d..bf145d4 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Panel
 #
-#############################################################
+################################################################################
 
 MATCHBOX_PANEL_VERSION_MAJOR = 0.9
 MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
@@ -13,7 +13,7 @@ MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPT = --enable-expat
 
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
   MATCHBOX_PANEL_CONF_OPT+=--enable-startup-notification
@@ -22,6 +22,6 @@ else
   MATCHBOX_PANEL_CONF_OPT+=--disable-startup-notification
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 18c3b13..561cac9 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox Applet Startup monitor
 #
-#############################################################
+################################################################################
 
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
@@ -12,6 +12,6 @@ MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 4c556e5..3438d32 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MatchBox WM
 #
-#############################################################
+################################################################################
 
 MATCHBOX_WM_VERSION = 1.2
 MATCHBOX_WM_SOURCE = matchbox-window-manager-$(MATCHBOX_WM_VERSION).tar.bz2
@@ -16,7 +16,7 @@ MATCHBOX_WM_CONF_OPT = --enable-expat
 # Workaround bug in configure script
 MATCHBOX_WM_CONF_ENV = expat=yes
 
-#############################################################
+################################################################################
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
@@ -40,6 +40,6 @@ else
   MATCHBOX_WM_CONF_OPT+=--disable-startup-notification
 endif
 
-#############################################################
+################################################################################
 
 $(eval $(autotools-package))
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
index 5bd5816..f9bbdaa 100644
--- a/package/mcrypt/mcrypt.mk
+++ b/package/mcrypt/mcrypt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mcrypt
 #
-#############################################################
+################################################################################
 
 MCRYPT_VERSION = 2.6.8
 MCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/MCrypt/$(MCRYPT_VERSION)
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index e8cefda..e21cb71 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mdadm
 #
-#############################################################
+################################################################################
 
 MDADM_VERSION = 3.2.6
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
diff --git a/package/media-ctl/media-ctl.mk b/package/media-ctl/media-ctl.mk
index 065751e..64a63aa 100644
--- a/package/media-ctl/media-ctl.mk
+++ b/package/media-ctl/media-ctl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # media-ctl
 #
-#############################################################
+################################################################################
 
 MEDIA_CTL_VERSION = ac40b79f002a2315f909548614ccd2d408da25b7
 MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 6a0664e..5093df7 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mediastreamer
 #
-#############################################################
+################################################################################
 
 MEDIASTREAMER_VERSION = 2.8.2
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 4adacd1..e13d013 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # memstat
 #
-#############################################################
+################################################################################
 
 MEMSTAT_VERSION = 0.8
 MEMSTAT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index a343301..3e2092a 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # memtester
 #
-#############################################################
+################################################################################
 
 MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index aa78a7a..9306b00 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # metacity
 #
-#############################################################
+################################################################################
 
 # newer versions need libcanberra-gtk and gnome-doc-utils
 METACITY_VERSION_MAJOR = 2.25
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 8fac3d8..8887e49 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # midori
 #
-#############################################################
+################################################################################
 
 MIDORI_VERSION = 0.4.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 88187c6..9443661 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mii-diag
 #
-#############################################################
+################################################################################
 
 MII_DIAG_VERSION = 2.11
 MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 1dfbde7..25f266b 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # minicom
 #
-#############################################################
+################################################################################
 
 MINICOM_VERSION = 2.6.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.gz
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 5eff6d1..035b948 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mobile broadband provider info
 #
-#############################################################
+################################################################################
 
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20120614
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 9d136b9..88abec4 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # module-init-tools
 #
-#############################################################
+################################################################################
 
 MODULE_INIT_TOOLS_VERSION = 3.15
 MODULE_INIT_TOOLS_SOURCE = module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 9905cf9..d928dd8 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mongoose
 #
-#############################################################
+################################################################################
 
 MONGOOSE_VERSION = 3.7
 MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 06ec6cd..c068107 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mongrel2
 #
-#############################################################
+################################################################################
 
 MONGREL2_VERSION = 1.8.0
 MONGREL2_SOURCE = mongrel2_$(MONGREL2_VERSION).tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 657f0f1..e2847fc 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # monit
 #
-#############################################################
+################################################################################
 
 MONIT_VERSION = 5.4
 MONIT_SITE = http://mmonit.com/monit/dist/
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index a366db7..84e4ff3 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mpc
 #
-#############################################################
+################################################################################
 
 MPC_VERSION = 1.0.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 7fa97fe..6460844 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mpfr
 #
-#############################################################
+################################################################################
 
 MPFR_VERSION = 3.1.2
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 56aa7e1..c0cc2aa 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mrouted
 #
-#############################################################
+################################################################################
 
 MROUTED_VERSION = 3.9.6
 MROUTED_SOURCE = mrouted-$(MROUTED_VERSION).tar.bz2
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index e99ab3d..95687bc 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # msmtp
 #
-#############################################################
+################################################################################
 
 MSMTP_VERSION = 1.4.31
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 4411544..994a73a 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mtd
 #
-#############################################################
+################################################################################
 
 MTD_VERSION = 1.5.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index d240b50..5c94352 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mtdev
 #
-#############################################################
+################################################################################
 
 MTDEV_VERSION = 1.1.3
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index fcbe5a6..3f34702 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mtdev2tuio
 #
-#############################################################
+################################################################################
 
 MTDEV2TUIO_VERSION = e1e7378
 MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/master
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index a27c4fd..6751059 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mtools
 #
-#############################################################
+################################################################################
 
 MTOOLS_VERSION       = 4.0.18
 MTOOLS_SOURCE        = mtools-$(MTOOLS_VERSION).tar.bz2
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 84082d1..b951112 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # alsa-utils
 #
-#############################################################
+################################################################################
 
 ALSA_UTILS_VERSION = 1.0.26
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index da42bba..de0902a 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # aumix
 #
-#############################################################
+################################################################################
 
 AUMIX_VERSION = 2.8
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index 07004ce..993015c 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # bellagio
 #
-#############################################################
+################################################################################
 
 BELLAGIO_VERSION = 0.9.3
 BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index fd7a256..6223a79 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ffmpeg
 #
-#############################################################
+################################################################################
 
 FFMPEG_VERSION = 0.8.12
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index ead490e..fc59c30 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-ffmpeg
 #
-#############################################################
+################################################################################
 
 GST_FFMPEG_VERSION = 0.10.13
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
diff --git a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
index 405374a..ccdb521 100644
--- a/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/multimedia/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-fsl-plugins
 #
-#############################################################
+################################################################################
 
 GST_FSL_PLUGINS_VERSION = 3.0.1
 # No official download site from freescale, just this mirror
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 1e8f54e..df90cf9 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-plugins-bad
 #
-#############################################################
+################################################################################
 
 GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 713aaae..c82aad0 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-plugins-base
 #
-#############################################################
+################################################################################
 
 GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index b61138d..eba0571 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-plugins-good
 #
-#############################################################
+################################################################################
 
 GST_PLUGINS_GOOD_VERSION = 0.10.31
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 752f8e8..009c168 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # gst-plugins-ugly
 #
-#############################################################
+################################################################################
 
 GST_PLUGINS_UGLY_VERSION = 0.10.19
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 3639a55..4453fc8 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -1,9 +1,9 @@
 
-#############################################################
+################################################################################
 #
 # gstreamer
 #
-#############################################################
+################################################################################
 
 GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 0970592..38a39a3 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # lame
 #
-#############################################################
+################################################################################
 
 LAME_VERSION_MAJOR = 3.99
 LAME_VERSION_MINOR = 5
diff --git a/package/multimedia/libvpx/libvpx.mk b/package/multimedia/libvpx/libvpx.mk
index 131fd49..480f1c4 100644
--- a/package/multimedia/libvpx/libvpx.mk
+++ b/package/multimedia/libvpx/libvpx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libvpx
 #
-#############################################################
+################################################################################
 
 LIBVPX_VERSION = v1.2.0
 LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index d68c86b..8dbb4c0 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # madplay
 #
-#############################################################
+################################################################################
 
 MADPLAY_VERSION = 0.15.2b
 MADPLAY_SOURCE = madplay-$(MADPLAY_VERSION).tar.gz
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index e098c3d..4424b7e 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mpd
 #
-#############################################################
+################################################################################
 
 MPD_VERSION = 0.17.4
 MPD_SITE = http://www.musicpd.org/download/mpd/stable
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 8796392..f554043 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mpg123
 #
-#############################################################
+################################################################################
 
 MPG123_VERSION = 1.15.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 6ddf002..a13efed 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mplayer
 #
-#############################################################
+################################################################################
 
 MPLAYER_VERSION = 1.1
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/multimedia/vorbis-tools/vorbis-tools.mk
index c23648c..56b1f94 100644
--- a/package/multimedia/vorbis-tools/vorbis-tools.mk
+++ b/package/multimedia/vorbis-tools/vorbis-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vorbis-tools
 #
-#############################################################
+################################################################################
 
 VORBIS_TOOLS_VERSION = 1.4.0
 VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index ed5e86e..59f65f6 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mutt
 #
-#############################################################
+################################################################################
 
 MUTT_VERSION = 1.5.21
 MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt-dev
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 5f03db8..778e9bf 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mxml
 #
-#############################################################
+################################################################################
 
 MXML_VERSION = 2.7
 MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 1477b66..ade4822 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # MySQL 5.1 Client
 #
-#############################################################
+################################################################################
 
 MYSQL_CLIENT_VERSION = 5.1.67
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 61bf218..b1a8f44 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nano
 #
-#############################################################
+################################################################################
 
 NANO_VERSION = 2.3.1
 NANO_SITE = http://www.nano-editor.org/dist/v2.3
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index a6cd7e1..d97e26d 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nanocom
 #
-#############################################################
+################################################################################
 
 NANOCOM_VERSION = 2.6.1
 NANOCOM_SOURCE = nanocom.tar.gz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 84663e5..c762dcf 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -1,8 +1,8 @@
-############################################################
+################################################################################
 #
 # nasm
 #
-############################################################
+################################################################################
 
 NASM_VERSION = 2.10.01
 NASM_SOURCE  = nasm-$(NASM_VERSION).tar.bz2
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 708e567..e790a34 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nbd
 #
-#############################################################
+################################################################################
 
 NBD_VERSION = 3.3
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 06f5e71..a104285 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ncdu
 #
-#############################################################
+################################################################################
 
 NCDU_VERSION = 1.9
 NCDU_SITE = http://dev.yorhel.nl/download/
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index bfb878a..a51605e 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ncftp
 #
-#############################################################
+################################################################################
 
 NCFTP_VERSION = 3.2.5
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.bz2
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 8d5463c..5381bd1 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ncurses
 #
-#############################################################
+################################################################################
 
 NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 1d3c0e7..719f85d 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ndisc6
 #
-#############################################################
+################################################################################
 
 NDISC6_VERSION = 1.0.2
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 64cd1a9..f5121ed 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ne10
 #
-#############################################################
+################################################################################
 
 # We use a Git commit ID because the last tagged version is more than
 # one year old.
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 57a434d..0fa30ea 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # neard
 #
-#############################################################
+################################################################################
 
 NEARD_VERSION = 0.11
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index b937acb..7e085e4 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # neardal
 #
-#############################################################
+################################################################################
 
 NEARDAL_VERSION = 0.8
 NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 32d63ad..1915e6c 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # neon
 #
-#############################################################
+################################################################################
 
 NEON_VERSION = 0.29.6
 NEON_SITE = http://www.webdav.org/neon/
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 2e0f978..684e790 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netatalk
 #
-#############################################################
+################################################################################
 
 NETATALK_VERSION = 3.0
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 5f6cc4d..594ef2f 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netcat
 #
-#############################################################
+################################################################################
 
 NETCAT_VERSION = 0.7.1
 NETCAT_SOURCE = netcat-$(NETCAT_VERSION).tar.gz
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 01f35be..b17ee99 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netkitbase
 #
-#############################################################
+################################################################################
 
 NETKITBASE_VERSION = 0.17
 NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index db6743e..ca3b930 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netkittelnet
 #
-#############################################################
+################################################################################
 
 NETKITTELNET_VERSION = 0.17
 NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 653dc7a..2bd11f3 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netperf
 #
-#############################################################
+################################################################################
 
 NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 0c723bf..7460b66 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netplug
 #
-#############################################################
+################################################################################
 
 NETPLUG_VERSION=1.2.9.2
 NETPLUG_SOURCE=netplug-$(NETPLUG_VERSION).tar.bz2
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6a72da7..806f7a6 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netsnmp
 #
-#############################################################
+################################################################################
 
 NETSNMP_VERSION = 5.7.2
 NETSNMP_SITE = http://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index a67b786..d94c6f0 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # netstat-nat
 #
-#############################################################
+################################################################################
 
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9be624c..9c143aa 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # NetworkManager
 #
-#############################################################
+################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
 NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.0
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 754636b..1d5e7d5 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # newt
 #
-#############################################################
+################################################################################
 
 NEWT_VERSION         = 0.51.0
 NEWT_SITE            = http://www.uclibc.org/
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index cde9cad..48f73e9 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nfacct
 #
-#############################################################
+################################################################################
 
 NFACCT_VERSION = 1.0.1
 NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e59619f..76face5 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nfs-utils
 #
-#############################################################
+################################################################################
 
 NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 7300911..41a5b49 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ngircd
 #
-#############################################################
+################################################################################
 
 NGIRCD_VERSION = 17.1
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 274bbbd..99b8f46 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ngrep
 #
-#############################################################
+################################################################################
 
 NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index a5b085d..47e4cfc 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nmap
 #
-#############################################################
+################################################################################
 
 NMAP_VERSION = 6.01
 NMAP_SITE = http://nmap.org/dist
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a77709d..874c5f1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nodejs
 #
-#############################################################
+################################################################################
 
 NODEJS_VERSION = 0.8.22
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index e90ff07..a3d5e3d 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # noip
 #
-#############################################################
+################################################################################
 
 NOIP_VERSION = 2.1.9
 NOIP_SITE = http://www.no-ip.com/client/linux
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 250050e..ea53bc2 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nss_mdns
 #
-#############################################################
+################################################################################
 
 NSS_MDNS_VERSION=0.10
 NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index e9a91a4..55a4d7b 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ntfs-3g
 #
-#############################################################
+################################################################################
 
 NTFS_3G_VERSION = 2013.1.13
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index a9a7f10..601fa97 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ntp
 #
-#############################################################
+################################################################################
 
 NTP_VERSION = 4.2.6p5
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index fe6f23f..5b2b022 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # numactl
 #
-#############################################################
+################################################################################
 
 NUMACTL_VERSION = 2.0.8
 NUMACTL_SOURCE = numactl-$(NUMACTL_VERSION).tar.gz
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index df03dca..406219d 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # nuttcp
 #
-#############################################################
+################################################################################
 
 NUTTCP_VERSION = 6.1.2
 NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 1be3a3f..8ca5578 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ocf-linux
 #
-#############################################################
+################################################################################
 
 OCF_LINUX_VERSION = 20120127
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 9b1181a..6031395 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ofono
 #
-#############################################################
+################################################################################
 
 OFONO_VERSION = 1.12
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index fff7b34..9532612 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # olsr
 #
-#############################################################
+################################################################################
 
 OLSR_VERSION_MAJOR = 0.6
 OLSR_VERSION_MINOR = 4
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 8615fdb..77bb6a6 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # omap-u-boot-utils
 #
-#############################################################
+################################################################################
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852
 OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/master
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 5a129ec..d083795 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -1,8 +1,8 @@
-############################################################
+################################################################################
 #
 # open2300
 #
-############################################################
+################################################################################
 
 OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
 OPEN2300_SITE_METHOD = svn
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index f9be0d7..3bf7ee9 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # opencv
 #
-#############################################################
+################################################################################
 
 OPENCV_VERSION = 2.4.2
 OPENCV_SITE    = http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/$(OPENCV_VERSION)
diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 8ff24e8..bd8040d 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Virtual package for libEGL
 #
-#############################################################
+################################################################################
 
 LIBEGL_SOURCE =
 
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 675d11f..a0048a7 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Virtual package for libGLES
 #
-#############################################################
+################################################################################
 
 LIBGLES_SOURCE =
 
diff --git a/package/opengl/libopenmax/libopenmax.mk b/package/opengl/libopenmax/libopenmax.mk
index 4307602..9175c6e 100644
--- a/package/opengl/libopenmax/libopenmax.mk
+++ b/package/opengl/libopenmax/libopenmax.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Virtual package for libopenmax
 #
-#############################################################
+################################################################################
 
 LIBOPENMAX_SOURCE =
 
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 746b52c..03f59ba 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Virtual package for libOpenVG
 #
-#############################################################
+################################################################################
 
 LIBOPENVG_SOURCE =
 
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 7419359..cd9bab6 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openntpd
 #
-#############################################################
+################################################################################
 
 OPENNTPD_VERSION = 3.9p1
 OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 0fb4f65..7195a26 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openobex
 #
-#############################################################
+################################################################################
 
 OPENOBEX_VERSION = 1.5
 OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 05876dc..ac3cd77 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openocd
 #
-#############################################################
+################################################################################
 
 OPENOCD_VERSION = 0.5.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index c476014..3ec5c77 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openpgm
 #
-#############################################################
+################################################################################
 
 OPENPGM_VERSION = 5.1.118~dfsg
 OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a56bb75..006d597 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openssh
 #
-#############################################################
+################################################################################
 
 OPENSSH_VERSION = 6.2p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 081fc90..e16c91f 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openssl
 #
-#############################################################
+################################################################################
 
 OPENSSL_VERSION = 1.0.1e
 OPENSSL_SITE = http://www.openssl.org/source
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 6b7dc05..b373e11 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openswan
 #
-#############################################################
+################################################################################
 
 OPENSWAN_VERSION = 2.6.38
 OPENSWAN_SITE = http://download.openswan.org/openswan
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7a4385b..db61c83 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openvpn
 #
-#############################################################
+################################################################################
 
 OPENVPN_VERSION = 2.3.1
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 9932d3f..9e1c623 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # opkg
 #
-#############################################################
+################################################################################
 
 OPKG_VERSION = 635
 OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 6c39702..abfb1cd 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # oprofile
 #
-#############################################################
+################################################################################
 
 OPROFILE_VERSION = 0.9.8
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 7ee708f..66bd9f0 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # opus-tools
 #
-#############################################################
+################################################################################
 
 OPUS_TOOLS_VERSION = 0.1.6
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index adaebfb..043d4b0 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # opus
 #
-#############################################################
+################################################################################
 
 OPUS_VERSION = 1.0.2
 OPUS_SITE = http://downloads.xiph.org/releases/opus
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 18ce0fd..9d9921a 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # orc
 #
-#############################################################
+################################################################################
 
 ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index a54cc5d..371cc02 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # owl-linux
 #
-#############################################################
+################################################################################
 
 OWL_LINUX_VERSION = 1.0.7
 OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 89774dc..63a8af2 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # p11-kit
 #
-#############################################################
+################################################################################
 
 P11_KIT_VERSION = 0.18.1
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 75477d9..82ba542 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pango
 #
-#############################################################
+################################################################################
 
 PANGO_VERSION_MAJOR = 1.28
 PANGO_VERSION_MINOR = 4
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 2152ea6..78c755a 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # parted
 #
-#############################################################
+################################################################################
 
 PARTED_VERSION = 3.1
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 5a421c7..1605e31 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # patch
 #
-#############################################################
+################################################################################
 
 PATCH_VERSION = 2.7.1
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index d9265a3..350ca0d 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pciutils
 #
-#############################################################
+################################################################################
 
 PCIUTILS_VERSION = 3.2.0
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 4a2cdac..90b3959 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pcmanfm
 #
-#############################################################
+################################################################################
 
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 62f2210..bf86a3d 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pcre
 #
-#############################################################
+################################################################################
 
 PCRE_VERSION = 8.33
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index b3bd342..5eab4e7 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -1,8 +1,8 @@
-##########################################################
+################################################################################
 #
 # pcsc-lite
 #
-#########################################################
+################################################################################
 
 PCSC_LITE_VERSION = 1.8.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 4356f5d..7787c78 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # perf
 #
-#############################################################
+################################################################################
 
 # Source taken from the Linux kernel tree
 PERF_SOURCE =
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 42512f8..cbd5453 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # perl
 #
-#############################################################
+################################################################################
 
 PERL_VERSION_MAJOR = 16
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
diff --git a/package/php/php.mk b/package/php/php.mk
index 8c4c2e1..ea148fb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # php
 #
-#############################################################
+################################################################################
 
 PHP_VERSION = 5.3.25
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 4278ac0..4298faa 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # picocom
 #
-#############################################################
+################################################################################
 
 PICOCOM_VERSION = 1.6
 PICOCOM_SITE    = http://picocom.googlecode.com/files/
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 6c5e135..4a3d66d 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pkgconfig
 #
-#############################################################
+################################################################################
 
 PKG_CONFIG_VERSION = 0.25
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1705fcd..8f6fe3d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -1,11 +1,11 @@
-############################################################################
+################################################################################
 #
 # This file contains the download helpers for the various package
 # infrastructures. It is used to handle downloads from HTTP servers,
 # FTP servers, Git repositories, Subversion repositories, Mercurial
 # repositories, Bazaar repositories, and SCP servers.
 #
-############################################################################
+################################################################################
 
 # Download method commands
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 86d687f..15db096 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -1,9 +1,9 @@
-############################################################################
+################################################################################
 #
 # This file contains various utility functions used by the package
 # infrastructure, or by the packages themselves.
 #
-############################################################################
+################################################################################
 
 # UPPERCASE Macro -- transform its argument to uppercase and replace dots and
 # hyphens to underscores
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 4b00ad3..b489699 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pkgconf
 #
-#############################################################
+################################################################################
 
 PKGCONF_VERSION = 0.8.9
 PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
diff --git a/package/pmake/pmake.mk b/package/pmake/pmake.mk
index 50613e8..83ee12e 100644
--- a/package/pmake/pmake.mk
+++ b/package/pmake/pmake.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pmake
 #
-##############################################################
+################################################################################
 
 PMAKE_VERSION       = 1.111
 PMAKE_SOURCE        = pmake_$(PMAKE_VERSION).orig.tar.gz
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 1aa9bb4..a18f209 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # poco
 #
-#############################################################
+################################################################################
 
 POCO_VERSION_MAJOR = 1.4.6
 POCO_VERSION = $(POCO_VERSION_MAJOR)p1
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 54782dd..5ff530b 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # polkit
 #
-#############################################################
+################################################################################
 
 POLKIT_VERSION = 0.103
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases/
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 1ce7d1e..81bdbbb 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # poppler
 #
-#############################################################
+################################################################################
 
 POPPLER_VERSION = 0.22.3
 POPPLER_SITE = http://poppler.freedesktop.org
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 9193553..180972a 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # popt
 #
-#############################################################
+################################################################################
 
 POPT_VERSION = 1.16
 # rpm5.org down
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 639a72e..a43fc1f 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # portmap
 #
-#############################################################
+################################################################################
 
 PORTMAP_VERSION = 6.0
 PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index b13dbab..b2ced29 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pppd
 #
-#############################################################
+################################################################################
 
 PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index ef25c9a..ee0fab6 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pptp-linux
 #
-#############################################################
+################################################################################
 
 PPTP_LINUX_VERSION = 1.7.2
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 027e982..1da08ce 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # prboom
 #
-#############################################################
+################################################################################
 
 PRBOOM_VERSION = 2.5.0
 PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index 189da1f..dc2b841 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # procps
 #
-#############################################################
+################################################################################
 
 PROCPS_VERSION = 3.2.8
 PROCPS_SITE = http://procps.sourceforge.net/
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 92644a8..a8d0e59 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # proftpd
 #
-#############################################################
+################################################################################
 
 PROFTPD_VERSION = 1.3.3g
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index eb0047a..31fb593 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # protobuf-c
 #
-#############################################################
+################################################################################
 
 PROTOBUF_C_VERSION = 0.15
 PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 519e568..278ed29 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # protobuf
 #
-#############################################################
+################################################################################
 
 PROTOBUF_VERSION = 2.4.1
 PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 2020e3f..cc3e357 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # proxychains-ng
 #
-#############################################################
+################################################################################
 
 PROXYCHAINS_NG_VERSION = 4.4
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index f251c17..1340ee6 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # psmisc
 #
-#############################################################
+################################################################################
 
 PSMISC_VERSION = 22.20
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index 481a64e..ac9ab98 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ptpd
 #
-#############################################################
+################################################################################
 
 PTPD_VERSION = 1.1.0
 PTPD_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD_VERSION)
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index 04a0070..0428c80 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ptpd2
 #
-#############################################################
+################################################################################
 
 PTPD2_VERSION = 2.2.2
 PTPD2_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD2_VERSION)
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index a47d8d3..1aa95f6 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -1,8 +1,8 @@
-#######################
+################################################################################
 #
 # pv
 #
-#######################
+################################################################################
 
 PV_VERSION = 1.2.0
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 9df359f..db71512 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-bottle
 #
-#############################################################
+################################################################################
 
 PYTHON_BOTTLE_VERSION = 0.11.6
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
index ab6c0be..df12f97 100644
--- a/package/python-distutilscross/python-distutilscross.mk
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-distutilscross
 #
-#############################################################
+################################################################################
 
 PYTHON_DISTUTILSCROSS_VERSION = 0.1
 PYTHON_DISTUTILSCROSS_SOURCE  = distutilscross-$(PYTHON_DISTUTILSCROSS_VERSION).tar.gz
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 7312a78..7518ee0 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-dpkt
 #
-#############################################################
+################################################################################
 
 PYTHON_DPKT_VERSION = 1.7
 PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index c642072..9328a0f 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-id3
 #
-#############################################################
+################################################################################
 
 PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 2429b24..1c0efbd 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-m2crypto
 #
-#############################################################
+################################################################################
 
 PYTHON_M2CRYPTO_VERSION = 0.21.1
 PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 6ce6cf8..eaa1fae 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-mad
 #
-#############################################################
+################################################################################
 
 PYTHON_MAD_VERSION = 0.6
 PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index de83b28..27da9c8 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-meld3
 #
-#############################################################
+################################################################################
 
 PYTHON_MELD3_VERSION = 0.6.8
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index d742cbd..1570fd1 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-netifaces
 #
-#############################################################
+################################################################################
 
 PYTHON_NETIFACES_VERSION = 0.7
 PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 32c0a27..63a502b 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-nfc
 #
-#############################################################
+################################################################################
 
 PYTHON_NFC_VERSION = 142
 PYTHON_NFC_SITE = https://launchpad.net/nfcpy
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index d853dee..dcf67c2 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-protobuf
 #
-#############################################################
+################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 61af1af..4a87db7 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # pygame
 #
-#############################################################
+################################################################################
 
 # stable 1.9.1 release requires V4L which has been wiped out of recent Linux
 # kernels, so use latest mercurial revision until next stable release is out.
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 246df4d..7814ce3 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-pyparsing
 #
-#############################################################
+################################################################################
 
 PYTHON_PYPARSING_VERSION         = 1.5.6
 PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 4bfc355..e00577b 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-serial
 #
-#############################################################
+################################################################################
 
 PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 1ff9f89..cd5ee4d 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-setuptools
 #
-#############################################################
+################################################################################
 
 # "distribute" is a fork of the unmaintained setuptools package. There
 # are plans to re-merge it into setuptools; if this happens, we can
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index c2fc752..4cd35e5 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-thrift
 #
-#############################################################
+################################################################################
 
 PYTHON_THRIFT_VERSION = 0.9.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
diff --git a/package/python/python.mk b/package/python/python.mk
index 6e95451..363513d 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python
 #
-#############################################################
+################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
 PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).3
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f44ba13..11ffe61 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python3
 #
-#############################################################
+################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.3
 PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).0
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 806ffd8..f177fd5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qemu
 #
-#############################################################
+################################################################################
 
 QEMU_VERSION = 1.3.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index efbfae7..373cd69 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qextserialport
 #
-#############################################################
+################################################################################
 
 QEXTSERIALPORT_VERSION     = 6c47244de4ce6db
 QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index d203cd5..29b8c31 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qjson
 #
-#############################################################
+################################################################################
 
 QJSON_VERSION = 0.8.1
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 93d2ed0..71b9e4c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,4 +1,4 @@
-######################################################################
+################################################################################
 #
 # Qt Embedded for Linux
 #
@@ -9,7 +9,7 @@
 # the kernels FPU emulation so it's better to choose soft float in the
 # buildroot config (and uClibc.config of course, if you have your own.)
 #
-######################################################################
+################################################################################
 
 QT_VERSION = 4.8.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cfa06ea..1686dad 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5base
 #
-#############################################################
+################################################################################
 
 QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index e4dd742..83810ad 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5declarative
 #
-#############################################################
+################################################################################
 
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 93aef53..fc9a2ec 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5graphicaleffects
 #
-#############################################################
+################################################################################
 
 QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 77dfa8f..8aa412d 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5imageformats
 #
-#############################################################
+################################################################################
 
 QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
index 3c3c2c2..9134579 100644
--- a/package/qt5/qt5jsbackend/qt5jsbackend.mk
+++ b/package/qt5/qt5jsbackend/qt5jsbackend.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5jsbackend
 #
-#############################################################
+################################################################################
 
 QT5JSBACKEND_VERSION = $(QT5_VERSION)
 QT5JSBACKEND_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index b08a9ab..8f62274 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5multimedia
 #
-#############################################################
+################################################################################
 
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
 QT5MULTIMEDIA_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index 371eb62..0b7f9ea 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5quick1
 #
-#############################################################
+################################################################################
 
 QT5QUICK1_VERSION = $(QT5_VERSION)
 QT5QUICK1_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index a090fda..8687f49 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5script
 #
-#############################################################
+################################################################################
 
 QT5SCRIPT_VERSION = $(QT5_VERSION)
 QT5SCRIPT_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index fdcbfde..8a31ac8 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5svg
 #
-#############################################################
+################################################################################
 
 QT5SVG_VERSION = $(QT5_VERSION)
 QT5SVG_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 7366a30..b51f5c5 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5webkit
 #
-#############################################################
+################################################################################
 
 QT5WEBKIT_VERSION = $(QT5_VERSION)
 QT5WEBKIT_SITE = $(QT5_SITE)
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 7e2d671..f92f853 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qt5xmlpatterns
 #
-#############################################################
+################################################################################
 
 QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
 QT5XMLPATTERNS_SITE = $(QT5_SITE)
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 38644dd..b2c9306 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qtuio
 #
-#############################################################
+################################################################################
 
 QTUIO_VERSION = abe4973ff6
 QTUIO_SITE = git://github.com/x29a/qTUIO.git
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 25e17e3..56b3dcb 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # quagga
 #
-#############################################################
+################################################################################
 
 QUAGGA_VERSION = 0.99.22.1
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 3087940..7bec9a2 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # quota
 #
-#############################################################
+################################################################################
 
 QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index e35833d..aa5ec9b 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # qwt
 #
-#############################################################
+################################################################################
 
 QWT_VERSION = 6.0.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 6c39fe2..aed6f01 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # radvd
 #
-#############################################################
+################################################################################
 
 RADVD_VERSION = 1.9.3
 RADVD_SITE = http://www.litech.org/radvd/dist
diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
index d19571c..f87f8bc 100644
--- a/package/ramspeed/ramspeed.mk
+++ b/package/ramspeed/ramspeed.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ramspeed
 #
-#############################################################
+################################################################################
 
 RAMSPEED_VERSION = 2.6.0
 RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index cc260e9..6fc1dd3 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rapidjson
 #
-#############################################################
+################################################################################
 
 RAPIDJSON_VERSION = 0.11
 RAPIDJSON_SOURCE = rapidjson-$(RAPIDJSON_VERSION).zip
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index b39b29b..fa7359c 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rdesktop
 #
-#############################################################
+################################################################################
 
 RDESKTOP_VERSION = 1.5.0
 RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index 371801e..02d80d0 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -1,8 +1,8 @@
-############################################
+################################################################################
 #
 # read-edid
 #
-############################################
+################################################################################
 
 READ_EDID_VERSION = 1.4.2
 READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 4de1476..0c883bc 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # readline
 #
-#############################################################
+################################################################################
 
 READLINE_VERSION = 6.2
 READLINE_SOURCE = readline-$(READLINE_VERSION).tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fc7d23f..8b4e900 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # redis
 #
-#############################################################
+################################################################################
 
 REDIS_VERSION = 2.6.11
 REDIS_SITE = http://redis.googlecode.com/files
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index e2a2bd7..610ded0 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rings
 #
-#############################################################
+################################################################################
 
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index e997b15..ae0bf14 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rng-tools
 #
-#############################################################
+################################################################################
 
 RNG_TOOLS_VERSION = 4
 RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 106d310..ff57dc6 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rp-pppoe
 #
-#############################################################
+################################################################################
 
 RP_PPPOE_VERSION = 3.11
 RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 382e53b..19bdace 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rpcbind
 #
-#############################################################
+################################################################################
 
 RPCBIND_VERSION = 0.2.0
 RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index dcda6b0..11dffe6 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rpi-firmware
 #
-#############################################################
+################################################################################
 
 RPI_FIRMWARE_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 6198671..cdf0bf9 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rpi-userland
 #
-#############################################################
+################################################################################
 
 RPI_USERLAND_VERSION = 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 0c40800..32a949f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rpm
 #
-#############################################################
+################################################################################
 
 RPM_VERSION = 5.2.0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index d3b63ea..354cff6 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rrdtool
 #
-#############################################################
+################################################################################
 
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 55966f3..4a7469f 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rsh-redone
 #
-#############################################################
+################################################################################
 
 RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3963547..94c2e75 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rsync
 #
-#############################################################
+################################################################################
 
 RSYNC_VERSION = 3.0.9
 RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 2d3c27f..daae010 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rsyslog
 #
-#############################################################
+################################################################################
 
 RSYSLOG_VERSION = 5.8.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index c9cf8ff..77f0e85 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rtorrent
 #
-#############################################################
+################################################################################
 
 RTORRENT_VERSION = 0.9.3
 RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index 773e0bc..1e10c64 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rubix
 #
-#############################################################
+################################################################################
 
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 692e265..e708262 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ruby
 #
-#############################################################
+################################################################################
 
 RUBY_VERSION = 1.9.3-p392
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index dba653e..e425503 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sam-ba
 #
-#############################################################
+################################################################################
 
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 SAM_BA_VERSION = 2.12
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 55fc94d..528e29c 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # samba
 #
-#############################################################
+################################################################################
 
 SAMBA_VERSION = 3.6.15
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 334cf95..96a6100 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sane-backends
 #
-#############################################################
+################################################################################
 
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index e6439d5..d807bb4 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sawman
 #
-#############################################################
+################################################################################
 
 SAWMAN_VERSION = 1.6.3
 SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 7309b47..730bd06 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # schifra
 #
-#############################################################
+################################################################################
 
 SCHIFRA_VERSION = 0.0.1
 SCHIFRA_SITE = http://www.schifra.com/downloads
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 565d467..ff6eada 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sconeserver
 #
-#############################################################
+################################################################################
 
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Subversion trunk snapshot.
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index dd8a732..9fd04c7 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # screen
 #
-#############################################################
+################################################################################
 
 SCREEN_VERSION = 4.0.3
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index fc60de6..76cc413 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL
 #
-#############################################################
+################################################################################
 
 SDL_VERSION = 1.2.15
 SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 8acc5c5..04f1d8b 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL_gfx addon for SDL
 #
-#############################################################
+################################################################################
 
 SDL_GFX_VERSION = 2.0.23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 46d5679..de72a04 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL_image addon for SDL
 #
-#############################################################
+################################################################################
 
 SDL_IMAGE_VERSION = 1.2.6
 SDL_IMAGE_SOURCE = SDL_image-$(SDL_IMAGE_VERSION).tar.gz
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a062c35..73743eb 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL_mixer
 #
-#############################################################
+################################################################################
 
 SDL_MIXER_VERSION = 1.2.12
 SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 85a5ccb..de1dc59 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL_net: network addon for SDL
 #
-#############################################################
+################################################################################
 
 SDL_NET_VERSION = 1.2.8
 SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index e20a888..ae449ae 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sdl_sound addon for SDL
 #
-#############################################################
+################################################################################
 
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index e9bc537..1310287 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # SDL_ttf
 #
-#############################################################
+################################################################################
 
 SDL_TTF_VERSION = 2.0.11
 SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 5535754..9f17ad3 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sed
 #
-#############################################################
+################################################################################
 
 SED_VERSION = 4.2.2
 SED_SITE = $(BR2_GNU_MIRROR)/sed
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 378dc06..588571c 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ser2net
 #
-#############################################################
+################################################################################
 
 SER2NET_VERSION = 2.8
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 215b5ee..e6846b2 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # setserial
 #
-#############################################################
+################################################################################
 
 SETSERIAL_VERSION            = 2.17
 SETSERIAL_PATCH              = setserial_2.17-45.2.diff.gz
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 9015b2a..42ed2e0 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sg3_utils
 #
-#############################################################
+################################################################################
 
 SG3_UTILS_VERSION = 1.34
 SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 1f32e51..d147bb7 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # shared-mime-info
 #
-#############################################################
+################################################################################
 
 SHARED_MIME_INFO_VERSION = 0.90
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index bd4815a..2fb9692 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # slang
 #
-#############################################################
+################################################################################
 
 SLANG_VERSION = 1.4.5
 SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 5b608e0..9ed3424 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # spice-slirp
 #
-#############################################################
+################################################################################
 
 # There's no tarball releases of slirp, so we use the git repo
 # Also, there's no tag, so we use a random SHA1 (master's HEAD
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 850001a..fb9fb3c 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # smartmontools
 #
-#############################################################
+################################################################################
 
 SMARTMONTOOLS_VERSION = 6.1
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 2704b97..d8ec239 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # snappy
 #
-#############################################################
+################################################################################
 
 SNAPPY_VERSION		= 1.1.0
 SNAPPY_SITE		= http://snappy.googlecode.com/files/
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
index ceeecd6..d7bfd5a 100644
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ b/package/snowball-hdmiservice/snowball-hdmiservice.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # snowball-hdmiservice
 #
-#############################################################
+################################################################################
 
 SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
 SNOWBALL_HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
index d664b06..7cc2048 100644
--- a/package/snowball-init/snowball-init.mk
+++ b/package/snowball-init/snowball-init.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # snowball-init
 #
-#############################################################
+################################################################################
 
 SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
 SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index f10a836..8ba399b 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # socat
 #
-#############################################################
+################################################################################
 
 SOCAT_VERSION = 2.0.0-b5
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 1771388..5c10115 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # socketcand
 #
-#############################################################
+################################################################################
 
 SOCKETCAND_VERSION = 7d06986
 SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index 8983bdf..7cde12d 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sound-theme-borealis
 #
-#############################################################
+################################################################################
 
 SOUND_THEME_BOREALIS_VERSION = 0.9a
 SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
index ae30fe7..ea4c853 100644
--- a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sound-theme-freedesktop
 #
-#############################################################
+################################################################################
 
 SOUND_THEME_FREEDESKTOP_VERSION = 0.7
 SOUND_THEME_FREEDESKTOP_SITE = \
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 7c23421..670daf7 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # spawn-fcgi
 #
-#############################################################
+################################################################################
 
 SPAWN_FCGI_VERSION = 1.6.3
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 28f2797..6eb7e90 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # speex
 #
-#############################################################
+################################################################################
 
 SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 0404377..62a028d 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # spice-protocol
 #
-#############################################################
+################################################################################
 
 SPICE_PROTOCOL_VERSION         = 0.12.2
 SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 291386a..a016da6 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # spice
 #
-#############################################################
+################################################################################
 
 SPICE_VERSION         = 0.12.0
 SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 033cd33..0b2581b 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sqlcipher
 #
-#############################################################
+################################################################################
 
 SQLCIPHER_VERSION = 1.1.9
 SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/v$(SQLCIPHER_VERSION)
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 39a39d0..d474619 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sqlite
 #
-#############################################################
+################################################################################
 
 SQLITE_VERSION = 3071700
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 45a0b2c..934277e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # squid
 #
-#############################################################
+################################################################################
 
 SQUID_VERSION = 3.3.4
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 4e2c481..b9c90d6 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sredird
 #
-#############################################################
+################################################################################
 
 SREDIRD_VERSION = 2.2.1-1.1
 SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index f3c86cf..de9b094 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sshfs
 #
-#############################################################
+################################################################################
 
 SSHFS_VERSION = 2.4
 SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index e078b2c..be8c563 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -1,8 +1,8 @@
-############################################################
+################################################################################
 #
 # sstrip
 #
-############################################################
+################################################################################
 
 SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 50a5dd6..1ce607f 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # startup-notification
 #
-#############################################################
+################################################################################
 
 STARTUP_NOTIFICATION_VERSION = 0.9
 STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index bacd0f0..22dc8c6 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # statserial
 #
-#############################################################
+################################################################################
 
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 349dc2c..b172a20 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # strace
 #
-#############################################################
+################################################################################
 
 STRACE_VERSION = 4.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index fb6835c..df9065a 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # stress
 #
-#############################################################
+################################################################################
 
 STRESS_VERSION = 1.0.4
 STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 92344d1..bfe96c3 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # stunnel
 #
-#############################################################
+################################################################################
 
 STUNNEL_VERSION = 4.55
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 5fd3c61..661d858 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sudo
 #
-#############################################################
+################################################################################
 
 SUDO_VERSION = 1.8.6p7
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index 38fc3e1..8ad99cb 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sunxi-boards
 #
-#############################################################
+################################################################################
 
 SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
 SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/master
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index a97dfcb..8f1ae28 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sunxi-tools
 #
-#############################################################
+################################################################################
 
 SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
 SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 26afff3..edd2efd 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-supervisor
 #
-#############################################################
+################################################################################
 
 SUPERVISOR_VERSION = 3.0a12
 SUPERVISOR_SOURCE = supervisor-$(SUPERVISOR_VERSION).tar.gz
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 6aaf969..4cc883c 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # swig
 #
-#############################################################
+################################################################################
 
 SWIG_VERSION = 2.0.9
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 1da63de..cc79eeb 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sylpheed
 #
-#############################################################
+################################################################################
 
 SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION_MINOR = 0
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 240f83c..c6119b5 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # synergy
 #
-#############################################################
+################################################################################
 
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index b2497f5..8ffdc0f 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sysklogd
 #
-#############################################################
+################################################################################
 
 SYSKLOGD_VERSION = 1.5
 SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 03355d8..f288aaf 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sysprof
 #
-#############################################################
+################################################################################
 
 SYSPROF_VERSION = 1.1.8
 SYSPROF_SITE = http://sysprof.com
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index d211f9c..73e20d3 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sysstat
 #
-#############################################################
+################################################################################
 
 SYSSTAT_VERSION = 10.0.3
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8152f68..1bb429c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # systemd
 #
-#############################################################
+################################################################################
 
 SYSTEMD_VERSION = 44
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index ab42251..bf05d73 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # sysvinit
 #
-#############################################################
+################################################################################
 
 SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index e1e1694..8260293 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # taglib
 #
-#############################################################
+################################################################################
 
 TAGLIB_VERSION = 1.8
 TAGLIB_SITE = http://github.com/downloads/taglib/taglib
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index e465bfa..3ffeaf0 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tar
 #
-#############################################################
+################################################################################
 
 TAR_VERSION = 1.26
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index c4a1c3d..0c8fa33 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tcl8.4
 #
-#############################################################
+################################################################################
 
 TCL_VERSION_MAJOR = 8.4
 TCL_VERSION_MINOR = 19
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index a91af27..f2aca36 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tcllib
 #
-#############################################################
+################################################################################
 
 TCLLIB_VERSION       = 1.13
 TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 7ca3770..6b95ba7 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tcpdump
 #
-#############################################################
+################################################################################
 
 TCPDUMP_VERSION = 4.3.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 2662a7d..f74b9f4 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tcpreplay
 #
-#############################################################
+################################################################################
 
 TCPREPLAY_VERSION = 3.4.3
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
index 54d18b6..7064e12 100644
--- a/package/texinfo/texinfo.mk
+++ b/package/texinfo/texinfo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # texinfo
 #
-#############################################################
+################################################################################
 
 # We are intentionally not using the latest version 5.x, because it
 # causes issues with the documentation building process when creating
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 537dfb1..145d9fd 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tftpd
 #
-#############################################################
+################################################################################
 
 TFTPD_VERSION  = 5.2
 TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 9bf68bd..7431cbc 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # thttpd
 #
-#############################################################
+################################################################################
 
 THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 956daf4..d739f3c 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ti-utils
 #
-#############################################################
+################################################################################
 
 TI_UTILS_VERSION = 06dbdb2
 TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/master
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index bcc55be..8d2e087 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tiff
 #
-#############################################################
+################################################################################
 
 TIFF_VERSION = 4.0.3
 TIFF_SITE = http://download.osgeo.org/libtiff
diff --git a/package/time/time.mk b/package/time/time.mk
index 7b53286..b7ee40c 100644
--- a/package/time/time.mk
+++ b/package/time/time.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # time
 #
-#############################################################
+################################################################################
 
 TIME_VERSION = 1.7
 TIME_SITE = $(BR2_GNU_MIRROR)/time
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index ed4670d..05546ab 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tinyhttpd
 #
-#############################################################
+################################################################################
 
 TINYHTTPD_VERSION = 0.1.0
 TINYHTTPD_SITE = http://downloads.sourceforge.net/project/tinyhttpd/tinyhttpd%20source/tinyhttpd%20$(TINYHTTPD_VERSION)
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 7b16eb1..4890f35 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tn5250
 #
-#############################################################
+################################################################################
 
 TN5250_VERSION = 0.17.4
 TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index c2388d4..505ae09 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # torsmo
 #
-#############################################################
+################################################################################
 
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 6187360..5661c78 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # transmission
 #
-#############################################################
+################################################################################
 
 TRANSMISSION_VERSION = 2.33
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index cb12ba0..c0ce5ef 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -1,8 +1,8 @@
-############################################################
+################################################################################
 #
 # Tremor
 #
-############################################################
+################################################################################
 
 TREMOR_SITE = http://svn.xiph.org/trunk/Tremor/
 TREMOR_SITE_METHOD = svn
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 6d1abcb..575626a 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tslib
 #
-#############################################################
+################################################################################
 
 TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 52e3fdf..b65949d 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ttcp
 #
-#############################################################
+################################################################################
 
 #
 TTCP_VERSION =
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5ddcd75c..81cb062 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tvheadend
 #
-##############################################################
+################################################################################
 
 TVHEADEND_VERSION           = 5513b44
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 04d9b27..4a9affe 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tzdata
 #
-#############################################################
+################################################################################
 
 TZDATA_VERSION = 2012j
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 76e727c..ceda3c5 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # uboot-tools
 #
-#############################################################
+################################################################################
 
 UBOOT_TOOLS_VERSION = 2013.04
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 1c97288..69f011f 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # udev
 #
-#############################################################
+################################################################################
 
 UDEV_VERSION = 182
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 844dfcd..5d3368d 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # udisks
 #
-#############################################################
+################################################################################
 
 UDISKS_VERSION = 1.0.4
 UDISKS_SITE    = http://hal.freedesktop.org/releases/
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 54051b9..eeaf6af 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # udpcast
 #
-#############################################################
+################################################################################
 
 UDPCAST_VERSION = 20120424
 UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 0cbcc0b..9452062 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # uemacs
 #
-#############################################################
+################################################################################
 
 UEMACS_VERSION = 4.0.15-lt
 UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.bz2
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 9425ac5..11780ac 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ulogd
 #
-#############################################################
+################################################################################
 
 ULOGD_VERSION = 2.0.2
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 89729fe..e5c5993 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # unionfs
 #
-#############################################################
+################################################################################
 
 UNIONFS_VERSION = 0.26
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 18326f4..e16393a 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # urg
 #
-#############################################################
+################################################################################
 
 URG_VERSION = 0.8.18
 URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 653109d..92ca163 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # usb_modeswitch
 #
-#############################################################
+################################################################################
 
 USB_MODESWITCH_VERSION = 1.2.5
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 479137c..cb9754f 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # usb_modeswitch_data
 #
-#############################################################
+################################################################################
 
 USB_MODESWITCH_DATA_VERSION = 20121109
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 821b77e..69262a6 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # usbmount
 #
-#############################################################
+################################################################################
 
 USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index efdb1be..ad593a4 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # usbredir
 #
-#############################################################
+################################################################################
 
 USBREDIR_VERSION         = 0.6
 USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 05573ed..e679b26 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # usbutils
 #
-#############################################################
+################################################################################
 
 USBUTILS_VERSION = 006
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils/
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 8f690fc..5cdc931 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ushare
 #
-#############################################################
+################################################################################
 
 USHARE_VERSION = 1.1a
 USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
index c109554..c3d11f9 100644
--- a/package/ussp-push/ussp-push.mk
+++ b/package/ussp-push/ussp-push.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ussp-push
 #
-#############################################################
+################################################################################
 
 USSP_PUSH_VERSION = 0.11
 USSP_PUSH_SITE = http://www.xmailserver.org
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b562206..d8a4e6f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # util-linux
 #
-#############################################################
+################################################################################
 
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_VERSION_MAJOR = 2.22
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
index 543698a..14b4a8e 100644
--- a/package/ux500-firmware/ux500-firmware.mk
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # ux500-firmware
 #
-#############################################################
+################################################################################
 
 UX500_FIRMWARE_VERSION = 1.1.3-6
 UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 8cf616f..aed02fa 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vala
 #
-#############################################################
+################################################################################
 
 VALA_VERSION_MAJOR = 0.18
 VALA_VERSION_MINOR = 1
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index ff35e6c..f40784e 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # valgrind
 #
-#############################################################
+################################################################################
 
 VALGRIND_VERSION = 3.8.1
 VALGRIND_SITE    = http://valgrind.org/downloads/
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index cb85f57..1b1ecd5 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vde2
 #
-#############################################################
+################################################################################
 
 VDE2_VERSION         = 2.3.2
 VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index cb08cd9..ca8131c 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vim
 #
-#############################################################
+################################################################################
 
 VIM_SITE = https://vim.googlecode.com/hg
 VIM_SITE_METHOD = hg
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 8d03300..4d3e7b6 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vpnc
 #
-#############################################################
+################################################################################
 
 VPNC_VERSION       = 0.5.3
 VPNC_SITE          = http://www.unix-ag.uni-kl.de/~massar/vpnc
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 36f2645..c544996 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vsftpd
 #
-#############################################################
+################################################################################
 
 VSFTPD_VERSION = 3.0.2
 VSFTPD_SITE = https://security.appspot.com/downloads
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 0f0b5ce..b0c0db3 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # vtun
 #
-#############################################################
+################################################################################
 
 VTUN_VERSION = 3.0.3
 VTUN_SOURCE = vtun-$(VTUN_VERSION).tar.gz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index a0fadc2..b5fe94d 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wayland
 #
-#############################################################
+################################################################################
 
 WAYLAND_VERSION = 1.1.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases/
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 264bcad..c0a14c1 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # webkit
 #
-#############################################################
+################################################################################
 
 WEBKIT_VERSION = 1.2.7
 WEBKIT_SITE = http://www.webkitgtk.org/releases
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 00743dd..9f2acf9 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -1,8 +1,8 @@
-#####################################################################
+################################################################################
 #
 # webp
 #
-#####################################################################
+################################################################################
 
 WEBP_VERSION = 0.3.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b6827db..3e9f3c9 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # weston
 #
-#############################################################
+################################################################################
 
 WESTON_VERSION = 1.1.0
 WESTON_SITE = http://wayland.freedesktop.org/releases/
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 01ebcb6..0b213eb 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wget
 #
-#############################################################
+################################################################################
 
 WGET_VERSION = 1.14
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 4a23485..f9318d8 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # whetstone
 #
-#############################################################
+################################################################################
 
 WHETSTONE_VERSION = 1.2
 WHETSTONE_SOURCE = whetstone.c
diff --git a/package/which/which.mk b/package/which/which.mk
index 6e2dce6..019c479 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # which
 #
-#############################################################
+################################################################################
 
 WHICH_VERSION = 2.20
 WHICH_SITE = http://carlo17.home.xs4all.nl/which
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index eed90be..c3d4f67 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wipe
 #
-#############################################################
+################################################################################
 
 WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 2d5b86a..3e39284 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wireless-regdb
 #
-#############################################################
+################################################################################
 
 WIRELESS_REGDB_VERSION = 2013.02.13
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.bz2
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 4dd4084..e614ec4 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wireless_tools
 #
-#############################################################
+################################################################################
 
 WIRELESS_TOOLS_VERSION = 29
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 34d2708..2d4ea10 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wireshark
 #
-#############################################################
+################################################################################
 
 WIRESHARK_VERSION = 1.8.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 762ceaf..450e10f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wpa_supplicant
 #
-#############################################################
+################################################################################
 
 WPA_SUPPLICANT_VERSION = 2.0
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index eb2b51c..4a64b94 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wsapi
 #
-#############################################################
+################################################################################
 
 WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
diff --git a/package/wvdial/wvdial.mk b/package/wvdial/wvdial.mk
index 89888d4..58d8173 100644
--- a/package/wvdial/wvdial.mk
+++ b/package/wvdial/wvdial.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wvdial
 #
-#############################################################
+################################################################################
 
 WVDIAL_VERSION = 1.61
 WVDIAL_SITE = http://wvdial.googlecode.com/files
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 837c449..13982c4 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # wvstreams
 #
-#############################################################
+################################################################################
 
 WVSTREAMS_VERSION = 4.6.1
 WVSTREAMS_SITE = http://wvstreams.googlecode.com/files
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 9495ef0..0f87ba9 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # libxcb
 #
-#############################################################
+################################################################################
 
 LIBXCB_VERSION = 1.8.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index cc83f46..87a236f 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mcookie
 #
-#############################################################
+################################################################################
 
 # Source included in Buildroot
 MCOOKIE_SOURCE =
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 84f7c3f..f9d35a9 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # mesa3d
 #
-#############################################################
+################################################################################
 
 MESA3D_VERSION = 7.10.3
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 62a9782..2828805 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xapp_xman
 #
-#############################################################
+################################################################################
 
 XAPP_XMAN_VERSION = 1.0.3
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 115d600..782238f 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcb-proto
 #
-#############################################################
+################################################################################
 
 XCB_PROTO_VERSION = 1.7.1
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 0309f3b..7933b74 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcb-util-image
 #
-#############################################################
+################################################################################
 
 XCB_UTIL_IMAGE_VERSION = 0.3.9
 XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 72077a2..45a4c68 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcb-util-keysyms
 #
-#############################################################
+################################################################################
 
 XCB_UTIL_KEYSYMS_VERSION = 0.3.9
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 0338b85..622f295 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcb-util-wm
 #
-#############################################################
+################################################################################
 
 XCB_UTIL_WM_VERSION = 0.3.9
 XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist/
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index fd55fc9..29fa013 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcb-util
 #
-#############################################################
+################################################################################
 
 XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index c3b1b9c..f2bccb0 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xcursor-transparent-theme
 #
-#############################################################
+################################################################################
 
 XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
 XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils/
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 5c86f50..8f3e681 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xdata_xcursor-themes
 #
-#############################################################
+################################################################################
 
 XDATA_XCURSOR_THEMES_VERSION = 1.0.3
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index cd04a40..7104719 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # openchrome
 #
-#############################################################
+################################################################################
 
 XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.906
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 275ceef..0451d15 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xkeyboard-config
 #
-#############################################################
+################################################################################
 
 XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
diff --git a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
index 7e441db..082cc4d 100644
--- a/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
+++ b/package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xlib_libpthread-stubs
 #
-#############################################################
+################################################################################
 
 XLIB_LIBPTHREAD_STUBS_VERSION = 0.3
 XLIB_LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(XLIB_LIBPTHREAD_STUBS_VERSION).tar.bz2
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 635b670..bf9b96e 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # x11vnc
 #
-#############################################################
+################################################################################
 
 X11VNC_VERSION = 0.9.13
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 0c1c6f1..7c7fdde 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xavante
 #
-#############################################################
+################################################################################
 
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index b423195..14c616e 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # Xenomai
 #
-#############################################################
+################################################################################
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 71a24a6..7bd7070 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xerces
 #
-#############################################################
+################################################################################
 
 XERCES_VERSION = 3.1.1
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 79ad602..05bd83e 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xfsprogs
 #
-#############################################################
+################################################################################
 
 XFSPROGS_VERSION = 3.1.8
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 510e7a5..32cdf28 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xinetd
 #
-#############################################################
+################################################################################
 
 XINETD_VERSION       = 2.3.15
 XINETD_SOURCE        = xinetd-$(XINETD_VERSION).tar.gz
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index cf0576d..7b0a228 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xl2tp
 #
-#############################################################
+################################################################################
 
 XL2TP_VERSION = v1.3.1
 XL2TP_SITE = http://github.com/xelerance/xl2tpd/tarball/$(XL2TP_VERSION)
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 2d22091..f0a26c2 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xmlstarlet
 #
-#############################################################
+################################################################################
 
 XMLSTARLET_VERSION = 1.3.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 730312e..a4b04ac 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xstroke
 #
-#############################################################
+################################################################################
 
 XSTROKE_VERSION = 0.6
 XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 08e3303..ec8251f 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xterm
 #
-#############################################################
+################################################################################
 
 XTERM_VERSION = 278
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 04ad2c9..a28751b 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xvkbd
 #
-#############################################################
+################################################################################
 
 XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 877c631..de746ad 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # xz-utils
 #
-#############################################################
+################################################################################
 
 XZ_VERSION = 5.0.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index b8ec9a5..26324da 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # yasm
 #
-#############################################################
+################################################################################
 
 YASM_VERSION = 1.2.0
 YASM_SOURCE = yasm-$(YASM_VERSION).tar.gz
diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
index b8a72de..04af2a6 100644
--- a/package/yavta/yavta.mk
+++ b/package/yavta/yavta.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # yavta
 #
-#############################################################
+################################################################################
 
 YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
 YAVTA_SITE = git://git.ideasonboard.org/yavta.git
diff --git a/package/zd1211-firmware/zd1211-firmware.mk b/package/zd1211-firmware/zd1211-firmware.mk
index afea0e9..59ea219 100644
--- a/package/zd1211-firmware/zd1211-firmware.mk
+++ b/package/zd1211-firmware/zd1211-firmware.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zd1211-firmware
 #
-#############################################################
+################################################################################
 
 ZD1211_FIRMWARE_VERSION = 1.4
 ZD1211_FIRMWARE_SITE = http://downloads.sourceforge.net/project/zd1211/zd1211-firmware/$(ZD1211_FIRMWARE_VERSION)
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index bebba20..4847ed8 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zeromq
 #
-#############################################################
+################################################################################
 
 ZEROMQ_VERSION = 3.2.3
 ZEROMQ_SITE = http://download.zeromq.org/
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 3dec6af..7a06a58 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zic
 #
-#############################################################
+################################################################################
 
 ZIC_VERSION = 2012j
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 3723839..25d40a5 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zlib
 #
-#############################################################
+################################################################################
 
 ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index c64b256..ee0b9cb 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zmqpp
 #
-#############################################################
+################################################################################
 
 ZMQPP_VERSION = 31220ca
 ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index d35f933..73fc349 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zxing
 #
-#############################################################
+################################################################################
 
 ZXING_VERSION = 2.0
 ZXING_SITE = http://zxing.googlecode.com/files
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 5b4fadb..a9d2eae 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # zyre
 #
-#############################################################
+################################################################################
 
 ZYRE_VERSION = 44a57a449a
 ZYRE_SITE = git://github.com/zeromq/zyre.git
-- 
1.8.1.2
