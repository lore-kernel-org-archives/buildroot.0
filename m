From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:32 +0530
Subject: [Buildroot] [PATCH 03/21] boot, linux,
	package: use SPDX short identifier for GPLv2/GPLv2+
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-4-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license strings as much as possible.
SPDX short identifier for GPLv2/GPLv2+ is GPL-2.0/GPL-2.0+.

This change is done by using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv2\>/GPL-2.0/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 boot/barebox/barebox.mk                                               | 2 +-
 boot/grub/grub.mk                                                     | 2 +-
 boot/mxs-bootlets/mxs-bootlets.mk                                     | 2 +-
 boot/syslinux/syslinux.mk                                             | 2 +-
 boot/uboot/uboot.mk                                                   | 2 +-
 boot/xloader/xloader.mk                                               | 2 +-
 linux/linux.mk                                                        | 2 +-
 package/acl/acl.mk                                                    | 2 +-
 package/acpica/acpica.mk                                              | 2 +-
 package/acpid/acpid.mk                                                | 2 +-
 package/acpitool/acpitool.mk                                          | 2 +-
 package/aer-inject/aer-inject.mk                                      | 2 +-
 package/aircrack-ng/aircrack-ng.mk                                    | 2 +-
 package/alsa-lib/alsa-lib.mk                                          | 2 +-
 package/alsa-utils/alsa-utils.mk                                      | 2 +-
 package/alsamixergui/alsamixergui.mk                                  | 2 +-
 package/argus/argus.mk                                                | 2 +-
 package/arptables/arptables.mk                                        | 2 +-
 package/at/at.mk                                                      | 2 +-
 package/atftp/atftp.mk                                                | 2 +-
 package/atkmm/atkmm.mk                                                | 2 +-
 package/atop/atop.mk                                                  | 2 +-
 package/attr/attr.mk                                                  | 2 +-
 package/audiofile/audiofile.mk                                        | 2 +-
 package/audit/audit.mk                                                | 2 +-
 package/aufs-util/aufs-util.mk                                        | 2 +-
 package/aufs/aufs.mk                                                  | 2 +-
 package/aumix/aumix.mk                                                | 2 +-
 package/autofs/autofs.mk                                              | 2 +-
 package/automake/automake.mk                                          | 2 +-
 package/avrdude/avrdude.mk                                            | 4 ++--
 package/axel/axel.mk                                                  | 2 +-
 package/axfsutils/axfsutils.mk                                        | 2 +-
 package/batctl/batctl.mk                                              | 2 +-
 package/batman-adv/batman-adv.mk                                      | 2 +-
 package/bc/bc.mk                                                      | 2 +-
 package/bcache-tools/bcache-tools.mk                                  | 2 +-
 package/bcm2835/bcm2835.mk                                            | 2 +-
 package/bctoolbox/bctoolbox.mk                                        | 2 +-
 package/bcusdk/bcusdk.mk                                              | 2 +-
 package/blktrace/blktrace.mk                                          | 2 +-
 package/bluez5_utils/bluez5_utils.mk                                  | 2 +-
 package/bluez_utils/bluez_utils.mk                                    | 2 +-
 package/boa/boa.mk                                                    | 2 +-
 package/bonnie/bonnie.mk                                              | 2 +-
 package/bootutils/bootutils.mk                                        | 2 +-
 package/bridge-utils/bridge-utils.mk                                  | 2 +-
 package/btrfs-progs/btrfs-progs.mk                                    | 2 +-
 package/busybox/busybox.mk                                            | 2 +-
 package/bwm-ng/bwm-ng.mk                                              | 2 +-
 package/c-icap-modules/c-icap-modules.mk                              | 2 +-
 package/ca-certificates/ca-certificates.mk                            | 2 +-
 package/cannelloni/cannelloni.mk                                      | 2 +-
 package/cbootimage/cbootimage.mk                                      | 2 +-
 package/cc-tool/cc-tool.mk                                            | 2 +-
 package/ccrypt/ccrypt.mk                                              | 2 +-
 package/cdrkit/cdrkit.mk                                              | 2 +-
 package/checkpolicy/checkpolicy.mk                                    | 2 +-
 package/chocolate-doom/chocolate-doom.mk                              | 2 +-
 package/chrony/chrony.mk                                              | 2 +-
 package/clamav/clamav.mk                                              | 2 +-
 package/classpath/classpath.mk                                        | 2 +-
 package/cloop/cloop.mk                                                | 2 +-
 package/collectd/collectd.mk                                          | 2 +-
 package/connman-gtk/connman-gtk.mk                                    | 2 +-
 package/connman/connman.mk                                            | 2 +-
 package/conntrack-tools/conntrack-tools.mk                            | 2 +-
 package/cpuload/cpuload.mk                                            | 2 +-
 package/cramfs/cramfs.mk                                              | 2 +-
 package/crudini/crudini.mk                                            | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk                            | 2 +-
 package/cryptsetup/cryptsetup.mk                                      | 2 +-
 package/ctorrent/ctorrent.mk                                          | 2 +-
 package/cups/cups.mk                                                  | 2 +-
 package/curlftpfs/curlftpfs.mk                                        | 2 +-
 package/cwiid/cwiid.mk                                                | 2 +-
 package/dash/dash.mk                                                  | 2 +-
 package/dbus-glib/dbus-glib.mk                                        | 2 +-
 package/dbus-triggerd/dbus-triggerd.mk                                | 2 +-
 package/dbus/dbus.mk                                                  | 2 +-
 package/ddrescue/ddrescue.mk                                          | 2 +-
 package/debianutils/debianutils.mk                                    | 2 +-
 package/devmem2/devmem2.mk                                            | 2 +-
 package/dfu-util/dfu-util.mk                                          | 2 +-
 package/dmidecode/dmidecode.mk                                        | 2 +-
 package/dmraid/dmraid.mk                                              | 2 +-
 package/dnsmasq/dnsmasq.mk                                            | 2 +-
 package/docker/docker.mk                                              | 2 +-
 package/doxygen/doxygen.mk                                            | 2 +-
 package/drbd-utils/drbd-utils.mk                                      | 2 +-
 package/dropwatch/dropwatch.mk                                        | 2 +-
 package/dstat/dstat.mk                                                | 2 +-
 package/dtach/dtach.mk                                                | 2 +-
 package/dtc/dtc.mk                                                    | 4 ++--
 package/dtv-scan-tables/dtv-scan-tables.mk                            | 2 +-
 package/duma/duma.mk                                                  | 2 +-
 package/dvb-apps/dvb-apps.mk                                          | 2 +-
 package/dvblast/dvblast.mk                                            | 2 +-
 package/dvbsnoop/dvbsnoop.mk                                          | 2 +-
 package/dvdauthor/dvdauthor.mk                                        | 2 +-
 package/dvdrw-tools/dvdrw-tools.mk                                    | 2 +-
 package/e2fsprogs/e2fsprogs.mk                                        | 2 +-
 package/e2tools/e2tools.mk                                            | 2 +-
 package/ebtables/ebtables.mk                                          | 2 +-
 package/ecryptfs-utils/ecryptfs-utils.mk                              | 2 +-
 package/eeprog/eeprog.mk                                              | 2 +-
 package/efibootmgr/efibootmgr.mk                                      | 2 +-
 package/efl/efl.mk                                                    | 2 +-
 package/ejabberd/ejabberd.mk                                          | 2 +-
 package/elf2flt/elf2flt.mk                                            | 2 +-
 package/elfutils/elfutils.mk                                          | 2 +-
 package/emlog/emlog.mk                                                | 2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk                            | 2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk                                | 2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk                              | 2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk                                | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk                            | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk                              | 2 +-
 package/ethtool/ethtool.mk                                            | 2 +-
 package/eudev/eudev.mk                                                | 2 +-
 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk                  | 2 +-
 package/evtest/evtest.mk                                              | 2 +-
 package/exim/exim.mk                                                  | 2 +-
 package/exiv2/exiv2.mk                                                | 2 +-
 package/f2fs-tools/f2fs-tools.mk                                      | 2 +-
 package/faad2/faad2.mk                                                | 2 +-
 package/fakedate/fakedate.mk                                          | 2 +-
 package/faketime/faketime.mk                                          | 2 +-
 package/fan-ctrl/fan-ctrl.mk                                          | 2 +-
 package/fb-test-app/fb-test-app.mk                                    | 2 +-
 package/fbdump/fbdump.mk                                              | 2 +-
 package/fbgrab/fbgrab.mk                                              | 2 +-
 package/fbset/fbset.mk                                                | 2 +-
 package/fbterm/fbterm.mk                                              | 2 +-
 package/fbtft/fbtft.mk                                                | 2 +-
 package/fbv/fbv.mk                                                    | 2 +-
 package/fconfig/fconfig.mk                                            | 2 +-
 package/fetchmail/fetchmail.mk                                        | 2 +-
 package/ffmpeg/ffmpeg.mk                                              | 2 +-
 package/fftw/fftw.mk                                                  | 2 +-
 package/fio/fio.mk                                                    | 2 +-
 package/firejail/firejail.mk                                          | 2 +-
 package/fis/fis.mk                                                    | 2 +-
 package/flac/flac.mk                                                  | 2 +-
 package/flashbench/flashbench.mk                                      | 2 +-
 package/flashrom/flashrom.mk                                          | 2 +-
 package/flickcurl/flickcurl.mk                                        | 2 +-
 package/fmlib/fmlib.mk                                                | 2 +-
 package/fmtools/fmtools.mk                                            | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk                            | 2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk                              | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 2 +-
 package/freetype/freetype.mk                                          | 2 +-
 package/fswebcam/fswebcam.mk                                          | 2 +-
 package/fwts/fwts.mk                                                  | 2 +-
 package/fxload/fxload.mk                                              | 2 +-
 package/gdb/gdb.mk                                                    | 2 +-
 package/genext2fs/genext2fs.mk                                        | 2 +-
 package/genimage/genimage.mk                                          | 2 +-
 package/genromfs/genromfs.mk                                          | 2 +-
 package/gesftpserver/gesftpserver.mk                                  | 2 +-
 package/ghostscript-fonts/ghostscript-fonts.mk                        | 2 +-
 package/git/git.mk                                                    | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 package/glibmm/glibmm.mk                                              | 2 +-
 package/gmp/gmp.mk                                                    | 2 +-
 package/gmpc/gmpc.mk                                                  | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk                      | 2 +-
 package/gnu-efi/gnu-efi.mk                                            | 2 +-
 package/gnuchess/gnuchess.mk                                          | 2 +-
 package/gpm/gpm.mk                                                    | 2 +-
 package/gptfdisk/gptfdisk.mk                                          | 2 +-
 package/gqview/gqview.mk                                              | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk                            | 2 +-
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk                  | 2 +-
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk                | 2 +-
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk                | 2 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk                           | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk             | 2 +-
 package/gtkmm3/gtkmm3.mk                                              | 2 +-
 package/gtkperf/gtkperf.mk                                            | 2 +-
 package/gupnp-tools/gupnp-tools.mk                                    | 2 +-
 package/gutenprint/gutenprint.mk                                      | 2 +-
 package/haserl/haserl.mk                                              | 2 +-
 package/hiawatha/hiawatha.mk                                          | 2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk                      | 2 +-
 package/hplip/hplip.mk                                                | 2 +-
 package/htop/htop.mk                                                  | 2 +-
 package/httping/httping.mk                                            | 2 +-
 package/hwdata/hwdata.mk                                              | 2 +-
 package/i2c-tools/i2c-tools.mk                                        | 2 +-
 package/i7z/i7z.mk                                                    | 2 +-
 package/ifplugd/ifplugd.mk                                            | 2 +-
 package/iftop/iftop.mk                                                | 2 +-
 package/ifupdown/ifupdown.mk                                          | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk                              | 2 +-
 package/igh-ethercat/igh-ethercat.mk                                  | 2 +-
 package/igmpproxy/igmpproxy.mk                                        | 2 +-
 package/inadyn/inadyn.mk                                              | 2 +-
 package/input-tools/input-tools.mk                                    | 2 +-
 package/intltool/intltool.mk                                          | 2 +-
 package/iotop/iotop.mk                                                | 2 +-
 package/iproute2/iproute2.mk                                          | 2 +-
 package/ipset/ipset.mk                                                | 2 +-
 package/iptables/iptables.mk                                          | 2 +-
 package/iptraf-ng/iptraf-ng.mk                                        | 2 +-
 package/iputils/iputils.mk                                            | 2 +-
 package/iqvlinux/iqvlinux.mk                                          | 2 +-
 package/irda-utils/irda-utils.mk                                      | 2 +-
 package/irqbalance/irqbalance.mk                                      | 2 +-
 package/irssi/irssi.mk                                                | 2 +-
 package/iucode-tool/iucode-tool.mk                                    | 2 +-
 package/jack2/jack2.mk                                                | 2 +-
 package/jamvm/jamvm.mk                                                | 2 +-
 package/jo/jo.mk                                                      | 2 +-
 package/kbd/kbd.mk                                                    | 2 +-
 package/keepalived/keepalived.mk                                      | 2 +-
 package/kexec-lite/kexec-lite.mk                                      | 2 +-
 package/kexec/kexec.mk                                                | 2 +-
 package/keyutils/keyutils.mk                                          | 2 +-
 package/kismet/kismet.mk                                              | 2 +-
 package/kmod/kmod.mk                                                  | 2 +-
 package/knock/knock.mk                                                | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk        | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk      | 2 +-
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk              | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk        | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk        | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk        | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk      | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk    | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk              | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk              | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk          | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk                | 2 +-
 package/kodi-platform/kodi-platform.mk                                | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                          | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                          | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                      | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                            | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                      | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                  | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                    | 2 +-
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk    | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                            | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                          | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                          | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                        | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                            | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                  | 2 +-
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk      | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk    | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk          | 2 +-
 .../kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk    | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk      | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk        | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk              | 2 +-
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk      | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk            | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk  | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk    | 2 +-
 .../kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk    | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk    | 2 +-
 package/kodi/kodi.mk                                                  | 2 +-
 package/ktap/ktap.mk                                                  | 2 +-
 package/kvmtool/kvmtool.mk                                            | 2 +-
 package/latencytop/latencytop.mk                                      | 2 +-
 package/lbreakout2/lbreakout2.mk                                      | 2 +-
 package/lcdproc/lcdproc.mk                                            | 2 +-
 package/leafpad/leafpad.mk                                            | 2 +-
 package/libao/libao.mk                                                | 2 +-
 package/libatomic_ops/libatomic_ops.mk                                | 2 +-
 package/libcap-ng/libcap-ng.mk                                        | 2 +-
 package/libcap/libcap.mk                                              | 2 +-
 package/libcdaudio/libcdaudio.mk                                      | 2 +-
 package/libcec/libcec.mk                                              | 2 +-
 package/libcoap/libcoap.mk                                            | 2 +-
 package/libcue/libcue.mk                                              | 2 +-
 package/libcuefile/libcuefile.mk                                      | 2 +-
 package/libdvbcsa/libdvbcsa.mk                                        | 2 +-
 package/libdvdcss/libdvdcss.mk                                        | 2 +-
 package/libdvdnav/libdvdnav.mk                                        | 2 +-
 package/libdvdread/libdvdread.mk                                      | 2 +-
 package/libeXosip2/libeXosip2.mk                                      | 2 +-
 package/libenca/libenca.mk                                            | 2 +-
 package/libesmtp/libesmtp.mk                                          | 2 +-
 package/libev/libev.mk                                                | 2 +-
 package/libfm-extra/libfm-extra.mk                                    | 2 +-
 package/libfm/libfm.mk                                                | 2 +-
 package/libfreeimage/libfreeimage.mk                                  | 2 +-
 package/libftdi1/libftdi1.mk                                          | 2 +-
 package/libfuse/libfuse.mk                                            | 2 +-
 package/libgpg-error/libgpg-error.mk                                  | 2 +-
 package/libhid/libhid.mk                                              | 2 +-
 package/libid3tag/libid3tag.mk                                        | 2 +-
 package/libidn/libidn.mk                                              | 2 +-
 package/libiscsi/libiscsi.mk                                          | 2 +-
 package/libkcapi/libkcapi.mk                                          | 2 +-
 package/libksba/libksba.mk                                            | 2 +-
 package/liblockfile/liblockfile.mk                                    | 2 +-
 package/libmad/libmad.mk                                              | 2 +-
 package/libmbim/libmbim.mk                                            | 2 +-
 package/libmpd/libmpd.mk                                              | 2 +-
 package/libmpeg2/libmpeg2.mk                                          | 2 +-
 package/libnetfilter_conntrack/libnetfilter_conntrack.mk              | 2 +-
 package/libnetfilter_cthelper/libnetfilter_cthelper.mk                | 2 +-
 package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk              | 2 +-
 package/libnetfilter_log/libnetfilter_log.mk                          | 2 +-
 package/libnetfilter_queue/libnetfilter_queue.mk                      | 2 +-
 package/libnfnetlink/libnfnetlink.mk                                  | 2 +-
 package/libnftnl/libnftnl.mk                                          | 2 +-
 package/libnpth/libnpth.mk                                            | 2 +-
 package/liboping/liboping.mk                                          | 2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk                      | 2 +-
 package/libpam-tacplus/libpam-tacplus.mk                              | 2 +-
 package/libpjsip/libpjsip.mk                                          | 2 +-
 package/libplatform/libplatform.mk                                    | 2 +-
 package/libqmi/libqmi.mk                                              | 2 +-
 package/librtlsdr/librtlsdr.mk                                        | 2 +-
 package/libserial/libserial.mk                                        | 2 +-
 package/libsidplay2/libsidplay2.mk                                    | 2 +-
 package/libsigsegv/libsigsegv.mk                                      | 2 +-
 package/libsysfs/libsysfs.mk                                          | 2 +-
 package/libtool/libtool.mk                                            | 2 +-
 package/libtorrent/libtorrent.mk                                      | 2 +-
 package/libuci/libuci.mk                                              | 4 ++--
 package/libuio/libuio.mk                                              | 2 +-
 package/libunistring/libunistring.mk                                  | 2 +-
 package/libupnpp/libupnpp.mk                                          | 2 +-
 package/liburcu/liburcu.mk                                            | 2 +-
 package/libusbgx/libusbgx.mk                                          | 2 +-
 package/libv4l/libv4l.mk                                              | 2 +-
 package/libvncserver/libvncserver.mk                                  | 2 +-
 package/linknx/linknx.mk                                              | 2 +-
 package/links/links.mk                                                | 2 +-
 package/linphone/linphone.mk                                          | 2 +-
 package/linux-backports/linux-backports.mk                            | 2 +-
 package/linux-fusion/linux-fusion.mk                                  | 2 +-
 package/linux-headers/linux-headers.mk                                | 2 +-
 package/linux-zigbee/linux-zigbee.mk                                  | 2 +-
 package/lirc-tools/lirc-tools.mk                                      | 2 +-
 package/lksctp-tools/lksctp-tools.mk                                  | 2 +-
 package/lm-sensors/lm-sensors.mk                                      | 2 +-
 package/lmbench/lmbench.mk                                            | 2 +-
 package/lockfile-progs/lockfile-progs.mk                              | 2 +-
 package/logrotate/logrotate.mk                                        | 2 +-
 package/lpc3250loader/lpc3250loader.mk                                | 2 +-
 package/lrzsz/lrzsz.mk                                                | 2 +-
 package/lshw/lshw.mk                                                  | 2 +-
 package/lsuio/lsuio.mk                                                | 2 +-
 package/ltp-testsuite/ltp-testsuite.mk                                | 2 +-
 package/ltrace/ltrace.mk                                              | 2 +-
 package/ltris/ltris.mk                                                | 2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk                          | 2 +-
 package/lttng-libust/lttng-libust.mk                                  | 2 +-
 package/lttng-modules/lttng-modules.mk                                | 2 +-
 package/lttng-tools/lttng-tools.mk                                    | 2 +-
 package/lugaru/lugaru.mk                                              | 2 +-
 package/lvm2/lvm2.mk                                                  | 2 +-
 package/lz4/lz4.mk                                                    | 2 +-
 package/lzip/lzip.mk                                                  | 2 +-
 package/lzo/lzo.mk                                                    | 2 +-
 package/lzop/lzop.mk                                                  | 2 +-
 package/macchanger/macchanger.mk                                      | 2 +-
 package/madplay/madplay.mk                                            | 2 +-
 package/makedevs/makedevs.mk                                          | 2 +-
 package/mariadb/mariadb.mk                                            | 2 +-
 package/matchbox-common/matchbox-common.mk                            | 2 +-
 package/matchbox-desktop/matchbox-desktop.mk                          | 2 +-
 package/matchbox-fakekey/matchbox-fakekey.mk                          | 2 +-
 package/matchbox-keyboard/matchbox-keyboard.mk                        | 2 +-
 package/matchbox-panel/matchbox-panel.mk                              | 2 +-
 package/matchbox-startup-monitor/matchbox-startup-monitor.mk          | 2 +-
 package/matchbox/matchbox.mk                                          | 2 +-
 package/mcelog/mcelog.mk                                              | 2 +-
 package/mdadm/mdadm.mk                                                | 2 +-
 package/mediastreamer/mediastreamer.mk                                | 2 +-
 package/memtest86/memtest86.mk                                        | 2 +-
 package/memtester/memtester.mk                                        | 2 +-
 package/memtool/memtool.mk                                            | 2 +-
 package/metacity/metacity.mk                                          | 2 +-
 package/minicom/minicom.mk                                            | 2 +-
 package/minidlna/minidlna.mk                                          | 2 +-
 package/miraclecast/miraclecast.mk                                    | 2 +-
 package/mjpegtools/mjpegtools.mk                                      | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk                                | 2 +-
 package/mkpasswd/mkpasswd.mk                                          | 2 +-
 package/mkpimage/mkpimage.mk                                          | 2 +-
 package/mmc-utils/mmc-utils.mk                                        | 2 +-
 package/modem-manager/modem-manager.mk                                | 2 +-
 package/mongoose/mongoose.mk                                          | 2 +-
 package/mono/mono.mk                                                  | 2 +-
 package/motion/motion.mk                                              | 2 +-
 package/mpd-mpc/mpd-mpc.mk                                            | 2 +-
 package/mpd/mpd.mk                                                    | 2 +-
 package/mplayer/mplayer.mk                                            | 2 +-
 package/mpv/mpv.mk                                                    | 2 +-
 package/msr-tools/msr-tools.mk                                        | 2 +-
 package/mtd/mtd.mk                                                    | 2 +-
 package/mtr/mtr.mk                                                    | 2 +-
 package/multicat/multicat.mk                                          | 2 +-
 package/mutt/mutt.mk                                                  | 2 +-
 package/mxsldr/mxsldr.mk                                              | 2 +-
 package/nanocom/nanocom.mk                                            | 2 +-
 package/nbd/nbd.mk                                                    | 2 +-
 package/ncmpc/ncmpc.mk                                                | 2 +-
 package/ndisc6/ndisc6.mk                                              | 2 +-
 package/neard/neard.mk                                                | 2 +-
 package/neardal/neardal.mk                                            | 2 +-
 package/neon/neon.mk                                                  | 2 +-
 package/net-tools/net-tools.mk                                        | 2 +-
 package/netatalk/netatalk.mk                                          | 2 +-
 package/netcat/netcat.mk                                              | 2 +-
 package/netplug/netplug.mk                                            | 2 +-
 package/netsniff-ng/netsniff-ng.mk                                    | 2 +-
 package/netstat-nat/netstat-nat.mk                                    | 2 +-
 package/nettle/nettle.mk                                              | 2 +-
 package/network-manager/network-manager.mk                            | 2 +-
 package/newt/newt.mk                                                  | 2 +-
 package/nfacct/nfacct.mk                                              | 2 +-
 package/nfs-utils/nfs-utils.mk                                        | 2 +-
 package/nftables/nftables.mk                                          | 2 +-
 package/nginx-naxsi/nginx-naxsi.mk                                    | 2 +-
 package/ngircd/ngircd.mk                                              | 2 +-
 package/nload/nload.mk                                                | 2 +-
 package/nmap/nmap.mk                                                  | 2 +-
 package/nodm/nodm.mk                                                  | 2 +-
 package/noip/noip.mk                                                  | 2 +-
 package/ntfs-3g/ntfs-3g.mk                                            | 2 +-
 package/numactl/numactl.mk                                            | 2 +-
 package/nut/nut.mk                                                    | 2 +-
 package/nuttcp/nuttcp.mk                                              | 2 +-
 package/nvme/nvme.mk                                                  | 2 +-
 package/odhcp6c/odhcp6c.mk                                            | 2 +-
 package/ofono/ofono.mk                                                | 2 +-
 package/ola/ola.mk                                                    | 2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk                        | 2 +-
 package/omxplayer/omxplayer.mk                                        | 2 +-
 package/on2-8170-modules/on2-8170-modules.mk                          | 2 +-
 package/open2300/open2300.mk                                          | 2 +-
 package/openbox/openbox.mk                                            | 2 +-
 package/openipmi/openipmi.mk                                          | 2 +-
 package/openobex/openobex.mk                                          | 2 +-
 package/openpowerlink/openpowerlink.mk                                | 2 +-
 package/openswan/openswan.mk                                          | 2 +-
 package/opentyrian/opentyrian.mk                                      | 2 +-
 package/openvpn/openvpn.mk                                            | 2 +-
 package/opkg-utils/opkg-utils.mk                                      | 2 +-
 package/opkg/opkg.mk                                                  | 2 +-
 package/oprofile/oprofile.mk                                          | 2 +-
 package/oracle-mysql/oracle-mysql.mk                                  | 2 +-
 package/owfs/owfs.mk                                                  | 2 +-
 package/p910nd/p910nd.mk                                              | 2 +-
 package/pangomm/pangomm.mk                                            | 2 +-
 package/pax-utils/pax-utils.mk                                        | 2 +-
 package/pciutils/pciutils.mk                                          | 2 +-
 package/pcmanfm/pcmanfm.mk                                            | 2 +-
 package/picocom/picocom.mk                                            | 2 +-
 package/pinentry/pinentry.mk                                          | 2 +-
 package/policycoreutils/policycoreutils.mk                            | 2 +-
 package/polkit/polkit.mk                                              | 2 +-
 package/poppler/poppler.mk                                            | 2 +-
 package/powerpc-utils/powerpc-utils.mk                                | 2 +-
 package/powertop/powertop.mk                                          | 2 +-
 package/pppd/pppd.mk                                                  | 2 +-
 package/pps-tools/pps-tools.mk                                        | 2 +-
 package/pptp-linux/pptp-linux.mk                                      | 2 +-
 package/prboom/prboom.mk                                              | 2 +-
 package/privoxy/privoxy.mk                                            | 2 +-
 package/procps-ng/procps-ng.mk                                        | 2 +-
 package/proftpd/proftpd.mk                                            | 2 +-
 package/proxychains-ng/proxychains-ng.mk                              | 2 +-
 package/pru-software-support/pru-software-support.mk                  | 2 +-
 package/psmisc/psmisc.mk                                              | 2 +-
 package/psplash/psplash.mk                                            | 2 +-
 package/pwgen/pwgen.mk                                                | 2 +-
 package/python-dicttoxml/python-dicttoxml.mk                          | 2 +-
 package/python-id3/python-id3.mk                                      | 2 +-
 package/python-mad/python-mad.mk                                      | 2 +-
 package/python-mutagen/python-mutagen.mk                              | 2 +-
 package/python-pylru/python-pylru.mk                                  | 2 +-
 package/python-pyparted/python-pyparted.mk                            | 2 +-
 package/python-pyqt/python-pyqt.mk                                    | 2 +-
 package/python-pyroute2/python-pyroute2.mk                            | 2 +-
 package/python-scapy3k/python-scapy3k.mk                              | 2 +-
 package/python-sip/python-sip.mk                                      | 2 +-
 package/python-smbus-cffi/python-smbus-cffi.mk                        | 2 +-
 package/python-spidev/python-spidev.mk                                | 2 +-
 package/qemu/qemu.mk                                                  | 2 +-
 package/qt5/qt53d/qt53d.mk                                            | 2 +-
 package/qt5/qt5base/qt5base.mk                                        | 2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk                                | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk                        | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk                          | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk                | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk                        | 4 ++--
 package/qt5/qt5location/qt5location.mk                                | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk                            | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk                      | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                                  | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                              | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk                            | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                                          | 2 +-
 package/qt5/qt5tools/qt5tools.mk                                      | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk                            | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk                            | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk                              | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                          | 2 +-
 package/quagga/quagga.mk                                              | 2 +-
 package/quota/quota.mk                                                | 2 +-
 package/racehound/racehound.mk                                        | 2 +-
 package/raptor/raptor.mk                                              | 2 +-
 package/rng-tools/rng-tools.mk                                        | 2 +-
 package/rp-pppoe/rp-pppoe.mk                                          | 2 +-
 package/rpm/rpm.mk                                                    | 2 +-
 package/rrdtool/rrdtool.mk                                            | 2 +-
 package/rsh-redone/rsh-redone.mk                                      | 2 +-
 package/rt-tests/rt-tests.mk                                          | 2 +-
 package/rtl8188eu/rtl8188eu.mk                                        | 2 +-
 package/rtl8723bs/rtl8723bs.mk                                        | 2 +-
 package/rtl8821au/rtl8821au.mk                                        | 2 +-
 package/rtorrent/rtorrent.mk                                          | 2 +-
 package/sane-backends/sane-backends.mk                                | 2 +-
 package/sbc/sbc.mk                                                    | 2 +-
 package/sconeserver/sconeserver.mk                                    | 2 +-
 package/scrub/scrub.mk                                                | 2 +-
 package/sepolgen/sepolgen.mk                                          | 2 +-
 package/ser2net/ser2net.mk                                            | 2 +-
 package/setools/setools.mk                                            | 2 +-
 package/setserial/setserial.mk                                        | 2 +-
 package/sg3_utils/sg3_utils.mk                                        | 2 +-
 package/shared-mime-info/shared-mime-info.mk                          | 2 +-
 package/shellinabox/shellinabox.mk                                    | 2 +-
 package/simicsfs/simicsfs.mk                                          | 2 +-
 package/sispmctl/sispmctl.mk                                          | 2 +-
 package/slang/slang.mk                                                | 2 +-
 package/smartmontools/smartmontools.mk                                | 2 +-
 package/smcroute/smcroute.mk                                          | 2 +-
 package/smstools3/smstools3.mk                                        | 2 +-
 package/socat/socat.mk                                                | 2 +-
 package/socketcand/socketcand.mk                                      | 2 +-
 package/softether/softether.mk                                        | 2 +-
 package/sox/sox.mk                                                    | 2 +-
 package/sp-oops-extract/sp-oops-extract.mk                            | 2 +-
 package/spi-tools/spi-tools.mk                                        | 2 +-
 package/spidev_test/spidev_test.mk                                    | 2 +-
 package/squashfs/squashfs.mk                                          | 2 +-
 package/squid/squid.mk                                                | 2 +-
 package/sredird/sredird.mk                                            | 2 +-
 package/sshfs/sshfs.mk                                                | 2 +-
 package/sshpass/sshpass.mk                                            | 2 +-
 package/sslh/sslh.mk                                                  | 2 +-
 package/start-stop-daemon/start-stop-daemon.mk                        | 2 +-
 package/statserial/statserial.mk                                      | 2 +-
 package/stella/stella.mk                                              | 2 +-
 package/stm32flash/stm32flash.mk                                      | 2 +-
 package/stress-ng/stress-ng.mk                                        | 2 +-
 package/stress/stress.mk                                              | 2 +-
 package/strongswan/strongswan.mk                                      | 2 +-
 package/stunnel/stunnel.mk                                            | 2 +-
 package/sunxi-tools/sunxi-tools.mk                                    | 2 +-
 package/swupdate/swupdate.mk                                          | 2 +-
 package/sylpheed/sylpheed.mk                                          | 2 +-
 package/synergy/synergy.mk                                            | 2 +-
 package/sysdig/sysdig.mk                                              | 2 +-
 package/sysklogd/sysklogd.mk                                          | 2 +-
 package/syslog-ng/syslog-ng.mk                                        | 2 +-
 package/sysprof/sysprof.mk                                            | 2 +-
 package/sysstat/sysstat.mk                                            | 2 +-
 package/systemd/systemd.mk                                            | 2 +-
 package/sysvinit/sysvinit.mk                                          | 2 +-
 package/ti-sgx-km/ti-sgx-km.mk                                        | 2 +-
 package/ti-uim/ti-uim.mk                                              | 2 +-
 package/time/time.mk                                                  | 2 +-
 package/tinc/tinc.mk                                                  | 2 +-
 package/tovid/tovid.mk                                                | 2 +-
 package/trace-cmd/trace-cmd.mk                                        | 2 +-
 package/transmission/transmission.mk                                  | 2 +-
 package/tree/tree.mk                                                  | 2 +-
 package/trinity/trinity.mk                                            | 2 +-
 package/tunctl/tunctl.mk                                              | 2 +-
 package/uboot-tools/uboot-tools.mk                                    | 2 +-
 package/uccp420wlan/uccp420wlan.mk                                    | 2 +-
 package/ucl/ucl.mk                                                    | 2 +-
 package/udisks/udisks.mk                                              | 2 +-
 package/udpcast/udpcast.mk                                            | 2 +-
 package/ulogd/ulogd.mk                                                | 2 +-
 package/unixodbc/unixodbc.mk                                          | 2 +-
 package/unscd/unscd.mk                                                | 2 +-
 package/upmpdcli/upmpdcli.mk                                          | 2 +-
 package/upower/upower.mk                                              | 2 +-
 package/upx/upx.mk                                                    | 2 +-
 package/usb_modeswitch/usb_modeswitch.mk                              | 2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk                    | 2 +-
 package/usbredir/usbredir.mk                                          | 2 +-
 package/usbutils/usbutils.mk                                          | 2 +-
 package/ushare/ushare.mk                                              | 2 +-
 package/ussp-push/ussp-push.mk                                        | 2 +-
 package/util-linux/util-linux.mk                                      | 2 +-
 package/v4l2grab/v4l2grab.mk                                          | 2 +-
 package/valgrind/valgrind.mk                                          | 2 +-
 package/vde2/vde2.mk                                                  | 2 +-
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk                | 2 +-
 package/vdr/vdr.mk                                                    | 2 +-
 package/vlc/vlc.mk                                                    | 2 +-
 package/vnstat/vnstat.mk                                              | 2 +-
 package/vorbis-tools/vorbis-tools.mk                                  | 2 +-
 package/vpnc/vpnc.mk                                                  | 2 +-
 package/vsftpd/vsftpd.mk                                              | 2 +-
 package/vtun/vtun.mk                                                  | 2 +-
 package/w_scan/w_scan.mk                                              | 2 +-
 package/whois/whois.mk                                                | 2 +-
 package/wipe/wipe.mk                                                  | 2 +-
 package/wireless_tools/wireless_tools.mk                              | 2 +-
 package/wmctrl/wmctrl.mk                                              | 2 +-
 package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk  | 2 +-
 package/x11vnc/x11vnc.mk                                              | 2 +-
 package/x264/x264.mk                                                  | 2 +-
 package/x265/x265.mk                                                  | 2 +-
 package/xen/xen.mk                                                    | 2 +-
 package/xenomai/xenomai.mk                                            | 2 +-
 package/xl2tp/xl2tp.mk                                                | 2 +-
 package/xscreensaver/xscreensaver.mk                                  | 2 +-
 package/xtables-addons/xtables-addons.mk                              | 2 +-
 package/xvisor/xvisor.mk                                              | 2 +-
 package/xvkbd/xvkbd.mk                                                | 2 +-
 package/xxhash/xxhash.mk                                              | 2 +-
 package/xz/xz.mk                                                      | 2 +-
 package/yaffs2utils/yaffs2utils.mk                                    | 2 +-
 package/yasm/yasm.mk                                                  | 2 +-
 package/yavta/yavta.mk                                                | 2 +-
 package/ympd/ympd.mk                                                  | 2 +-
 package/zd1211-firmware/zd1211-firmware.mk                            | 2 +-
 638 files changed, 649 insertions(+), 649 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7a110d2..3ae349a 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -36,7 +36,7 @@ endif
 endif
 
 $(1)_DEPENDENCIES = host-lzop
