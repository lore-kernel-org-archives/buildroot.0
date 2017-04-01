From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:17:59 +0200
Subject: [Buildroot] [git commit] boot,
	package: use SPDX short identifier for GPLv3/GPLv3+
Message-ID: <20170401134425.044447FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=337aa51f3fd531ac676d4fc64075781129c9414a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for GPLv3/GPLv3+ is GPL-3.0/GPL-3.0+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv3\>/GPL-3.0/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk                                      | 2 +-
 package/4th/4th.mk                                       | 2 +-
 package/at/at.mk                                         | 2 +-
 package/aubio/aubio.mk                                   | 2 +-
 package/autoconf-archive/autoconf-archive.mk             | 2 +-
 package/autoconf/autoconf.mk                             | 2 +-
 package/bash/bash.mk                                     | 2 +-
 package/binutils/binutils.mk                             | 2 +-
 package/bison/bison.mk                                   | 2 +-
 package/ccache/ccache.mk                                 | 2 +-
 package/cgroupfs-mount/cgroupfs-mount.mk                 | 2 +-
 package/cifs-utils/cifs-utils.mk                         | 2 +-
 package/comix-cursors/comix-cursors.mk                   | 2 +-
 package/coreutils/coreutils.mk                           | 2 +-
 package/cpio/cpio.mk                                     | 2 +-
 package/dc3dd/dc3dd.mk                                   | 2 +-
 package/diffutils/diffutils.mk                           | 2 +-
 package/dillo/dillo.mk                                   | 2 +-
 package/ding-libs/ding-libs.mk                           | 2 +-
 package/dnsmasq/dnsmasq.mk                               | 2 +-
 package/domoticz/domoticz.mk                             | 2 +-
 package/dosfstools/dosfstools.mk                         | 2 +-
 package/ed/ed.mk                                         | 2 +-
 package/elfutils/elfutils.mk                             | 2 +-
 package/enscript/enscript.mk                             | 2 +-
 package/espeak/espeak.mk                                 | 2 +-
 package/evemu/evemu.mk                                   | 2 +-
 package/exfat-utils/exfat-utils.mk                       | 2 +-
 package/exfat/exfat.mk                                   | 2 +-
 package/fakeroot/fakeroot.mk                             | 2 +-
 package/findutils/findutils.mk                           | 2 +-
 package/ftop/ftop.mk                                     | 2 +-
 package/gawk/gawk.mk                                     | 2 +-
 package/gdb/gdb.mk                                       | 2 +-
 package/gdbm/gdbm.mk                                     | 2 +-
 package/gengetopt/gengetopt.mk                           | 2 +-
 package/gettext/gettext.mk                               | 2 +-
 package/git-crypt/git-crypt.mk                           | 2 +-
 package/glmark2/glmark2.mk                               | 2 +-
 package/gnupg/gnupg.mk                                   | 2 +-
 package/gnupg2/gnupg2.mk                                 | 2 +-
 package/gnuradio/gnuradio.mk                             | 2 +-
 package/gnutls/gnutls.mk                                 | 2 +-
 package/gperf/gperf.mk                                   | 2 +-
 package/gqrx/gqrx.mk                                     | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk                         | 2 +-
 package/grep/grep.mk                                     | 2 +-
 package/gsl/gsl.mk                                       | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk               | 2 +-
 package/gzip/gzip.mk                                     | 2 +-
 package/hans/hans.mk                                     | 2 +-
 package/haveged/haveged.mk                               | 2 +-
 package/hidapi/hidapi.mk                                 | 2 +-
 package/ifenslave/ifenslave.mk                           | 2 +-
 package/janus-gateway/janus-gateway.mk                   | 2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk               | 2 +-
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk   | 2 +-
 package/lensfun/lensfun.mk                               | 2 +-
 package/less/less.mk                                     | 2 +-
 package/lftp/lftp.mk                                     | 2 +-
 package/libasplib/libasplib.mk                           | 2 +-
 package/libassuan/libassuan.mk                           | 2 +-
 package/libcdio/libcdio.mk                               | 2 +-
 package/libfreeimage/libfreeimage.mk                     | 2 +-
 package/libgpiod/libgpiod.mk                             | 2 +-
 package/libgsasl/libgsasl.mk                             | 2 +-
 package/libiconv/libiconv.mk                             | 2 +-
 package/libidn/libidn.mk                                 | 2 +-
 package/libksba/libksba.mk                               | 2 +-
 package/libllcp/libllcp.mk                               | 2 +-
 package/libsigrok/libsigrok.mk                           | 2 +-
 package/libsigrokdecode/libsigrokdecode.mk               | 2 +-
 package/libstrophe/libstrophe.mk                         | 2 +-
 package/libtasn1/libtasn1.mk                             | 2 +-
 package/liburcu/liburcu.mk                               | 2 +-
 package/m4/m4.mk                                         | 2 +-
 package/make/make.mk                                     | 2 +-
 package/mc/mc.mk                                         | 2 +-
 package/mcrypt/mcrypt.mk                                 | 2 +-
 package/modplugtools/modplugtools.mk                     | 2 +-
 package/mosh/mosh.mk                                     | 2 +-
 package/msmtp/msmtp.mk                                   | 2 +-
 package/mtdev2tuio/mtdev2tuio.mk                         | 2 +-
 package/mtools/mtools.mk                                 | 2 +-
 package/nano/nano.mk                                     | 2 +-
 package/ndisc6/ndisc6.mk                                 | 2 +-
 package/nmon/nmon.mk                                     | 2 +-
 package/nut/nut.mk                                       | 2 +-
 package/ocrad/ocrad.mk                                   | 2 +-
 package/openzwave/openzwave.mk                           | 2 +-
 package/parted/parted.mk                                 | 2 +-
 package/patch/patch.mk                                   | 2 +-
 package/patchelf/patchelf.mk                             | 2 +-
 package/pifmrds/pifmrds.mk                               | 2 +-
 package/pound/pound.mk                                   | 2 +-
 package/pulseview/pulseview.mk                           | 2 +-
 package/python-daemon/python-daemon.mk                   | 2 +-
 package/python-docutils/python-docutils.mk               | 2 +-
 package/python-enum/python-enum.mk                       | 2 +-
 package/python-mwscrape2slob/python-mwscrape2slob.mk     | 2 +-
 package/python-networkmanager/python-networkmanager.mk   | 2 +-
 package/python-pyqt/python-pyqt.mk                       | 2 +-
 package/python-pyqt5/python-pyqt5.mk                     | 2 +-
 package/python-sip/python-sip.mk                         | 2 +-
 package/python-slob/python-slob.mk                       | 2 +-
 package/qt/qt.mk                                         | 2 +-
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.mk                           | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk           | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk             | 4 ++--
 package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk           | 4 ++--
 package/qt5/qt5location/qt5location.mk                   | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk               | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5script/qt5script.mk                       | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                     | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk               | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                             | 4 ++--
 package/qt5/qt5tools/qt5tools.mk                         | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.mk               | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk               | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 4 ++--
 package/qtuio/qtuio.mk                                   | 2 +-
 package/ranger/ranger.mk                                 | 2 +-
 package/rdesktop/rdesktop.mk                             | 2 +-
 package/readline/readline.mk                             | 2 +-
 package/rsync/rsync.mk                                   | 2 +-
 package/rsyslog/rsyslog.mk                               | 2 +-
 package/samba4/samba4.mk                                 | 2 +-
 package/screen/screen.mk                                 | 2 +-
 package/sed/sed.mk                                       | 2 +-
 package/sigrok-cli/sigrok-cli.mk                         | 2 +-
 package/sngrep/sngrep.mk                                 | 2 +-
 package/squeezelite/squeezelite.mk                       | 2 +-
 package/supertuxkart/supertuxkart.mk                     | 2 +-
 package/swig/swig.mk                                     | 2 +-
 package/tar/tar.mk                                       | 2 +-
 package/tcping/tcping.mk                                 | 2 +-
 package/tcpreplay/tcpreplay.mk                           | 2 +-
 package/transmission/transmission.mk                     | 2 +-
 package/triggerhappy/triggerhappy.mk                     | 2 +-
 package/tvheadend/tvheadend.mk                           | 2 +-
 package/udpxy/udpxy.mk                                   | 2 +-
 package/wavemon/wavemon.mk                               | 2 +-
 package/wget/wget.mk                                     | 2 +-
 package/which/which.mk                                   | 2 +-
 package/xorriso/xorriso.mk                               | 2 +-
 package/xz/xz.mk                                         | 2 +-
 package/yad/yad.mk                                       | 2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk                   | 2 +-
 157 files changed, 172 insertions(+), 172 deletions(-)

Patch is too large, so refusing to show it