-$(1)_LICENSE = GPLv2 with exceptions
+$(1)_LICENSE = GPL-2.0 with exceptions
 $(1)_LICENSE_FILES = COPYING
 
 $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index ae687d6..21f4462 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -9,7 +9,7 @@ GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
 GRUB_PATCH = grub_$(GRUB_VERSION)-68.diff.gz
 GRUB_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub
 
-GRUB_LICENSE = GPLv2+
+GRUB_LICENSE = GPL-2.0+
 GRUB_LICENSE_FILES = COPYING
 
 # Passing -O0 since the default -O2 passed by Buildroot generates
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 17af6dc..1955a37 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -35,7 +35,7 @@ MXS_BOOTLETS_ELFTOSB_OPTIONS += -f imx28
 endif
 
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
-MXS_BOOTLETS_LICENSE = GPLv2+
+MXS_BOOTLETS_LICENSE = GPL-2.0+
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 82890c5..5b7906c 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -8,7 +8,7 @@ SYSLINUX_VERSION = 6.03
 SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
 SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
-SYSLINUX_LICENSE = GPLv2+
+SYSLINUX_LICENSE = GPL-2.0+
 SYSLINUX_LICENSE_FILES = COPYING
 
 SYSLINUX_INSTALL_IMAGES = YES
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1e22eaa..aac692c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -7,7 +7,7 @@
 UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
-UBOOT_LICENSE = GPLv2+
+UBOOT_LICENSE = GPL-2.0+
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index c68dc81..7e0b286 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -8,7 +8,7 @@ XLOADER_VERSION = 6f3a26101303051e0f91b6213735b68ce804e94e
 XLOADER_SITE = git://gitorious.org/x-loader/x-loader.git
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
-XLOADER_LICENSE = GPLv2+
+XLOADER_LICENSE = GPL-2.0+
 XLOADER_LICENSE_FILES = README
 
 XLOADER_INSTALL_IMAGES = YES
diff --git a/linux/linux.mk b/linux/linux.mk
index d160d28..f68a3ff 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
-LINUX_LICENSE = GPLv2
+LINUX_LICENSE = GPL-2.0
 LINUX_LICENSE_FILES = COPYING
 
 define LINUX_HELP_CMDS
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index e1462b6..93e20c3 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -10,7 +10,7 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
 ACL_CONF_OPTS = --enable-gettext=no
-ACL_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
+ACL_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index f76c948..18870c2 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -7,7 +7,7 @@
 ACPICA_VERSION = 20161117
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
-ACPICA_LICENSE = BSD-3c or GPLv2
+ACPICA_LICENSE = BSD-3c or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
 
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index f561b90..2141a1a 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -7,7 +7,7 @@
 ACPID_VERSION = 2.0.28
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
-ACPID_LICENSE = GPLv2+
+ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 
 define ACPID_INSTALL_INIT_SYSV
diff --git a/package/acpitool/acpitool.mk b/package/acpitool/acpitool.mk
index f663fbb..547da37 100644
--- a/package/acpitool/acpitool.mk
+++ b/package/acpitool/acpitool.mk
@@ -7,7 +7,7 @@
 ACPITOOL_VERSION = 0.5.1
 ACPITOOL_SOURCE = acpitool-$(ACPITOOL_VERSION).tar.bz2
 ACPITOOL_SITE = http://downloads.sourceforge.net/sourceforge/acpitool
-ACPITOOL_LICENSE = GPLv2+
+ACPITOOL_LICENSE = GPL-2.0+
 ACPITOOL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index e00570e..72495bb 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -6,7 +6,7 @@
 
 AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
 AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
-AER_INJECT_LICENSE = GPLv2
+AER_INJECT_LICENSE = GPL-2.0
 AER_INJECT_LICENSE_FILES = README
 AER_INJECT_DEPENDENCIES = host-flex host-bison
 
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 7e5464d..8cf1f47 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -6,7 +6,7 @@
 
 AIRCRACK_NG_VERSION = 1.2-rc1
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
-AIRCRACK_NG_LICENSE = GPLv2+
+AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
 AIRCRACK_NG_DEPENDENCIES = openssl zlib host-pkgconf
 # Enable buddy-ng, easside-ng, tkiptun-ng, wesside-ng
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 5957568..8f421a0 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -7,7 +7,7 @@
 ALSA_LIB_VERSION = 1.1.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
-ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPLv2+ (aserver)
+ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (aserver)
 ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index a72191e..847a97f 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -7,7 +7,7 @@
 ALSA_UTILS_VERSION = 1.1.3
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
-ALSA_UTILS_LICENSE = GPLv2
+ALSA_UTILS_LICENSE = GPL-2.0
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-gettext host-pkgconf alsa-lib \
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 0d37c8c..24e2497 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -7,7 +7,7 @@
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
 ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
-ALSAMIXERGUI_LICENSE = GPLv2+
+ALSAMIXERGUI_LICENSE = GPL-2.0+
 ALSAMIXERGUI_LICENSE_FILES = debian/copyright
 ALSAMIXERGUI_AUTORECONF = YES
 
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index bd1c559..941f439 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -9,7 +9,7 @@ ARGUS_SITE = http://qosient.com/argus/src
 ARGUS_DEPENDENCIES = libpcap
 ARGUS_CONF_ENV = arg_cv_sys_errlist=yes
 # Code is really v2+ though COPYING is v3 so ship README to avoid confusion
-ARGUS_LICENSE = GPLv2+
+ARGUS_LICENSE = GPL-2.0+
 ARGUS_LICENSE_FILES = README
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index 888d396..257b636 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -7,7 +7,7 @@
 ARPTABLES_VERSION = 0.0.4
 ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
 ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
-ARPTABLES_LICENSE = GPLv2+
+ARPTABLES_LICENSE = GPL-2.0+
 
 define ARPTABLES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
diff --git a/package/at/at.mk b/package/at/at.mk
index 8865360..db38aa7 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -11,7 +11,7 @@ AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
-AT_LICENSE = GPLv2+, GPLv3+, ISC
+AT_LICENSE = GPL-2.0+, GPLv3+, ISC
 AT_LICENSE_FILES = Copyright COPYING
 
 AT_CONF_OPTS = \
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 615b6ea..e1c257c 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -6,7 +6,7 @@
 
 ATFTP_VERSION = 0.7.1
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
-ATFTP_LICENSE = GPLv2+
+ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 2c070f2..0f98ee0 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -8,7 +8,7 @@ ATKMM_VERSION_MAJOR = 2.24
 ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
-ATKMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+ATKMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
 ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 27e1f82..f089382 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -6,7 +6,7 @@
 
 ATOP_VERSION = 2.2-3
 ATOP_SITE = http://www.atoptool.nl/download
-ATOP_LICENSE = GPLv2+
+ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_DEPENDENCIES = ncurses zlib
 
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 4d5a07d..24222b5 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -10,7 +10,7 @@ ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPTS = --enable-gettext=no
 HOST_ATTR_CONF_OPTS = --enable-gettext=no
-ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
+ATTR_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index ee3f833..74550a3 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -12,7 +12,7 @@ AUDIOFILE_CONF_OPTS = --disable-examples
 AUDIOFILE_DEPENDENCIES = host-pkgconf
 # configure is outdated and has old bugs because of it
 AUDIOFILE_AUTORECONF = YES
-AUDIOFILE_LICENSE = GPLv2+, LGPLv2.1+
+AUDIOFILE_LICENSE = GPL-2.0+, LGPLv2.1+
 AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 298ef20..b94d0bf 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -6,7 +6,7 @@
 
 AUDIT_VERSION = 2.7.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
-AUDIT_LICENSE = GPLv2+ (programs), unclear (libraries)
+AUDIT_LICENSE = GPL-2.0+ (programs), unclear (libraries)
 AUDIT_LICENSE_FILES = COPYING
 
 AUDIT_INSTALL_STAGING = YES
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
index d41b4ac..d954f02 100644
--- a/package/aufs-util/aufs-util.mk
+++ b/package/aufs-util/aufs-util.mk
@@ -8,7 +8,7 @@
 AUFS_UTIL_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
 AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
 AUFS_UTIL_SITE_METHOD = git
-AUFS_UTIL_LICENSE = GPLv2
+AUFS_UTIL_LICENSE = GPL-2.0
 AUFS_UTIL_LICENSE_FILES = COPYING
 
 AUFS_UTIL_DEPENDENCIES = linux
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 1ba5508..55dbf94 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
-AUFS_LICENSE = GPLv2
+AUFS_LICENSE = GPL-2.0
 AUFS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index eae34d0..9bcc19a 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -9,7 +9,7 @@ AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF = YES
 AUMIX_GETTEXTIZE = YES
-AUMIX_LICENSE = GPLv2+
+AUMIX_LICENSE = GPL-2.0+
 AUMIX_LICENSE_FILES = COPYING
 
 AUMIX_CONF_OPTS = \
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 23e6836..f20a19a 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -7,7 +7,7 @@
 AUTOFS_VERSION = 5.1.2
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
-AUTOFS_LICENSE = GPLv2+
+AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison
 # For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch and
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 84f05dc..e62038c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -7,7 +7,7 @@
 AUTOMAKE_VERSION = 1.15
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
-AUTOMAKE_LICENSE = GPLv2+
+AUTOMAKE_LICENSE = GPL-2.0+
 AUTOMAKE_LICENSE_FILES = COPYING
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 27a74de..f914ed7 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -6,7 +6,7 @@
 
 AVRDUDE_VERSION = ad04c429a90f4c34f000ea4ae11db2705915a31f
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
-AVRDUDE_LICENSE = GPLv2+
+AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
@@ -14,7 +14,7 @@ AVRDUDE_SUBDIR = avrdude
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
-AVRDUDE_LICENSE = GPLv2+
+AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 6cf0fa8..e89a946 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -6,7 +6,7 @@
 
 AXEL_VERSION = 2.4
 AXEL_SITE = http://sources.buildroot.net
-AXEL_LICENSE = GPLv2+
+AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 1bd6280..e1f7427 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -6,7 +6,7 @@
 
 AXFSUTILS_VERSION = 64886703fdff6cfc64eb20fbe7d7295bbeec867b
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
-AXFSUTILS_LICENSE = GPLv2
+AXFSUTILS_LICENSE = GPL-2.0
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
 HOST_AXFSUTILS_DEPENDENCIES = host-zlib
 
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index ed1b06c..73d4598 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -6,7 +6,7 @@
 
 BATCTL_VERSION = 2016.1
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
-BATCTL_LICENSE = GPLv2
+BATCTL_LICENSE = GPL-2.0
 BATCTL_DEPENDENCIES = libnl host-pkgconf
 
 define BATCTL_BUILD_CMDS
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 256781f..ead2cca 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -6,7 +6,7 @@
 
 BATMAN_ADV_VERSION = 2016.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
-BATMAN_ADV_LICENSE = GPLv2
+BATMAN_ADV_LICENSE = GPL-2.0
 
 # Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_CFLAGS = \
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 8f3e08d..3193ffa 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -8,7 +8,7 @@ BC_VERSION = 1.06.95
 BC_SOURCE = bc-$(BC_VERSION).tar.bz2
 BC_SITE = http://alpha.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
-BC_LICENSE = GPLv2+, LGPLv2.1+
+BC_LICENSE = GPL-2.0+, LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
 # Build after busybox so target ends up with bc's "dc" version
diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
index 09604f6..0e7a282 100644
--- a/package/bcache-tools/bcache-tools.mk
+++ b/package/bcache-tools/bcache-tools.mk
@@ -6,7 +6,7 @@
 
 BCACHE_TOOLS_VERSION = v1.0.8
 BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
-BCACHE_TOOLS_LICENSE = GPLv2
+BCACHE_TOOLS_LICENSE = GPL-2.0
 BCACHE_TOOLS_LICENSE_FILES = COPYING
 BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux
 
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index c111a0a..e24c819 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -6,7 +6,7 @@
 
 BCM2835_VERSION = 1.48
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
-BCM2835_LICENSE = GPLv2
+BCM2835_LICENSE = GPL-2.0
 BCM2835_LICENSE_FILES = COPYING
 BCM2835_INSTALL_STAGING = YES
 
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index f972ab6..281a0bf 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -6,7 +6,7 @@
 
 BCTOOLBOX_VERSION = 0.4.0
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
-BCTOOLBOX_LICENSE = GPLv2+
+BCTOOLBOX_LICENSE = GPL-2.0+
 BCTOOLBOX_LICENSE_FILES = COPYING
 BCTOOLBOX_INSTALL_STAGING = YES
 
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 697b5ce..12f41ea 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -7,7 +7,7 @@
 BCUSDK_VERSION = 0.0.5
 BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
 BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib
-BCUSDK_LICENSE = GPLv2+
+BCUSDK_LICENSE = GPL-2.0+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
 BCUSDK_CONF_OPTS = \
diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index de583cf..bc29c25 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -7,7 +7,7 @@
 BLKTRACE_VERSION = 1.1.0
 BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
-BLKTRACE_LICENSE = GPLv2+
+BLKTRACE_LICENSE = GPL-2.0+
 BLKTRACE_LICENSE_FILES = COPYING
 
 define BLKTRACE_BUILD_CMDS
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 63f29ab..a72899a 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,7 +9,7 @@ BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
-BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
+BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 BLUEZ5_UTILS_CONF_OPTS =	\
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 1c93f2e..2fa8f7f 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -11,7 +11,7 @@ BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
-BLUEZ_UTILS_LICENSE = GPLv2+, LGPLv2.1+
+BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPLv2.1+
 BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index ab23d90..d8bcaa1 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -6,7 +6,7 @@
 
 BOA_VERSION = 0.94.14rc21
 BOA_SITE = http://www.boa.org
-BOA_LICENSE = GPLv2+
+BOA_LICENSE = GPL-2.0+
 BOA_LICENSE_FILES = COPYING
 
 define BOA_INSTALL_TARGET_CMDS
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 787d180..e5c8640 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -7,7 +7,7 @@
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
 BONNIE_SITE = http://www.coker.com.au/bonnie++
-BONNIE_LICENSE = GPLv2
+BONNIE_LICENSE = GPL-2.0
 BONNIE_LICENSE_FILES = copyright.txt
 
 define BONNIE_INSTALL_TARGET_CMDS
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index eb3cb4f..bc4b3e8 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -7,7 +7,7 @@
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
 BOOTUTILS_CONF_OPTS = --prefix=/ --exec-prefix=/
-BOOTUTILS_LICENSE = GPLv2+
+BOOTUTILS_LICENSE = GPL-2.0+
 BOOTUTILS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index efe57cd..7982025 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -9,7 +9,7 @@ BRIDGE_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/bridge-utils
 BRIDGE_UTILS_SOURCE = bridge-utils-1.6.tar.xz
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_CONF_OPTS = --with-linux-headers=$(LINUX_HEADERS_DIR)
-BRIDGE_UTILS_LICENSE = GPLv2+
+BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 852c614..1504303 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -9,7 +9,7 @@ BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace
-BTRFS_PROGS_LICENSE = GPLv2
+BTRFS_PROGS_LICENSE = GPL-2.0
 BTRFS_PROGS_LICENSE_FILES = COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 577f2f2..f9dacc7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,7 +7,7 @@
 BUSYBOX_VERSION = 1.26.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPLv2
+BUSYBOX_LICENSE = GPL-2.0
 BUSYBOX_LICENSE_FILES = LICENSE
 
 define BUSYBOX_HELP_CMDS
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index e285422..85ee689 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -7,7 +7,7 @@
 BWM_NG_VERSION = 0.6.1
 BWM_NG_SITE = http://www.gropp.org/bwm-ng
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
-BWM_NG_LICENSE = GPLv2
+BWM_NG_LICENSE = GPL-2.0
 BWM_NG_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index cf388aa..9daee58 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -7,7 +7,7 @@
 C_ICAP_MODULES_VERSION = 0.4.2
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
-C_ICAP_MODULES_LICENSE = GPLv2+
+C_ICAP_MODULES_LICENSE = GPL-2.0+
 C_ICAP_MODULES_LICENSE_FILES = COPYING
 C_ICAP_MODULES_DEPENDENCIES = c-icap
 
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index d077a19..fafc434 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -12,7 +12,7 @@ CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # but it must be at least python 2.7
 CA_CERTIFICATES_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
-CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
+CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
 define CA_CERTIFICATES_BUILD_CMDS
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index fffdb4b..cc99c54 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -6,7 +6,7 @@
 
 CANNELLONI_VERSION = 20160414
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
-CANNELLONI_LICENSE = GPLv2
+CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
 
 ifeq ($(BR2_PACKAGE_LKSCTP_TOOLS),y)
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 1b5672d..22a6e53 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -6,7 +6,7 @@
 
 CBOOTIMAGE_VERSION = v1.7
 CBOOTIMAGE_SITE = $(call github,NVIDIA,cbootimage,$(CBOOTIMAGE_VERSION))
-CBOOTIMAGE_LICENSE = GPLv2
+CBOOTIMAGE_LICENSE = GPL-2.0
 CBOOTIMAGE_LICENSE_FILES = COPYING
 CBOOTIMAGE_AUTORECONF = YES
 
diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
index d8df041..b9209ce 100644
--- a/package/cc-tool/cc-tool.mk
+++ b/package/cc-tool/cc-tool.mk
@@ -7,7 +7,7 @@
 CC_TOOL_VERSION = 0.26
 CC_TOOL_SITE = http://downloads.sourceforge.net/project/cctool
 CC_TOOL_SOURCE = cc-tool-$(CC_TOOL_VERSION)-src.tgz
-CC_TOOL_LICENSE = GPLv2
+CC_TOOL_LICENSE = GPL-2.0
 CC_TOOL_LICENSE_FILES = COPYING
 CC_TOOL_DEPENDENCIES = boost libusb
 
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index 3beff40..d27e346 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -7,7 +7,7 @@
 CCRYPT_VERSION = 1.10
 CCRYPT_SITE = http://ccrypt.sourceforge.net/download
 
-CCRYPT_LICENSE = GPLv2+
+CCRYPT_LICENSE = GPL-2.0+
 CCRYPT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 10d118c..f49d515 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -9,7 +9,7 @@ CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
 CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
-CDRKIT_LICENSE = GPLv2
+CDRKIT_LICENSE = GPL-2.0
 CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 8328b39..774d006 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -6,7 +6,7 @@
 
 CHECKPOLICY_VERSION = 2.6
 CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-CHECKPOLICY_LICENSE = GPLv2
+CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 7283092..54121c4 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -6,7 +6,7 @@
 
 CHOCOLATE_DOOM_VERSION = 2.3.0
 CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
-CHOCOLATE_DOOM_LICENSE = GPLv2+
+CHOCOLATE_DOOM_LICENSE = GPL-2.0+
 CHOCOLATE_DOOM_LICENSE_FILES = COPYING
 CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl sdl_mixer sdl_net
 
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index c3d48a7..3b10c8c 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -6,7 +6,7 @@
 
 CHRONY_VERSION = 3.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
-CHRONY_LICENSE = GPLv2
+CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 
 CHRONY_CONF_OPTS = \
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 5d57b8d..23dee0a 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -6,7 +6,7 @@
 
 CLAMAV_VERSION = 0.99.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
-CLAMAV_LICENSE = GPLv2
+CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
 	COPYING.unrar COPYING.zlib
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 47658c2..6bba694 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -18,7 +18,7 @@ CLASSPATH_CONF_OPTS = \
 # don't support qt4 on X11
 CLASSPATH_CONF_OPTS += --disable-qt-peer
 CLASSPATH_DEPENDENCIES = host-pkgconf
-CLASSPATH_LICENSE = GPLv2+ with exception
+CLASSPATH_LICENSE = GPL-2.0+ with exception
 CLASSPATH_LICENSE_FILES = COPYING
 
 # Needs ALSA pcm and sequencer (midi) support
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index caed3f4..6a6e790 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -7,7 +7,7 @@
 CLOOP_VERSION = 2.634-1
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.gz
 CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
-CLOOP_LICENSE = GPLv2 (module), GPLv2+ (advancecomp)
+CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
 HOST_CLOOP_DEPENDENCIES = host-zlib
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 38354ac..a3f3063 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -9,7 +9,7 @@ COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-COLLECTD_LICENSE = GPLv2, LGPLv2.1
+COLLECTD_LICENSE = GPL-2.0, LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
index 2c9c131..9888fcd 100644
--- a/package/connman-gtk/connman-gtk.mk
+++ b/package/connman-gtk/connman-gtk.mk
@@ -9,7 +9,7 @@ CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONN
 CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
 CONNMAN_GTK_INSTALL_STAGING = YES
 CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3
-CONNMAN_GTK_LICENSE = GPLv2+
+CONNMAN_GTK_LICENSE = GPL-2.0+
 CONNMAN_GTK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index f7c9f23..5c9a05f 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -9,7 +9,7 @@ CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
-CONNMAN_LICENSE = GPLv2
+CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
 	--with-dbusconfdir=/etc \
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index b73aa7f..2f4ea5f 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -10,7 +10,7 @@ CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
 	libnetfilter_queue host-bison host-flex
-CONNTRACK_TOOLS_LICENSE = GPLv2+
+CONNTRACK_TOOLS_LICENSE = GPL-2.0+
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 CONNTRACK_TOOLS_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index 30c3db6..e792952 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -6,7 +6,7 @@
 
 CPULOAD_VERSION = v0.3
 CPULOAD_SITE = $(call github,kelvincheung,cpuload,$(CPULOAD_VERSION))
-CPULOAD_LICENSE = GPLv2
+CPULOAD_LICENSE = GPL-2.0
 CPULOAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 3cbe274..2391b24 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -6,7 +6,7 @@
 
 CRAMFS_VERSION = 1.1
 CRAMFS_SITE = http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
-CRAMFS_LICENSE = GPLv2+
+CRAMFS_LICENSE = GPL-2.0+
 CRAMFS_LICENSE_FILES = COPYING
 
 CRAMFS_DEPENDENCIES = zlib
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 8fe3232..c03f55c 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -7,7 +7,7 @@
 CRUDINI_VERSION = 0.9
 CRUDINI_SITE = https://pypi.python.org/packages/b5/65/5588903472f30fa01ca4951be00c03a317b27bac4cd1e945bd16b2c1b6d3
 CRUDINI_SETUP_TYPE = setuptools
-CRUDINI_LICENSE = GPLv2
+CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 709c6ed..91802a7 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -7,7 +7,7 @@
 CRYPTODEV_LINUX_VERSION = 2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
-CRYPTODEV_LINUX_LICENSE = GPLv2+
+CRYPTODEV_LINUX_LICENSE = GPL-2.0+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
 CRYPTODEV_LINUX_PROVIDES = cryptodev
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 8337bed..6791f6f 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -10,7 +10,7 @@ CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
+CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 CRYPTSETUP_INSTALL_STAGING = YES
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 55fc95e..959e543 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -6,7 +6,7 @@
 
 CTORRENT_VERSION = dnh3.3.2
 CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent
-CTORRENT_LICENSE = GPLv2
+CTORRENT_LICENSE = GPL-2.0
 CTORRENT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index d58c78d..4ffe6f7 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -7,7 +7,7 @@
 CUPS_VERSION = 2.2.3
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
-CUPS_LICENSE = GPLv2, LGPLv2
+CUPS_LICENSE = GPL-2.0, LGPLv2
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
index 8ec3e4c..585dbf2 100644
--- a/package/curlftpfs/curlftpfs.mk
+++ b/package/curlftpfs/curlftpfs.mk
@@ -7,7 +7,7 @@
 CURLFTPFS_VERSION = 0.9.2
 CURLFTPFS_SITE = http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/$(CURLFTPFS_VERSION)
 CURLFTPFS_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
-CURLFTPFS_LICENSE = GPLv2
+CURLFTPFS_LICENSE = GPL-2.0
 CURLFTPFS_LICENSE_FILES = COPYING
 CURLFTPFS_DEPENDENCIES = \
 	libglib2 libfuse openssl libcurl \
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
index 36450c1..c092e40 100644
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -6,7 +6,7 @@
 
 CWIID_VERSION = fadf11e89b579bcc0336a0692ac15c93785f3f82
 CWIID_SITE = $(call github,abstrakraft,cwiid,$(CWIID_VERSION))
-CWIID_LICENSE = GPLv2+
+CWIID_LICENSE = GPL-2.0+
 CWIID_LICENSE_FILES = COPYING
 
 CWIID_AUTORECONF = YES
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 4f2b6ed..26db5a8 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -8,7 +8,7 @@ DASH_VERSION = 0.5.8
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/d/dash
 DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
-DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
+DASH_LICENSE = BSD-3c, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
 # 0002-fix-parallel-build.patch
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5a6f5a0..e14a095 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,7 +7,7 @@
 DBUS_GLIB_VERSION = 0.108
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
-DBUS_GLIB_LICENSE = AFLv2.1 or GPLv2+
+DBUS_GLIB_LICENSE = AFLv2.1 or GPL-2.0+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = \
diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
index 0d693b4..7d73a6c 100644
--- a/package/dbus-triggerd/dbus-triggerd.mk
+++ b/package/dbus-triggerd/dbus-triggerd.mk
@@ -6,7 +6,7 @@
 
 DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
 DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
-DBUS_TRIGGERD_LICENSE = GPLv2+
+DBUS_TRIGGERD_LICENSE = GPL-2.0+
 DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
 DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2d1583e..ee8ffe1 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 DBUS_VERSION = 1.10.16
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
+DBUS_LICENSE = AFLv2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 4e244e6..9432e7a 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -7,7 +7,7 @@
 DDRESCUE_VERSION = 1.22
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
-DDRESCUE_LICENSE = GPLv2+
+DDRESCUE_LICENSE = GPL-2.0+
 DDRESCUE_LICENSE_FILES = COPYING
 
 define DDRESCUE_CONFIGURE_CMDS
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 83cf744..86f201d 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -10,7 +10,7 @@ DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/po
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 # Make sure we override the busybox tools, such as which
 DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-DEBIANUTILS_LICENSE = GPLv2+, SMAIL (savelog)
+DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
 
 $(eval $(autotools-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index 7f0594e..45d3c99 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -7,7 +7,7 @@
 DEVMEM2_SITE = http://free-electrons.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
 DEVMEM2_VERSION = 1
-DEVMEM2_LICENSE = GPLv2+
+DEVMEM2_LICENSE = GPL-2.0+
 DEVMEM2_LICENSE_FILES = devmem2.c
 
 define DEVMEM2_EXTRACT_CMDS
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 079f875..c494485 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,7 +6,7 @@
 
 DFU_UTIL_VERSION = 0.9
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
-DFU_UTIL_LICENSE = GPLv2+
+DFU_UTIL_LICENSE = GPL-2.0+
 DFU_UTIL_LICENSE_FILES = COPYING
 
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index cd30aa7..b6c59db 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -7,7 +7,7 @@
 DMIDECODE_VERSION = 3.0
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
-DMIDECODE_LICENSE = GPLv2+
+DMIDECODE_LICENSE = GPL-2.0+
 DMIDECODE_LICENSE_FILES = LICENSE
 
 define DMIDECODE_BUILD_CMDS
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index fbb2387..0382cd4 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -11,7 +11,7 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
-DMRAID_LICENSE = GPLv2
+DMRAID_LICENSE = GPL-2.0
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 
 DMRAID_DEPENDENCIES = lvm2
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e8240b9..53a69d5 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -11,7 +11,7 @@ DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_DEPENDENCIES = host-pkgconf
-DNSMASQ_LICENSE = GPLv2 or GPLv3
+DNSMASQ_LICENSE = GPL-2.0 or GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 9a9d26b..4a8c6fc 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -8,7 +8,7 @@ DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
 
-DOCKER_LICENSE = GPLv2+
+DOCKER_LICENSE = GPL-2.0+
 # The 'or later' is specified at the end of the README, so include that one too.
 DOCKER_LICENSE_FILES = COPYING README
 
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index cf7dfee..428747b 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -7,7 +7,7 @@
 DOXYGEN_VERSION = 1.8.9.1
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
-DOXYGEN_LICENSE = GPLv2
+DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index eb6042d..f71a4ae 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -6,7 +6,7 @@
 
 DRBD_UTILS_VERSION = 8.9.4
 DRBD_UTILS_SITE = http://oss.linbit.com/drbd
-DRBD_UTILS_LICENSE = GPLv2+
+DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
 DRBD_UTILS_DEPENDENCIES = host-flex
 
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 3565927..a037d3f 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -8,7 +8,7 @@ DROPWATCH_VERSION = 1.4
 DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.xz
 DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
-DROPWATCH_LICENSE = GPLv2
+DROPWATCH_LICENSE = GPL-2.0
 DROPWATCH_LICENSE_FILES = COPYING
 
 # libbfd may be linked to libintl
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index 180031f..b535328 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -7,7 +7,7 @@
 DSTAT_VERSION = 0.7.2
 DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
 DSTAT_SITE = http://dag.wieers.com/home-made/dstat
-DSTAT_LICENSE = GPLv2
+DSTAT_LICENSE = GPL-2.0
 DSTAT_LICENSE_FILES = COPYING
 
 define DSTAT_INSTALL_TARGET_CMDS
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
index 75c4434..571481c 100644
--- a/package/dtach/dtach.mk
+++ b/package/dtach/dtach.mk
@@ -6,7 +6,7 @@
 
 DTACH_VERSION = v0.9
 DTACH_SITE = $(call github,crigler,dtach,$(DTACH_VERSION))
-DTACH_LICENSE = GPLv2+
+DTACH_LICENSE = GPL-2.0+
 DTACH_LICENSE_FILES = COPYING
 
 # The Makefile does not have an install target.
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index f6800f3..8643849 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -7,7 +7,7 @@
 DTC_VERSION = 1.4.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
-DTC_LICENSE = GPLv2+ or BSD-2c (library)
+DTC_LICENSE = GPL-2.0+ or BSD-2c (library)
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
@@ -19,7 +19,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
-DTC_LICENSE := $(DTC_LICENSE), GPLv2+ (programs)
+DTC_LICENSE := $(DTC_LICENSE), GPL-2.0+ (programs)
 DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 8a782cb..57fa1cd 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -14,7 +14,7 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 # However, the package prominently contains the COPYING and COPYING.LIB
 # license files (respectively for the GPLv2 and the LGPLv2.1), so we use
 # that as the licensing information.
-DTV_SCAN_TABLES_LICENSE = GPLv2, LGPLv2.1
+DTV_SCAN_TABLES_LICENSE = GPL-2.0, LGPLv2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
 # In order to avoid issues with file name encodings, we rename the
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index cd7f33e..88d8b75 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -7,7 +7,7 @@
 DUMA_VERSION = 2.5.15
 DUMA_SOURCE = duma_$(subst .,_,$(DUMA_VERSION)).tar.gz
 DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/$(DUMA_VERSION)
-DUMA_LICENSE = GPLv2+, LGPLv2.1+
+DUMA_LICENSE = GPL-2.0+, LGPLv2.1+
 DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
 
 DUMA_INSTALL_STAGING = YES
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index c52252c..ad38bb6 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -7,7 +7,7 @@
 DVB_APPS_VERSION = 3d43b280298c39a67d1d889e01e173f52c12da35
 DVB_APPS_SITE = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD = hg
-DVB_APPS_LICENSE = GPLv2, GPLv2+, LGPLv2.1+
+DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPLv2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 ifeq ($(BR2_ENABLE_LOCALE),)
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index ef9a666..1247276 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -7,7 +7,7 @@
 DVBLAST_VERSION = 3.0
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
-DVBLAST_LICENSE = GPLv2+, WTFPL
+DVBLAST_LICENSE = GPL-2.0+, WTFPL
 DVBLAST_LICENSE_FILES = COPYING COPYING.WTFPL
 DVBLAST_DEPENDENCIES = bitstream libev
 
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
index 3bd8f81..fdc483d 100644
--- a/package/dvbsnoop/dvbsnoop.mk
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -6,7 +6,7 @@
 
 DVBSNOOP_VERSION = 1.4.50
 DVBSNOOP_SITE = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
-DVBSNOOP_LICENSE = GPLv2
+DVBSNOOP_LICENSE = GPL-2.0
 DVBSNOOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
index e982a40..689367d 100644
--- a/package/dvdauthor/dvdauthor.mk
+++ b/package/dvdauthor/dvdauthor.mk
@@ -7,7 +7,7 @@
 DVDAUTHOR_VERSION = 0.7.1
 DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
 DVDAUTHOR_DEPENDENCIES = host-pkgconf libxml2 freetype libpng
-DVDAUTHOR_LICENSE = GPLv2+
+DVDAUTHOR_LICENSE = GPL-2.0+
 DVDAUTHOR_LICENSE_FILES = COPYING
 DVDAUTHOR_CONF_ENV = \
 	ac_cv_prog_FREETYPECONFIG=$(STAGING_DIR)/usr/bin/freetype-config \
diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
index 24daac1..5dab546 100644
--- a/package/dvdrw-tools/dvdrw-tools.mk
+++ b/package/dvdrw-tools/dvdrw-tools.mk
@@ -7,7 +7,7 @@
 DVDRW_TOOLS_VERSION = 7.1
 DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
 DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
-DVDRW_TOOLS_LICENSE = GPLv2
+DVDRW_TOOLS_LICENSE = GPL-2.0
 DVDRW_TOOLS_LICENSE_FILES = LICENSE
 DVDRW_TOOLS_DEPENDENCIES = host-m4
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 6659c16..04471c6 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,7 +7,7 @@
 E2FSPROGS_VERSION = 1.43.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
-E2FSPROGS_LICENSE = GPLv2, BSD-3c (libuuid), MIT-like with advertising clause (libss and libet)
+E2FSPROGS_LICENSE = GPL-2.0, BSD-3c (libuuid), MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 1f3bb5c..266d909 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -9,7 +9,7 @@ E2TOOLS_SITE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION))
 
 # Source coming from GitHub, no configure included.
 E2TOOLS_AUTORECONF = YES
-E2TOOLS_LICENSE = GPLv2
+E2TOOLS_LICENSE = GPL-2.0
 E2TOOLS_LICENSE_FILES = COPYING
 E2TOOLS_DEPENDENCIES = e2fsprogs
 E2TOOLS_CONF_ENV = LIBS="-lpthread"
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 6395930..aae0c91 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -7,7 +7,7 @@
 EBTABLES_VERSION = 2.0.10-4
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://ftp.netfilter.org/pub/ebtables
-EBTABLES_LICENSE = GPLv2+
+EBTABLES_LICENSE = GPL-2.0+
 EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_STATIC = $(if $(BR2_STATIC_LIBS),static)
 EBTABLES_K64U32 = $(if $(BR2_KERNEL_64_USERLAND_32),-DKERNEL_64_USERSPACE_32)
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 81a4b4b..334e115 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -7,7 +7,7 @@
 ECRYPTFS_UTILS_VERSION = 109
 ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
-ECRYPTFS_UTILS_LICENSE = GPLv2+
+ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 
 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 93aeb5e..0b0fcc6 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -6,7 +6,7 @@
 
 EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://www.codesink.org/download
-EEPROG_LICENSE = GPLv2+
+EEPROG_LICENSE = GPL-2.0+
 EEPROG_LICENSE_FILES = eeprog.c
 
 define EEPROG_BUILD_CMDS
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 487c8ca..b9b520a 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -6,7 +6,7 @@
 
 EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
-EFIBOOTMGR_LICENSE = GPLv2+
+EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
 EFIBOOTMGR_DEPENDENCIES = efivar $(if $(BR2_NEEDS_GETTEXT),gettext)
 EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index e0ec6d6bc..ee6211d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -7,7 +7,7 @@
 EFL_VERSION = 1.18.4
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
-EFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
+EFL_LICENSE = BSD-2c, LGPLv2.1+, GPL-2.0+
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 1140eb1..6668661 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -7,7 +7,7 @@
 EJABBERD_VERSION = 16.01
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
-EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
+EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
 	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index bd15ea2..1829b10 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -6,7 +6,7 @@
 
 ELF2FLT_VERSION = 9dbc458c6122c495bbdec8dc975a15c9d39e5ff2
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
-ELF2FLT_LICENSE = GPLv2+
+ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
 HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 0bf105e..be6e626 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -8,7 +8,7 @@ ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-ELFUTILS_LICENSE = GPLv2+ or LGPLv3+ (library)
+ELFUTILS_LICENSE = GPL-2.0+ or LGPLv3+ (library)
 ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_DEPENDENCIES = zlib
 HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index bf0bcf7..70d133a 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -6,7 +6,7 @@
 
 EMLOG_VERSION = 576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1
 EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
-EMLOG_LICENSE = GPLv2
+EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
 
 define EMLOG_BUILD_CMDS
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index d2d2626..64a6ad4 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_ICONV_VERSION = 0.9.0
 ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
-ERLANG_P1_ICONV_LICENSE = GPLv2+
+ERLANG_P1_ICONV_LICENSE = GPL-2.0+
 ERLANG_P1_ICONV_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 24075a7..b589721 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_SIP_VERSION = 1.0.0
 ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
-ERLANG_P1_SIP_LICENSE = GPLv2 with OpenSSL exception
+ERLANG_P1_SIP_LICENSE = GPL-2.0 with OpenSSL exception
 ERLANG_P1_SIP_LICENSE_FILES = COPYING
 ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 4d26f91..f9056f5 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_STUN_VERSION = 0.9.0
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
-ERLANG_P1_STUN_LICENSE = GPLv2+
+ERLANG_P1_STUN_LICENSE = GPL-2.0+
 ERLANG_P1_STUN_LICENSE_FILES = COPYING
 ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
 ERLANG_P1_STUN_INSTALL_STAGING = YES
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 77f06e6..b2451df 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_TLS_VERSION = 1.0.0
 ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
-ERLANG_P1_TLS_LICENSE = GPLv2+ with OpenSSL exception
+ERLANG_P1_TLS_LICENSE = GPL-2.0+ with OpenSSL exception
 ERLANG_P1_TLS_LICENSE_FILES = COPYING
 ERLANG_P1_TLS_INSTALL_STAGING = YES
 ERLANG_P1_TLS_DEPENDENCIES = openssl
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 733cf87..c9d9299 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_UTILS_VERSION = 1.0.3
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
-ERLANG_P1_UTILS_LICENSE = GPLv2+
+ERLANG_P1_UTILS_LICENSE = GPL-2.0+
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_UTILS_INSTALL_STAGING = YES
 
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 1f8ae00..89574b8 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -6,7 +6,7 @@
 
 ERLANG_P1_ZLIB_VERSION = 1.0.0
 ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
-ERLANG_P1_ZLIB_LICENSE = GPLv2+
+ERLANG_P1_ZLIB_LICENSE = GPL-2.0+
 ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
 ERLANG_P1_ZLIB_DEPENDENCIES = zlib
 
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index bb3ed92..53cdaba 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -7,7 +7,7 @@
 ETHTOOL_VERSION = 4.8
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
-ETHTOOL_LICENSE = GPLv2
+ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 2f5bd6c..82c11d3 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -6,7 +6,7 @@
 
 EUDEV_VERSION = 3.2.1
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
-EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
+EUDEV_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
diff --git a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk b/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
index 55e26f0..92e8927 100644
--- a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
+++ b/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
@@ -6,6 +6,6 @@
 
 EV3DEV_LINUX_DRIVERS_VERSION = 0e551eb25ae8600c1f178814781bfb42dc835496
 EV3DEV_LINUX_DRIVERS_SITE = $(call github,ev3dev,lego-linux-drivers,$(EV3DEV_LINUX_DRIVERS_VERSION))
-EV3DEV_LINUX_DRIVERS_LICENSE = GPLv2
+EV3DEV_LINUX_DRIVERS_LICENSE = GPL-2.0
 
 $(eval $(generic-package))
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 5ff2bf3..d00d4cb 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -6,7 +6,7 @@
 
 EVTEST_VERSION = 1.33
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
-EVTEST_LICENSE = GPLv2+
+EVTEST_LICENSE = GPL-2.0+
 EVTEST_LICENSE_FILES = COPYING
 EVTEST_DEPENDENCIES = host-pkgconf
 # needed because source package contains no generated files
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8638388..45cb57d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -7,7 +7,7 @@
 EXIM_VERSION = 4.89
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
-EXIM_LICENSE = GPLv2+
+EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
 
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 45f9289..95d03cf 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -20,7 +20,7 @@ EXIV2_LICENSE = commercial
 # of the translated texts.
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_COMMERCIAL=ON -DEXIV2_ENABLE_NLS=OFF
 else
-EXIV2_LICENSE = GPLv2+
+EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
 endif
 
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ac8bd39..9b827df 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -12,7 +12,7 @@ F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
 # GIT version, shipped without configure
 F2FS_TOOLS_AUTORECONF = YES
 F2FS_TOOLS_INSTALL_STAGING = YES
-F2FS_TOOLS_LICENSE = GPLv2
+F2FS_TOOLS_LICENSE = GPL-2.0
 F2FS_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 8c4fc1a..d7b55d3 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -6,7 +6,7 @@
 
 FAAD2_VERSION = 2.7
 FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION)
-FAAD2_LICENSE = GPLv2
+FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
index 61d4bd7..f47a5ee 100644
--- a/package/fakedate/fakedate.mk
+++ b/package/fakedate/fakedate.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # source included in buildroot
-HOST_FAKEDATE_LICENSE = GPLv2+
+HOST_FAKEDATE_LICENSE = GPL-2.0+
 
 define HOST_FAKEDATE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/fakedate
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 292fe17..03879ea 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -6,7 +6,7 @@
 
 FAKETIME_VERSION = v0.9.6
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,$(FAKETIME_VERSION))
-FAKETIME_LICENSE = GPLv2
+FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
 
 define HOST_FAKETIME_BUILD_CMDS
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
index 4232286..53533a8 100644
--- a/package/fan-ctrl/fan-ctrl.mk
+++ b/package/fan-ctrl/fan-ctrl.mk
@@ -8,7 +8,7 @@
 FAN_CTRL_VERSION = 1.3
 FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
 FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
-FAN_CTRL_LICENSE = GPLv2+
+FAN_CTRL_LICENSE = GPL-2.0+
 FAN_CTRL_LICENSE_FILES = fan-ctrl.c
 
 define FAN_CTRL_EXTRACT_CMDS
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 9cd0aec..1ab7b2f 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -6,7 +6,7 @@
 
 FB_TEST_APP_VERSION = rosetta-1.1.0
 FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
-FB_TEST_APP_LICENSE = GPLv2
+FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
 define FB_TEST_APP_BUILD_CMDS
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 9295acd..301dd4f 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -6,7 +6,7 @@
 
 FBDUMP_VERSION = 0.4.2
 FBDUMP_SITE = http://www.rcdrummond.net/fbdump
-FBDUMP_LICENSE = GPLv2
+FBDUMP_LICENSE = GPL-2.0
 FBDUMP_LICENSE_FILES = COPYING
 
 # The VGA16 specific feature of fbdump doesn't make much sense outside
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 4455423..15e0a95 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -7,7 +7,7 @@
 FBGRAB_VERSION = 1.3
 FBGRAB_SITE = http://fbgrab.monells.se
 FBGRAB_DEPENDENCIES = libpng
-FBGRAB_LICENSE = GPLv2
+FBGRAB_LICENSE = GPL-2.0
 FBGRAB_LICENSE_FILES = COPYING
 
 define FBGRAB_BUILD_CMDS
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 16581c4..d6ee104 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -7,7 +7,7 @@
 FBSET_VERSION = 2.1
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
-FBSET_LICENSE = GPLv2
+FBSET_LICENSE = GPL-2.0
 
 # Make sure full fbset wins over busybox fbset
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index be3cbe2..712d4f9 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -6,7 +6,7 @@
 
 FBTERM_VERSION = 1.7.0
 FBTERM_SITE = https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/fbterm
-FBTERM_LICENSE = GPLv2+
+FBTERM_LICENSE = GPL-2.0+
 FBTERM_LICENSE_FILES = COPYING
 FBTERM_DEPENDENCIES = fontconfig liberation
 
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
index 913627d..b935e74 100644
--- a/package/fbtft/fbtft.mk
+++ b/package/fbtft/fbtft.mk
@@ -6,6 +6,6 @@
 
 FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
 FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
-FBTFT_LICENSE = GPLv2
+FBTFT_LICENSE = GPL-2.0
 
 $(eval $(generic-package))
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index d12b9f4..a69e4ad 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -7,7 +7,7 @@
 FBV_VERSION = 1.0b
 FBV_SITE = http://s-tech.elsat.net.pl/fbv
 
-FBV_LICENSE = GPLv2
+FBV_LICENSE = GPL-2.0
 FBV_LICENSE_FILES = COPYING
 
 ### image format dependencies and configure options
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 509fc2c..1e6fbb4 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -8,7 +8,7 @@ FCONFIG_VERSION = 20080329
 # Real upstream location has been disabled
 # FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
 FCONFIG_SITE = http://sources.buildroot.net
-FCONFIG_LICENSE = GPLv2+
+FCONFIG_LICENSE = GPL-2.0+
 FCONFIG_LICENSE_FILES = fconfig.c
 
 define FCONFIG_BUILD_CMDS
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 6aa0a2c..2c3786f 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -8,7 +8,7 @@ FETCHMAIL_VERSION_MAJOR = 6.3
 FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).26
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
-FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
+FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_AUTORECONF = YES
 FETCHMAIL_GETTEXTIZE = YES
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 449cca2..c181dfa 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -12,7 +12,7 @@ FFMPEG_INSTALL_STAGING = YES
 FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
 FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
-FFMPEG_LICENSE += and GPLv2+
+FFMPEG_LICENSE += and GPL-2.0+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5bd39a8..671c99b 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -7,7 +7,7 @@
 FFTW_VERSION = 3.3.4
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
-FFTW_LICENSE = GPLv2+
+FFTW_LICENSE = GPL-2.0+
 FFTW_LICENSE_FILES = COPYING
 
 # fortran support only enables generation and installation of fortran sources
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 5c02bc9..e7e9fbe 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -6,7 +6,7 @@
 
 FIO_VERSION = fio-2.13
 FIO_SITE = git://git.kernel.dk/fio.git
-FIO_LICENSE = GPLv2 + special obligations
+FIO_LICENSE = GPL-2.0 + special obligations
 FIO_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
diff --git a/package/firejail/firejail.mk b/package/firejail/firejail.mk
index c1fab29..858f547 100644
--- a/package/firejail/firejail.mk
+++ b/package/firejail/firejail.mk
@@ -7,7 +7,7 @@
 FIREJAIL_VERSION = 0.9.44.8
 FIREJAIL_SITE = http://download.sourceforge.net/firejail
 FIREJAIL_SOURCE = firejail-$(FIREJAIL_VERSION).tar.xz
-FIREJAIL_LICENSE = GPLv2+
+FIREJAIL_LICENSE = GPL-2.0+
 FIREJAIL_LICENSE_FILES = COPYING
 
 FIREJAIL_CONF_OPTS = \
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index 876b127..6d3a227 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -7,7 +7,7 @@
 FIS_SITE = http://svn.chezphil.org/utils/trunk
 FIS_SITE_METHOD = svn
 FIS_VERSION = 2892
-FIS_LICENSE = GPLv2+
+FIS_LICENSE = GPL-2.0+
 FIS_LICENSE_FILES = fis.c
 
 define FIS_BUILD_CMDS
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 43e0410..639636e 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -9,7 +9,7 @@ FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-FLAC_LICENSE = Xiph BSD-like (libFLAC), GPLv2+ (tools), LGPLv2.1+ (other libraries)
+FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPLv2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
 # 0001-configure.ac-relax-linux-OS-detection.patch patches configure.ac
 FLAC_AUTORECONF = YES
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index 6759338..cbcf9ea 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -6,7 +6,7 @@
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
 FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
-FLASHBENCH_LICENSE = GPLv2
+FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
 FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 7e0fcf2..0b89bf3 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -8,7 +8,7 @@ FLASHROM_VERSION = 0.9.8
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
-FLASHROM_LICENSE = GPLv2+
+FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
 define FLASHROM_BUILD_CMDS
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index ce836f7..87af8f4 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -6,7 +6,7 @@
 
 FLICKCURL_VERSION = 1.26
 FLICKCURL_SITE = http://download.dajobe.org/flickcurl
-FLICKCURL_LICENSE = LGPLv2.1+ or GPLv2+ or Apache 2.0+
+FLICKCURL_LICENSE = LGPLv2.1+ or GPL-2.0+ or Apache 2.0+
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
 FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 16e8176..e75eeff 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -6,7 +6,7 @@
 
 FMLIB_VERSION = fsl-sdk-v2.0
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
-FMLIB_LICENSE = BSD-3c, GPLv2+
+FMLIB_LICENSE = BSD-3c, GPL-2.0+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index 4b1b64f..890fae1 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -6,7 +6,7 @@
 
 FMTOOLS_VERSION = 2.0.7
 FMTOOLS_SITE = http://benpfaff.org/fmtools
-FMTOOLS_LICENSE = GPLv2+
+FMTOOLS_LICENSE = GPL-2.0+
 FMTOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 8f490c2..897820d 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -6,7 +6,7 @@
 
 IMX_KOBS_VERSION = b402243a04e5a6760a860445e5ff6a931d86f794
 IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
-IMX_KOBS_LICENSE = GPLv2+
+IMX_KOBS_LICENSE = GPL-2.0+
 IMX_KOBS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
index 12d9312..c05cee3 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.mk
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -6,7 +6,7 @@
 
 IMX_UUC_VERSION = 3440b1108373e79669cc17ba1d2be91a123a2053
 IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
-IMX_UUC_LICENSE = GPLv2+
+IMX_UUC_LICENSE = GPL-2.0+
 IMX_UUC_LICENSE_FILES = COPYING
 
 # mkfs.vfat is needed to create a FAT partition used by g_mass_storage
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index bcbd8d2..d232134 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -7,7 +7,7 @@
 KERNEL_MODULE_IMX_GPU_VIV_VERSION = bfa78b095a892705a09afe9514fc5d236b3124d2
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
-KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
+KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE_FILES = COPYING
 
 KERNEL_MODULE_IMX_GPU_VIV_MODULE_MAKE_OPTS = \
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 9484758..da9e900 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,7 +9,7 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
-FREETYPE_LICENSE = Dual FTL/GPLv2+
+FREETYPE_LICENSE = Dual FTL/GPL-2.0+
 FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 8cb40d6..4b47b3e 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -6,7 +6,7 @@
 
 FSWEBCAM_VERSION = 20140113
 FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
-FSWEBCAM_LICENSE = GPLv2
+FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
 
 FSWEBCAM_DEPENDENCIES += freetype jpeg libpng gd
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 984e368..550536e 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -7,7 +7,7 @@
 FWTS_VERSION = V16.11.00
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-FWTS_LICENSE = GPLv2, LGPLv2.1, Custom
+FWTS_LICENSE = GPL-2.0, LGPLv2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 \
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index b34dccd..94b11d0 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -6,7 +6,7 @@
 
 FXLOAD_VERSION = 2008_10_13
 FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FXLOAD_VERSION)
-FXLOAD_LICENSE = GPLv2+
+FXLOAD_LICENSE = GPL-2.0+
 FXLOAD_LICENSE_FILES = COPYING
 
 define FXLOAD_BUILD_CMDS
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1218f11..8067b63 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -20,7 +20,7 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-GDB_LICENSE = GPLv2+, LGPLv2+, GPLv3+, LGPLv3+
+GDB_LICENSE = GPL-2.0+, LGPLv2+, GPLv3+, LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 528912e..dd907c8 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -6,7 +6,7 @@
 
 GENEXT2FS_VERSION = 1.4.1
 GENEXT2FS_SITE = http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
-GENEXT2FS_LICENSE = GPLv2
+GENEXT2FS_LICENSE = GPL-2.0
 GENEXT2FS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 4343d14..2e7aad2 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -8,7 +8,7 @@ GENIMAGE_VERSION = 9
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-GENIMAGE_LICENSE = GPLv2
+GENIMAGE_LICENSE = GPL-2.0
 GENIMAGE_LICENSE_FILES = COPYING
 
 $(eval $(host-autotools-package))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 8db0899..3025550 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -6,7 +6,7 @@
 
 GENROMFS_VERSION = 0.5.2
 GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
-GENROMFS_LICENSE = GPLv2+
+GENROMFS_LICENSE = GPL-2.0+
 GENROMFS_LICENSE_FILES = COPYING
 
 define GENROMFS_BUILD_CMDS
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 25c947a..27a1ec3 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -7,7 +7,7 @@
 GESFTPSERVER_VERSION = 0.2.1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
-GESFTPSERVER_LICENSE = GPLv2+
+GESFTPSERVER_LICENSE = GPL-2.0+
 GESFTPSERVER_LICENSE_FILES = COPYING
 # forgets to link against pthread when cross compiling
 GESFTPSERVER_CONF_ENV = LIBS=-lpthread
diff --git a/package/ghostscript-fonts/ghostscript-fonts.mk b/package/ghostscript-fonts/ghostscript-fonts.mk
index fa5c4b7..156eb4c 100644
--- a/package/ghostscript-fonts/ghostscript-fonts.mk
+++ b/package/ghostscript-fonts/ghostscript-fonts.mk
@@ -7,7 +7,7 @@
 GHOSTSCRIPT_FONTS_VERSION = 8.11
 GHOSTSCRIPT_FONTS_SITE = http://downloads.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29
 GHOSTSCRIPT_FONTS_SOURCE = ghostscript-fonts-std-$(GHOSTSCRIPT_FONTS_VERSION).tar.gz
-GHOSTSCRIPT_FONTS_LICENSE = GPLv2
+GHOSTSCRIPT_FONTS_LICENSE = GPL-2.0
 GHOSTSCRIPT_FONTS_LICENSE_FILES = COPYING
 
 GHOSTSCRIPT_FONTS_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/gs
diff --git a/package/git/git.mk b/package/git/git.mk
index b49ddd5..9a14fdc 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -7,7 +7,7 @@
 GIT_VERSION = 2.12.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
-GIT_LICENSE = GPLv2, LGPLv2.1+
+GIT_LICENSE = GPL-2.0, LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ee52539..44e7459 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -9,7 +9,7 @@ GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
 
-GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
+GLIBC_LICENSE = GPL-2.0+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
 # glibc is part of the toolchain so disable the toolchain dependency
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 0daca58..d579a0c 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -6,7 +6,7 @@
 
 GLIBMM_VERSION_MAJOR = 2.50
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
-GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+GLIBMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
 GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 33b5d54..d85ab81 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,7 +8,7 @@ GMP_VERSION = 6.1.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
-GMP_LICENSE = LGPLv3+ or GPLv2+
+GMP_LICENSE = LGPLv3+ or GPL-2.0+
 GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 03d95d4..7ba86a7 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -8,7 +8,7 @@ GMPC_VERSION = 11.8.16
 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
 GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
-GMPC_LICENSE = GPLv2+
+GMPC_LICENSE = GPL-2.0+
 GMPC_LICENSE_FILES = COPYING
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 24608a1..98d5e0b 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -9,7 +9,7 @@ GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RE
 # Original distribution does not have default configure,
 # so we need to autoreconf:
 GMRENDER_RESURRECT_AUTORECONF = YES
-GMRENDER_RESURRECT_LICENSE = GPLv2+
+GMRENDER_RESURRECT_LICENSE = GPL-2.0+
 GMRENDER_RESURRECT_LICENSE_FILES = COPYING
 GMRENDER_RESURRECT_DEPENDENCIES = gstreamer1 libupnp
 
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index a11ff81..5ac615e 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -8,7 +8,7 @@ GNU_EFI_VERSION = 3.0.1
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = BSD-3c and/or GPLv2+ (gnuefi), BSD-3c (efilib)
+GNU_EFI_LICENSE = BSD-3c and/or GPL-2.0+ (gnuefi), BSD-3c (efilib)
 GNU_EFI_LICENSE_FILES = README.efilib
 
 # gnu-efi is a set of library and header files used to build
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index e066b01..0103367 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -6,7 +6,7 @@
 
 GNUCHESS_VERSION = 6.2.4
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
-GNUCHESS_LICENSE = GPLv2+
+GNUCHESS_LICENSE = GPL-2.0+
 GNUCHESS_LICENSE_FILES = COPYING
 
 GNUCHESS_DEPENDENCIES = host-flex flex
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index ed4c1fd..f59d059 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -7,7 +7,7 @@
 GPM_VERSION = 1.20.7
 GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
-GPM_LICENSE = GPLv2+
+GPM_LICENSE = GPL-2.0+
 GPM_LICENSE_FILES = COPYING
 GPM_INSTALL_STAGING = YES
 GPM_DEPENDENCIES = host-bison
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 274591c..56be765 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -6,7 +6,7 @@
 
 GPTFDISK_VERSION = 1.0.0
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
-GPTFDISK_LICENSE = GPLv2+
+GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
 
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 8962025..0837630 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -8,7 +8,7 @@ GQVIEW_VERSION = 2.1.5
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 GQVIEW_CONF_ENV = LIBS="-lm"
-GQVIEW_LICENSE = GPLv2
+GQVIEW_LICENSE = GPL-2.0
 GQVIEW_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index b1d8f8b..e178dbc 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -12,7 +12,7 @@ GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
 
 ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
 GST_FFMPEG_CONF_OPTS += --disable-lgpl
-GST_FFMPEG_LICENSE = GPLv2+ (gst-ffmpeg), GPLv2+/GPLv3+ (libav)
+GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPLv3+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
 else
 GST_FFMPEG_CONF_OPTS += --enable-lgpl
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 98e5c1c..9296dab 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -8,7 +8,7 @@ GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 # COPYING.LIB is in fact v2, but most of the code is v2.1+
-GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPLv2+
+GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPL-2.0+
 GST_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB COPYING
 
 GST_PLUGINS_BAD_CONF_OPTS = \
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index 51c22a9..d1738c5 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -8,7 +8,7 @@ GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
-GST_PLUGINS_BASE_LICENSE = GPLv2+, LGPLv2+
+GST_PLUGINS_BASE_LICENSE = GPL-2.0+, LGPLv2+
 GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
 
 # freetype is only used by examples, but if it is not found
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index 0f56164..d145430 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -10,7 +10,7 @@ GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST_PLUGINS_UGLY_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-ugly0.10/cdio-cd-text-api.patch
 # COPYING is in fact LGPLv2.1, but all of the code is v2+
 # (except for one test, xingmux)
-GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPLv2+ (synaesthesia)
+GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPL-2.0+ (synaesthesia)
 GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
 
 GST_PLUGINS_UGLY_CONF_OPTS = \
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 5726bb5..41c19d1 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -12,7 +12,7 @@ GST1_LIBAV_DEPENDENCIES = \
 	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_XZ),xz)
-GST1_LIBAV_LICENSE = GPLv2+
+GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index d503555..16ba229 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -110,7 +110,7 @@ endif
 
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
-GST1_PLUGINS_UGLY_LICENSE += GPLv2
+GST1_PLUGINS_UGLY_LICENSE += GPL-2.0
 endif
 
 # Use the following command to extract license info for plugins.
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 57b9b1f..81a933b 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -8,7 +8,7 @@ GTKMM3_VERSION_MAJOR = 3.22
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
-GTKMM3_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+GTKMM3_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
 GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 0542a26..1d1230f 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -8,7 +8,7 @@ GTKPERF_VERSION = 0.40
 GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
 GTKPERF_DEPENDENCIES = libgtk2
-GTKPERF_LICENSE = GPLv2
+GTKPERF_LICENSE = GPL-2.0
 GTKPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 07b5d3c..b64a138 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -9,7 +9,7 @@ GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).13
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-GUPNP_TOOLS_LICENSE = GPLv2+
+GUPNP_TOOLS_LICENSE = GPL-2.0+
 GUPNP_TOOLS_LICENSE_FILES = COPYING
 GUPNP_TOOLS_INSTALL_STAGING = YES
 GUPNP_TOOLS_DEPENDENCIES = \
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 8ee2406..99d1f43 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -8,7 +8,7 @@ GUTENPRINT_VERSION_MAJOR = 5.2
 GUTENPRINT_VERSION = $(GUTENPRINT_VERSION_MAJOR).11
 GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-$(GUTENPRINT_VERSION_MAJOR)/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
-GUTENPRINT_LICENSE = GPLv2+
+GUTENPRINT_LICENSE = GPL-2.0+
 GUTENPRINT_LICENSE_FILES = COPYING
 
 # Needed, as we touch Makefile.am and configure.ac
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 93d64c8..4c24b9b 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -6,7 +6,7 @@
 
 HASERL_VERSION = 0.9.35
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
-HASERL_LICENSE = GPLv2
+HASERL_LICENSE = GPL-2.0
 HASERL_LICENSE_FILES = COPYING
 HASERL_DEPENDENCIES = host-pkgconf
 
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index abe57b7..f5bdf4b 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -7,7 +7,7 @@
 HIAWATHA_VERSION = 10.5
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
-HIAWATHA_LICENSE = GPLv2
+HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index 5e00074..dec75c1 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -7,7 +7,7 @@
 HICOLOR_ICON_THEME_VERSION = 0.15
 HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
 HICOLOR_ICON_THEME_SOURCE = hicolor-icon-theme-$(HICOLOR_ICON_THEME_VERSION).tar.xz
-HICOLOR_ICON_THEME_LICENSE = GPLv2
+HICOLOR_ICON_THEME_LICENSE = GPL-2.0
 HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index cd1be04..5f9aa6f 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -8,7 +8,7 @@ HPLIP_VERSION = 3.16.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
-HPLIP_LICENSE = GPLv2, BSD-3c, MIT
+HPLIP_LICENSE = GPL-2.0, BSD-3c, MIT
 HPLIP_LICENSE_FILES = COPYING
 
 HPLIP_CONF_OPTS = \
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index dd3bed4..d06e4a5 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -9,7 +9,7 @@ HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-HTOP_LICENSE = GPLv2
+HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 3418ffa..e1c686f 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -7,7 +7,7 @@
 HTTPING_VERSION = 2.5
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
-HTTPING_LICENSE = GPLv2
+HTTPING_LICENSE = GPL-2.0
 HTTPING_LICENSE_FILES = license.txt
 HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
 	$(if $(BR2_NEEDS_GETTEXT),-lintl) \
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index f8cffcd..4ad8d42 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,7 +8,7 @@ HWDATA_VERSION = 0.267
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
 HWDATA_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/hwdata
-HWDATA_LICENSE = GPLv2+ or XFree86 1.0 license
+HWDATA_LICENSE = GPL-2.0+ or XFree86 1.0 license
 HWDATA_LICENSE_FILES = COPYING LICENSE
 
 define HWDATA_INSTALL_TARGET_CMDS
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index e16b940..1995ca2 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -6,7 +6,7 @@
 
 I2C_TOOLS_VERSION = v3.1.2
 I2C_TOOLS_SITE = git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
-I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
+I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
diff --git a/package/i7z/i7z.mk b/package/i7z/i7z.mk
index e21fd9f..9c2c673 100644
--- a/package/i7z/i7z.mk
+++ b/package/i7z/i7z.mk
@@ -6,7 +6,7 @@
 
 I7Z_VERSION = 5023138d7c35c4667c938b853e5ea89737334e92
 I7Z_SITE = $(call github,ajaiantilal,i7z,$(I7Z_VERSION))
-I7Z_LICENSE = GPLv2
+I7Z_LICENSE = GPL-2.0
 I7Z_LICENSE_FILES = COPYING
 I7Z_DEPENDENCIES = ncurses
 
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 9f0feba..b569320 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -6,7 +6,7 @@
 
 IFPLUGD_VERSION = 0.28
 IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
-IFPLUGD_LICENSE = GPLv2
+IFPLUGD_LICENSE = GPL-2.0
 IFPLUGD_LICENSE_FILES = LICENSE
 IFPLUGD_AUTORECONF = YES
 
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index 042f2b2..664c725 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -7,7 +7,7 @@
 IFTOP_VERSION = 1.0pre4
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download
 IFTOP_DEPENDENCIES = ncurses libpcap
-IFTOP_LICENSE = GPLv2+
+IFTOP_LICENSE = GPL-2.0+
 IFTOP_LICENSE_FILES = COPYING
 
 IFTOP_LIBS = -lpcap
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index ad0e513..dfc3f3c 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -8,7 +8,7 @@ IFUPDOWN_VERSION = 0.8.16
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
 IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-IFUPDOWN_LICENSE = GPLv2+
+IFUPDOWN_LICENSE = GPL-2.0+
 IFUPDOWN_LICENSE_FILES = COPYING
 
 define IFUPDOWN_BUILD_CMDS
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 8944c05..68b64f1 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -7,7 +7,7 @@
 IGD2_FOR_LINUX_VERSION = v1.2
 IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
 
-IGD2_FOR_LINUX_LICENSE = GPLv2
+IGD2_FOR_LINUX_LICENSE = GPL-2.0
 IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
 
 IGD2_FOR_LINUX_DEPENDENCIES = libupnp
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 32c49a3..075ce97 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -7,7 +7,7 @@
 IGH_ETHERCAT_VERSION = 1.5.2
 IGH_ETHERCAT_SITE = http://etherlab.org/download/ethercat
 IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
-IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
+IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
 IGH_ETHERCAT_INSTALL_STAGING = YES
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 9816872..545a17e 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -7,7 +7,7 @@
 IGMPPROXY_VERSION = a731683d1a65956fa05024b0597b105fe6a3a122
 IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
 IGMPPROXY_AUTORECONF = YES
-IGMPPROXY_LICENSE = GPLv2+
+IGMPPROXY_LICENSE = GPL-2.0+
 IGMPPROXY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index f23955b..5e26785 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -6,7 +6,7 @@
 
 INADYN_VERSION = v2.0
 INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
-INADYN_LICENSE = GPLv2+
+INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
 INADYN_AUTORECONF = YES
 INADYN_DEPENDENCIES = host-pkgconf libconfuse libite
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 81e913d..6189b3e 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -8,7 +8,7 @@ INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
 INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20101023T043132Z/pool/main/j/joystick
-INPUT_TOOLS_LICENSE = GPLv2+
+INPUT_TOOLS_LICENSE = GPL-2.0+
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index dbef80f..8595544 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -6,7 +6,7 @@
 
 INTLTOOL_VERSION = 0.51.0
 INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+download
-INTLTOOL_LICENSE = GPLv2+
+INTLTOOL_LICENSE = GPL-2.0+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
diff --git a/package/iotop/iotop.mk b/package/iotop/iotop.mk
index 31787c5..8b55649 100644
--- a/package/iotop/iotop.mk
+++ b/package/iotop/iotop.mk
@@ -6,7 +6,7 @@
 
 IOTOP_VERSION = 0.6
 IOTOP_SITE = http://guichaz.free.fr/iotop/files
-IOTOP_LICENSE = GPLv2+
+IOTOP_LICENSE = GPL-2.0+
 IOTOP_LICENSE_FILES = COPYING
 IOTOP_SETUP_TYPE = distutils
 
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 5ea5299..6ecfc09 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -9,7 +9,7 @@ IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
-IPROUTE2_LICENSE = GPLv2
+IPROUTE2_LICENSE = GPL-2.0
 IPROUTE2_LICENSE_FILES = COPYING
 
 # If both iproute2 and busybox are selected, make certain we win
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d4b01d9..88415f6 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -9,7 +9,7 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPTS = --with-kmod=no
-IPSET_LICENSE = GPLv2
+IPSET_LICENSE = GPL-2.0
 IPSET_LICENSE_FILES = COPYING
 IPSET_INSTALL_STAGING = YES
 
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 90fab34..44cfde2 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -10,7 +10,7 @@ IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
 IPTABLES_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
-IPTABLES_LICENSE = GPLv2
+IPTABLES_LICENSE = GPL-2.0
 IPTABLES_LICENSE_FILES = COPYING
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index a36c708..ac572b9 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -6,7 +6,7 @@
 
 IPTRAF_NG_VERSION = 1.1.4
 IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
-IPTRAF_NG_LICENSE = GPLv2+
+IPTRAF_NG_LICENSE = GPL-2.0+
 IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
 
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 21f5dcb..34c0a27 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -13,7 +13,7 @@
 
 IPUTILS_VERSION = 55828d1fef3fed7f07abcbf7be9282a9662e78c7
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
-IPUTILS_LICENSE = GPLv2+, BSD-3c, BSD-4c
+IPUTILS_LICENSE = GPL-2.0+, BSD-3c, BSD-4c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
index b3981fa..5ceaaf4 100644
--- a/package/iqvlinux/iqvlinux.mk
+++ b/package/iqvlinux/iqvlinux.mk
@@ -8,7 +8,7 @@ IQVLINUX_VERSION = 1.1.5.3
 IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
 IQVLINUX_SOURCE = iqvlinux.tar.gz
 
-IQVLINUX_LICENSE = GPLv2, BSD-3c
+IQVLINUX_LICENSE = GPL-2.0, BSD-3c
 IQVLINUX_LICENSE_FILES = \
 	COPYING src/linux/driver/files.txt \
 	inc/linux/files.txt inc/files.txt
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 4b17007..18a3e58 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -6,7 +6,7 @@
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
-IRDA_UTILS_LICENSE = GPLv2+
+IRDA_UTILS_LICENSE = GPL-2.0+
 IRDA_UTILS_LICENSE_FILES = man/COPYING
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 1872c88..e4e6078 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -6,7 +6,7 @@
 
 IRQBALANCE_VERSION = v1.0.9
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
-IRQBALANCE_LICENSE = GPLv2
+IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
 IRQBALANCE_DEPENDENCIES = host-pkgconf
 # Autoreconf needed because package is distributed without a configure script
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index dfb1e28..1fe4de8 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -9,7 +9,7 @@ IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
 IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
-IRSSI_LICENSE = GPLv2+
+IRSSI_LICENSE = GPL-2.0+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index cee0572..f28698b 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -11,7 +11,7 @@ ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
-IUCODE_TOOL_LICENSE = GPLv2+
+IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 
 define IUCODE_TOOL_INSTALL_INIT_SYSV
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 23c9723..c877528 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -6,7 +6,7 @@
 
 JACK2_VERSION = v1.9.10
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
-JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
+JACK2_LICENSE = GPL-2.0+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
 JACK2_PATCH = https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645.patch
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index ee80c80..3fcf460 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -6,7 +6,7 @@
 
 JAMVM_VERSION = 2.0.0
 JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
-JAMVM_LICENSE = GPLv2+
+JAMVM_LICENSE = GPL-2.0+
 JAMVM_LICENSE_FILES = COPYING
 JAMVM_DEPENDENCIES = zlib classpath
 # For 0001-Use-fenv.h-when-available-instead-of-fpu_control.h.patch
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index 5529f55..c325c5c 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -6,7 +6,7 @@
 
 JO_VERSION = 1.0
 JO_SITE = https://github.com/jpmens/jo/releases/download/v$(JO_VERSION)
-JO_LICENSE = MIT (json.[ch]), GPLv2+ (rest)
+JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
 # don't build man pages
 JO_CONF_ENV = ac_cv_path_PANDOC=''
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 0243c53..175a237 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -13,7 +13,7 @@ KBD_CONF_OPTS = \
 KBD_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkgconf
-KBD_LICENSE = GPLv2+
+KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 35e666a..59d3cb5 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -7,7 +7,7 @@
 KEEPALIVED_VERSION = 1.3.5
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
-KEEPALIVED_LICENSE = GPLv2+
+KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index b1b66fd..76b6819 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -6,7 +6,7 @@
 
 KEXEC_LITE_VERSION = 86e45a47e8cc1f598ccfa9b873a23067f4ecc36f
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
-KEXEC_LITE_LICENSE = GPLv2+
+KEXEC_LITE_LICENSE = GPL-2.0+
 KEXEC_LITE_LICENSE_FILES = COPYING
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
 
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 0a8e9f0..7564103 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -7,7 +7,7 @@
 KEXEC_VERSION = 2.0.14
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
-KEXEC_LICENSE = GPLv2
+KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
 
 # Makefile expects $STRIP -o to work, so needed for BR2_STRIP_none
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 4a8dbac..b7f08ce 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -7,7 +7,7 @@
 KEYUTILS_VERSION = 1.5.9
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE = GPLv2+, LGPLv2.1+
+KEYUTILS_LICENSE = GPL-2.0+, LGPLv2.1+
 KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f4a28b8..8abf712 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -9,7 +9,7 @@ KISMET_SITE = http://www.kismetwireless.net/kismet.git
 KISMET_SITE_METHOD = git
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPTS += --with-netlink-version=3
-KISMET_LICENSE = GPLv2+
+KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = debian/copyright
 
 # We touch configure.in:
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index b6553bd..e2fbfa8 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -46,7 +46,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
-KMOD_LICENSE := $(KMOD_LICENSE), GPLv2+ (tools)
+KMOD_LICENSE := $(KMOD_LICENSE), GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
 # take precedence over busybox implementation
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 2ab8d1b..55f5bfd 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -7,7 +7,7 @@
 KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
 KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
 KNOCK_AUTORECONF = YES
-KNOCK_LICENSE = GPLv2+
+KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
 
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 581223c..d29e07c 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_MODPLUG_VERSION = 03b772da7ea44ff3c34b322989254cd1e4732443
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
-KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
+KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
 KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
 
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 49688a4..6aa268e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_NOSEFART_VERSION = bfab543bae0d9855538cf03e78ea9cd5e3b9750e
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
-KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
+KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
 KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
index efe17f3..828b9f0 100644
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_OPUS_VERSION = 0bd11e35e6ed8b6480e4100ac8927113cb085eda
 KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AUDIODECODER_OPUS_VERSION))
-KODI_AUDIODECODER_OPUS_LICENSE = GPLv2+
+KODI_AUDIODECODER_OPUS_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
 KODI_AUDIODECODER_OPUS_DEPENDENCIES = kodi-platform libogg opus opusfile
 
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d8cf438..54df9a1 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_SIDPLAY_VERSION = d832f050211b4e5f085a8b09bc7d26ce32098169
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
-KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
+KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
 KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
 
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index f9f398c..9ffb004 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_SNESAPU_VERSION = db62e88e568994a0496d7026a10e044d70b3aa2b
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
-KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
+KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
 KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 7601089..5fcfe71 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_STSOUND_VERSION = 759ae7eadb94adfde8533a2a42d949c321718625
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
-KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
+KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
 KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index fb680d1..0d5f6ef 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_TIMIDITY_VERSION = a84559da92aa67744069fc9e9dc885732588c8ce
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
-KODI_AUDIODECODER_TIMIDITY_LICENSE = GPLv2+
+KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 447d837..68f5884 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIODECODER_VGMSTREAM_VERSION = cb2892ac0465b0563ee45f532323198a6f722b62
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
-KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
+KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
 KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index ca48826..402db10 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIOENCODER_FLAC_VERSION = v1.0.0
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
-KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
+KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
 
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 3e1836f..1edefa4 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIOENCODER_LAME_VERSION = v1.0.0
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
-KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
+KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 749ea8e..f6db818 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIOENCODER_VORBIS_VERSION = v1.0.0
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
-KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
+KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
 
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 661ab44..9005bf3 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -6,7 +6,7 @@
 
 KODI_AUDIOENCODER_WAV_VERSION = v1.0.0
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
-KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
+KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
 
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 4b642f9..9658918 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -6,7 +6,7 @@
 
 KODI_PLATFORM_VERSION = 45d6ad1984fdb1dc855076ff18484dbec33939d1
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
-KODI_PLATFORM_LICENSE = GPLv2+
+KODI_PLATFORM_LICENSE = GPL-2.0+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
 KODI_PLATFORM_INSTALL_STAGING = YES
 KODI_PLATFORM_DEPENDENCIES = libplatform kodi
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 3c0f40a..2250511 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_ARGUSTV_VERSION = 2aca01c6db28fe3145b57eb5bf5841895c618507
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
-KODI_PVR_ARGUSTV_LICENSE = GPLv2+
+KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
 KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
 
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 75ce621..59c8926 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_DVBLINK_VERSION = 06c4e5603e4db0bda3f35e80344a308f486ae0f9
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
-KODI_PVR_DVBLINK_LICENSE = GPLv2+
+KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
 KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
 
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index b2fae52..66a7496 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_DVBVIEWER_VERSION = 26286604635a170eeea68df9b7eb52fea0056cfe
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
-KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
+KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
 KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 0174aa4..fcf8a28 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_FILMON_VERSION = 4b34b41999b86e675f794ec8e5a63c85b78c001e
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
-KODI_PVR_FILMON_LICENSE = GPLv2+
+KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
 KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
 
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 67980fb..821ab36 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_HDHOMERUN_VERSION = aa4324eaa5f738394f21d3f54667e346eb65038e
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
-KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
+KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
 KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
 
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 4ca5a31..5a6a36c 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_HTS_VERSION = 3c673b5b29fc26c203c79f7df58680af50a1afa7
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
-KODI_PVR_HTS_LICENSE = GPLv2+
+KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
 KODI_PVR_HTS_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 85039dd..fd1e053 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_IPTVSIMPLE_VERSION = ae9bc1d94e97c5381b2fa59adac70a57146016cd
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
-KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
+KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
 KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index e3a4df4..36b5227 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = a3dd464379a56131bae61b94275c14a3abcf2869
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
-KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
 KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index a8a1a6d..2c5d07a 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_MYTHTV_VERSION = 84b0b6b122ca779588de5c895ef77b6bc454e859
 KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
-KODI_PVR_MYTHTV_LICENSE = GPLv2+
+KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
 KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index a8b8235..a4df90e 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_NEXTPVR_VERSION = 2055105c93e18e04e73c87578bece3edf7525e14
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
-KODI_PVR_NEXTPVR_LICENSE = GPLv2+
+KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
 KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 0f2eecd..9e4a783 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_NJOY_VERSION = 480c1591d486c6166746fb8b5efc68a7aca3d0f0
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
-KODI_PVR_NJOY_LICENSE = GPLv2+
+KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = src/client.h
 KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index a9824d5..fabfee9 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_PCTV_VERSION = 0096770e96f84c46f444e159b9b737ac8b4238dc
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
-KODI_PVR_PCTV_LICENSE = GPLv2+
+KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
 KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
 
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index d1fa8a0..ba39152 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_STALKER_VERSION = 5e588330c453141ae0a2f4fd9c02d909ac9d199e
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
-KODI_PVR_STALKER_LICENSE = GPLv2+
+KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
 KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform
 
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 593c1e7..8da35a4 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_VBOX_VERSION = 15e864d160da5a051e18aef06f3a53e49808be02
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
-KODI_PVR_VBOX_LICENSE = GPLv2+
+KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
 KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index f8e1e92..36bba66 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_VDR_VNSI_VERSION = 7e11b853637ec436e30e4ac826de6ee87c303482
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
-KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
+KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
 KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index e839bcc..7ac2a13 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_VUPLUS_VERSION = 815ea2f303dbe7dd19f87c53965dfdf2358fcdc8
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
-KODI_PVR_VUPLUS_LICENSE = GPLv2+
+KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
 KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 194bd1f..031df6a 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -8,7 +8,7 @@
 # When Kodi is updated, then this should be updated to the corresponding branch
 KODI_PVR_WMC_VERSION = 949fcd162206b569af15942180e6c133ad61e336
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
-KODI_PVR_WMC_LICENSE = GPLv2+
+KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = src/client.h
 KODI_PVR_WMC_DEPENDENCIES = kodi-platform
 
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 1af1f2e..b2eac1b 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_ASTEROIDS_VERSION = c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
-KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
+KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
 KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index dce6968..8e10a57 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_BIOGENESIS_VERSION = 39928eef56ed639085d401dd97bf18f44b1f3e8b
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
-KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
+KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index bf67ea0..0fc5c53 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_CPBLOBS_VERSION = 87a3abfbe6e4fd1089548eab77a84902d0e1af60
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
-KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2
+KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
 
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
index 49ddb43..2e0209f 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 2e7c10e3543f5aaab6fd2f5aa9d05b976a43ba68
 KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
-KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPLv2+
+KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
 KODI_SCREENSAVER_CRYSTALMORPH_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 9773bac..7b00012 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_GREYNETIC_VERSION = 80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
-KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
+KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 5ecacdf..b67ee4a 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 16057e7195f930109f0a4aea999296ca315700e5
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
-KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPLv2+
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
 
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 2adf960..db8e275 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_PINGPONG_VERSION = 5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
-KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
+KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index f904052..25c2bbd 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_PYRO_VERSION = 2476b77d9954980a27e07eb8eb0727e2af226351
 KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
-KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
+KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
 
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index b5b5206..da5fb5c 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -6,7 +6,7 @@
 
 KODI_SCREENSAVER_STARS_VERSION = 28bf79d4dce040e9fbdc25f51007e13950cab937
 KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
-KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
+KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
 
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 1e07774..92c9190 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_FISHBMC_VERSION = 50c38c296a62e096a2216e43b86d864ee265c506
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
-KODI_VISUALISATION_FISHBMC_LICENSE = GPLv2+
+KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
 
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 89f2bab..e769505 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_GOOM_VERSION = 16747b7dba9cbdcfdc8df44e849eaf09450fc86f
 KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
-KODI_VISUALISATION_GOOM_LICENSE = GPLv2+
+KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
 
 KODI_VISUALISATION_GOOM_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index e5f2d91..527c5e4 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_SHADERTOY_VERSION = f9988007681bf37e6c03d6992bae30133b020608
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
-KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
+KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
 
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index de197eb..ebc7577 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_SPECTRUM_VERSION = 9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
-KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
+KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
 
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
index 28eeb4d..ce0fc18 100644
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_WAVEFORHUE_VERSION = e87d5c7d7e7504036b80af8bc89f4cf6489085fe
 KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,notspiff,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
-KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
 
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 81e880b..2263b71 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -6,7 +6,7 @@
 
 KODI_VISUALISATION_WAVEFORM_VERSION = 89aec48e2975f820004df5a1a53801339a5b3064
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
-KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index de4d308..ebce84d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 KODI_VERSION = 16.1-Jarvis
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
-KODI_LICENSE = GPLv2
+KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.GPL
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 966b51c..b9b3dbc 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -6,7 +6,7 @@
 
 KTAP_VERSION = eb66d40310c93dc82bc8eac889744c1ed1f01f7b
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
-KTAP_LICENSE = GPLv2
+KTAP_LICENSE = GPL-2.0
 KTAP_LICENSE_FILES = LICENSE-GPL
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 12454e1..2789a6e 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -15,7 +15,7 @@ KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBVNCSERVER),libvncserver) \
 	$(if $(BR2_PACKAGE_SDL),sdl) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
-KVMTOOL_LICENSE = GPLv2
+KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
 
 # This is required to convert a static binary (init helper) back into
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 644a84f..56afe86 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -7,7 +7,7 @@
 LATENCYTOP_VERSION = 0.5
 LATENCYTOP_SITE = http://www.latencytop.org/download
 LATENCYTOP_DEPENDENCIES = libglib2 ncurses
-LATENCYTOP_LICENSE = GPLv2
+LATENCYTOP_LICENSE = GPL-2.0
 LATENCYTOP_LICENSE_FILES = latencytop.c
 
 # NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
index 5dc4c71..017d562 100644
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -7,7 +7,7 @@
 LBREAKOUT2_VERSION_MAJOR = 2.6
 LBREAKOUT2_VERSION = $(LBREAKOUT2_VERSION_MAJOR).4
 LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/$(LBREAKOUT2_VERSION_MAJOR)
-LBREAKOUT2_LICENSE = GPLv2+
+LBREAKOUT2_LICENSE = GPL-2.0+
 LBREAKOUT2_LICENSE_FILES = COPYING
 
 LBREAKOUT2_DEPENDENCIES = sdl libpng
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 4fbeca1..bd37b7a 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -6,7 +6,7 @@
 
 LCDPROC_VERSION = 0.5.7
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
-LCDPROC_LICENSE = GPLv2+
+LCDPROC_LICENSE = GPL-2.0+
 LCDPROC_LICENSE_FILES = COPYING
 LCDPROC_MAKE = $(MAKE1)
 
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 9551a75..c6c28d1 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -7,7 +7,7 @@
 LEAFPAD_VERSION = 0.8.18.1
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
-LEAFPAD_LICENSE = GPLv2+
+LEAFPAD_LICENSE = GPL-2.0+
 LEAFPAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index a314c08..501ea0c 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -8,7 +8,7 @@ LIBAO_VERSION = 1.2.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
-LIBAO_LICENSE = GPLv2+
+LIBAO_LICENSE = GPL-2.0+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CONF_OPTS = \
 	--disable-esd \
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index b5e2172..52d2745 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -14,7 +14,7 @@ LIBATOMIC_OPS_AUTORECONF = YES
 # covered by an MIT-style license. A few library routines are covered
 # by the GNU General Public License. These are put into a separate
 # library, libatomic_ops_gpl.a."
-LIBATOMIC_OPS_LICENSE = MIT (main library) / GPLv2+ (gpl extension)
+LIBATOMIC_OPS_LICENSE = MIT (main library) / GPL-2.0+ (gpl extension)
 LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 19cc27d..372dc92 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -6,7 +6,7 @@
 
 LIBCAP_NG_VERSION = 0.7.8
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
-LIBCAP_NG_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
+LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
 
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index bcb5d8c..508f67a 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -7,7 +7,7 @@
 LIBCAP_VERSION = 2.25
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
-LIBCAP_LICENSE = GPLv2 or BSD-3c
+LIBCAP_LICENSE = GPL-2.0 or BSD-3c
 LIBCAP_LICENSE_FILES = License
 
 LIBCAP_DEPENDENCIES = host-libcap host-gperf
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index bee1fe3..5d421eb 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -8,7 +8,7 @@ LIBCDAUDIO_VERSION = 0.99.12p2
 LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
-LIBCDAUDIO_LICENSE = GPLv2+
+LIBCDAUDIO_LICENSE = GPL-2.0+
 LIBCDAUDIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index c9a05a5..e2b5c1f 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -6,7 +6,7 @@
 
 LIBCEC_VERSION = 2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
-LIBCEC_LICENSE = GPLv2+
+LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
 
 LIBCEC_INSTALL_STAGING = YES
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index ef9b731..03aabec 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -7,7 +7,7 @@
 LIBCOAP_VERSION = c909bf802034b7762a2182848304b2530e58444f
 LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
-LIBCOAP_LICENSE = GPLv2+ or BSD-2c
+LIBCOAP_LICENSE = GPL-2.0+ or BSD-2c
 LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 7012453..e6ee7fe 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -6,7 +6,7 @@
 
 LIBCUE_VERSION = v1.4.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
-LIBCUE_LICENSE = GPLv2, BSD-2c (rem.c)
+LIBCUE_LICENSE = GPL-2.0, BSD-2c (rem.c)
 LIBCUE_LICENSE_FILES = COPYING
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index d1f2448..66b589b 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -8,7 +8,7 @@ LIBCUEFILE_VERSION = r475
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
-LIBCUEFILE_LICENSE = GPLv2+
+LIBCUEFILE_LICENSE = GPL-2.0+
 LIBCUEFILE_LICENSE_FILES = COPYING
 
 define LIBCUEFILE_INSTALL_STAGING_INCLUDES
diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
index dfbb4c2..8b733e7 100644
--- a/package/libdvbcsa/libdvbcsa.mk
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -6,7 +6,7 @@
 
 LIBDVBCSA_VERSION = 1.1.0
 LIBDVBCSA_SITE = http://get.videolan.org/libdvbcsa/$(LIBDVBCSA_VERSION)
-LIBDVBCSA_LICENSE = GPLv2+
+LIBDVBCSA_LICENSE = GPL-2.0+
 LIBDVBCSA_LICENSE_FILES = COPYING
 LIBDVBCSA_INSTALL_STAGING = YES
 
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
index 8e1c929..e5ba3af 100644
--- a/package/libdvdcss/libdvdcss.mk
+++ b/package/libdvdcss/libdvdcss.mk
@@ -8,7 +8,7 @@ LIBDVDCSS_VERSION = 1.4.0
 LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.bz2
 LIBDVDCSS_SITE = http://www.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
 LIBDVDCSS_INSTALL_STAGING = YES
-LIBDVDCSS_LICENSE = GPLv2+
+LIBDVDCSS_LICENSE = GPL-2.0+
 LIBDVDCSS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index b53f0c8..5cb47ab 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -9,7 +9,7 @@ LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
-LIBDVDNAV_LICENSE = GPLv2+
+LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
 # 0001-do-not-match-nios2-as-os2.patch
 LIBDVDNAV_AUTORECONF = YES
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index adf79d8..0e335e5 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -8,7 +8,7 @@ LIBDVDREAD_VERSION = 5.0.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-LIBDVDREAD_LICENSE = GPLv2+
+LIBDVDREAD_LICENSE = GPL-2.0+
 LIBDVDREAD_LICENSE_FILES = COPYING
 LIBDVDREAD_CONF_OPTS = --with-libdvdcss
 LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index d101f95..04f8672 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -7,7 +7,7 @@
 LIBEXOSIP2_VERSION = 3.6.0
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
-LIBEXOSIP2_LICENSE = GPLv2+
+LIBEXOSIP2_LICENSE = GPL-2.0+
 LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index b87427a..63b6895 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -8,7 +8,7 @@ LIBENCA_VERSION = 1.19
 LIBENCA_SITE = http://dl.cihar.com/enca
 LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.xz
 LIBENCA_INSTALL_STAGING = YES
-LIBENCA_LICENSE = GPLv2
+LIBENCA_LICENSE = GPL-2.0
 LIBENCA_LICENSE_FILES = COPYING
 LIBENCA_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index cad2e27..a00d371 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,7 +10,7 @@ LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
-LIBESMTP_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
+LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPLv2.1+ (library)
 LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 02bc72c..390cc83 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -7,7 +7,7 @@
 LIBEV_VERSION = 4.22
 LIBEV_SITE = http://dist.schmorp.de/libev
 LIBEV_INSTALL_STAGING = YES
-LIBEV_LICENSE = BSD-2c or GPLv2+
+LIBEV_LICENSE = BSD-2c or GPL-2.0+
 LIBEV_LICENSE_FILES = LICENSE
 
 # The 'compatibility' event.h header conflicts with libevent
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
index 0e7a7dc..e5ef2f7 100644
--- a/package/libfm-extra/libfm-extra.mk
+++ b/package/libfm-extra/libfm-extra.mk
@@ -8,7 +8,7 @@ LIBFM_EXTRA_VERSION = 1.2.4
 LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
 LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
-LIBFM_EXTRA_LICENSE = GPLv2+, LGPLv2.1+
+LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPLv2.1+
 LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_EXTRA_INSTALL_STAGING = YES
 LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index 633a844..a6c0e74 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -8,7 +8,7 @@ LIBFM_VERSION = 1.2.4
 LIBFM_SOURCE = libfm-$(LIBFM_VERSION).tar.xz
 LIBFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
-LIBFM_LICENSE = GPLv2+, LGPLv2.1+
+LIBFM_LICENSE = GPL-2.0+, LGPLv2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
 
diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index fe79689..e6790b1 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -7,7 +7,7 @@
 LIBFREEIMAGE_VERSION = 3.17.0
 LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
 LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
-LIBFREEIMAGE_LICENSE = GPLv2 or GPLv3 or FreeImage Public License
+LIBFREEIMAGE_LICENSE = GPL-2.0 or GPLv3 or FreeImage Public License
 LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 26aa293..1f058bd 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -9,7 +9,7 @@ LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
-LIBFTDI1_LICENSE = LGPLv2 (libftdi1), GPLv2 with exception (ftdipp1)
+LIBFTDI1_LICENSE = LGPLv2 (libftdi1), GPL-2.0 with exception (ftdipp1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 57aabcd..cf6912c 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -7,7 +7,7 @@
 LIBFUSE_VERSION = 2.9.7
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
-LIBFUSE_LICENSE = GPLv2, LGPLv2.1
+LIBFUSE_LICENSE = GPL-2.0, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 074ebb7..8f25491 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -6,7 +6,7 @@
 
 LIBGPG_ERROR_VERSION = 1.27
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
-LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
+LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 8b3cb2a..b2e890c 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -9,7 +9,7 @@ LIBHID_SITE = http://sources.buildroot.net
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
-LIBHID_LICENSE = GPLv2
+LIBHID_LICENSE = GPL-2.0
 LIBHID_LICENSE_FILES = COPYING
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 2cd7820..951ae09 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -6,7 +6,7 @@
 
 LIBID3TAG_VERSION = 0.15.1b
 LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
-LIBID3TAG_LICENSE = GPLv2+
+LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 99c9e2c..d348665 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBIDN_LICENSE = GPLv2+, GPLv3+, LGPLv3+
+LIBIDN_LICENSE = GPL-2.0+, GPLv3+, LGPLv3+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
 define LIBIDN_REMOVE_BINARY
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 4c8a229..7ce6a47 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -6,7 +6,7 @@
 
 LIBISCSI_VERSION = 1.18.0
 LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
-LIBISCSI_LICENSE = GPLv2+, LGPLv2.1+
+LIBISCSI_LICENSE = GPL-2.0+, LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 74edf2c..7e518e7 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -8,7 +8,7 @@ LIBKCAPI_VERSION = 79cb80714ebcbae2b9de9bb5aca9a6a546f2f121
 LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
 LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
-LIBKCAPI_LICENSE = BSD-3c (library), BSD-3c or GPLv2 (programs)
+LIBKCAPI_LICENSE = BSD-3c (library), BSD-3c or GPL-2.0 (programs)
 LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_APPS),y)
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index e29b6ae..58d0ff3 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -7,7 +7,7 @@
 LIBKSBA_VERSION = 1.3.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
-LIBKSBA_LICENSE = LGPLv3+ or GPLv2+ (library, headers), GPLv3+ (manual, tests, build system)
+LIBKSBA_LICENSE = LGPLv3+ or GPL-2.0+ (library, headers), GPLv3+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 59fced6..a940f21 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -9,7 +9,7 @@ LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-6.debian.tar.bz2
 
-LIBLOCKFILE_LICENSE = LGPLv2+, GPLv2+ (dotlockfile)
+LIBLOCKFILE_LICENSE = LGPLv2+, GPL-2.0+ (dotlockfile)
 LIBLOCKFILE_LICENSE_FILES = COPYRIGHT
 
 LIBLOCKFILE_INSTALL_STAGING = YES
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 9c152f9..0bb64da 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -8,7 +8,7 @@ LIBMAD_VERSION = 0.15.1b
 LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LIBTOOL_PATCH = NO
-LIBMAD_LICENSE = GPLv2+
+LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
 
 define LIBMAD_PREVENT_AUTOMAKE
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 0f757c0..733722f 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -7,7 +7,7 @@
 LIBMBIM_VERSION = 1.14.0
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
-LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
+LIBMBIM_LICENSE = LGPLv2+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
 
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index 882210c..2aa7ff7 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -9,7 +9,7 @@ LIBMPD_VERSION = $(LIBMPD_VERSION_MAJOR).17
 LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/$(LIBMPD_VERSION_MAJOR)
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
-LIBMPD_LICENSE = GPLv2+
+LIBMPD_LICENSE = GPL-2.0+
 LIBMPD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index 124c749..db9b2f8 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -6,7 +6,7 @@
 
 LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
-LIBMPEG2_LICENSE = GPLv2+
+LIBMPEG2_LICENSE = GPL-2.0+
 LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index ec05f6d..2e9f6b7 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -9,7 +9,7 @@ LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
-LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
+LIBNETFILTER_CONNTRACK_LICENSE = GPL-2.0+
 LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
index 00388a5..61d6acd 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthe
 LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
 LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTHELPER_AUTORECONF = YES
-LIBNETFILTER_CTHELPER_LICENSE = GPLv2+
+LIBNETFILTER_CTHELPER_LICENSE = GPL-2.0+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
index d85a8d2..9c4c951 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_ctt
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
-LIBNETFILTER_CTTIMEOUT_LICENSE = GPLv2+
+LIBNETFILTER_CTTIMEOUT_LICENSE = GPL-2.0+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_log/libnetfilter_log.mk b/package/libnetfilter_log/libnetfilter_log.mk
index a448c54..bcf755e 100644
--- a/package/libnetfilter_log/libnetfilter_log.mk
+++ b/package/libnetfilter_log/libnetfilter_log.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_LOG_SITE = http://www.netfilter.org/projects/libnetfilter_log/files
 LIBNETFILTER_LOG_INSTALL_STAGING = YES
 LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
 LIBNETFILTER_LOG_AUTORECONF = YES
-LIBNETFILTER_LOG_LICENSE = GPLv2+
+LIBNETFILTER_LOG_LICENSE = GPL-2.0+
 LIBNETFILTER_LOG_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_queue/libnetfilter_queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
index d788fd1..75910c5 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.mk
+++ b/package/libnetfilter_queue/libnetfilter_queue.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/f
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
 LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
 LIBNETFILTER_QUEUE_AUTORECONF = YES
-LIBNETFILTER_QUEUE_LICENSE = GPLv2+
+LIBNETFILTER_QUEUE_LICENSE = GPL-2.0+
 LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 6f69a81..13f5d72 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -9,7 +9,7 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
-LIBNFNETLINK_LICENSE = GPLv2
+LIBNFNETLINK_LICENSE = GPL-2.0
 LIBNFNETLINK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 0e1ddf8..bde3ee4 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -7,7 +7,7 @@
 LIBNFTNL_VERSION = 1.0.7
 LIBNFTNL_SITE = http://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
-LIBNFTNL_LICENSE = GPLv2+
+LIBNFTNL_LICENSE = GPL-2.0+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index c97099b..51bdc51 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -7,7 +7,7 @@
 LIBNPTH_VERSION = 1.3
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = ftp://ftp.gnupg.org/gcrypt/npth
-LIBNPTH_LICENSE = LGPLv3+ or GPLv2+
+LIBNPTH_LICENSE = LGPLv3+ or GPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
 LIBNPTH_INSTALL_STAGING = YES
 
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index dd70387..aa478a4 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -10,7 +10,7 @@ LIBOPING_SOURCE = liboping-$(LIBOPING_VERSION).tar.bz2
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
-LIBOPING_LICENSE = LGPLv2.1+, GPLv2
+LIBOPING_LICENSE = LGPLv2.1+, GPL-2.0
 LIBOPING_LICENSE_FILES = COPYING
 
 LIBOPING_AUTORECONF = YES
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 5ed5953..184e48d 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -9,7 +9,7 @@ LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius
 LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.gz
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
-LIBPAM_RADIUS_AUTH_LICENSE = GPLv2+
+LIBPAM_RADIUS_AUTH_LICENSE = GPL-2.0+
 LIBPAM_RADIUS_AUTH_LICENSE_FILES = LICENSE
 # While autoconf is used for configuration, the Makefile is
 # hand-written, so we need to pass CC, LD, CFLAGS at build time.
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 6696d89..f43e2b9 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -6,7 +6,7 @@
 
 LIBPAM_TACPLUS_VERSION = 1.3.9
 LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,$(LIBPAM_TACPLUS_VERSION))
-LIBPAM_TACPLUS_LICENSE = GPLv2+
+LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
 LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
 # Fetching from github, we need to generate the configure script
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index b0d0609..4e2da7d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -8,7 +8,7 @@ LIBPJSIP_VERSION = 2.6
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
-LIBPJSIP_LICENSE = GPLv2+
+LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 6d54915..b253028 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -6,7 +6,7 @@
 
 LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPLv2+, PHP license v3.01
+LIBPLATFORM_LICENSE = GPL-2.0+, PHP license v3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
 LIBPLATFORM_INSTALL_STAGING = YES
 
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 825493e..9151d6d 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -7,7 +7,7 @@
 LIBQMI_VERSION = 1.16.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
-LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
+LIBQMI_LICENSE = LGPLv2+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
 LIBQMI_INSTALL_STAGING = YES
 
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 51ecabe..ca0a438 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -6,7 +6,7 @@
 
 LIBRTLSDR_VERSION = v0.5.3
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
-LIBRTLSDR_LICENSE = GPLv2+
+LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
 LIBRTLSDR_INSTALL_STAGING = YES
 LIBRTLSDR_DEPENDENCIES = libusb
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index 11f1874..b73d4c7 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -7,7 +7,7 @@
 LIBSERIAL_VERSION = 0.6.0rc2
 LIBSERIAL_SITE = http://downloads.sourceforge.net/libserial
 LIBSERIAL_INSTALL_STAGING = YES
-LIBSERIAL_LICENSE = GPLv2+
+LIBSERIAL_LICENSE = GPL-2.0+
 LIBSERIAL_LICENSE_FILES = COPYING
 LIBSERIAL_DEPENDENCIES = boost
 
diff --git a/package/libsidplay2/libsidplay2.mk b/package/libsidplay2/libsidplay2.mk
index cf44068..20af772 100644
--- a/package/libsidplay2/libsidplay2.mk
+++ b/package/libsidplay2/libsidplay2.mk
@@ -7,7 +7,7 @@
 LIBSIDPLAY2_VERSION = 2.1.1
 LIBSIDPLAY2_SOURCE = sidplay-libs-$(LIBSIDPLAY2_VERSION).tar.gz
 LIBSIDPLAY2_SITE = http://downloads.sourceforge.net/project/sidplay2/sidplay2/sidplay-libs-$(LIBSIDPLAY2_VERSION)
-LIBSIDPLAY2_LICENSE = GPLv2+
+LIBSIDPLAY2_LICENSE = GPL-2.0+
 LIBSIDPLAY2_LICENSE_FILES = libsidplay/COPYING
 LIBSIDPLAY2_INSTALL_STAGING = YES
 
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 1473369..d252497 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -8,7 +8,7 @@ LIBSIGSEGV_VERSION = 2.11
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
-LIBSIGSEGV_LICENSE = GPLv2+
+LIBSIGSEGV_LICENSE = GPL-2.0+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index fb0310f..e019583 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -8,7 +8,7 @@ LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
-LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
+LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPLv2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 
 $(eval $(autotools-package))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 1d066bd..b1a4f48 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -11,7 +11,7 @@ LIBTOOL_INSTALL_STAGING = YES
 LIBTOOL_CONF_ENV = HELP2MAN=true
 LIBTOOL_DEPENDENCIES = host-m4
 HOST_LIBTOOL_DEPENDENCIES = host-m4
-LIBTOOL_LICENSE = GPLv2+
+LIBTOOL_LICENSE = GPL-2.0+
 LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index ef1c75f..fbd332e 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -14,7 +14,7 @@ LIBTORRENT_CONF_OPTS = --enable-aligned \
 	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
-LIBTORRENT_LICENSE = GPLv2
+LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 9161be9..f1a359b 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -6,7 +6,7 @@
 
 LIBUCI_VERSION = 49ec6efbdac4819033d34f08927d795f83a3932d
 LIBUCI_SITE = git://git.openwrt.org/project/uci.git
-LIBUCI_LICENSE = LGPLv2.1, GPLv2 (tools)
+LIBUCI_LICENSE = LGPLv2.1, GPL-2.0 (tools)
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
@@ -15,7 +15,7 @@ LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
 	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
-LIBUCI_LICENSE := $(LIBUCI_LICENSE), GPLv2 (lua bindings)
+LIBUCI_LICENSE := $(LIBUCI_LICENSE), GPL-2.0 (lua bindings)
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 6d07f1f..9e7ad6f 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -7,7 +7,7 @@
 # v0.2.7
 LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
-LIBUIO_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
+LIBUIO_LICENSE = LGPLv2.1 (library), GPL-2.0 (programs)
 LIBUIO_LICENSE_FILES = COPYING
 LIBUIO_CONF_OPTS = --with-glib=no --without-werror
 LIBUIO_INSTALL_STAGING = YES
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index ce58b47..fc47ae4 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -8,7 +8,7 @@ LIBUNISTRING_VERSION = 0.9.7
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-LIBUNISTRING_LICENSE = LGPLv3+ or GPLv2
+LIBUNISTRING_LICENSE = LGPLv3+ or GPL-2.0
 LIBUNISTRING_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 0cb3eae..52753cf 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -6,7 +6,7 @@
 
 LIBUPNPP_VERSION = 0.15.1
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
-LIBUPNPP_LICENSE = GPLv2+
+LIBUPNPP_LICENSE = GPL-2.0+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c21c210..9092c79 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -7,7 +7,7 @@
 LIBURCU_VERSION = 0.9.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE), GPLv2+ (test), GPLv3 (few *.m4 files)
+LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPLv3 (few *.m4 files)
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 1340d2d..721245f 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -6,7 +6,7 @@
 
 LIBUSBGX_VERSION = 2e3d43ee098ed928d1baa61ce791ce9ff4788c5a
 LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
-LIBUSBGX_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
+LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPLv2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
 LIBUSBGX_AUTORECONF = YES
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index c14bedb..4fe7048 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -15,7 +15,7 @@ LIBV4L_CONF_OPTS = --disable-doxygen-doc
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
-LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
+LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPLv2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index d3f0657..8063570 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -7,7 +7,7 @@
 LIBVNCSERVER_VERSION = 0.9.11
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
-LIBVNCSERVER_LICENSE = GPLv2+
+LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 5dc8bb2..b9fa5fc 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -6,7 +6,7 @@
 
 LINKNX_VERSION = 0.0.1.32
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
-LINKNX_LICENSE = GPLv2+
+LINKNX_LICENSE = GPL-2.0+
 LINKNX_INSTALL_STAGING = YES
 # Patching acinclude.m4
 LINKNX_AUTORECONF = YES
diff --git a/package/links/links.mk b/package/links/links.mk
index ce0e638..dd6adb2 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -8,7 +8,7 @@ LINKS_VERSION = 2.14
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-LINKS_LICENSE = GPLv2+
+LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index df80490..fb5e18d 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -13,7 +13,7 @@ LINPHONE_CONF_OPTS = \
 LINPHONE_AUTORECONF = YES
 LINPHONE_INSTALL_STAGING = YES
 LINPHONE_DEPENDENCIES = host-pkgconf libeXosip2 speex
-LINPHONE_LICENSE = GPLv2+
+LINPHONE_LICENSE = GPL-2.0+
 LINPHONE_LICENSE_FILES = COPYING
 LINPHONE_PATCH = \
 	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav9.patch \
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 6f599a8..1d7d6e7 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -8,7 +8,7 @@ LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
-LINUX_BACKPORTS_LICENSE = GPLv2
+LINUX_BACKPORTS_LICENSE = GPL-2.0
 LINUX_BACKPORTS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 35ed28e..f30a07a 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -9,7 +9,7 @@ LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.xz
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_DEPENDENCIES = linux
-LINUX_FUSION_LICENSE = GPLv2+
+LINUX_FUSION_LICENSE = GPL-2.0+
 LINUX_FUSION_LICENSE_FILES = debian/copyright
 
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 8f339cf..5660439 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -82,7 +82,7 @@ LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
 endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
-LINUX_HEADERS_LICENSE = GPLv2
+LINUX_HEADERS_LICENSE = GPL-2.0
 LINUX_HEADERS_LICENSE_FILES = COPYING
 
 LINUX_HEADERS_INSTALL_STAGING = YES
diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
index 1f4197f..9450ca4 100644
--- a/package/linux-zigbee/linux-zigbee.mk
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -6,7 +6,7 @@
 
 LINUX_ZIGBEE_VERSION = v0.3.1
 LINUX_ZIGBEE_SITE = git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee
-LINUX_ZIGBEE_LICENSE = GPLv2
+LINUX_ZIGBEE_LICENSE = GPL-2.0
 LINUX_ZIGBEE_LICENSE_FILES = COPYING
 LINUX_ZIGBEE_DEPENDENCIES = libnl host-pkgconf host-flex host-bison
 
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index bd0f96f..6fd6434 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -7,7 +7,7 @@
 LIRC_TOOLS_VERSION = 0.9.4b
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
-LIRC_TOOLS_LICENSE = GPLv2+
+LIRC_TOOLS_LICENSE = GPL-2.0+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index a36d6ca..20776a7 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -9,7 +9,7 @@ LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
 LKSCTP_TOOLS_INSTALL_STAGING = YES
 # configure not shipped
 LKSCTP_TOOLS_AUTORECONF = YES
-LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPLv2+ (programs)
+LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPL-2.0+ (programs)
 LKSCTP_TOOLS_LICENSE_FILES = COPYING.lib COPYING
 LKSCTP_TOOLS_CONF_OPTS = --disable-tests
 
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index c198817..89419bc 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -9,7 +9,7 @@ LM_SENSORS_SOURCE = lm-sensors_$(LM_SENSORS_VERSION).orig.tar.bz2
 LM_SENSORS_SITE = http://snapshot.debian.org/archive/debian/20170208T211941Z/pool/main/l/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
-LM_SENSORS_LICENSE = LGPLv2.1+ (libsensors), GPLv2+ (programs)
+LM_SENSORS_LICENSE = LGPLv2.1+ (libsensors), GPL-2.0+ (programs)
 LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
 LM_SENSORS_BINS_ = bin/sensors-conf-convert
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index b62096d..c52d6a5 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -7,7 +7,7 @@
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
-LMBENCH_LICENSE = lmbench license (based on GPLv2)
+LMBENCH_LICENSE = lmbench license (based on GPL-2.0)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
 LMBENCH_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index deb9f90..57df573 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -8,7 +8,7 @@ LOCKFILE_PROGS_VERSION = 0.1.17
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockfile-progs
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
-LOCKFILE_PROGS_LICENSE = GPLv2
+LOCKFILE_PROGS_LICENSE = GPL-2.0
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
 
 LOCKFILE_BINS = \
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 5fd779e..b11fc88 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -6,7 +6,7 @@
 
 LOGROTATE_VERSION = 3.11.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
-LOGROTATE_LICENSE = GPLv2+
+LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 042e364..1a02235 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -6,7 +6,7 @@
 
 HOST_LPC3250LOADER_VERSION = 1.0
 HOST_LPC3250LOADER_SITE = $(call github,alexandrebelloni,lpc3250loader,$(HOST_LPC3250LOADER_VERSION))
-LPC3250LOADER_LICENSE = GPLv2+
+LPC3250LOADER_LICENSE = GPL-2.0+
 LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index a283dd1..5dac07a 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -7,7 +7,7 @@
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_CONF_OPTS = --disable-timesync
-LRZSZ_LICENSE = GPLv2+
+LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
 
 define LRZSZ_POST_CONFIGURE_HOOKS
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 32c0bc0..eb39611 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,7 +6,7 @@
 
 LSHW_VERSION = B.02.18
 LSHW_SITE = http://ezix.org/software/files
-LSHW_LICENSE = GPLv2
+LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
 LSHW_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 5f8a965..193de15 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -6,7 +6,7 @@
 
 LSUIO_VERSION = 0.2.0
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
-LSUIO_LICENSE = GPLv2
+LSUIO_LICENSE = GPL-2.0
 LSUIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 29f374b..cd9a345 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -7,7 +7,7 @@
 LTP_TESTSUITE_VERSION = 20170116
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
-LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
+LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
 # Do not enable Open POSIX testsuite as it doesn't cross-compile
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index eac42be..6dfbb58 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -8,7 +8,7 @@ LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
 LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
-LTRACE_LICENSE = GPLv2
+LTRACE_LICENSE = GPL-2.0
 LTRACE_LICENSE_FILES = COPYING
 LTRACE_AUTORECONF = YES
 
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index bbd270e..8f12ab1 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -6,7 +6,7 @@
 
 LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris
 LTRIS_VERSION = 1.0.19
-LTRIS_LICENSE = GPLv2+
+LTRIS_LICENSE = GPL-2.0+
 LTRIS_LICENSE_FILES = COPYING
 
 LTRIS_DEPENDENCIES = sdl
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 6ac129a..1b2c654 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -7,7 +7,7 @@
 LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.5.2
 LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
+LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPL-2.0 (test code)
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
 # The host-elfutils dependency is optional, but since we don't have
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index f8c4c11..a195e2f 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,7 +7,7 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.9.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
+LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index e77617e..ecc8992 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -7,7 +7,7 @@
 LTTNG_MODULES_VERSION = 2.9.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
-LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
+LTTNG_MODULES_LICENSE = LGPLv2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 LTTNG_MODULES_MODULE_MAKE_OPTS = CONFIG_LTTNG=m CONFIG_LTTNG_CLOCK_PLUGIN_TEST=m
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 5af0ab3..808e256 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -7,7 +7,7 @@
 LTTNG_TOOLS_VERSION = 2.9.4
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
-LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
+LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 
diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
index 7704931..53797f4 100644
--- a/package/lugaru/lugaru.mk
+++ b/package/lugaru/lugaru.mk
@@ -8,7 +8,7 @@ LUGARU_VERSION = 1.2
 LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
 LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
 
-LUGARU_LICENSE = GPLv2+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
+LUGARU_LICENSE = GPL-2.0+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
 	CC-BY-SA-4.0 (OSS Lugaru, Jendraz and Philtron R. assets)
 LUGARU_LICENSE_FILES = COPYING.txt CONTENT-LICENSE.txt
 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6af3137..068a400 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -8,7 +8,7 @@ LVM2_VERSION = 2.02.169
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-LVM2_LICENSE = GPLv2, LGPLv2.1
+LVM2_LICENSE = GPL-2.0, LGPLv2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 # Make sure that binaries and libraries are installed with write
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index c2c8919..8316a88 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -7,7 +7,7 @@
 LZ4_VERSION = v1.7.5
 LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
-LZ4_LICENSE = BSD-2c (library), GPLv2+ (programs)
+LZ4_LICENSE = BSD-2c (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index db04862..04c83f1 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -6,7 +6,7 @@
 
 LZIP_VERSION = 1.18
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
-LZIP_LICENSE = GPLv2+
+LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
 
 define LZIP_CONFIGURE_CMDS
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index ec7c749..17d8d0f 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -6,7 +6,7 @@
 
 LZO_VERSION = 2.09
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
-LZO_LICENSE = GPLv2+
+LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 # Ships a beta libtool version hence our patch doesn't apply.
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 43c1628..14d417f 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,7 +6,7 @@
 
 LZOP_VERSION = 1.03
 LZOP_SITE = http://www.lzop.org/download
-LZOP_LICENSE = GPLv2+
+LZOP_LICENSE = GPL-2.0+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 HOST_LZOP_DEPENDENCIES = host-lzo
diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 2e716d9..f2cbce4 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -6,7 +6,7 @@
 
 MACCHANGER_VERSION = 1.7.0
 MACCHANGER_SITE = https://github.com/alobbs/macchanger/releases/download/$(MACCHANGER_VERSION)
-MACCHANGER_LICENSE = GPLv2+
+MACCHANGER_LICENSE = GPL-2.0+
 MACCHANGER_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 2606ac8..4ae95ab 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -6,7 +6,7 @@
 
 MADPLAY_VERSION = 0.15.2b
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
-MADPLAY_LICENSE = GPLv2+
+MADPLAY_LICENSE = GPL-2.0+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 9bd684f..3e78892 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDEVS_LICENSE = GPLv2
+MAKEDEVS_LICENSE = GPL-2.0
 
 HOST_MAKEDEVS_CFLAGS = $(HOST_CFLAGS)
 HOST_MAKEDEVS_LDFLAGS = $(HOST_LDFLAGS)
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 8c7375a..a17f746 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -6,7 +6,7 @@
 
 MARIADB_VERSION = 10.1.22
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
-MARIADB_LICENSE = GPLv2 (server), GPLv2 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
+MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
 MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
diff --git a/package/matchbox-common/matchbox-common.mk b/package/matchbox-common/matchbox-common.mk
index 038dd59..fd54c27 100644
--- a/package/matchbox-common/matchbox-common.mk
+++ b/package/matchbox-common/matchbox-common.mk
@@ -8,7 +8,7 @@ MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 MATCHBOX_COMMON_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
-MATCHBOX_COMMON_LICENSE = GPLv2+
+MATCHBOX_COMMON_LICENSE = GPL-2.0+
 MATCHBOX_COMMON_LICENSE_FILES = COPYING
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
diff --git a/package/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
index a703a18..81b13c0 100644
--- a/package/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox-desktop/matchbox-desktop.mk
@@ -8,7 +8,7 @@ MATCHBOX_DESKTOP_VERSION_MAJOR = 0.9
 MATCHBOX_DESKTOP_VERSION = $(MATCHBOX_DESKTOP_VERSION_MAJOR).1
 MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION_MAJOR)
-MATCHBOX_DESKTOP_LICENSE = GPLv2+
+MATCHBOX_DESKTOP_LICENSE = GPL-2.0+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
 MATCHBOX_DESKTOP_CONF_OPTS = --enable-expat
diff --git a/package/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
index ea8e6dc..996206e 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox-fakekey/matchbox-fakekey.mk
@@ -7,7 +7,7 @@
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
 MATCHBOX_FAKEKEY_SITE = http://downloads.yoctoproject.org/releases/matchbox/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
-MATCHBOX_FAKEKEY_LICENSE = GPLv2+
+MATCHBOX_FAKEKEY_LICENSE = GPL-2.0+
 MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index 3ffaca6..23ab5ad 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -7,7 +7,7 @@
 MATCHBOX_KEYBOARD_VERSION = 0.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
 MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
-MATCHBOX_KEYBOARD_LICENSE = GPLv2+
+MATCHBOX_KEYBOARD_LICENSE = GPL-2.0+
 MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
 MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expat
 
diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index aa2d417..344d8fd 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -8,7 +8,7 @@ MATCHBOX_PANEL_VERSION_MAJOR = 0.9
 MATCHBOX_PANEL_VERSION = $(MATCHBOX_PANEL_VERSION_MAJOR).3
 MATCHBOX_PANEL_SOURCE = matchbox-panel-$(MATCHBOX_PANEL_VERSION).tar.bz2
 MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/$(MATCHBOX_PANEL_VERSION_MAJOR)
-MATCHBOX_PANEL_LICENSE = GPLv2+
+MATCHBOX_PANEL_LICENSE = GPL-2.0+
 MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
 MATCHBOX_PANEL_CONF_OPTS = --enable-expat --enable-dnotify
diff --git a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
index be57239..c80e753 100644
--- a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -7,7 +7,7 @@
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
 MATCHBOX_STARTUP_MONITOR_SITE = http://downloads.yoctoproject.org/releases/matchbox/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
-MATCHBOX_STARTUP_MONITOR_LICENSE = GPLv2+
+MATCHBOX_STARTUP_MONITOR_LICENSE = GPL-2.0+
 MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 9094b1e..c0a2778 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -7,7 +7,7 @@
 MATCHBOX_VERSION = 1.2
 MATCHBOX_SOURCE = matchbox-window-manager-$(MATCHBOX_VERSION).tar.bz2
 MATCHBOX_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$(MATCHBOX_VERSION)
-MATCHBOX_LICENSE = GPLv2+
+MATCHBOX_LICENSE = GPL-2.0+
 MATCHBOX_LICENSE_FILES = COPYING
 
 MATCHBOX_DEPENDENCIES = matchbox-lib
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 1290e34..bea31b9 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -7,7 +7,7 @@
 MCELOG_VERSION = v111
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
-MCELOG_LICENSE = GPLv2
+MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = README
 
 define MCELOG_BUILD_CMDS
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 7558c18..c08e057 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -7,7 +7,7 @@
 MDADM_VERSION = 3.3.4
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
-MDADM_LICENSE = GPLv2+
+MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 
 MDADM_MAKE_OPTS = \
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index b4f0c52..a9e0bf7 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -10,7 +10,7 @@ MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
 # tests fail linking on some architectures, so disable them
 MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
-MEDIASTREAMER_LICENSE = GPLv2+
+MEDIASTREAMER_LICENSE = GPL-2.0+
 MEDIASTREAMER_LICENSE_FILES = COPYING
 
 # fix compilation issue with latest bctoolbox (touches configure.ac)
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index d2ec1a7..eb071cc 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -7,7 +7,7 @@
 MEMTEST86_VERSION = 5.01
 MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
 MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
-MEMTEST86_LICENSE = GPLv2
+MEMTEST86_LICENSE = GPL-2.0
 MEMTEST86_LICENSE_FILES = README
 
 # memtest86+ is sensitive to toolchain changes, use the shipped binary version
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 802c1e4..0e64d8c 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -6,7 +6,7 @@
 
 MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
-MEMTESTER_LICENSE = GPLv2
+MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
 
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
diff --git a/package/memtool/memtool.mk b/package/memtool/memtool.mk
index f641627..c236cab 100644
--- a/package/memtool/memtool.mk
+++ b/package/memtool/memtool.mk
@@ -7,7 +7,7 @@
 MEMTOOL_VERSION = 2016.10.0
 MEMTOOL_SITE = http://public.pengutronix.de/software/memtool
 MEMTOOL_SOURCE = memtool-$(MEMTOOL_VERSION).tar.xz
-MEMTOOL_LICENSE = GPLv2
+MEMTOOL_LICENSE = GPL-2.0
 MEMTOOL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index d889779..b93200c 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -9,7 +9,7 @@ METACITY_VERSION_MAJOR = 2.25
 METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
 METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
-METACITY_LICENSE = GPLv2+
+METACITY_LICENSE = GPL-2.0+
 METACITY_LICENSE_FILES = COPYING
 
 METACITY_CONF_OPTS = \
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 94a4628..75cd0c4 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -6,7 +6,7 @@
 
 MINICOM_VERSION = 2.7
 MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/3977
-MINICOM_LICENSE = GPLv2+
+MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 0e765e8..cf2f273 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -6,7 +6,7 @@
 
 MINIDLNA_VERSION = 1.1.5
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
-MINIDLNA_LICENSE = GPLv2, BSD-3c
+MINIDLNA_LICENSE = GPL-2.0, BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
index 17e73f1..f037a2e 100644
--- a/package/miraclecast/miraclecast.mk
+++ b/package/miraclecast/miraclecast.mk
@@ -6,7 +6,7 @@
 
 MIRACLECAST_VERSION = c94be167c85c6ec8badd7ac79e3dea2e0b73225c
 MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
-MIRACLECAST_LICENSE = LGPLv2.1+, GPLv2 (gdhcp)
+MIRACLECAST_LICENSE = LGPLv2.1+, GPL-2.0 (gdhcp)
 MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
 MIRACLECAST_DEPENDENCIES = host-pkgconf systemd gstreamer1 \
 	readline libglib2
diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 76ae968..c7392fa 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -7,7 +7,7 @@
 MJPEGTOOLS_VERSION = 2.1.0
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
 MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
-MJPEGTOOLS_LICENSE = GPLv2+
+MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index a710af6..4fecf69 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -10,7 +10,7 @@
 # http://sourceforge.net/p/mjpg-streamer/patches/14/
 MJPG_STREAMER_VERSION = bbf32fddfd02a9e072e89e83a5b33e6ca0a7bd4b
 MJPG_STREAMER_SITE = $(call github,oliv3r,mjpg-streamer,$(MJPG_STREAMER_VERSION))
-MJPG_STREAMER_LICENSE = GPLv2+
+MJPG_STREAMER_LICENSE = GPL-2.0+
 MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index 07935a4..ba4bd29 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -7,7 +7,7 @@
 # source included in buildroot, taken from
 # https://github.com/rfc1036/whois/blob/master/
 # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
-HOST_MKPASSWD_LICENSE = GPLv2+
+HOST_MKPASSWD_LICENSE = GPL-2.0+
 
 define HOST_MKPASSWD_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index 04b2ef0..bba2eb4 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MKPIMAGE_LICENSE = GPLv2
+HOST_MKPIMAGE_LICENSE = GPL-2.0
 
 # source included in the package
 # came from barebox's repository:
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 7473a1b..5eb9a9a 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -6,7 +6,7 @@
 
 MMC_UTILS_VERSION = 2cb6695e8dec00d887bdd5309d1b57d836fcd214
 MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
-MMC_UTILS_LICENSE = GPLv2
+MMC_UTILS_LICENSE = GPL-2.0
 
 define MMC_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 6a9b6a0..ecb7d3f 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -7,7 +7,7 @@
 MODEM_MANAGER_VERSION = 1.6.4
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
-MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
+MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPLv2+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 7dfa119..ad8b08c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -6,7 +6,7 @@
 
 MONGOOSE_VERSION = 6.2
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
-MONGOOSE_LICENSE = GPLv2
+MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
 
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 866bff2..58dfab7 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -7,7 +7,7 @@
 MONO_VERSION = 4.6.2.16
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
-MONO_LICENSE = GPLv2 or MIT (compiler, tools), MIT (libs) or commercial
+MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING eglib/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
 MONO_INSTALL_STAGING = YES
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index d76b547..ce64a93 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -6,7 +6,7 @@
 
 MOTION_VERSION = release-4.0.1
 MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
-MOTION_LICENSE = GPLv2
+MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
 MOTION_DEPENDENCIES = host-pkgconf jpeg
 # From git and patched configure.ac
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index d9aa1f8..6c15c0d 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -8,7 +8,7 @@ MPD_MPC_VERSION_MAJOR = 0
 MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).28
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
-MPD_MPC_LICENSE = GPLv2+
+MPD_MPC_LICENSE = GPL-2.0+
 MPD_MPC_LICENSE_FILES = COPYING
 MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
 MPD_MPC_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 79cc995..7fd9bc9 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -13,7 +13,7 @@ endif
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-MPD_LICENSE = GPLv2+
+MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 8288dcb..6b3009a 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -8,7 +8,7 @@ MPLAYER_VERSION = 1.3.0
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 MPLAYER_DEPENDENCIES = host-pkgconf
-MPLAYER_LICENSE = GPLv2
+MPLAYER_LICENSE = GPL-2.0
 MPLAYER_LICENSE_FILES = LICENSE Copyright
 MPLAYER_CFLAGS = $(TARGET_CFLAGS)
 MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 5b83b6d..2c5d829 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -10,7 +10,7 @@ MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
 	host-pkgconf ffmpeg zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-MPV_LICENSE = GPLv2+
+MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE
 
 MPV_NEEDS_EXTERNAL_WAF = YES
diff --git a/package/msr-tools/msr-tools.mk b/package/msr-tools/msr-tools.mk
index 4f84a28..bfe1a07 100644
--- a/package/msr-tools/msr-tools.mk
+++ b/package/msr-tools/msr-tools.mk
@@ -6,7 +6,7 @@
 
 MSR_TOOLS_VERSION = 1.3
 MSR_TOOLS_SITE = $(call github,01org,msr-tools,msr-tools-$(MSR_TOOLS_VERSION))
-MSR_TOOLS_LICENSE = GPLv2
+MSR_TOOLS_LICENSE = GPL-2.0
 MSR_TOOLS_LICENSE_FILES = cpuid.c
 
 define MSR_TOOLS_BUILD_CMDS
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index acf24d5..d6f0be2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -7,7 +7,7 @@
 MTD_VERSION = 1.5.2
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
-MTD_LICENSE = GPLv2
+MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 
 MTD_INSTALL_STAGING = YES
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 5ee6124..82688ed 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -9,7 +9,7 @@ MTR_SITE = $(call github,traviscross,mtr,$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
-MTR_LICENSE = GPLv2
+MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index cc6eb78..6f88266 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -7,7 +7,7 @@
 MULTICAT_VERSION = 2.1
 MULTICAT_SOURCE = multicat-$(MULTICAT_VERSION).tar.bz2
 MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
-MULTICAT_LICENSE = GPLv2+
+MULTICAT_LICENSE = GPL-2.0+
 MULTICAT_LICENSE_FILES = COPYING
 
 MULTICAT_DEPENDENCIES = bitstream
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index cd44ca1..8c3be5e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -6,7 +6,7 @@
 
 MUTT_VERSION = 1.7.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
-MUTT_LICENSE = GPLv2+
+MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-smtp
diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
index fa7ca84..07ef8da 100644
--- a/package/mxsldr/mxsldr.mk
+++ b/package/mxsldr/mxsldr.mk
@@ -6,7 +6,7 @@
 
 MXSLDR_VERSION = 2793a657ab7a22487d21c1b020957806f8ae8383
 MXSLDR_SITE = git://git.denx.de/mxsldr.git
-MXSLDR_LICENSE = GPLv2+
+MXSLDR_LICENSE = GPL-2.0+
 MXSLDR_LICENSE_FILES = COPYING
 HOST_MXSLDR_DEPENDENCIES = host-libusb host-pkgconf
 
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index caab368..7893cc6 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -8,7 +8,7 @@ NANOCOM_VERSION = 1.0
 NANOCOM_SOURCE = nanocom.tar.gz
 NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
 NANOCOM_STRIP_COMPONENTS = 0
-NANOCOM_LICENSE = GPLv2+
+NANOCOM_LICENSE = GPL-2.0+
 NANOCOM_LICENSE_FILES = COPYING
 
 define NANOCOM_BUILD_CMDS
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 7eeadec..82de1c4 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -9,7 +9,7 @@ NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = libglib2
-NBD_LICENSE = GPLv2
+NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index b5fa7cd..6f421df 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -9,7 +9,7 @@ NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).25
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
-NCMPC_LICENSE = GPLv2+
+NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index f431035..4797a8e 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -9,7 +9,7 @@ NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
-NDISC6_LICENSE = GPLv2 or GPLv3
+NDISC6_LICENSE = GPL-2.0 or GPLv3
 NDISC6_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index ed2c6b1..c46f46c 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -7,7 +7,7 @@
 NEARD_VERSION = 0.14
 NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
-NEARD_LICENSE = GPLv2
+NEARD_LICENSE = GPL-2.0
 NEARD_LICENSE_FILES = COPYING
 
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index c3164ef..f3e55fd 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -7,7 +7,7 @@
 NEARDAL_VERSION = 33b54a55032b047fd885a5eb3592c169c0056c49
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
-NEARDAL_LICENSE = GPLv2
+NEARDAL_LICENSE = GPL-2.0
 NEARDAL_LICENSE_FILES = COPYING
 
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index ca1a6bd..6a517a9 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,7 +6,7 @@
 
 NEON_VERSION = 0.30.2
 NEON_SITE = http://www.webdav.org/neon
-NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
+NEON_LICENSE = LGPLv2+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index f0c61d5..5720fcc 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -7,7 +7,7 @@
 NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-NET_TOOLS_LICENSE = GPLv2+
+NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
 
 # Install after busybox for the full-blown versions
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index dbe13a9..053a55d 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -12,7 +12,7 @@ NETATALK_AUTORECONF = YES
 NETATALK_CONFIG_SCRIPTS = netatalk-config
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
-NETATALK_LICENSE = GPLv2+, LGPLv3+, MIT-like
+NETATALK_LICENSE = GPL-2.0+, LGPLv3+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
 
 # Don't run ldconfig!
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 5d01ebb..eb7ddca 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -6,7 +6,7 @@
 
 NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
-NETCAT_LICENSE = GPLv2+
+NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index a165192..9363a71 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -7,7 +7,7 @@
 NETPLUG_VERSION = 1.2.9.2
 NETPLUG_SOURCE = netplug-$(NETPLUG_VERSION).tar.bz2
 NETPLUG_SITE = http://www.red-bean.com/~bos/netplug
-NETPLUG_LICENSE = GPLv2
+NETPLUG_LICENSE = GPL-2.0
 NETPLUG_LICENSE_FILES = COPYING
 
 define NETPLUG_BUILD_CMDS
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 4ec7e74..1a4017e 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -6,7 +6,7 @@
 
 NETSNIFF_NG_VERSION = v0.6.2
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
-NETSNIFF_NG_LICENSE = GPLv2
+NETSNIFF_NG_LICENSE = GPL-2.0
 NETSNIFF_NG_LICENSE_FILES = README COPYING
 # Prevent netsniff-ng configure script from finding a host installed nacl
 NETSNIFF_NG_CONF_ENV = \
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index 9a60f12..0d16579 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -6,7 +6,7 @@
 
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
-NETSTAT_NAT_LICENSE = GPLv2+
+NETSTAT_NAT_LICENSE = GPL-2.0+
 NETSTAT_NAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 31789ec..4937f4e 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -8,7 +8,7 @@ NETTLE_VERSION = 3.3
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = Dual GPLv2+/LGPLv3+
+NETTLE_LICENSE = Dual GPL-2.0+/LGPLv3+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3d7a1bf..6e82d30 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -11,7 +11,7 @@ NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(N
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
-NETWORK_MANAGER_LICENSE = GPLv2+ (app), LGPLv2+ (libnm-util)
+NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPLv2+ (libnm-util)
 NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
 NETWORK_MANAGER_CONF_ENV = \
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 2b8d337..1764bbc 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -11,7 +11,7 @@ NEWT_DEPENDENCIES = popt slang \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 NEWT_CONF_OPTS = --without-python --without-tcl
 NEWT_MAKE = $(MAKE1)
-NEWT_LICENSE = GPLv2
+NEWT_LICENSE = GPL-2.0
 NEWT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index a4e2045..d4c7c4c 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -9,7 +9,7 @@ NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
 	libnetfilter_acct
-NFACCT_LICENSE = GPLv2
+NFACCT_LICENSE = GPL-2.0
 NFACCT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 179009d..26112d6 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -7,7 +7,7 @@
 NFS_UTILS_VERSION = 1.3.3
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
-NFS_UTILS_LICENSE = GPLv2+
+NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_DEPENDENCIES = host-pkgconf
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 64d6be7..7263ec7 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -9,7 +9,7 @@ NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
 	host-pkgconf $(if $(BR2_NEEDS_GETTEXT),gettext)
-NFTABLES_LICENSE = GPLv2
+NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 33f1b60..491d518 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -6,7 +6,7 @@
 
 NGINX_NAXSI_VERSION = 0.55.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
-NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
+NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
 
 $(eval $(generic-package))
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 927474c..f7857e8 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -8,7 +8,7 @@ NGIRCD_VERSION = 20.3
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = http://arthur.barton.de/pub/ngircd
 NGIRCD_DEPENDENCIES = zlib
-NGIRCD_LICENSE = GPLv2+
+NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/nload/nload.mk b/package/nload/nload.mk
index 1ead61c..80d42a1 100644
--- a/package/nload/nload.mk
+++ b/package/nload/nload.mk
@@ -7,7 +7,7 @@
 NLOAD_VERSION = 0.7.4
 NLOAD_SITE = http://www.roland-riegel.de/nload
 NLOAD_DEPENDENCIES = ncurses
-NLOAD_LICENSE = GPLv2+
+NLOAD_LICENSE = GPL-2.0+
 NLOAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 6e178b1..37720e2 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -11,7 +11,7 @@ NMAP_DEPENDENCIES = libpcap pcre
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
 	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
-NMAP_LICENSE = GPLv2
+NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
 # needed by libpcap
diff --git a/package/nodm/nodm.mk b/package/nodm/nodm.mk
index da6bc85..4f751c3 100644
--- a/package/nodm/nodm.mk
+++ b/package/nodm/nodm.mk
@@ -6,7 +6,7 @@
 
 NODM_VERSION = 0.12-1
 NODM_SITE = $(call github,spanezz,nodm,debian/$(NODM_VERSION))
-NODM_LICENSE = GPLv2+
+NODM_LICENSE = GPL-2.0+
 NODM_LICENSE_FILES = COPYING
 NODM_AUTORECONF = YES
 
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index a61d141..b7fcc84 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -7,7 +7,7 @@
 NOIP_VERSION = 2.1.9
 NOIP_SITE = http://www.no-ip.com/client/linux
 NOIP_SOURCE = noip-duc-linux.tar.gz
-NOIP_LICENSE = GPLv2+
+NOIP_LICENSE = GPL-2.0+
 NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 25658f9..0aabde7 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -10,7 +10,7 @@ NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
-NTFS_3G_LICENSE = GPLv2+, LGPLv2+
+NTFS_3G_LICENSE = GPL-2.0+, LGPLv2+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index e2d2590..83fdae7 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -9,7 +9,7 @@ NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_PATCH = \
 	https://github.com/numactl/numactl/commit/3770bdc4fa7b9059db5cd2aa8bb09b50fa15e456.patch \
 	https://github.com/numactl/numactl/commit/31dc2951c758698bff060aeae8ffd8854616183b.patch
-NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
+NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README
 NUMACTL_INSTALL_STAGING = YES
 
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 7136e83..8cd4184 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -7,7 +7,7 @@
 NUT_VERSION_MAJOR = 2.7
 NUT_VERSION = $(NUT_VERSION_MAJOR).4
 NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
-NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
+NUT_LICENSE = GPL-2.0+, GPLv3+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_DEPENDENCIES = host-pkgconf
 
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 455875a..2636f95 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -7,7 +7,7 @@
 NUTTCP_VERSION = 6.1.2
 NUTTCP_SITE = http://nuttcp.net/nuttcp
 NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
-NUTTCP_LICENSE = GPLv2
+NUTTCP_LICENSE = GPL-2.0
 NUTTCP_LICENSE_FILES = LICENSE
 
 define NUTTCP_BUILD_CMDS
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index b745025..66b3cef 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -6,7 +6,7 @@
 
 NVME_VERSION = v0.3
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
-NVME_LICENSE = GPLv2+
+NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
 
 # Yes LIBUDEV=0 means udev support enabled, LIBUDEV=1 means udev
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 0ec9657..31867d7 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -6,7 +6,7 @@
 
 ODHCP6C_VERSION = 7533a6243dc3ac5a747cf6ccbc4d0539dafd3e07
 ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
-ODHCP6C_LICENSE = GPLv2
+ODHCP6C_LICENSE = GPL-2.0
 ODHCP6C_LICENSE_FILES = COPYING
 
 define ODHCP6C_INSTALL_SCRIPT
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 8234396..88749aa 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -7,7 +7,7 @@
 OFONO_VERSION = 1.18
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
-OFONO_LICENSE = GPLv2
+OFONO_LICENSE = GPL-2.0
 OFONO_LICENSE_FILES = COPYING
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index cfd6638..a4f3501 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -6,7 +6,7 @@
 
 OLA_VERSION = 0.10.2
 OLA_SITE = https://github.com/OpenLightingProject/ola/releases/download/$(OLA_VERSION)
-OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
+OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPL-2.0+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
 OLA_AUTORECONF = YES
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index b8a342b..e2aeefa 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -6,7 +6,7 @@
 
 OMAP_U_BOOT_UTILS_VERSION = 3f07426cddc0be9e24702e7aacc7574ddd7fba28
 OMAP_U_BOOT_UTILS_SITE = $(call github,nmenon,omap-u-boot-utils,$(OMAP_U_BOOT_UTILS_VERSION))
-OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
+OMAP_U_BOOT_UTILS_LICENSE = GPL-2.0, GPL-2.0+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index da4614b..7425014 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -6,7 +6,7 @@
 
 OMXPLAYER_VERSION = 6c90c7503ba4658221774759edf7f2ae816711de
 OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
-OMXPLAYER_LICENSE = GPLv2+
+OMXPLAYER_LICENSE = GPL-2.0+
 OMXPLAYER_LICENSE_FILES = COPYING
 
 OMXPLAYER_DEPENDENCIES = \
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index b40ed86..9864313 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -7,7 +7,7 @@
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
 ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
 
-ON2_8170_MODULES_LICENSE = GPLv2+
+ON2_8170_MODULES_LICENSE = GPL-2.0+
 #There is no license file
 
 $(eval $(kernel-module))
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 588692d..589d344 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -7,7 +7,7 @@
 OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk
 OPEN2300_SITE_METHOD = svn
 OPEN2300_VERSION = 12
-OPEN2300_LICENSE = GPLv2
+OPEN2300_LICENSE = GPL-2.0
 OPEN2300_LICENSE_FILES = COPYING
 
 OPEN2300_BINS = \
diff --git a/package/openbox/openbox.mk b/package/openbox/openbox.mk
index b5148e0..91d1c86 100644
--- a/package/openbox/openbox.mk
+++ b/package/openbox/openbox.mk
@@ -7,7 +7,7 @@
 OPENBOX_VERSION = 3.6.1
 OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.xz
 OPENBOX_SITE = http://openbox.org/dist/openbox
-OPENBOX_LICENSE = GPLv2+
+OPENBOX_LICENSE = GPL-2.0+
 OPENBOX_LICENSE_FILES = COPYING
 
 OPENBOX_CONF_OPTS = \
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 9faa7c6..25bd7fd 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -9,7 +9,7 @@ OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_PATCH = \
 	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
-OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
+OPENIPMI_LICENSE = LGPLv2+, GPL-2.0+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
 # Patching Makefile.am
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 6a1a10b..b6b2bf0 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -10,7 +10,7 @@ OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPE
 OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
 # Libraries seems to be released under LGPLv2.1+,
 # while other material is under GPLv2+.
-OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
+OPENOBEX_LICENSE = GPL-2.0+/LGPLv2.1+
 OPENOBEX_LICENSE_FILES = COPYING COPYING.LIB
 
 OPENOBEX_DEPENDENCIES = host-pkgconf
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index dcb548c..a3fbd18 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -7,7 +7,7 @@
 OPENPOWERLINK_VERSION = V2.5.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
-OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK_LICENSE = BSD-2c, GPL-2.0
 OPENPOWERLINK_LICENSE_FILES = license.md
 
 OPENPOWERLINK_INSTALL_STAGING = YES
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 5c8e143..c83c583 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -6,7 +6,7 @@
 
 OPENSWAN_VERSION = 2.6.46
 OPENSWAN_SITE = http://download.openswan.org/openswan
-OPENSWAN_LICENSE = GPLv2+, BSD-3c
+OPENSWAN_LICENSE = GPL-2.0+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 6efbe4e..4417512 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -7,7 +7,7 @@
 OPENTYRIAN_VERSION = 9c9f0ec3532b
 OPENTYRIAN_SITE = https://bitbucket.org/opentyrian/opentyrian
 OPENTYRIAN_SITE_METHOD = hg
-OPENTYRIAN_LICENSE = GPLv2+
+OPENTYRIAN_LICENSE = GPL-2.0+
 OPENTYRIAN_LICENSE_FILES = COPYING
 
 OPENTYRIAN_DEPENDENCIES = sdl
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 6581a4e..aba6e30 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -8,7 +8,7 @@ OPENVPN_VERSION = 2.4.1
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-OPENVPN_LICENSE = GPLv2
+OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
 	--disable-plugin-auth-pam \
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index aa3c44d..6f4e64e 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -7,7 +7,7 @@
 OPKG_UTILS_VERSION = 0.3.4
 OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
-OPKG_UTILS_LICENSE = GPLv2+
+OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
 
 define HOST_OPKG_UTILS_BUILD_CMDS
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index bf19a60..0c7e15e 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -9,7 +9,7 @@ OPKG_SITE = http://git.yoctoproject.org/git/opkg
 OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf libarchive
-OPKG_LICENSE = GPLv2+
+OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPTS = --disable-curl
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index f6c0f13..d86b8c5 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -6,7 +6,7 @@
 
 OPROFILE_VERSION = 1.1.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
-OPROFILE_LICENSE = GPLv2+
+OPROFILE_LICENSE = GPL-2.0+
 OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index f0f0649..45a71fa 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -11,7 +11,7 @@ ORACLE_MYSQL_SITE = http://dev.mysql.com/get/Downloads/MySQL-$(ORACLE_MYSQL_VERS
 ORACLE_MYSQL_INSTALL_STAGING = YES
 ORACLE_MYSQL_DEPENDENCIES = readline ncurses
 ORACLE_MYSQL_AUTORECONF = YES
-ORACLE_MYSQL_LICENSE = GPLv2
+ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
 ORACLE_MYSQL_PROVIDES = mysql
 
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index e0679d2..a7f9ed0 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -13,7 +13,7 @@ OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
 OWFS_AUTORECONF = YES
 
 # owtcl license is declared in module/ownet/c/src/include/ow_functions.h
-OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
+OWFS_LICENSE = GPL-2.0+, LGPLv2 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
 OWFS_INSTALL_STAGING = YES
 
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index a1afdb3..163ab1b 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -7,7 +7,7 @@
 P910ND_VERSION = 0.97
 P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
 P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
-P910ND_LICENSE = GPLv2
+P910ND_LICENSE = GPL-2.0
 P910ND_LICENSE_FILES = COPYING
 
 define P910ND_BUILD_CMDS
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 2a85e39..7146532 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -8,7 +8,7 @@ PANGOMM_VERSION_MAJOR = 2.40
 PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
-PANGOMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
+PANGOMM_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (tools)
 PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
 PANGOMM_DEPENDENCIES = glibmm cairomm libsigc pango host-pkgconf
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 35ea8e8..b31468e 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -7,7 +7,7 @@
 PAX_UTILS_VERSION = 1.2.2
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
-PAX_UTILS_LICENSE = GPLv2
+PAX_UTILS_LICENSE = GPL-2.0
 PAX_UTILS_LICENSE_FILES = COPYING
 
 PAX_UTILS_DEPENDENCIES = host-pkgconf
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index e65eadc..5b32eed 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -8,7 +8,7 @@ PCIUTILS_VERSION = 3.5.2
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-PCIUTILS_LICENSE = GPLv2+
+PCIUTILS_LICENSE = GPL-2.0+
 PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index e361909..e173436 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -8,7 +8,7 @@ PCMANFM_VERSION = 1.2.4
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
-PCMANFM_LICENSE = GPLv2+
+PCMANFM_LICENSE = GPL-2.0+
 PCMANFM_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 59a749f..8e77f1d 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -6,7 +6,7 @@
 
 PICOCOM_VERSION = 2.1
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
-PICOCOM_LICENSE = GPLv2+
+PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
 define PICOCOM_BUILD_CMDS
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index bcb910a..e4f68b5 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -7,7 +7,7 @@
 PINENTRY_VERSION = 0.9.4
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
-PINENTRY_LICENSE = GPLv2+
+PINENTRY_LICENSE = GPL-2.0+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 6076bb9..911d40d 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -6,7 +6,7 @@
 
 POLICYCOREUTILS_VERSION = 2.6
 POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-POLICYCOREUTILS_LICENSE = GPLv2
+POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index f31387e..e283181 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -6,7 +6,7 @@
 
 POLKIT_VERSION = 0.103
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
-POLKIT_LICENSE = GPLv2
+POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 
 POLKIT_INSTALL_STAGING = YES
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index d5f1378..aea90b0 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -8,7 +8,7 @@ POPPLER_VERSION = 0.53.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-POPPLER_LICENSE = GPLv2+
+POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index f6e0277..0aa79dc 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -8,7 +8,7 @@ POWERPC_UTILS_VERSION = v1.3.3
 POWERPC_UTILS_SITE = $(call github,nfont,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
-POWERPC_UTILS_LICENSE = GPLv2+
+POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
 
 POWERPC_UTILS_CONF_ENV = \
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 53be483..bd73e19 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -7,7 +7,7 @@
 POWERTOP_VERSION = 2.7
 POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
-POWERTOP_LICENSE = GPLv2
+POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
 # We're patching Makefile.am
 POWERTOP_AUTORECONF = YES
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 55630a8..722146c 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,7 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = https://download.samba.org/pub/ppp
-PPPD_LICENSE = LGPLv2+, LGPL, BSD-4c, BSD-3c, GPLv2+
+PPPD_LICENSE = LGPLv2+, LGPL, BSD-4c, BSD-3c, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index c3e147a..37bb7e1 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -7,7 +7,7 @@
 PPS_TOOLS_VERSION = 47333f24af878f67ce48022e8af16419713aa1ac
 PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
 PPS_TOOLS_INSTALL_STAGING = YES
-PPS_TOOLS_LICENSE = GPLv2+
+PPS_TOOLS_LICENSE = GPL-2.0+
 PPS_TOOLS_LICENSE_FILES = COPYING
 
 define PPS_TOOLS_BUILD_CMDS
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 1538457..17433b0 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -8,7 +8,7 @@ PPTP_LINUX_VERSION = 1.8.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
-PPTP_LINUX_LICENSE = GPLv2+
+PPTP_LINUX_LICENSE = GPL-2.0+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
 define PPTP_LINUX_BUILD_CMDS
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 5f5e7fb..d370ae3 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -8,7 +8,7 @@ PRBOOM_VERSION = 2.5.0
 PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
-PRBOOM_LICENSE = GPLv2+
+PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 267ddc2..df0e737 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -10,7 +10,7 @@ PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
 PRIVOXY_AUTORECONF = YES
 PRIVOXY_DEPENDENCIES = pcre zlib
-PRIVOXY_LICENSE = GPLv2+
+PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 0f8b20c..d5a140b 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -7,7 +7,7 @@
 PROCPS_NG_VERSION = 3.3.12
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
-PROCPS_NG_LICENSE = GPLv2+, LGPLv2+ (libproc and libps)
+PROCPS_NG_LICENSE = GPL-2.0+, LGPLv2+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index b5ffddc..21f7de5 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -6,7 +6,7 @@
 
 PROFTPD_VERSION = 1.3.5d
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
-PROFTPD_LICENSE = GPLv2+
+PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 
 PROFTPD_CONF_ENV = \
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index 54e7dcd..0d31bce 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -7,7 +7,7 @@
 PROXYCHAINS_NG_VERSION = 4.6
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
-PROXYCHAINS_NG_LICENSE = GPLv2+
+PROXYCHAINS_NG_LICENSE = GPL-2.0+
 PROXYCHAINS_NG_LICENSE_FILES = COPYING
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index adaa4ac..ee28de6 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -6,7 +6,7 @@
 
 PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
-PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
+PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPL-2.0, Public Domain
 PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 2f83b7d..70caf5e 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -8,7 +8,7 @@ PSMISC_VERSION = 22.21
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_PATCH = \
 	https://gitlab.com/psmisc/psmisc/commit/e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
-PSMISC_LICENSE = GPLv2
+PSMISC_LICENSE = GPL-2.0
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 4e365c5..0bd985f 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -6,7 +6,7 @@
 
 PSPLASH_VERSION = 14c8f7b705de944beb4de3f296506d80871e410f
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
-PSPLASH_LICENSE = GPLv2+
+PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_AUTORECONF = YES
 
 define PSPLASH_INSTALL_INIT_SYSTEMD
diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index 9810097..653adb8 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -6,7 +6,7 @@
 
 PWGEN_VERSION = 2.07
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
-PWGEN_LICENSE = GPLv2
+PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
 
 $(eval $(autotools-package))
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 6976715..537afff 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -8,7 +8,7 @@ PYTHON_DICTTOXML_VERSION = 1.7.4
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
 PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
-PYTHON_DICTTOXML_LICENSE = GPLv2
+PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
 
 $(eval $(python-package))
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index 157576e..d4cdded 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -8,7 +8,7 @@ PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
 PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
 PYTHON_ID3_SETUP_TYPE = distutils
-PYTHON_ID3_LICENSE = GPLv2+
+PYTHON_ID3_LICENSE = GPL-2.0+
 PYTHON_ID3_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 5a49887..a222148 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -8,7 +8,7 @@ PYTHON_MAD_VERSION = 0.6
 PYTHON_MAD_SOURCE = pymad-$(PYTHON_MAD_VERSION).tar.gz
 PYTHON_MAD_SITE = http://spacepants.org/src/pymad/download
 PYTHON_MAD_SETUP_TYPE = distutils
-PYTHON_MAD_LICENSE = GPLv2+
+PYTHON_MAD_LICENSE = GPL-2.0+
 PYTHON_MAD_LICENSE_FILES = COPYING
 
 PYTHON_MAD_DEPENDENCIES = libmad
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index c80eb98..3b516fe 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -7,7 +7,7 @@
 PYTHON_MUTAGEN_VERSION = 1.36.2
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
 PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/e7/8a/61496657e30c2cbeb9b3aa28848e0adbcba7cab0ff0bd8e6206647670088
-PYTHON_MUTAGEN_LICENSE = GPLv2
+PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = distutils
 
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index e670f3d..75b6de7 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -8,7 +8,7 @@ PYTHON_PYLRU_VERSION = 1.0.9
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
 PYTHON_PYLRU_SITE = https://pypi.python.org/packages/c0/7d/0de1055632f3871dfeaabe5a3f0510317cd98b93e7b792b44e4c7de2b17b
 PYTHON_PYLRU_SETUP_TYPE = distutils
-PYTHON_PYLRU_LICENSE = GPLv2
+PYTHON_PYLRU_LICENSE = GPL-2.0
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 4bf58c4..4a691f2 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -7,7 +7,7 @@
 PYTHON_PYPARTED_VERSION = v3.10.7
 PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,$(PYTHON_PYPARTED_VERSION))
 PYTHON_PYPARTED_SETUP_TYPE = distutils
-PYTHON_PYPARTED_LICENSE = GPLv2+
+PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = COPYING
 PYTHON_PYPARTED_DEPENDENCIES = host-python-cffi parted
 
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 50e8351..f689be6 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -7,7 +7,7 @@
 PYTHON_PYQT_VERSION = 4.11.3
 PYTHON_PYQT_SOURCE = PyQt-x11-gpl-$(PYTHON_PYQT_VERSION).tar.gz
 PYTHON_PYQT_SITE = http://downloads.sourceforge.net/project/pyqt/PyQt4/PyQt-$(PYTHON_PYQT_VERSION)
-PYTHON_PYQT_LICENSE = GPLv2 or GPLv3
+PYTHON_PYQT_LICENSE = GPL-2.0 or GPLv3
 PYTHON_PYQT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
 
 PYTHON_PYQT_DEPENDENCIES = python-sip host-python-sip qt
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index f026b7f..eed8eb4 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -7,7 +7,7 @@
 PYTHON_PYROUTE2_VERSION = 0.4.13
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
 PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/91/e7/814f60e355078dc51625cd2e7e715ed4a06111ddf2ac5580f2f10e79c94a
-PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
+PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
 
diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
index 661cb9d..e858dcc 100644
--- a/package/python-scapy3k/python-scapy3k.mk
+++ b/package/python-scapy3k/python-scapy3k.mk
@@ -7,6 +7,6 @@
 PYTHON_SCAPY3K_VERSION = v0.18
 PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,$(PYTHON_SCAPY3K_VERSION))
 PYTHON_SCAPY3K_SETUP_TYPE = distutils
-PYTHON_SCAPY3K_LICENSE = GPLv2+
+PYTHON_SCAPY3K_LICENSE = GPL-2.0+
 
 $(eval $(python-package))
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 0c0a947..60adec2 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -7,7 +7,7 @@
 PYTHON_SIP_VERSION = 4.18
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
-PYTHON_SIP_LICENSE = SIP license or GPLv2 or GPLv3
+PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPLv3
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
 
 ifeq ($(BR2_PACKAGE_QT5),y)
diff --git a/package/python-smbus-cffi/python-smbus-cffi.mk b/package/python-smbus-cffi/python-smbus-cffi.mk
index 5fd9558..bc5731d 100644
--- a/package/python-smbus-cffi/python-smbus-cffi.mk
+++ b/package/python-smbus-cffi/python-smbus-cffi.mk
@@ -8,7 +8,7 @@ PYTHON_SMBUS_CFFI_VERSION = 0.5.1
 PYTHON_SMBUS_CFFI_SOURCE = smbus-cffi-$(PYTHON_SMBUS_CFFI_VERSION).tar.gz
 PYTHON_SMBUS_CFFI_SITE = https://pypi.python.org/packages/source/s/smbus-cffi
 PYTHON_SMBUS_CFFI_SETUP_TYPE = setuptools
-PYTHON_SMBUS_CFFI_LICENSE = GPLv2
+PYTHON_SMBUS_CFFI_LICENSE = GPL-2.0
 PYTHON_SMBUS_CFFI_LICENSE_FILES = LICENSE
 PYTHON_SMBUS_CFFI_DEPENDENCIES = host-python-cffi
 
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index d839bb3..17fb049 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -8,7 +8,7 @@ PYTHON_SPIDEV_VERSION = 3.2
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
 PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/36/83/73748b6e1819b57d8e1df8090200195cdae33aaa22a49a91ded16785eedd
 PYTHON_SPIDEV_SETUP_TYPE = distutils
-PYTHON_SPIDEV_LICENSE = GPLv2
+PYTHON_SPIDEV_LICENSE = GPL-2.0
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE.md
 
 $(eval $(python-package))
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e744556..6c42490 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -7,7 +7,7 @@
 QEMU_VERSION = 2.8.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
+QEMU_LICENSE = GPL-2.0, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #?NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 5dac5b0..77e9c53 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -15,7 +15,7 @@ QT53D_DEPENDENCIES += assimp
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT53D_LICENSE = GPLv2 or GPLv3 or LGPLv3
+QT53D_LICENSE = GPL-2.0 or GPLv3 or LGPLv3
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT53D_LICENSE = Commercial license
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1020348..b1fd6fb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -50,7 +50,7 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5BASE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5BASE_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 3f605ab..7a35a76 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -11,7 +11,7 @@ QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5CANVAS3D_LICENSE = GPLv2 or GPLv3 or LGPLv3
+QT5CANVAS3D_LICENSE = GPL-2.0 or GPLv3 or LGPLv3
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 else
 QT5CANVAS3D_LICENSE = Commercial license
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index f00dcb2..f0e1e4d 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -12,10 +12,10 @@ QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5CONNECTIVITY_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5CONNECTIVITY_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index d5b298c..66a2696 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -12,7 +12,7 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5DECLARATIVE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5DECLARATIVE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index aef69eb..76d9ddc 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -12,10 +12,10 @@ QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5GRAPHICALEFFECTS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5GRAPHICALEFFECTS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index d764925..802a3f4 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -12,10 +12,10 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5IMAGEFORMATS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5IMAGEFORMATS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index dbdc645..f6f413c 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -12,10 +12,10 @@ QT5LOCATION_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5LOCATION_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5LOCATION_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5LOCATION_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0a95340..638133d 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,7 +12,7 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5MULTIMEDIA_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5MULTIMEDIA_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 43254ba..0a1d632 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,7 +11,7 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS_LICENSE = GPLv2 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5QUICKCONTROLS_LICENSE = Commercial license
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index fb9ef32..00c0ac0 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -12,10 +12,10 @@ QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SENSORS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SENSORS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SENSORS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index b188f5d..636b529 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -11,7 +11,7 @@ QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SERIALBUS_LICENSE = GPLv2 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALBUS_LICENSE = GPL-2.0 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SERIALBUS_LICENSE = Commercial license
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 4fbca9e..b0f0cec 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -12,10 +12,10 @@ QT5SERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SERIALPORT_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5SERIALPORT_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALPORT_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 08821e4..e946a67 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -12,7 +12,7 @@ QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5SVG_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5SVG_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5SVG_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 0395f96..1f02eb2 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -21,7 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5TOOLS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5TOOLS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5TOOLS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 9522a74..1d10a5c 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -12,10 +12,10 @@ QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBCHANNEL_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5WEBCHANNEL_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 975ea64..972fa73 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -12,7 +12,7 @@ QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5WEBSOCKETS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools)
+QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
 else
 QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 996056b..d3d409e 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -12,10 +12,10 @@ QT5X11EXTRAS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5X11EXTRAS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
-QT5X11EXTRAS_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
+QT5X11EXTRAS_LICENSE = GPL-2.0 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 else
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index e5981af..d33d180 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -12,7 +12,7 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5XMLPATTERNS_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
+QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 else
 QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index c17ceaa..b2b4e2a 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -7,7 +7,7 @@
 QUAGGA_VERSION = 1.1.1
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
-QUAGGA_LICENSE = GPLv2+
+QUAGGA_LICENSE = GPL-2.0+
 QUAGGA_LICENSE_FILES = COPYING
 
 # We need to override the sysconf and localstate directories so that
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index a1e343a..d3b8755 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -8,7 +8,7 @@ QUOTA_VERSION = 4.01
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
-QUOTA_LICENSE = GPLv2+
+QUOTA_LICENSE = GPL-2.0+
 QUOTA_CONF_OPTS = --disable-strip-binaries
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 8e282c1..6499e16 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -6,7 +6,7 @@
 
 RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
 RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
-RACEHOUND_LICENSE = GPLv2
+RACEHOUND_LICENSE = GPL-2.0
 RACEHOUND_LICENSE_FILES = LICENSE
 RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
 
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 2653663..445d2be 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -8,7 +8,7 @@ RAPTOR_VERSION = 2.0.15
 RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
 RAPTOR_SITE = http://download.librdf.org/source
 RAPTOR_DEPENDENCIES = libxml2 libxslt
-RAPTOR_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
+RAPTOR_LICENSE = GPL-2.0+ or LGPLv2.1+ or Apache-2.0+
 RAPTOR_LICENSE_FILES = LICENSE.txt
 RAPTOR_INSTALL_STAGING = YES
 
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index cc07bdf..bbb1a64 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -6,7 +6,7 @@
 
 RNG_TOOLS_VERSION = 5
 RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
-RNG_TOOLS_LICENSE = GPLv2
+RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 
 # Work around for uClibc or musl toolchains which lack argp_*()
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 99d231e..4214df9 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -6,7 +6,7 @@
 
 RP_PPPOE_VERSION = 3.12
 RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
-RP_PPPOE_LICENSE = GPLv2
+RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 1c03f2e..d57dd70 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -9,7 +9,7 @@ RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
-RPM_LICENSE = GPLv2 or LGPLv2 (library only)
+RPM_LICENSE = GPL-2.0 or LGPLv2 (library only)
 RPM_LICENSE_FILES = COPYING
 RPM_PATCH = \
 	https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch \
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index abca1d8..84c7bb7 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -6,7 +6,7 @@
 
 RRDTOOL_VERSION = 1.6.0
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
-RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
+RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
 # autoreconf needed to avoid link failure due to missing -lintl,
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index a62c2df..f63da64 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -7,7 +7,7 @@
 RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
 RSH_REDONE_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/r/rsh-redone
-RSH_REDONE_LICENSE = GPLv2
+RSH_REDONE_LICENSE = GPL-2.0
 RSH_REDONE_LICENSE_FILES = rsh.c
 
 RSH_REDONE_BINS-y =
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 9a9c562..fb0ce5d 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -7,7 +7,7 @@
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
 RT_TESTS_VERSION = 1.0
-RT_TESTS_LICENSE = GPLv2+
+RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 8560be2..5c1cc73 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -6,7 +6,7 @@
 
 RTL8188EU_VERSION = ced2b64a1139dcaf86947e3a9f7617dffbd64239
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
-RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
+RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
 
diff --git a/package/rtl8723bs/rtl8723bs.mk b/package/rtl8723bs/rtl8723bs.mk
index f5bc1ac..4c6303c 100644
--- a/package/rtl8723bs/rtl8723bs.mk
+++ b/package/rtl8723bs/rtl8723bs.mk
@@ -6,7 +6,7 @@
 
 RTL8723BS_VERSION = 11ab92d8ccd71c80f0102828366b14ef6b676fb2
 RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
-RTL8723BS_LICENSE = GPLv2, proprietary (*.bin firmware blobs)
+RTL8723BS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8723BS=m \
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 9ba43ef..5f39bc5 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -6,7 +6,7 @@
 
 RTL8821AU_VERSION = c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
-RTL8821AU_LICENSE = GPLv2
+RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = COPYING
 
 RTL8821AU_MODULE_MAKE_OPTS = \
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index edde02e..51dc9ee 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -8,7 +8,7 @@ RTORRENT_VERSION = 0.9.6
 RTORRENT_SITE = http://rtorrent.net/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_AUTORECONF = YES
-RTORRENT_LICENSE = GPLv2
+RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 37e5136..ed3b912 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -7,7 +7,7 @@
 SANE_BACKENDS_VERSION = 1.0.25
 SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/4146
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
-SANE_BACKENDS_LICENSE = GPLv2+
+SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
 SANE_BACKENDS_INSTALL_STAGING = YES
 
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 60ebc74..6bafe03 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -9,7 +9,7 @@ SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
 SBC_DEPENDENCIES = libsndfile host-pkgconf
-SBC_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
+SBC_LICENSE = GPL-2.0+ (programs), LGPLv2.1+ (library)
 SBC_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 793ca6f..cf7bcbc 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -6,7 +6,7 @@
 
 SCONESERVER_VERSION = d659468cd164e6a6cc12932cc6780566b04f8328
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
-SCONESERVER_LICENSE = GPLv2+
+SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
index b816272..0207a4c 100644
--- a/package/scrub/scrub.mk
+++ b/package/scrub/scrub.mk
@@ -6,7 +6,7 @@
 
 SCRUB_VERSION = 2.6.1
 SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
-SCRUB_LICENSE = GPLv2+
+SCRUB_LICENSE = GPL-2.0+
 SCRUB_LICENSE_FILES = COPYING DISCLAIMER
 SCRUB_PATCH = https://github.com/chaos/scrub/commit/11d30916dd9c11a26c7c8a0f6db9e6ebca301594.patch
 
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 137eaed..94c0d59 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -6,7 +6,7 @@
 
 SEPOLGEN_VERSION = 2.6
 SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-SEPOLGEN_LICENSE = GPLv2
+SEPOLGEN_LICENSE = GPL-2.0
 SEPOLGEN_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 3d9002a..833becc 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -6,7 +6,7 @@
 
 SER2NET_VERSION = 3.4
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
-SER2NET_LICENSE = GPLv2+
+SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 87a19cf..7ff14ac 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -9,7 +9,7 @@ SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
 SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)
 SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2 host-bison host-flex
 SETOOLS_INSTALL_STAGING = YES
-SETOOLS_LICENSE = GPLv2+, LGPLv2.1+
+SETOOLS_LICENSE = GPL-2.0+, LGPLv2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 
 # configure.ac is patched by the cross compile patch,
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 561fbe9..66ca59d 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -8,7 +8,7 @@ SETSERIAL_VERSION = 2.17
 SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial
-SETSERIAL_LICENSE = GPLv2
+SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index e7af83a..bc7b0b5 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -10,7 +10,7 @@ SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
-SG3_UTILS_LICENSE += GPLv2+
+SG3_UTILS_LICENSE += GPL-2.0+
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 64bb4d5..300c3e0 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -16,7 +16,7 @@ SHARED_MIME_INFO_CONF_OPTS = \
 HOST_SHARED_MIME_INFO_CONF_OPTS = \
 	--disable-update-mimedb \
 	--disable-default-make-check
-SHARED_MIME_INFO_LICENSE = GPLv2
+SHARED_MIME_INFO_LICENSE = GPL-2.0
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
 HOST_SHARED_MIME_INFO_DEPENDENCIES = \
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 1173ef7..1db62e6 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -6,7 +6,7 @@
 
 SHELLINABOX_VERSION = v2.19
 SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,$(SHELLINABOX_VERSION))
-SHELLINABOX_LICENSE = GPLv2 with OpenSSL exception
+SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
 
 # Fetching from Github, and patching Makefile.am, so we need to autoreconf
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 91ed413..fe05302 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -6,7 +6,7 @@
 
 SIMICSFS_VERSION = 1.18
 SIMICSFS_SITE = http://download.simics.net/pub
-SIMICSFS_LICENSE = GPLv2+
+SIMICSFS_LICENSE = GPL-2.0+
 SIMICSFS_LICENSE_FILES = hostfs.h
 
 $(eval $(kernel-module))
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index 3f3635e..85c0338 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -6,7 +6,7 @@
 
 SISPMCTL_VERSION = 3.1
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
-SISPMCTL_LICENSE = GPLv2+
+SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = LICENCE
 SISPMCTL_DEPENDENCIES = libusb-compat
 
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index e6abdee..7feaeb4 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -6,7 +6,7 @@
 
 SLANG_VERSION = 2.3.0
 SLANG_SITE = http://www.jedsoft.org/releases/slang
-SLANG_LICENSE = GPLv2+
+SLANG_LICENSE = GPL-2.0+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_CONF_OPTS = --with-onig=no
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index cd0c076..137c00a 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -6,7 +6,7 @@
 
 SMARTMONTOOLS_VERSION = 6.5
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
-SMARTMONTOOLS_LICENSE = GPLv2+
+SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index a3d4bc4..0dd39ea 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -7,7 +7,7 @@
 SMCROUTE_VERSION = 2.1.1
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
-SMCROUTE_LICENSE = GPLv2+
+SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
 
 SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 52f9b31..2dfd11b 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -6,7 +6,7 @@
 
 SMSTOOLS3_VERSION = 3.1.15
 SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
-SMSTOOLS3_LICENSE = GPLv2+
+SMSTOOLS3_LICENSE = GPL-2.0+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
 
 SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 754b210..ba46263 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -7,7 +7,7 @@
 SOCAT_VERSION = 2.0.0-b9
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
-SOCAT_LICENSE = GPLv2
+SOCAT_LICENSE = GPL-2.0
 SOCAT_LICENSE_FILES = COPYING
 SOCAT_CONF_ENV = \
 	sc_cv_termios_ispeed=no \
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 0cc56ef..3b4bba6 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -7,7 +7,7 @@
 SOCKETCAND_VERSION = df7fb4ff8a4439d7737fe2df3540e1ab7465721a
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
-SOCKETCAND_LICENSE = BSD-3c or GPLv2
+SOCKETCAND_LICENSE = BSD-3c or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index da7d129..0222629 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -9,7 +9,7 @@ SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
 	https://github.com/dajhorn/SoftEtherVPN/commit/75625af541fd128f51079d0ffe5ef24645b8f421.patch
-SOFTETHER_LICENSE = GPLv2
+SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-softether openssl readline
 SOFTETHER_AUTORECONF = YES
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 61f5220..186f37d 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -10,7 +10,7 @@ SOX_SOURCE = sox-$(SOX_VERSION).tar.bz2
 SOX_DEPENDENCIES = host-pkgconf
 SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
 	$(if $(BR2_TOOLCHAIN_HAS_SSP),,--disable-stack-protector)
-SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
+SOX_LICENSE = GPL-2.0+ (sox binary), LGPLv2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
 # MIPS Codescape toolchains don't support stack-smashing protection
diff --git a/package/sp-oops-extract/sp-oops-extract.mk b/package/sp-oops-extract/sp-oops-extract.mk
index 9919807..a3ff46c 100644
--- a/package/sp-oops-extract/sp-oops-extract.mk
+++ b/package/sp-oops-extract/sp-oops-extract.mk
@@ -7,7 +7,7 @@
 SP_OOPS_EXTRACT_VERSION = 0.0.7-1
 SP_OOPS_EXTRACT_SITE = http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract
 SP_OOPS_EXTRACT_SOURCE = sp-oops-extract_$(SP_OOPS_EXTRACT_VERSION).tar.gz
-SP_OOPS_EXTRACT_LICENSE = GPLv2
+SP_OOPS_EXTRACT_LICENSE = GPL-2.0
 SP_OOPS_EXTRACT_LICENSE_FILES = COPYING
 
 define SP_OOPS_EXTRACT_BUILD_CMDS
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index 384ae41..e5f3774 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -8,7 +8,7 @@ SPI_TOOLS_VERSION = 0.8.1
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
-SPI_TOOLS_LICENSE = GPLv2
+SPI_TOOLS_LICENSE = GPL-2.0
 SPI_TOOLS_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 52441bb..50e7a30 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -14,7 +14,7 @@ SPIDEV_TEST_VERSION = v3.0
 endif
 SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
 SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
-SPIDEV_TEST_LICENSE = GPLv2
+SPIDEV_TEST_LICENSE = GPL-2.0
 
 # musl libc requires linux/ioctl.h for _IOC_SIZEBITS. Do a sed patch to keep
 # compatibility with different spidev_test.c versions that we support.
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 4f84872..65c39c1 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -7,7 +7,7 @@
 SQUASHFS_VERSION = 3de1687d7432ea9b302c2db9521996f506c140a3
 SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
 SQUASHFS_SITE_METHOD = git
-SQUASHFS_LICENSE = GPLv2+
+SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index cf0378a..263ce16 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -8,7 +8,7 @@ SQUID_VERSION_MAJOR = 3.5
 SQUID_VERSION = $(SQUID_VERSION_MAJOR).24
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
-SQUID_LICENSE = GPLv2+
+SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 # For 0001-assume-get-certificate-ok.patch
 SQUID_AUTORECONF = YES
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index b564f1a..723c10a 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -6,7 +6,7 @@
 
 SREDIRD_VERSION = 2.2.2
 SREDIRD_SITE = http://www.ibiblio.org/pub/Linux/system/serial
-SREDIRD_LICENSE = GPLv2+
+SREDIRD_LICENSE = GPL-2.0+
 SREDIRD_LICENSE_FILES = COPYING
 
 define SREDIRD_BUILD_CMDS
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index de4c361..1288318 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -6,7 +6,7 @@
 
 SSHFS_VERSION = 2.8
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs_$(SSHFS_VERSION)
-SSHFS_LICENSE = GPLv2
+SSHFS_LICENSE = GPL-2.0
 SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index de46604..6c14f0f 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -6,7 +6,7 @@
 
 SSHPASS_VERSION = 1.06
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
-SSHPASS_LICENSE = GPLv2+
+SSHPASS_LICENSE = GPL-2.0+
 SSHPASS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 17aafd1..3a9223b 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -6,7 +6,7 @@
 
 SSLH_VERSION = v1.18
 SSLH_SITE = http://www.rutschle.net/tech/sslh
-SSLH_LICENSE = GPLv2+
+SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
 
 SSLH_DEPENDENCIES = libconfig
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 5aac541..7071f56 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -23,7 +23,7 @@ START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
 # Patching m4/dpkg-arch.m4
 START_STOP_DAEMON_AUTORECONF = YES
-START_STOP_DAEMON_LICENSE = GPLv2+
+START_STOP_DAEMON_LICENSE = GPL-2.0+
 START_STOP_DAEMON_LICENSE_FILES = COPYING
 
 define START_STOP_DAEMON_BUILD_CMDS
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 22b468e..f9b131f 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -7,7 +7,7 @@
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial
 STATSERIAL_DEPENDENCIES = ncurses
-STATSERIAL_LICENSE = GPLv2+
+STATSERIAL_LICENSE = GPL-2.0+
 STATSERIAL_LICENSE_FILES = COPYING
 
 define STATSERIAL_BUILD_CMDS
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 2e9d57b..220abb2 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -7,7 +7,7 @@
 STELLA_VERSION = 4.7.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = http://downloads.sourceforge.net/stella
-STELLA_LICENSE = GPLv2+
+STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
 STELLA_DEPENDENCIES = sdl2 libpng zlib
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index 2c0fa56..c41fc76 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -6,7 +6,7 @@
 
 STM32FLASH_VERSION = 4ac0566f188f39eace0223d966d349cd2f2c5895
 STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
-STM32FLASH_LICENSE = GPLv2+
+STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
 
 define STM32FLASH_BUILD_CMDS
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index b4d4699..794e875 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -6,7 +6,7 @@
 
 STRESS_NG_VERSION = 0.06.15
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
-STRESS_NG_LICENSE = GPLv2+
+STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
 STRESS_NG_DEPENDENCIES = attr keyutils
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 1b5ba06..4d2d4cb 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -6,7 +6,7 @@
 
 STRESS_VERSION = 1.0.4
 STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
-STRESS_LICENSE = GPLv2+
+STRESS_LICENSE = GPL-2.0+
 STRESS_LICENSE_FILES = COPYING
 
 # Stress is linked statically if the --enable-static is specified.
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 36b5148..2a852f2 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -7,7 +7,7 @@
 STRONGSWAN_VERSION = 5.4.0
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
-STRONGSWAN_LICENSE = GPLv2+
+STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_CONF_OPTS += \
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index f98e7b5..99e5381 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -13,7 +13,7 @@ STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 STUNNEL_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	LIBS=$(if $(BR2_STATIC_LIBS),-lz)
-STUNNEL_LICENSE = GPLv2+
+STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 1a58aff..9bb0b9e 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -6,7 +6,7 @@
 
 SUNXI_TOOLS_VERSION = v1.4.1
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
-SUNXI_TOOLS_LICENSE = GPLv2+
+SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 7f2cb0a..335ec90 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -6,7 +6,7 @@
 
 SWUPDATE_VERSION = 2017.01
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
-SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
+SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
 
 # swupdate bundles its own version of mongoose (version 3.8)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 8d42623..ea5c42e 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -8,7 +8,7 @@ SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
-SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
+SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPLv2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 82d672b..a4053e3 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -6,7 +6,7 @@
 
 SYNERGY_VERSION = v1.8.5-stable
 SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
-SYNERGY_LICENSE = GPLv2
+SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
 SYNERGY_DEPENDENCIES = libcurl openssl xlib_libX11 xlib_libXtst
 
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 85d16a4..f967727 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -6,7 +6,7 @@
 
 SYSDIG_VERSION = 0.1.100
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
-SYSDIG_LICENSE = GPLv2
+SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
 	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 49997d4..e1f0c34 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -6,7 +6,7 @@
 
 SYSKLOGD_VERSION = 1.5.1
 SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
-SYSKLOGD_LICENSE = GPLv2+
+SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
 
 # Override BusyBox implementations if BusyBox is enabled.
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 61fc48f..8f56f5c 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 SYSLOG_NG_VERSION = 3.9.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
-SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
+SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 0650781..033194a 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -7,7 +7,7 @@
 SYSPROF_VERSION = 1.2.0
 SYSPROF_SITE = http://sysprof.com
 SYSPROF_DEPENDENCIES = libglib2
-SYSPROF_LICENSE = GPLv2+
+SYSPROF_LICENSE = GPL-2.0+
 SYSPROF_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index c285342..31645b8 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -9,7 +9,7 @@ SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
-SYSSTAT_LICENSE = GPLv2+
+SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cfd885d..d8ebec8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -6,7 +6,7 @@
 
 SYSTEMD_VERSION = 233
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
-SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
+SYSTEMD_LICENSE = LGPLv2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index faefd5c..ca7d06b 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -8,7 +8,7 @@ SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
 SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1+squeeze1.diff.gz
 SYSVINIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sysvinit
-SYSVINIT_LICENSE = GPLv2+
+SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 
 SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 48c8a6d..db74da9 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -7,7 +7,7 @@
 # This correpsonds to SDK 02.00.00.00
 TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
 TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git
-TI_SGX_KM_LICENSE = GPLv2
+TI_SGX_KM_LICENSE = GPL-2.0
 TI_SGX_KM_LICENSE_FILES = GPL-COPYING
 
 TI_SGX_KM_DEPENDENCIES = linux
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index 66b93e4..8b1678f 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -6,7 +6,7 @@
 
 TI_UIM_VERSION = a0236bc252e6484835ce266ae4a50b361f6a902d
 TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
-TI_UIM_LICENSE = GPLv2+
+TI_UIM_LICENSE = GPL-2.0+
 TI_UIM_LICENSE_FILES = uim.h
 
 define TI_UIM_BUILD_CMDS
diff --git a/package/time/time.mk b/package/time/time.mk
index 56f28ff..8092ea9 100644
--- a/package/time/time.mk
+++ b/package/time/time.mk
@@ -7,7 +7,7 @@
 TIME_VERSION = 1.7
 TIME_SITE = $(BR2_GNU_MIRROR)/time
 TIME_CONF_ENV = ac_cv_func_wait3=yes
-TIME_LICENSE = GPLv2+
+TIME_LICENSE = GPL-2.0+
 TIME_LICENSE_FILES = COPYING
 
 # time uses an old version of automake that does not support
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index 6d87cbf..f537d46 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -7,7 +7,7 @@
 TINC_VERSION = 1.0.30
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
-TINC_LICENSE = GPLv2+ with OpenSSL exception
+TINC_LICENSE = GPL-2.0+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index 3069d67..079fada 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -6,7 +6,7 @@
 
 TOVID_VERSION = 0.35.0
 TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
-TOVID_LICENSE = GPLv2+
+TOVID_LICENSE = GPL-2.0+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
 
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 2348155..a4f2255 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -8,7 +8,7 @@ TRACE_CMD_VERSION = trace-cmd-v2.6
 TRACE_CMD_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-TRACE_CMD_LICENSE = GPLv2, LGPLv2.1
+TRACE_CMD_LICENSE = GPL-2.0, LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
 TRACE_CMD_DEPENDENCIES = host-pkgconf
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 923ba40..fd923fe 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -18,7 +18,7 @@ TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
 	--disable-libnotify \
 	--enable-lightweight
-TRANSMISSION_LICENSE = GPLv2 or GPLv3 with OpenSSL exception
+TRANSMISSION_LICENSE = GPL-2.0 or GPLv3 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index b8988bd..34b6c60 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -7,7 +7,7 @@
 TREE_VERSION = 1.7.0
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
-TREE_LICENSE = GPLv2+
+TREE_LICENSE = GPL-2.0+
 TREE_LICENSE_FILES = LICENSE
 
 define TREE_BUILD_CMDS
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 7596e92..fa5a280 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -6,7 +6,7 @@
 
 TRINITY_VERSION = v1.6
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
-TRINITY_LICENSE = GPLv2
+TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 
 define TRINITY_CONFIGURE_CMDS
diff --git a/package/tunctl/tunctl.mk b/package/tunctl/tunctl.mk
index 30dbbd1..0d7b88d 100644
--- a/package/tunctl/tunctl.mk
+++ b/package/tunctl/tunctl.mk
@@ -7,7 +7,7 @@
 TUNCTL_VERSION = 1.5
 TUNCTL_SITE = http://downloads.sourceforge.net/project/tunctl/tunctl/$(TUNCTL_VERSION)
 
-TUNCTL_LICENSE = GPLv2
+TUNCTL_LICENSE = GPL-2.0
 TUNCTL_LICENSE_FILES = tunctl.c
 
 define TUNCTL_BUILD_CMDS
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b26a662..2585c7b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -7,7 +7,7 @@
 UBOOT_TOOLS_VERSION = 2017.03
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
-UBOOT_TOOLS_LICENSE = GPLv2+
+UBOOT_TOOLS_LICENSE = GPL-2.0+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 UBOOT_TOOLS_INSTALL_STAGING = YES
 
diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
index 1496a92..bd89e07 100644
--- a/package/uccp420wlan/uccp420wlan.mk
+++ b/package/uccp420wlan/uccp420wlan.mk
@@ -6,7 +6,7 @@
 
 UCCP420WLAN_VERSION = v6.9.1
 UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
-UCCP420WLAN_LICENSE = GPLv2 (kernel module), proprietary (firmware blob)
+UCCP420WLAN_LICENSE = GPL-2.0 (kernel module), proprietary (firmware blob)
 UCCP420WLAN_LICENSE_FILES = COPYING firmware/LICENSE.imagination
 
 define UCCP420WLAN_INSTALL_TARGET_CMDS
diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
index b183a13..aac068e 100644
--- a/package/ucl/ucl.mk
+++ b/package/ucl/ucl.mk
@@ -6,7 +6,7 @@
 
 UCL_VERSION = 1.03
 UCL_SITE = http://www.oberhumer.com/opensource/ucl/download
-UCL_LICENSE = GPLv2+
+UCL_LICENSE = GPL-2.0+
 UCL_LICENSE_FILES = COPYING
 
 # Fix ACC conformance test failure for host gcc 6.x
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index f1558fb..119bcc6 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -6,7 +6,7 @@
 
 UDISKS_VERSION = 1.0.5
 UDISKS_SITE = http://hal.freedesktop.org/releases
-UDISKS_LICENSE = GPLv2+
+UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
 # For 0002-Fix-systemd-service-file.patch
 UDISKS_AUTORECONF = YES
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index b0ce643..cb81781 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -7,7 +7,7 @@
 UDPCAST_VERSION = 20120424
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
-UDPCAST_LICENSE = BSD-2c, GPLv2+
+UDPCAST_LICENSE = BSD-2c, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
 
 define UDPCAST_REMOVE_UDP_SENDER
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 4017edc..5b0e558 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -11,7 +11,7 @@ ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
-ULOGD_LICENSE = GPLv2
+ULOGD_LICENSE = GPL-2.0
 ULOGD_LICENSE_FILES = COPYING
 
 # DB backends need threads
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 280fe57..387f804 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -8,7 +8,7 @@ UNIXODBC_VERSION = 2.3.4
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
-UNIXODBC_LICENSE = LGPLv2.1+ (library), GPLv2+ (programs)
+UNIXODBC_LICENSE = LGPLv2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
 
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index 54caeb1..f0eb5d6 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -7,7 +7,7 @@
 UNSCD_VERSION = 0.52
 UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
 UNSCD_SITE = http://busybox.net/~vda/unscd
-UNSCD_LICENSE = GPLv2
+UNSCD_LICENSE = GPL-2.0
 UNSCD_LICENSE_FILES = $(UNSCD_SOURCE)
 
 define UNSCD_EXTRACT_CMDS
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a9b057d..eabc04a 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -6,7 +6,7 @@
 
 UPMPDCLI_VERSION = 1.2.12
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
-UPMPDCLI_LICENSE = GPLv2+
+UPMPDCLI_LICENSE = GPL-2.0+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index 471eb41..79dc5e8 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -7,7 +7,7 @@
 UPOWER_VERSION = 0.99.4
 UPOWER_SOURCE = upower-$(UPOWER_VERSION).tar.xz
 UPOWER_SITE = https://upower.freedesktop.org/releases
-UPOWER_LICENSE = GPLv2+
+UPOWER_LICENSE = GPL-2.0+
 UPOWER_LICENSE_FILES = COPYING
 
 # libupower-glib.so
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index eaef275..5ed86b3 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -7,7 +7,7 @@
 UPX_VERSION = 3.91
 UPX_SITE = http://upx.sourceforge.net/download
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
-UPX_LICENSE = GPLv2+
+UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
 
 HOST_UPX_DEPENDENCIES = host-ucl host-zlib
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 57996ab..1901767 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -8,7 +8,7 @@ USB_MODESWITCH_VERSION = 2.5.0
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
-USB_MODESWITCH_LICENSE = GPLv2+
+USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
 
 USB_MODESWITCH_BUILD_TARGETS = static
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 6d75b31..4f634cd 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -8,7 +8,7 @@ USB_MODESWITCH_DATA_VERSION = 20170205
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-USB_MODESWITCH_DATA_LICENSE = GPLv2+
+USB_MODESWITCH_DATA_LICENSE = GPL-2.0+
 USB_MODESWITCH_DATA_LICENSE_FILES = COPYING
 
 # Nothing to build, it is a pure data package
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 6765a9b..ae251d6 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -14,7 +14,7 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
-USBREDIR_LICENSE := $(USBREDIR_LICENSE), GPLv2+ (program)
+USBREDIR_LICENSE := $(USBREDIR_LICENSE), GPL-2.0+ (program)
 USBREDIR_LICENSE_FILES += COPYING
 
 else # BR2_PACKAGE_USBREDIR_SERVER != y
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index c96a1f5..c397d0a 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -8,7 +8,7 @@ USBUTILS_VERSION = 008
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
-USBUTILS_LICENSE = GPLv2+
+USBUTILS_LICENSE = GPL-2.0+
 USBUTILS_LICENSE_FILES = COPYING
 
 # Build after busybox since it's got a lightweight lsusb
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 62d269c..3a5f178 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -8,7 +8,7 @@ USHARE_VERSION = 1.1a
 USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkgconf libupnp
-USHARE_LICENSE = GPLv2+
+USHARE_LICENSE = GPL-2.0+
 USHARE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
index c3d11f9..0c45c29 100644
--- a/package/ussp-push/ussp-push.mk
+++ b/package/ussp-push/ussp-push.mk
@@ -6,7 +6,7 @@
 
 USSP_PUSH_VERSION = 0.11
 USSP_PUSH_SITE = http://www.xmailserver.org
-USSP_PUSH_LICENSE = GPLv2+
+USSP_PUSH_LICENSE = GPL-2.0+
 USSP_PUSH_LICENSE_FILES = COPYING
 
 USSP_PUSH_DEPENDENCIES = bluez_utils openobex
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 05e1398..42a4a43 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -14,7 +14,7 @@ UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
+UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
index f3a8967..68efe27 100644
--- a/package/v4l2grab/v4l2grab.mk
+++ b/package/v4l2grab/v4l2grab.mk
@@ -6,7 +6,7 @@
 
 V4L2GRAB_VERSION = f8d8844d52387b3db7b8736f5e86156d9374f781
 V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
-V4L2GRAB_LICENSE = GPLv2+
+V4L2GRAB_LICENSE = GPL-2.0+
 V4L2GRAB_LICENSE_FILES = LICENSE.md
 # Fetched from github, no pre-generated configure script provided
 V4L2GRAB_AUTORECONF = YES
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index ccc6cc3..61f7466 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,7 +7,7 @@
 VALGRIND_VERSION = 3.12.0
 VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_LICENSE = GPLv2, GFDLv1.2
+VALGRIND_LICENSE = GPL-2.0, GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 3bbfd5f..6e0a074 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -7,7 +7,7 @@
 VDE2_VERSION = 2.3.2
 VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPLv2+, LGPLv2.1+, BSD-3c
+VDE2_LICENSE = GPL-2.0+, LGPLv2.1+, BSD-3c
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index aaa0859..9a02e44 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -6,7 +6,7 @@
 
 VDR_PLUGIN_VNSISERVER_VERSION = v1.5.0
 VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
-VDR_PLUGIN_VNSISERVER_LICENSE = GPLv2+
+VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
 VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
 
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index cdfa7e3..24467f7 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -7,7 +7,7 @@
 VDR_VERSION = 2.3.2
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
-VDR_LICENSE = GPLv2+
+VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
 VDR_INSTALL_STAGING = YES
 VDR_DEPENDENCIES = \
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 583edf3..86418c3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -7,7 +7,7 @@
 VLC_VERSION = 2.2.4
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
-VLC_LICENSE = GPLv2+, LGPLv2.1+
+VLC_LICENSE = GPL-2.0+, LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_DEPENDENCIES = host-pkgconf
 VLC_AUTORECONF = YES
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index f3e74a7..18fb319 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -6,7 +6,7 @@
 
 VNSTAT_VERSION = 1.17
 VNSTAT_SITE = http://humdi.net/vnstat
-VNSTAT_LICENSE = GPLv2
+VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
 VNSTAT_DEPENDENCIES = host-pkgconf
 
diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index fc8e7dd..1bec1e2 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -6,7 +6,7 @@
 
 VORBIS_TOOLS_VERSION = 1.4.0
 VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
-VORBIS_TOOLS_LICENSE = GPLv2
+VORBIS_TOOLS_LICENSE = GPL-2.0
 VORBIS_TOOLS_LICENSE_FILES = COPYING
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
 VORBIS_TOOLS_CONF_OPTS = --program-transform-name=''
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 282a422..81cd830 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -6,7 +6,7 @@
 
 VPNC_VERSION = b1243d29e0c00312ead038b04a2cf5e2fa31d740
 VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
-VPNC_LICENSE = GPLv2+
+VPNC_LICENSE = GPL-2.0+
 VPNC_LICENSE_FILES = COPYING
 
 VPNC_DEPENDENCIES = libgcrypt libgpg-error gnutls host-pkgconf
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index fd92346..2f86d91 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -7,7 +7,7 @@
 VSFTPD_VERSION = 3.0.3
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
-VSFTPD_LICENSE = GPLv2
+VSFTPD_LICENSE = GPL-2.0
 VSFTPD_LICENSE_FILES = COPYING
 
 define VSFTPD_DISABLE_UTMPX
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 5e0e266..9c46559 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -6,7 +6,7 @@
 
 VTUN_VERSION = 3.0.3
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
-VTUN_LICENSE = GPLv2+ with OpenSSL exception
+VTUN_LICENSE = GPL-2.0+ with OpenSSL exception
 VTUN_LICENSE_FILES = README.OpenSSL
 VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index 3ec84ed..cdb4250 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -7,7 +7,7 @@
 W_SCAN_VERSION = 20141122
 W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
 W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
-W_SCAN_LICENSE = GPLv2+
+W_SCAN_LICENSE = GPL-2.0+
 W_SCAN_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 29a18e3..24b6b69 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -12,7 +12,7 @@ WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
-WHOIS_LICENSE = GPLv2+
+WHOIS_LICENSE = GPL-2.0+
 WHOIS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 9ec7faf..83a8c87 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -7,7 +7,7 @@
 WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
-WIPE_LICENSE = GPLv2+
+WIPE_LICENSE = GPL-2.0+
 WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index f4e0ffb..51320a9 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -8,7 +8,7 @@ WIRELESS_TOOLS_VERSION_MAJOR = 30
 WIRELESS_TOOLS_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR).pre9
 WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
-WIRELESS_TOOLS_LICENSE = GPLv2
+WIRELESS_TOOLS_LICENSE = GPL-2.0
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index f26b23e..0d4aeeb 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -6,7 +6,7 @@
 
 WMCTRL_VERSION = 1.07
 WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
-WMCTRL_LICENSE = GPLv2+
+WMCTRL_LICENSE = GPL-2.0+
 WMCTRL_LICENSE_FILES = COPYING
 
 WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index 5c6f2d2..ddcc6ac 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -7,7 +7,7 @@
 XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
 XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils
 XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
-XCURSOR_TRANSPARENT_THEME_LICENSE = GPLv2
+XCURSOR_TRANSPARENT_THEME_LICENSE = GPL-2.0
 XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
 
 define ICONS_DEFAULT_CONFIG_INSTALL
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index cdb3237..561d7bf 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -10,7 +10,7 @@ X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11
 # leak in if host has sdl-config
 X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
-X11VNC_LICENSE = GPLv2+
+X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 2c8040b..7214c96 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -6,7 +6,7 @@
 
 X264_VERSION = 97eaef2ab82a46d13ea5e00270712d6475fbe42b
 X264_SITE = git://git.videolan.org/x264.git
-X264_LICENSE = GPLv2+
+X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
 X264_LICENSE_FILES = COPYING
 X264_INSTALL_STAGING = YES
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 498ceaa..2ea404b 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -7,7 +7,7 @@
 X265_VERSION = 2.3
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
-X265_LICENSE = GPLv2+
+X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 7d32e52..2e388fc 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,7 +6,7 @@
 
 XEN_VERSION = 4.7.1
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
-XEN_LICENSE = GPLv2
+XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-python
 
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index fc240f9..5125473 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -13,7 +13,7 @@ endif
 
 XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
-XENOMAI_LICENSE = GPLv2+ with exception (headers), LGPLv2.1+ (libraries), GPLv2+ (kernel), GFDLv1.2+ (docs), GPLv2 (ipipe patch, can driver)
+XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPLv2.1+ (libraries), GPL-2.0+ (kernel), GFDLv1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
 
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index ff802a4..7f4ffd4 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -7,7 +7,7 @@
 XL2TP_VERSION = v1.3.8
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap openssl
-XL2TP_LICENSE = GPLv2
+XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 831349b..773fcde 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -8,7 +8,7 @@ XSCREENSAVER_VERSION = 5.32
 XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
 
 # N.B. GPLv2+ code (in the hacks/glx subdirectory) is not currently built.
-XSCREENSAVER_LICENSE = MIT-like, GPLv2+
+XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 274e681..5c3be16 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -8,7 +8,7 @@ XTABLES_ADDONS_VERSION = 2.12
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-XTABLES_ADDONS_LICENSE = GPLv2+
+XTABLES_ADDONS_LICENSE = GPL-2.0+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
 
 XTABLES_ADDONS_CONF_OPTS = \
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index a9a5dbf..141a0e3 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -6,7 +6,7 @@
 
 XVISOR_VERSION = 0.2.8
 XVISOR_SITE = http://www.xhypervisor.org/tarball
-XVISOR_LICENSE = GPLv2+
+XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 14e3f42..132d7e1 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,7 +6,7 @@
 
 XVKBD_VERSION = 3.7
 XVKBD_SITE = http://t-sato.in.coocan.jp/xvkbd
-XVKBD_LICENSE = GPLv2+
+XVKBD_LICENSE = GPL-2.0+
 XVKBD_LICENSE_FILES = README
 
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 47ead75..e38b2dc 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -6,7 +6,7 @@
 
 XXHASH_VERSION = r40
 XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
-XXHASH_LICENSE = BSD-2c, GPLv2+
+XXHASH_LICENSE = BSD-2c, GPL-2.0+
 XXHASH_LICENSE_FILES = LICENSE xxhsum.c
 
 define XXHASH_BUILD_CMDS
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 40adb3d..4785be8 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = GPLv2+, GPLv3+, LGPLv2.1+
+XZ_LICENSE = GPL-2.0+, GPLv3+, LGPLv2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
diff --git a/package/yaffs2utils/yaffs2utils.mk b/package/yaffs2utils/yaffs2utils.mk
index fdd5f67..927ffd6 100644
--- a/package/yaffs2utils/yaffs2utils.mk
+++ b/package/yaffs2utils/yaffs2utils.mk
@@ -7,7 +7,7 @@
 YAFFS2UTILS_VERSION = 0.2.9
 YAFFS2UTILS_SOURCE = $(YAFFS2UTILS_VERSION).tar.gz
 YAFFS2UTILS_SITE = https://yaffs2utils.googlecode.com/files
-YAFFS2UTILS_LICENSE = GPLv2
+YAFFS2UTILS_LICENSE = GPL-2.0
 YAFFS2UTILS_LICENSE_FILES = COPYING
 
 define HOST_YAFFS2UTILS_BUILD_CMDS
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 1980034..25f11de 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,7 @@
 
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
-YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPLv2, LGPLv2
+YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPL-2.0, LGPLv2
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
index 04af2a6..4e3d76e 100644
--- a/package/yavta/yavta.mk
+++ b/package/yavta/yavta.mk
@@ -6,7 +6,7 @@
 
 YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
 YAVTA_SITE = git://git.ideasonboard.org/yavta.git
-YAVTA_LICENSE = GPLv2+
+YAVTA_LICENSE = GPL-2.0+
 YAVTA_LICENSE_FILES = COPYING.GPL
 
 define YAVTA_BUILD_CMDS
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 61e9cab..a50aee0 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -6,7 +6,7 @@
 
 YMPD_VERSION = v1.2.3
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
-YMPD_LICENSE = GPLv2
+YMPD_LICENSE = GPL-2.0
 YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
diff --git a/package/zd1211-firmware/zd1211-firmware.mk b/package/zd1211-firmware/zd1211-firmware.mk
index 59ea219..860aa76 100644
--- a/package/zd1211-firmware/zd1211-firmware.mk
+++ b/package/zd1211-firmware/zd1211-firmware.mk
@@ -7,7 +7,7 @@
 ZD1211_FIRMWARE_VERSION = 1.4
 ZD1211_FIRMWARE_SITE = http://downloads.sourceforge.net/project/zd1211/zd1211-firmware/$(ZD1211_FIRMWARE_VERSION)
 ZD1211_FIRMWARE_SOURCE = zd1211-firmware-$(ZD1211_FIRMWARE_VERSION).tar.bz2
-ZD1211_FIRMWARE_LICENSE = GPLv2
+ZD1211_FIRMWARE_LICENSE = GPL-2.0
 ZD1211_FIRMWARE_LICENSE_FILES = COPYING
 
 # Not all of the firmware files are used
-- 
2.6.2
