Return-Path: <buildroot-bounces@buildroot.org>
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02002C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6232541983;
	Thu, 28 Jul 2022 08:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6232541983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMXGvgGhJj0o; Thu, 28 Jul 2022 08:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2DD4197C;
	Thu, 28 Jul 2022 08:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2DD4197C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 265E61BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF2FD82D07
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF2FD82D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W_MlZP7HO2i for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 08:07:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CA882C38
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0CA882C38
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:07:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id BC40360006;
 Thu, 28 Jul 2022 08:07:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:07:32 +0200
Message-Id: <20220728080733.3177721-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jul 2022 08:47:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658995663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7j20jUQuftkNFlXt/EyuRsfbUbECc3pVhlLy4ZKshT4=;
 b=o1WY+71ySDdL/77JKl5o/t9UKXkRrCXFqklJp400Eqo4CQvRSWZ4KnG2JJ4i9Agc6F7mf0
 7vKKX5cPqRivZ6T5SC/0eho573p/nppK/Md0/A37Gyvi1v9/vrVwnY0K4OZsGwudrZPw9R
 XzlGBaP1A9/Yoz/gmtZSCfUBjGHxFypGpYPGuWsG3TgliDWE4Q0RgU18DCn+/nchkDmtQN
 O7o9I+yBVY0YIKYP7ZlKWPkEvNgKzsmnq2C/AZb76gqbbwxHNsXXAhJf7WxD5qehJOMa9C
 AP4VtxynrrVjqsnGbLt9EljyVJPMo4ltdyE+C+Xs+Rv3o6hlvw6PBqoTvv7slw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o1WY+71y
Subject: [Buildroot] [PATCH 1/2] boot, package, support,
 toolchain: switch to 2 spaces for the hash file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's time to finally switch over globally to the new spacing format
that we have agreed on for the hash file, with 2 spaces as a separator
between fields.

This commit was mechanically generated using:

find . -type f -name '*.hash' | xargs sed -i 's%^md5[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%md5  \1  \2%'
find . -type f -name '*.hash' | xargs sed -i 's%^sha1[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha1  \1  \2%'
find . -type f -name '*.hash' | xargs sed -i 's%^sha256[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha256  \1  \2%'
find . -type f -name '*.hash' | xargs sed -i 's%^sha512[ \t]*\([^ \t]*\)[ \t]*\(.*\)$%sha512  \1  \2%'

This commit can easily be backported on the LTS branch by re-running
the same commands, if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/binaries-marvell/binaries-marvell.hash   |    4 +-
 boot/s500-bootloader/s500-bootloader.hash     |    2 +-
 boot/shim/shim.hash                           |    4 +-
 package/abootimg/abootimg.hash                |    4 +-
 package/acpitool/acpitool.hash                |    4 +-
 package/aespipe/aespipe.hash                  |    6 +-
 package/alsamixergui/alsamixergui.hash        |    2 +-
 package/alure/alure.hash                      |    4 +-
 package/android-tools/android-tools.hash      |    4 +-
 .../angular-websocket/angular-websocket.hash  |    4 +-
 package/aoetools/aoetools.hash                |    4 +-
 package/apr-util/apr-util.hash                |    4 +-
 package/apr/apr.hash                          |    4 +-
 package/argparse/argparse.hash                |    4 +-
 package/argus/argus.hash                      |    6 +-
 .../arm-gnu-toolchain/arm-gnu-toolchain.hash  |    2 +-
 package/arp-scan/arp-scan.hash                |    4 +-
 package/arptables/arptables.hash              |    4 +-
 package/ascii-invaders/ascii-invaders.hash    |    4 +-
 package/asterisk/asterisk.hash                |    4 +-
 package/atest/atest.hash                      |    4 +-
 package/atf/atf.hash                          |    4 +-
 package/aubio/aubio.hash                      |    4 +-
 package/autossh/autossh.hash                  |    8 +-
 package/avahi/avahi.hash                      |    4 +-
 package/b43-firmware/b43-firmware.hash        |    4 +-
 package/b43-fwcutter/b43-fwcutter.hash        |    4 +-
 package/bc/bc.hash                            |    6 +-
 package/bcache-tools/bcache-tools.hash        |    4 +-
 package/bdwgc/bdwgc.hash                      |    4 +-
 package/berkeleydb/berkeleydb.hash            |    4 +-
 package/biosdevname/biosdevname.hash          |    4 +-
 package/bitstream/bitstream.hash              |    6 +-
 package/bonnie/bonnie.hash                    |    2 +-
 package/bsdiff/bsdiff.hash                    |    2 +-
 package/bzip2/bzip2.hash                      |    4 +-
 .../cache-calibrator/cache-calibrator.hash    |    4 +-
 package/cage/cage.hash                        |    4 +-
 package/cairo/cairo.hash                      |   10 +-
 package/caps/caps.hash                        |    4 +-
 package/cbootimage/cbootimage.hash            |    4 +-
 package/cctz/cctz.hash                        |    4 +-
 package/cgic/cgic.hash                        |    4 +-
 package/cgilua/cgilua.hash                    |    4 +-
 package/chartjs/chartjs.hash                  |    4 +-
 package/chipmunk/chipmunk.hash                |    4 +-
 package/cmocka/cmocka.hash                    |    4 +-
 package/collectd/collectd.hash                |    8 +-
 package/comix-cursors/comix-cursors.hash      |    2 +-
 package/connman-gtk/connman-gtk.hash          |    4 +-
 package/conntrack-tools/conntrack-tools.hash  |    4 +-
 package/copas/copas.hash                      |    4 +-
 package/coxpcall/coxpcall.hash                |    4 +-
 package/cpio/cpio.hash                        |    8 +-
 package/cppdb/cppdb.hash                      |    4 +-
 package/cppunit/cppunit.hash                  |    6 +-
 package/cpuburn-arm/cpuburn-arm.hash          |    4 +-
 package/cpuload/cpuload.hash                  |    4 +-
 package/cracklib/cracklib.hash                |    6 +-
 package/ctorrent/ctorrent.hash                |    2 +-
 package/cunit/cunit.hash                      |    4 +-
 package/curlpp/curlpp.hash                    |    4 +-
 package/cwiid/cwiid.hash                      |    4 +-
 package/cxxtest/cxxtest.hash                  |    4 +-
 package/czmq/czmq.hash                        |    8 +-
 package/dacapo/dacapo.hash                    |    4 +-
 package/dado/dado.hash                        |    4 +-
 .../datatables-buttons.hash                   |    4 +-
 .../datatables-fixedcolumns.hash              |    4 +-
 .../datatables-responsive.hash                |    4 +-
 package/datatables/datatables.hash            |    4 +-
 package/dc3dd/dc3dd.hash                      |    2 +-
 package/debianutils/debianutils.hash          |    4 +-
 package/dhcpdump/dhcpdump.hash                |    4 +-
 package/dhrystone/dhrystone.hash              |    2 +-
 package/dieharder/dieharder.hash              |    4 +-
 package/dmraid/dmraid.hash                    |    2 +-
 package/docker-compose/docker-compose.hash    |    4 +-
 package/doom-wad/doom-wad.hash                |    2 +-
 package/dt/dt.hash                            |    6 +-
 package/dump1090/dump1090.hash                |    4 +-
 package/dvblast/dvblast.hash                  |    8 +-
 package/dvdauthor/dvdauthor.hash              |    4 +-
 package/e2tools/e2tools.hash                  |    4 +-
 package/ecryptfs-utils/ecryptfs-utils.hash    |    6 +-
 package/efivar/efivar.hash                    |    4 +-
 package/elftosb/elftosb.hash                  |    2 +-
 package/elixir/elixir.hash                    |    4 +-
 package/emlog/emlog.hash                      |    4 +-
 package/enscript/enscript.hash                |    4 +-
 .../erlang-base64url/erlang-base64url.hash    |    4 +-
 package/erlang-goldrush/erlang-goldrush.hash  |    4 +-
 package/erlang-rebar/erlang-rebar.hash        |    4 +-
 package/exfat-utils/exfat-utils.hash          |    4 +-
 package/exfat/exfat.hash                      |    4 +-
 package/fan-ctrl/fan-ctrl.hash                |    2 +-
 package/fbdump/fbdump.hash                    |    4 +-
 package/fbterm/fbterm.hash                    |    2 +-
 package/feh/feh.hash                          |    4 +-
 package/fftw/fftw.hash                        |    6 +-
 package/flannel/flannel.hash                  |    4 +-
 package/flex/flex.hash                        |    4 +-
 package/flickcurl/flickcurl.hash              |   10 +-
 package/flot/flot.hash                        |    4 +-
 package/fluid-soundfont/fluid-soundfont.hash  |    4 +-
 package/font-awesome/font-awesome.hash        |    2 +-
 package/fontconfig/fontconfig.hash            |    4 +-
 .../imx-m4fwloader/imx-m4fwloader.hash        |    4 +-
 package/freescale-imx/imx-uuc/imx-uuc.hash    |    4 +-
 package/fstrcmp/fstrcmp.hash                  |    8 +-
 package/ftop/ftop.hash                        |    8 +-
 package/gconf/gconf.hash                      |    4 +-
 package/gengetopt/gengetopt.hash              |    6 +-
 package/genpart/genpart.hash                  |    2 +-
 package/geoip/geoip.hash                      |    4 +-
 package/gflags/gflags.hash                    |    4 +-
 .../ghostscript-fonts/ghostscript-fonts.hash  |    6 +-
 package/giflib/giflib.hash                    |    6 +-
 package/gli/gli.hash                          |    4 +-
 package/glm/glm.hash                          |    4 +-
 package/glorytun/glorytun.hash                |    4 +-
 package/gnuradio/gnuradio.hash                |    4 +-
 package/gob2/gob2.hash                        |    6 +-
 .../googlefontdirectory.hash                  | 1982 ++++++++---------
 package/gperf/gperf.hash                      |    4 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash     |    4 +-
 package/gtkmm3/gtkmm3.hash                    |    2 +-
 package/gtksourceview/gtksourceview.hash      |    4 +-
 package/hans/hans.hash                        |    4 +-
 package/heimdal/heimdal.hash                  |    6 +-
 package/heirloom-mailx/heirloom-mailx.hash    |    2 +-
 package/httping/httping.hash                  |    4 +-
 package/ibrcommon/ibrcommon.hash              |    6 +-
 package/ifenslave/ifenslave.hash              |    2 +-
 package/ifmetric/ifmetric.hash                |    6 +-
 package/igh-ethercat/igh-ethercat.hash        |    2 +-
 package/ijs/ijs.hash                          |    4 +-
 package/ima-evm-utils/ima-evm-utils.hash      |    4 +-
 package/intltool/intltool.hash                |    6 +-
 package/iodine/iodine.hash                    |    2 +-
 package/iputils/iputils.hash                  |    8 +-
 package/irrlicht/irrlicht.hash                |    4 +-
 package/iucode-tool/iucode-tool.hash          |    4 +-
 package/jailhouse/jailhouse.hash              |    4 +-
 package/joe/joe.hash                          |    8 +-
 package/jquery/jquery.hash                    |    2 +-
 package/jsmin/jsmin.hash                      |    4 +-
 package/jsmn/jsmn.hash                        |    4 +-
 package/kyua/kyua.hash                        |    4 +-
 package/lbreakout2/lbreakout2.hash            |    4 +-
 package/lensfun/lensfun.hash                  |    4 +-
 package/libao/libao.hash                      |    4 +-
 package/libart/libart.hash                    |    4 +-
 package/libasplib/libasplib.hash              |    4 +-
 package/libatasmart/libatasmart.hash          |    4 +-
 package/libavl/libavl.hash                    |    4 +-
 package/libbacktrace/libbacktrace.hash        |    4 +-
 package/libbson/libbson.hash                  |    6 +-
 package/libcddb/libcddb.hash                  |    4 +-
 .../libcdio-paranoia/libcdio-paranoia.hash    |    4 +-
 package/libcdio/libcdio.hash                  |    4 +-
 package/libcgi/libcgi.hash                    |    2 +-
 package/libcgicc/libcgicc.hash                |    2 +-
 package/libcorrect/libcorrect.hash            |    4 +-
 package/libcsv/libcsv.hash                    |    4 +-
 package/libcue/libcue.hash                    |    4 +-
 package/libcuefile/libcuefile.hash            |    6 +-
 package/libcutl/libcutl.hash                  |    6 +-
 package/libdaemon/libdaemon.hash              |    4 +-
 package/libdcadec/libdcadec.hash              |    4 +-
 package/libdri2/libdri2.hash                  |    4 +-
 package/libdvbcsa/libdvbcsa.hash              |    6 +-
 package/libdvbpsi/libdvbpsi.hash              |    6 +-
 package/libeastl/libeastl.hash                |    4 +-
 package/libee/libee.hash                      |    4 +-
 package/libenca/libenca.hash                  |    4 +-
 package/libestr/libestr.hash                  |    4 +-
 package/libfcgi/libfcgi.hash                  |    4 +-
 package/libfreefare/libfreefare.hash          |    4 +-
 package/libfreeimage/libfreeimage.hash        |   12 +-
 package/libfuse/libfuse.hash                  |    6 +-
 package/libgdiplus/libgdiplus.hash            |    4 +-
 package/libglade/libglade.hash                |    4 +-
 package/libical/libical.hash                  |    4 +-
 package/libiconv/libiconv.hash                |    6 +-
 package/libiio/libiio.hash                    |    4 +-
 package/libimxvpuapi/libimxvpuapi.hash        |    4 +-
 package/libiscsi/libiscsi.hash                |    8 +-
 package/libkcapi/libkcapi.hash                |    8 +-
 package/libllcp/libllcp.hash                  |    4 +-
 .../liblog4c-localtime.hash                   |    4 +-
 package/liblogging/liblogging.hash            |    4 +-
 package/libloki/libloki.hash                  |    6 +-
 package/libmbus/libmbus.hash                  |    4 +-
 package/libmemcached/libmemcached.hash        |    4 +-
 package/libmng/libmng.hash                    |    6 +-
 package/libmpd/libmpd.hash                    |    4 +-
 package/libmspack/libmspack.hash              |    4 +-
 package/libnatpmp/libnatpmp.hash              |    4 +-
 package/libnet/libnet.hash                    |    2 +-
 .../libnetfilter_acct/libnetfilter_acct.hash  |    6 +-
 package/libnfs/libnfs.hash                    |   10 +-
 package/libnpth/libnpth.hash                  |    4 +-
 package/libodb-mysql/libodb-mysql.hash        |    6 +-
 package/libodb-pgsql/libodb-pgsql.hash        |    6 +-
 package/libodb/libodb.hash                    |    6 +-
 package/libopenaptx/libopenaptx.hash          |    4 +-
 package/liboping/liboping.hash                |    4 +-
 .../libpam-radius-auth.hash                   |    4 +-
 package/libpciaccess/libpciaccess.hash        |   10 +-
 package/libpng/libpng.hash                    |    8 +-
 package/libpqxx/libpqxx.hash                  |    4 +-
 .../libpthread-stubs/libpthread-stubs.hash    |    4 +-
 package/libraw1394/libraw1394.hash            |    4 +-
 package/libreplaygain/libreplaygain.hash      |    2 +-
 package/libroxml/libroxml.hash                |    4 +-
 package/libserial/libserial.hash              |    4 +-
 package/libsha1/libsha1.hash                  |    4 +-
 package/libsidplay2/libsidplay2.hash          |    2 +-
 package/libsigrok/libsigrok.hash              |    4 +-
 package/libsigrokdecode/libsigrokdecode.hash  |    4 +-
 package/libsodium/libsodium.hash              |    4 +-
 package/libsquish/libsquish.hash              |    6 +-
 package/libsvg-cairo/libsvg-cairo.hash        |    2 +-
 package/libsvg/libsvg.hash                    |    2 +-
 package/libtelnet/libtelnet.hash              |    4 +-
 package/libtheora/libtheora.hash              |    6 +-
 package/libtommath/libtommath.hash            |    4 +-
 package/libtool/libtool.hash                  |    6 +-
 package/libtorrent/libtorrent.hash            |    4 +-
 package/libucl/libucl.hash                    |    4 +-
 package/libuecc/libuecc.hash                  |    2 +-
 package/libwebsock/libwebsock.hash            |    4 +-
 .../libxml-parser-perl.hash                   |    4 +-
 package/lightning/lightning.hash              |    4 +-
 package/linux-zigbee/linux-zigbee.hash        |    4 +-
 package/lirc-tools/lirc-tools.hash            |    4 +-
 package/ljlinenoise/ljlinenoise.hash          |    4 +-
 package/ljsyscall/ljsyscall.hash              |    4 +-
 package/lksctp-tools/lksctp-tools.hash        |    4 +-
 package/log4cpp/log4cpp.hash                  |    8 +-
 package/logsurfer/logsurfer.hash              |    4 +-
 package/lpeg/lpeg.hash                        |    2 +-
 package/lpty/lpty.hash                        |    4 +-
 package/lrandom/lrandom.hash                  |    2 +-
 package/lsqlite3/lsqlite3.hash                |    2 +-
 .../lttng-babeltrace/lttng-babeltrace.hash    |    8 +-
 package/lua-binaryheap/lua-binaryheap.hash    |    2 +-
 package/lua-bit32/lua-bit32.hash              |    4 +-
 package/lua-cjson/lua-cjson.hash              |    4 +-
 package/lua-coat/lua-coat.hash                |    4 +-
 .../lua-coatpersistent.hash                   |    6 +-
 package/lua-codegen/lua-codegen.hash          |    4 +-
 package/lua-compat53/lua-compat53.hash        |    4 +-
 package/lua-csnappy/lua-csnappy.hash          |    4 +-
 package/lua-datafile/lua-datafile.hash        |    4 +-
 package/lua-fifo/lua-fifo.hash                |    4 +-
 package/lua-flu/lua-flu.hash                  |    4 +-
 package/lua-http/lua-http.hash                |    4 +-
 package/lua-iconv/lua-iconv.hash              |    4 +-
 package/lua-inotify/lua-inotify.hash          |    4 +-
 package/lua-livr-extra/lua-livr-extra.hash    |    4 +-
 package/lua-livr/lua-livr.hash                |    4 +-
 .../lua-lpeg-patterns/lua-lpeg-patterns.hash  |    4 +-
 package/lua-lunitx/lua-lunitx.hash            |    4 +-
 package/lua-lunix/lua-lunix.hash              |    4 +-
 package/lua-markdown/lua-markdown.hash        |    4 +-
 package/lua-messagepack/lua-messagepack.hash  |    6 +-
 package/lua-periphery/lua-periphery.hash      |    4 +-
 package/lua-resty-http/lua-resty-http.hash    |    4 +-
 package/lua-rotas/lua-rotas.hash              |    4 +-
 package/lua-sailor/lua-sailor.hash            |    4 +-
 package/lua-silva/lua-silva.hash              |    4 +-
 package/lua-std-debug/lua-std-debug.hash      |    4 +-
 .../lua-std-normalize/lua-std-normalize.hash  |    4 +-
 package/lua-stdlib/lua-stdlib.hash            |    4 +-
 package/lua-testmore/lua-testmore.hash        |    4 +-
 package/lua-utf8/lua-utf8.hash                |    4 +-
 package/lua-valua/lua-valua.hash              |    4 +-
 package/lua-zlib/lua-zlib.hash                |    2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.hash    |    4 +-
 package/luadbi/luadbi.hash                    |    4 +-
 package/luaexpatutils/luaexpatutils.hash      |    2 +-
 package/luafilesystem/luafilesystem.hash      |    4 +-
 package/luajson/luajson.hash                  |    4 +-
 package/lualdap/lualdap.hash                  |    4 +-
 package/lualogging/lualogging.hash            |    4 +-
 package/luaossl/luaossl.hash                  |    4 +-
 package/luasql-sqlite3/luasql-sqlite3.hash    |    4 +-
 package/luksmeta/luksmeta.hash                |    4 +-
 package/lzma/lzma.hash                        |    8 +-
 package/lzo/lzo.hash                          |    6 +-
 package/lzop/lzop.hash                        |    4 +-
 package/make/make.hash                        |    2 +-
 package/mali-driver/mali-driver.hash          |    4 +-
 package/matchbox-common/matchbox-common.hash  |    2 +-
 .../matchbox-desktop/matchbox-desktop.hash    |    2 +-
 package/matchbox-panel/matchbox-panel.hash    |    2 +-
 .../matchbox-startup-monitor.hash             |    2 +-
 package/memstat/memstat.hash                  |    2 +-
 package/mender-grubenv/mender-grubenv.hash    |    4 +-
 package/menu-cache/menu-cache.hash            |    6 +-
 package/mesa3d-demos/mesa3d-demos.hash        |    6 +-
 package/mg/mg.hash                            |    4 +-
 package/mini-snmpd/mini-snmpd.hash            |    4 +-
 package/minimodem/minimodem.hash              |    4 +-
 package/mjpg-streamer/mjpg-streamer.hash      |    4 +-
 .../mobile-broadband-provider-info.hash       |    4 +-
 package/monolite/monolite.hash                |    2 +-
 package/mosh/mosh.hash                        |    6 +-
 package/most/most.hash                        |    8 +-
 package/multicat/multicat.hash                |    6 +-
 package/mupdf/mupdf.hash                      |    2 +-
 package/murata-cyw-fw/murata-cyw-fw.hash      |    8 +-
 package/musepack/musepack.hash                |    2 +-
 .../musl-compat-headers.hash                  |    2 +-
 package/musl-fts/musl-fts.hash                |    4 +-
 package/nanomsg/nanomsg.hash                  |    4 +-
 package/neardal/neardal.hash                  |    4 +-
 package/netcalc/netcalc.hash                  |    6 +-
 package/newt/newt.hash                        |    6 +-
 package/nfacct/nfacct.hash                    |    4 +-
 package/nginx-dav-ext/nginx-dav-ext.hash      |    4 +-
 package/nload/nload.hash                      |    4 +-
 package/nss-myhostname/nss-myhostname.hash    |    4 +-
 package/nss-pam-ldapd/nss-pam-ldapd.hash      |    6 +-
 package/nvidia-modprobe/nvidia-modprobe.hash  |    4 +-
 .../obsidian-cursors/obsidian-cursors.hash    |    2 +-
 package/ocrad/ocrad.hash                      |    4 +-
 package/odb/odb.hash                          |    6 +-
 package/olsr/olsr.hash                        |    6 +-
 package/omxplayer/omxplayer.hash              |    2 +-
 package/opencore-amr/opencore-amr.hash        |    8 +-
 package/openmpi/openmpi.hash                  |    8 +-
 package/openobex/openobex.hash                |    8 +-
 package/openpowerlink/openpowerlink.hash      |    4 +-
 package/opentyrian-data/opentyrian-data.hash  |    2 +-
 package/opus-tools/opus-tools.hash            |    4 +-
 package/opus/opus.hash                        |    4 +-
 package/oracle-mysql/oracle-mysql.hash        |    2 +-
 package/orbit/orbit.hash                      |    6 +-
 package/pamtester/pamtester.hash              |    4 +-
 package/patch/patch.hash                      |    4 +-
 .../perl-apache-logformat-compiler.hash       |    6 +-
 package/perl-appconfig/perl-appconfig.hash    |    6 +-
 .../perl-astro-suntime.hash                   |    6 +-
 .../perl-class-inspector.hash                 |    6 +-
 package/perl-class-load/perl-class-load.hash  |    6 +-
 .../perl-class-method-modifiers.hash          |    6 +-
 .../perl-class-std-fast.hash                  |    6 +-
 package/perl-class-std/perl-class-std.hash    |    6 +-
 .../perl-cookie-baker/perl-cookie-baker.hash  |    6 +-
 .../perl-crypt-blowfish.hash                  |    6 +-
 package/perl-crypt-cbc/perl-crypt-cbc.hash    |    6 +-
 .../perl-crypt-openssl-aes.hash               |    6 +-
 .../perl-crypt-openssl-random.hash            |    6 +-
 .../perl-datetime-tiny.hash                   |    6 +-
 package/perl-dbd-mysql/perl-dbd-mysql.hash    |    6 +-
 package/perl-dbi/perl-dbi.hash                |    6 +-
 .../perl-devel-globaldestruction.hash         |    6 +-
 .../perl-devel-stacktrace-ashtml.hash         |    6 +-
 .../perl-devel-stacktrace.hash                |    6 +-
 .../perl-device-serialport.hash               |    6 +-
 .../perl-digest-sha1/perl-digest-sha1.hash    |    6 +-
 .../perl-dist-checkconflicts.hash             |    6 +-
 .../perl-encode-detect.hash                   |    6 +-
 .../perl-encode-locale.hash                   |    6 +-
 .../perl-extutils-config.hash                 |    6 +-
 .../perl-extutils-helpers.hash                |    6 +-
 .../perl-extutils-installpaths.hash           |    6 +-
 .../perl-file-sharedir-install.hash           |    6 +-
 .../perl-filesys-notify-simple.hash           |    6 +-
 package/perl-gdgraph/perl-gdgraph.hash        |    8 +-
 package/perl-gdtextutil/perl-gdtextutil.hash  |    8 +-
 .../perl-hash-multivalue.hash                 |    6 +-
 .../perl-html-tagset/perl-html-tagset.hash    |    6 +-
 package/perl-http-date/perl-http-date.hash    |    6 +-
 .../perl-http-headers-fast.hash               |    6 +-
 .../perl-http-multipartparser.hash            |    6 +-
 .../perl-http-negotiate.hash                  |    6 +-
 package/perl-i18n/perl-i18n.hash              |    6 +-
 .../perl-io-interface/perl-io-interface.hash  |    6 +-
 .../perl-io-socket-multicast.hash             |    6 +-
 package/perl-json-tiny/perl-json-tiny.hash    |    6 +-
 .../perl-locale-maketext-lexicon.hash         |    6 +-
 .../perl-lwp-mediatypes.hash                  |    6 +-
 package/perl-mailtools/perl-mailtools.hash    |    6 +-
 .../perl-math-prime-util.hash                 |    6 +-
 .../perl-mime-base64-urlsafe.hash             |    6 +-
 package/perl-mime-tools/perl-mime-tools.hash  |    6 +-
 .../perl-module-build-tiny.hash               |    6 +-
 .../perl-module-build/perl-module-build.hash  |    6 +-
 .../perl-module-implementation.hash           |    6 +-
 .../perl-module-runtime.hash                  |    6 +-
 .../perl-mojolicious-plugin-cspheader.hash    |    6 +-
 .../perl-mojolicious-plugin-i18n.hash         |    6 +-
 ...erl-mojolicious-plugin-securityheader.hash |    6 +-
 package/perl-net-snmp/perl-net-snmp.hash      |    6 +-
 package/perl-net-ssleay/perl-net-ssleay.hash  |    6 +-
 package/perl-netaddr-ip/perl-netaddr-ip.hash  |    8 +-
 .../perl-number-bytes-human.hash              |    6 +-
 package/perl-path-class/perl-path-class.hash  |    6 +-
 .../perl-stream-buffered.hash                 |    6 +-
 .../perl-sub-exporter-progressive.hash        |    6 +-
 .../perl-sub-install/perl-sub-install.hash    |    6 +-
 package/perl-sub-quote/perl-sub-quote.hash    |    6 +-
 .../perl-sys-meminfo/perl-sys-meminfo.hash    |    6 +-
 package/perl-sys-mmap/perl-sys-mmap.hash      |    8 +-
 .../perl-time-parsedate.hash                  |    8 +-
 .../perl-www-form-urlencoded.hash             |    6 +-
 .../perl-www-robotrules.hash                  |    6 +-
 package/perl-x10/perl-x10.hash                |    6 +-
 package/perl-xml-libxml/perl-xml-libxml.hash  |    6 +-
 .../perl-xml-namespacesupport.hash            |    6 +-
 .../perl-xml-sax-base/perl-xml-sax-base.hash  |    6 +-
 package/perl-xml-sax/perl-xml-sax.hash        |    6 +-
 package/php-pecl-dbus/php-pecl-dbus.hash      |    4 +-
 package/physfs/physfs.hash                    |    4 +-
 package/picocom/picocom.hash                  |    4 +-
 package/pimd/pimd.hash                        |    6 +-
 package/pixiewps/pixiewps.hash                |    4 +-
 package/policycoreutils/policycoreutils.hash  |    4 +-
 package/popperjs/popperjs.hash                |    4 +-
 package/pound/pound.hash                      |    4 +-
 package/pptp-linux/pptp-linux.hash            |    8 +-
 .../pru-software-support.hash                 |    2 +-
 package/ptm2human/ptm2human.hash              |    4 +-
 package/pwgen/pwgen.hash                      |    6 +-
 .../python-aiohttp-cors.hash                  |    6 +-
 .../python-aiohttp-debugtoolbar.hash          |    6 +-
 .../python-aiohttp-mako.hash                  |    6 +-
 .../python-aiohttp-security.hash              |    6 +-
 .../python-aiologstash.hash                   |    6 +-
 .../python-aiomonitor/python-aiomonitor.hash  |    6 +-
 .../python-alsaaudio/python-alsaaudio.hash    |    6 +-
 package/python-argh/python-argh.hash          |    4 +-
 package/python-asgiref/python-asgiref.hash    |    6 +-
 package/python-bunch/python-bunch.hash        |    6 +-
 package/python-canopen/python-canopen.hash    |    4 +-
 package/python-cbor/python-cbor.hash          |    4 +-
 .../python-channels-redis.hash                |    6 +-
 package/python-channels/python-channels.hash  |    6 +-
 .../python-characteristic.hash                |    4 +-
 package/python-cheetah/python-cheetah.hash    |    2 +-
 package/python-cheroot/python-cheroot.hash    |    4 +-
 package/python-cherrypy/python-cherrypy.hash  |    4 +-
 .../python-constantly/python-constantly.hash  |    4 +-
 package/python-couchdb/python-couchdb.hash    |    6 +-
 package/python-crcmod/python-crcmod.hash      |    4 +-
 .../python-cssselect/python-cssselect.hash    |    6 +-
 .../python-daemonize/python-daemonize.hash    |    6 +-
 package/python-daphne/python-daphne.hash      |    4 +-
 package/python-dialog3/python-dialog3.hash    |    2 +-
 .../python-dicttoxml/python-dicttoxml.hash    |    4 +-
 .../python-django-enumfields.hash             |    2 +-
 .../python-docker-pycreds.hash                |    6 +-
 package/python-docker/python-docker.hash      |    6 +-
 .../python-dockerpty/python-dockerpty.hash    |    6 +-
 .../python-entrypoints.hash                   |    6 +-
 .../python-fastentrypoints.hash               |    6 +-
 .../python-flask-babel.hash                   |    4 +-
 package/python-flup/python-flup.hash          |    6 +-
 package/python-future/python-future.hash      |    6 +-
 package/python-gitdb2/python-gitdb2.hash      |    6 +-
 package/python-huepy/python-huepy.hash        |    4 +-
 package/python-ibmiotf/python-ibmiotf.hash    |    6 +-
 package/python-iniparse/python-iniparse.hash  |    2 +-
 package/python-iowait/python-iowait.hash      |    4 +-
 .../python-ipython-genutils.hash              |    2 +-
 .../python-jaraco-classes.hash                |    2 +-
 .../python-jaraco-functools.hash              |    2 +-
 .../python-json-schema-validator.hash         |    4 +-
 .../python-jsonmodels/python-jsonmodels.hash  |    6 +-
 package/python-keyring/python-keyring.hash    |    4 +-
 .../python-kiwisolver/python-kiwisolver.hash  |    4 +-
 package/python-libusb1/python-libusb1.hash    |    2 +-
 package/python-lockfile/python-lockfile.hash  |    6 +-
 package/python-logbook/python-logbook.hash    |    6 +-
 package/python-m2r/python-m2r.hash            |    6 +-
 .../python-matplotlib/python-matplotlib.hash  |    4 +-
 .../python-mimeparse/python-mimeparse.hash    |    6 +-
 package/python-mistune/python-mistune.hash    |    4 +-
 .../python-nested-dict.hash                   |    6 +-
 package/python-netaddr/python-netaddr.hash    |    4 +-
 .../python-networkmanager.hash                |    4 +-
 package/python-numpy/python-numpy.hash        |    4 +-
 .../python-paho-mqtt/python-paho-mqtt.hash    |   10 +-
 package/python-pathpy/python-pathpy.hash      |    6 +-
 .../python-pathtools/python-pathtools.hash    |    4 +-
 package/python-pexpect/python-pexpect.hash    |    6 +-
 .../python-pickleshare.hash                   |    6 +-
 package/python-piexif/python-piexif.hash      |    4 +-
 package/python-ply/python-ply.hash            |    6 +-
 package/python-portend/python-portend.hash    |    6 +-
 package/python-pyaes/python-pyaes.hash        |    6 +-
 package/python-pyicu/python-pyicu.hash        |    2 +-
 .../python-pylibftdi/python-pylibftdi.hash    |    4 +-
 package/python-pyqrcode/python-pyqrcode.hash  |    4 +-
 package/python-pyratemp/python-pyratemp.hash  |    2 +-
 package/python-pyroute2/python-pyroute2.hash  |   10 +-
 package/python-pysmi/python-pysmi.hash        |    6 +-
 .../python-pysnmp-mibs.hash                   |    4 +-
 package/python-pysnmp/python-pysnmp.hash      |    6 +-
 package/python-pysocks/python-pysocks.hash    |    6 +-
 .../python-pytablereader.hash                 |    6 +-
 .../python-pytablewriter.hash                 |    6 +-
 package/python-pyxb/python-pyxb.hash          |    4 +-
 package/python-raven/python-raven.hash        |    6 +-
 .../python-requests-toolbelt.hash             |    6 +-
 package/python-rpi-gpio/python-rpi-gpio.hash  |    4 +-
 package/python-scandir/python-scandir.hash    |    6 +-
 package/python-sdnotify/python-sdnotify.hash  |    6 +-
 package/python-see/python-see.hash            |    4 +-
 .../python-setuptools-scm-git-archive.hash    |    6 +-
 .../python-shutilwhich.hash                   |    4 +-
 .../python-simplegeneric.hash                 |    4 +-
 .../python-simplesqlite.hash                  |    6 +-
 .../python-smbus-cffi/python-smbus-cffi.hash  |    2 +-
 package/python-spidev/python-spidev.hash      |    4 +-
 .../python-sqlalchemy/python-sqlalchemy.hash  |    6 +-
 package/python-sqlparse/python-sqlparse.hash  |    6 +-
 package/python-systemd/python-systemd.hash    |    2 +-
 package/python-tempora/python-tempora.hash    |    6 +-
 .../python-termcolor/python-termcolor.hash    |    6 +-
 package/python-tomako/python-tomako.hash      |    4 +-
 package/python-tqdm/python-tqdm.hash          |    6 +-
 package/python-txtorcon/python-txtorcon.hash  |    2 +-
 .../python-vcversioner.hash                   |    4 +-
 package/python-visitor/python-visitor.hash    |    6 +-
 .../python-webencodings.hash                  |    6 +-
 package/python-webpy/python-webpy.hash        |    6 +-
 package/python-whoosh/python-whoosh.hash      |    2 +-
 package/python-ws4py/python-ws4py.hash        |    6 +-
 package/python-xlib/python-xlib.hash          |    6 +-
 package/python-xlutils/python-xlutils.hash    |    4 +-
 package/python-xlwt/python-xlwt.hash          |    4 +-
 .../python-zc-lockfile.hash                   |    6 +-
 .../qoriq-cadence-dp-firmware.hash            |    4 +-
 package/qt5/qt5enginio/qt5enginio.hash        |    2 +-
 package/quagga/quagga.hash                    |    4 +-
 package/quotatool/quotatool.hash              |    4 +-
 package/rapidjson/rapidjson.hash              |    4 +-
 package/rapidxml/rapidxml.hash                |    4 +-
 package/raspi-gpio/raspi-gpio.hash            |    4 +-
 package/rcw-smarc-sal28/rcw-smarc-sal28.hash  |    4 +-
 package/reaver/reaver.hash                    |    4 +-
 package/rings/rings.hash                      |    4 +-
 package/ripgrep/ripgrep.hash                  |    4 +-
 package/rockchip-mali/rockchip-mali.hash      |    4 +-
 package/rpcbind/rpcbind.hash                  |    4 +-
 package/rrdtool/rrdtool.hash                  |    6 +-
 package/rs485conf/rs485conf.hash              |    4 +-
 package/rt-tests/rt-tests.hash                |    4 +-
 package/rtorrent/rtorrent.hash                |    4 +-
 package/rtptools/rtptools.hash                |    4 +-
 package/rubix/rubix.hash                      |    4 +-
 package/sdl/sdl.hash                          |    4 +-
 package/sdl2_image/sdl2_image.hash            |    4 +-
 package/sdl_gfx/sdl_gfx.hash                  |    4 +-
 package/sedutil/sedutil.hash                  |    4 +-
 package/setools/setools.hash                  |    8 +-
 package/shapelib/shapelib.hash                |    6 +-
 .../shared-mime-info/shared-mime-info.hash    |    4 +-
 package/shellinabox/shellinabox.hash          |    6 +-
 package/slang/slang.hash                      |    6 +-
 package/smcroute/smcroute.hash                |    4 +-
 package/smstools3/smstools3.hash              |    2 +-
 package/snmpclitools/snmpclitools.hash        |    6 +-
 package/softether/softether.hash              |    4 +-
 .../sound-theme-borealis.hash                 |    2 +-
 .../sound-theme-freedesktop.hash              |    2 +-
 package/squeezelite/squeezelite.hash          |    4 +-
 package/supertuxkart/supertuxkart.hash        |    4 +-
 package/swig/swig.hash                        |    8 +-
 package/sylpheed/sylpheed.hash                |    6 +-
 package/synergy/synergy.hash                  |    4 +-
 package/sysvinit/sysvinit.hash                |    4 +-
 package/szip/szip.hash                        |    4 +-
 package/taskd/taskd.hash                      |    2 +-
 package/tcping/tcping.hash                    |    4 +-
 package/thttpd/thttpd.hash                    |    4 +-
 package/ti-cgt-pru/ti-cgt-pru.hash            |    6 +-
 package/time/time.hash                        |    6 +-
 package/tinc/tinc.hash                        |    6 +-
 package/tinymembench/tinymembench.hash        |    4 +-
 package/tinyxml/tinyxml.hash                  |    4 +-
 package/tovid/tovid.hash                      |    4 +-
 package/tpm-tools/tpm-tools.hash              |    8 +-
 package/tpm2-totp/tpm2-totp.hash              |    4 +-
 package/traceroute/traceroute.hash            |    6 +-
 package/trinity/trinity.hash                  |    4 +-
 package/tstools/tstools.hash                  |    2 +-
 package/turbolua/turbolua.hash                |    4 +-
 .../udev-gentoo-scripts.hash                  |    4 +-
 package/uftrace/uftrace.hash                  |    4 +-
 package/ulogd/ulogd.hash                      |    8 +-
 package/urg/urg.hash                          |    6 +-
 .../usb_modeswitch_data.hash                  |    6 +-
 package/ussp-push/ussp-push.hash              |    4 +-
 package/utp_com/utp_com.hash                  |    4 +-
 .../vdr-plugin-vnsiserver.hash                |    4 +-
 package/vmtouch/vmtouch.hash                  |    4 +-
 package/vtun/vtun.hash                        |    8 +-
 package/watchdogd/watchdogd.hash              |    4 +-
 .../webrtc-audio-processing.hash              |    4 +-
 package/wf111/wf111.hash                      |    6 +-
 package/whetstone/whetstone.hash              |    2 +-
 package/wireless_tools/wireless_tools.hash    |    4 +-
 package/wpan-tools/wpan-tools.hash            |    4 +-
 package/wsapi-fcgi/wsapi-fcgi.hash            |    6 +-
 package/wsapi-xavante/wsapi-xavante.hash      |    6 +-
 package/wsapi/wsapi.hash                      |    6 +-
 .../x11r7/xapp_bdftopcf/xapp_bdftopcf.hash    |   10 +-
 package/x11r7/xapp_ico/xapp_ico.hash          |   10 +-
 package/x11r7/xapp_oclock/xapp_oclock.hash    |   10 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.hash  |   10 +-
 package/x11r7/xapp_viewres/xapp_viewres.hash  |   10 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.hash  |   10 +-
 package/x11r7/xapp_xauth/xapp_xauth.hash      |    2 +-
 .../xapp_xbacklight/xapp_xbacklight.hash      |   10 +-
 package/x11r7/xapp_xbiff/xapp_xbiff.hash      |   10 +-
 .../x11r7/xapp_xcompmgr/xapp_xcompmgr.hash    |   10 +-
 .../x11r7/xapp_xconsole/xapp_xconsole.hash    |    4 +-
 .../xapp_xcursorgen/xapp_xcursorgen.hash      |   10 +-
 .../x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash  |    2 +-
 .../x11r7/xapp_xditview/xapp_xditview.hash    |   10 +-
 .../x11r7/xapp_xdriinfo/xapp_xdriinfo.hash    |   10 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.hash  |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.hash          |   10 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash  |   10 +-
 package/x11r7/xapp_xhost/xapp_xhost.hash      |   10 +-
 package/x11r7/xapp_xinit/xapp_xinit.hash      |   10 +-
 package/x11r7/xapp_xinput/xapp_xinput.hash    |   10 +-
 .../x11r7/xapp_xkbprint/xapp_xkbprint.hash    |   10 +-
 package/x11r7/xapp_xkill/xapp_xkill.hash      |   10 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.hash      |   10 +-
 .../x11r7/xapp_xlsatoms/xapp_xlsatoms.hash    |   10 +-
 .../xapp_xlsclients/xapp_xlsclients.hash      |   10 +-
 package/x11r7/xapp_xman/xapp_xman.hash        |   10 +-
 .../x11r7/xapp_xmessage/xapp_xmessage.hash    |    2 +-
 package/x11r7/xapp_xmore/xapp_xmore.hash      |   10 +-
 package/x11r7/xapp_xpr/xapp_xpr.hash          |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.hash      |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.hash    |   10 +-
 .../x11r7/xapp_xrefresh/xapp_xrefresh.hash    |    2 +-
 package/x11r7/xapp_xset/xapp_xset.hash        |   10 +-
 .../xapp_xsetpointer/xapp_xsetpointer.hash    |    8 +-
 .../x11r7/xapp_xsetroot/xapp_xsetroot.hash    |   10 +-
 .../x11r7/xapp_xstdcmap/xapp_xstdcmap.hash    |    8 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash    |   10 +-
 .../x11r7/xapp_xwininfo/xapp_xwininfo.hash    |   10 +-
 package/x11r7/xapp_xwud/xapp_xwud.hash        |    2 +-
 .../xcb-util-cursor/xcb-util-cursor.hash      |    2 +-
 .../x11r7/xcb-util-image/xcb-util-image.hash  |    4 +-
 .../xcb-util-keysyms/xcb-util-keysyms.hash    |    2 +-
 package/x11r7/xcb-util-wm/xcb-util-wm.hash    |    4 +-
 .../x11r7/xdata_xbitmaps/xdata_xbitmaps.hash  |   10 +-
 .../xdata_xcursor-themes.hash                 |   10 +-
 .../xdriver_xf86-input-evdev.hash             |   10 +-
 .../xdriver_xf86-input-mouse.hash             |   10 +-
 .../xdriver_xf86-input-tslib.hash             |    2 +-
 .../xdriver_xf86-video-ati.hash               |   10 +-
 .../xdriver_xf86-video-fbdev.hash             |    2 +-
 .../xdriver_xf86-video-i128.hash              |    8 +-
 .../xdriver_xf86-video-neomagic.hash          |   10 +-
 .../xdriver_xf86-video-r128.hash              |   10 +-
 .../xdriver_xf86-video-siliconmotion.hash     |    4 +-
 .../xdriver_xf86-video-sis.hash               |    8 +-
 .../xdriver_xf86-video-tdfx.hash              |   10 +-
 .../xdriver_xf86-video-trident.hash           |    4 +-
 .../xdriver_xf86-video-vmware.hash            |   10 +-
 .../xfont_font-bh-ttf/xfont_font-bh-ttf.hash  |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.hash      |   10 +-
 package/x11r7/xlib_libICE/xlib_libICE.hash    |   10 +-
 package/x11r7/xlib_libSM/xlib_libSM.hash      |    8 +-
 .../xlib_libXScrnSaver.hash                   |   10 +-
 package/x11r7/xlib_libXau/xlib_libXau.hash    |   10 +-
 .../xlib_libXcomposite.hash                   |   10 +-
 .../xlib_libXdamage/xlib_libXdamage.hash      |   10 +-
 .../x11r7/xlib_libXdmcp/xlib_libXdmcp.hash    |   10 +-
 package/x11r7/xlib_libXext/xlib_libXext.hash  |   10 +-
 .../x11r7/xlib_libXfixes/xlib_libXfixes.hash  |    2 +-
 .../x11r7/xlib_libXfont/xlib_libXfont.hash    |    8 +-
 .../xlib_libXinerama/xlib_libXinerama.hash    |   10 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.hash    |   10 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.hash    |   12 +-
 .../x11r7/xlib_libXrandr/xlib_libXrandr.hash  |   10 +-
 .../xlib_libXrender/xlib_libXrender.hash      |    4 +-
 package/x11r7/xlib_libXt/xlib_libXt.hash      |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.hash      |    4 +-
 .../xlib_libXxf86dga/xlib_libXxf86dga.hash    |   10 +-
 .../xlib_libXxf86vm/xlib_libXxf86vm.hash      |    6 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.hash    |   10 +-
 .../xlib_libfontenc/xlib_libfontenc.hash      |   10 +-
 .../xlib_libxkbfile/xlib_libxkbfile.hash      |   10 +-
 .../xlib_libxshmfence/xlib_libxshmfence.hash  |   10 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.hash    |   10 +-
 .../xutil_makedepend/xutil_makedepend.hash    |   10 +-
 package/xavante/xavante.hash                  |    4 +-
 package/xmlstarlet/xmlstarlet.hash            |    4 +-
 .../xutil_util-macros/xutil_util-macros.hash  |    2 +-
 package/yad/yad.hash                          |    6 +-
 package/zip/zip.hash                          |    4 +-
 package/zmqpp/zmqpp.hash                      |    4 +-
 package/zxing-cpp/zxing-cpp.hash              |    4 +-
 support/legal-info/buildroot.hash             |    2 +-
 .../gitlab-release/gitlab-release.hash        |    4 +-
 ...toolchain-external-codescape-img-mips.hash |    4 +-
 ...toolchain-external-codescape-mti-mips.hash |    4 +-
 ...olchain-external-codesourcery-aarch64.hash |    4 +-
 .../toolchain-external-codesourcery-arm.hash  |    4 +-
 .../toolchain-external-codesourcery-mips.hash |    4 +-
 ...oolchain-external-codesourcery-niosII.hash |    8 +-
 .../toolchain-external-linaro-aarch64-be.hash |    4 +-
 .../toolchain-external-linaro-aarch64.hash    |    4 +-
 .../toolchain-external-linaro-arm.hash        |    4 +-
 .../toolchain-external-linaro-armeb.hash      |    4 +-
 .../toolchain-external-synopsys-arc.hash      |    8 +-
 718 files changed, 2799 insertions(+), 2799 deletions(-)

diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
index a7d5928a5d..654fb94ec0 100644
--- a/boot/binaries-marvell/binaries-marvell.hash
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d818c95bcd4d5c026238d6e554151184ed7fea15bce1f861f9068b97b4cd320a binaries-marvell-c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee.tar.gz
-sha256 e6d08ef60068ee72c68835001a24eb832dcba27cac0dde0f179dfb428be050ca README.md
+sha256  d818c95bcd4d5c026238d6e554151184ed7fea15bce1f861f9068b97b4cd320a  binaries-marvell-c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee.tar.gz
+sha256  e6d08ef60068ee72c68835001a24eb832dcba27cac0dde0f179dfb428be050ca  README.md
diff --git a/boot/s500-bootloader/s500-bootloader.hash b/boot/s500-bootloader/s500-bootloader.hash
index d538f23b2a..2ebd933e52 100644
--- a/boot/s500-bootloader/s500-bootloader.hash
+++ b/boot/s500-bootloader/s500-bootloader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b183024ac69f51ea7befd28d03b2ec35a7280e270405600fb4f37aa91d9c9571  s500-bootloader-a8d7fa1d9a7f353ec4613febf30f4ca99a10a106.tar.gz
+sha256  b183024ac69f51ea7befd28d03b2ec35a7280e270405600fb4f37aa91d9c9571  s500-bootloader-a8d7fa1d9a7f353ec4613febf30f4ca99a10a106.tar.gz
diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
index 15c763abca..a0a9f06f35 100644
--- a/boot/shim/shim.hash
+++ b/boot/shim/shim.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 8344473dd10569588b8238a4656b8fab226714eea9f5363f8c410aa8a5090297  shim-15.4.tar.bz2
-sha256 15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
+sha256  8344473dd10569588b8238a4656b8fab226714eea9f5363f8c410aa8a5090297  shim-15.4.tar.bz2
+sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
index 141db26860..33e74b893e 100644
--- a/package/abootimg/abootimg.hash
+++ b/package/abootimg/abootimg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37	abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br1.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSE
+sha256  f377da42a57d982cfc22fa75c5a69febdc3e4c1ef43cd0ceaec42e14067e2f37  abootimg-1ebeb393252ab5aeed62e34bc439b6728444f06e-br1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/acpitool/acpitool.hash b/package/acpitool/acpitool.hash
index b43bc374ca..764c1bc689 100644
--- a/package/acpitool/acpitool.hash
+++ b/package/acpitool/acpitool.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f  acpitool-0.5.1.tar.bz2
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f  acpitool-0.5.1.tar.bz2
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index 134a16df48..f7491278e0 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4f/
-sha1 2c23e1a6be298cf4f173f06b1123e4ecd5e9a202  aespipe-v2.4f.tar.bz2
-md5 ed05c62c1954110f009bedda4bc1562f  aespipe-v2.4f.tar.bz2
+sha1  2c23e1a6be298cf4f173f06b1123e4ecd5e9a202  aespipe-v2.4f.tar.bz2
+md5  ed05c62c1954110f009bedda4bc1562f  aespipe-v2.4f.tar.bz2
 # Locally computed:
-sha256 b135e1659f58dc9be5e3c88923cd03d2a936096ab8cd7f2b3af4cb7a844cef96  aespipe-v2.4f.tar.bz2
+sha256  b135e1659f58dc9be5e3c88923cd03d2a936096ab8cd7f2b3af4cb7a844cef96  aespipe-v2.4f.tar.bz2
diff --git a/package/alsamixergui/alsamixergui.hash b/package/alsamixergui/alsamixergui.hash
index 85c9ffe75e..32dfea284c 100644
--- a/package/alsamixergui/alsamixergui.hash
+++ b/package/alsamixergui/alsamixergui.hash
@@ -1,4 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui/alsamixergui_0.9.0rc2-1-9.dsc
-md5	af942a41b81ba27e2e4d0a1e1ab0decb  alsamixergui_0.9.0rc2-1.orig.tar.gz
+md5  af942a41b81ba27e2e4d0a1e1ab0decb  alsamixergui_0.9.0rc2-1.orig.tar.gz
 # locally computed
 sha256  ea617b76dcd0df74576686ca34c281f43bb9d844015cea91e3debc91538d2b1d  debian/copyright
diff --git a/package/alure/alure.hash b/package/alure/alure.hash
index d84af0a35e..0d4c36c4ae 100644
--- a/package/alure/alure.hash
+++ b/package/alure/alure.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz
-sha256 7331ddc67daaf1a283c81e8dc17bac8dc40f54ed3fab3d3964616f4bd502a0a3  LICENSE
+sha256  9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz
+sha256  7331ddc67daaf1a283c81e8dc17bac8dc40f54ed3fab3d3964616f4bd502a0a3  LICENSE
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
index 27602fb2f7..d9a186b62c 100644
--- a/package/android-tools/android-tools.hash
+++ b/package/android-tools/android-tools.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256	9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f  android-tools_4.2.2+git20130218.orig.tar.xz
-sha256	73c3078de3e44d8a3cadf7a360863c63155d9d558c2f0933cf38ad901a3f5998  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
+sha256  9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f  android-tools_4.2.2+git20130218.orig.tar.xz
+sha256  73c3078de3e44d8a3cadf7a360863c63155d9d558c2f0933cf38ad901a3f5998  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
 sha256  170c5939bf8c8eed1db8f66f2d6155e8c1a3e799e390b55e7aad253195b1ebf5  debian/copyright
diff --git a/package/angular-websocket/angular-websocket.hash b/package/angular-websocket/angular-websocket.hash
index f589abe5e8..3aa5b5e7e1 100644
--- a/package/angular-websocket/angular-websocket.hash
+++ b/package/angular-websocket/angular-websocket.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-2.0.0.tar.gz
-sha256 3013a57f2c8df37775804b8be5b107665a2ca209607bb92c618bcc084feb00a7  LICENSE
+sha256  69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-2.0.0.tar.gz
+sha256  3013a57f2c8df37775804b8be5b107665a2ca209607bb92c618bcc084feb00a7  LICENSE
diff --git a/package/aoetools/aoetools.hash b/package/aoetools/aoetools.hash
index 76c305624d..4629019bab 100644
--- a/package/aoetools/aoetools.hash
+++ b/package/aoetools/aoetools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 477e796f5c18e8c0e61b5d88e1759c68249e8e0210c2f3de2b98680e2cc63e32  aoetools-37.tar.gz
+sha256  477e796f5c18e8c0e61b5d88e1759c68249e8e0210c2f3de2b98680e2cc63e32  aoetools-37.tar.gz
 
 # Hash for license files:
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 82ad475619..59ef590109 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
 # From http://www.apache.org/dist/apr/apr-util-1.6.1.tar.bz2.sha256
-sha256	d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b	apr-util-1.6.1.tar.bz2
+sha256  d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b  apr-util-1.6.1.tar.bz2
 # Locally calculated
-sha256	ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2	LICENSE
+sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 0a3f5c8527..d7739d7ed3 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
 # From http://archive.apache.org/dist/apr/apr-1.7.0.tar.bz2.sha256
-sha256 e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea  apr-1.7.0.tar.bz2
+sha256  e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea  apr-1.7.0.tar.bz2
 # Locally calculated
-sha256 f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
+sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index fd7c48eab3..c573ba5796 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
-sha256 9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
+sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
+sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/argus/argus.hash b/package/argus/argus.hash
index b3196cce7d..26355c5976 100644
--- a/package/argus/argus.hash
+++ b/package/argus/argus.hash
@@ -1,6 +1,6 @@
 # From http://qosient.com/argus/src/argus-3.0.8.2.tar.gz.md5
-md5	eaf5f5ec66569e556392802a70ef9ca5  argus-3.0.8.2.tar.gz
+md5  eaf5f5ec66569e556392802a70ef9ca5  argus-3.0.8.2.tar.gz
 
 # Locally computed
-sha256	ca4e3bd5b9d4a8ff7c01cc96d1bffd46dbd6321237ec94c52f8badd51032eeff  argus-3.0.8.2.tar.gz
-sha256	c68221f7207486bfce863fada4ba9b2aaf4adc9e1c672f965ae98e88143e5f16  README
+sha256  ca4e3bd5b9d4a8ff7c01cc96d1bffd46dbd6321237ec94c52f8badd51032eeff  argus-3.0.8.2.tar.gz
+sha256  c68221f7207486bfce863fada4ba9b2aaf4adc9e1c672f965ae98e88143e5f16  README
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index 48b1b55c73..12a8fc112e 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
+sha256  8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index 562deb8ff0..dd97333013 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039	arp-scan-1.9.7.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039  arp-scan-1.9.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/arptables/arptables.hash b/package/arptables/arptables.hash
index 8366cea412..8bc0f7fc2c 100644
--- a/package/arptables/arptables.hash
+++ b/package/arptables/arptables.hash
@@ -1,5 +1,5 @@
 # From http://ftp.netfilter.org/pub/arptables/arptables-0.0.5.tar.gz.sha256sum
-sha256	4f9a0656ce5c90868f551cd4deeb2d04f33899667e1fb2818b64e432fe8f629c	arptables-0.0.5.tar.gz
+sha256  4f9a0656ce5c90868f551cd4deeb2d04f33899667e1fb2818b64e432fe8f629c  arptables-0.0.5.tar.gz
 
 # Hash for license file
-sha256	ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1	COPYING
+sha256  ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1  COPYING
diff --git a/package/ascii-invaders/ascii-invaders.hash b/package/ascii-invaders/ascii-invaders.hash
index f08fc2a7da..a95544a79c 100644
--- a/package/ascii-invaders/ascii-invaders.hash
+++ b/package/ascii-invaders/ascii-invaders.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	ascii-invaders-1.0.1.tar.gz
+sha512  326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7  ascii-invaders-1.0.1.tar.gz
 
 # Hash for license file
-sha512	1e455684996d7733b2f1ccd4606d034694d16ceff6ede6125d7f1537d20dabe05976cca4cef5cbf6c31352cbd62a515fd8e34a2ffb54dae1181c1116b24c6cf7	LICENSE
+sha512  1e455684996d7733b2f1ccd4606d034694d16ceff6ede6125d7f1537d20dabe05976cca4cef5cbf6c31352cbd62a515fd8e34a2ffb54dae1181c1116b24c6cf7  LICENSE
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index fe59483b73..880d67562d 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -3,9 +3,9 @@ sha256  0fb817943a276f5e540c2a9432e8841cd3393e7c1bd1250055c620902f6eafc8  asteri
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
-sha1    721c512feaea102700d5bdce952fdc0bb29dc640                          asterisk-core-sounds-en-gsm-1.6.1.tar.gz
+sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
 sha256  d79c3d2044d41da8f363c447dfccc140be86b4fcc41b1ca5a60a80da52f24f2d  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
-sha1    f40fd6ea03dfe8d72ada2540b2288bfdc006381d                          asterisk-moh-opsound-wav-2.03.tar.gz
+sha1  f40fd6ea03dfe8d72ada2540b2288bfdc006381d  asterisk-moh-opsound-wav-2.03.tar.gz
 sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asterisk-moh-opsound-wav-2.03.tar.gz
 
 # License files, locally computed
diff --git a/package/atest/atest.hash b/package/atest/atest.hash
index 8384f31791..e411a934e5 100644
--- a/package/atest/atest.hash
+++ b/package/atest/atest.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 49c235a636..5b4bbeb8e2 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505  atf-0.21.tar.gz
-sha256 2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
+sha256  92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505  atf-0.21.tar.gz
+sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index f484776c1b..6195788327 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,5 +1,5 @@
 # From https://aubio.org/pub/aubio-0.4.9.tar.bz2.sha256
-sha256 d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da  aubio-0.4.9.tar.bz2
+sha256  d48282ae4dab83b3dc94c16cf011bcb63835c1c02b515490e1883049c3d1f3da  aubio-0.4.9.tar.bz2
 
 # Hash for license file:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/autossh/autossh.hash b/package/autossh/autossh.hash
index 226003f89e..aaed9681dd 100644
--- a/package/autossh/autossh.hash
+++ b/package/autossh/autossh.hash
@@ -1,6 +1,6 @@
 # From http://www.harding.motd.ca/autossh/autossh-1.4g.cksums
-sha256 5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31ae21277  autossh-1.4g.tgz
-sha1 bd88da0e296b8d85722ee9e7c314e9319e5b2db8  autossh-1.4g.tgz
-md5 2b804bc1bf6d2f2afaa526d02df7c0a2  autossh-1.4g.tgz
+sha256  5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31ae21277  autossh-1.4g.tgz
+sha1  bd88da0e296b8d85722ee9e7c314e9319e5b2db8  autossh-1.4g.tgz
+md5  2b804bc1bf6d2f2afaa526d02df7c0a2  autossh-1.4g.tgz
 # Locally computed
-sha256 014ec5a85a8899d4ea0e0a886bb3fc4c72b4bbec6414093ba1fdac5b178c25b4  autossh.c
+sha256  014ec5a85a8899d4ea0e0a886bb3fc4c72b4bbec6414093ba1fdac5b178c25b4  autossh.c
diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
index cfc7ba020d..3bf22f831d 100644
--- a/package/avahi/avahi.hash
+++ b/package/avahi/avahi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda  avahi-0.8.tar.gz
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
+sha256  060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda  avahi-0.8.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/b43-firmware/b43-firmware.hash b/package/b43-firmware/b43-firmware.hash
index efc1a6cf0f..0e61b6b5ab 100644
--- a/package/b43-firmware/b43-firmware.hash
+++ b/package/b43-firmware/b43-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f broadcom-wl-5.100.138.tar.bz2
-sha256 26a8c370f48fc129d0731cfd751c36cae1419b0bc8ca35781126744e60eae009 broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
+sha256  f1e7067aac5b62b67b8b6e4c517990277804339ac16065eb13c731ff909ae46f  broadcom-wl-5.100.138.tar.bz2
+sha256  26a8c370f48fc129d0731cfd751c36cae1419b0bc8ca35781126744e60eae009  broadcom-wl-5.10.56.27.3_mipsel.tar.bz2
diff --git a/package/b43-fwcutter/b43-fwcutter.hash b/package/b43-fwcutter/b43-fwcutter.hash
index e83a49711a..9d125daa6c 100644
--- a/package/b43-fwcutter/b43-fwcutter.hash
+++ b/package/b43-fwcutter/b43-fwcutter.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	d6ea85310df6ae08e7f7e46d8b975e17fc867145ee249307413cfbe15d7121ce	b43-fwcutter-019.tar.bz2
+sha256  d6ea85310df6ae08e7f7e46d8b975e17fc867145ee249307413cfbe15d7121ce  b43-fwcutter-019.tar.bz2
 
 # Hash for license file
-sha256	6af9fc424d57f29b7e59b35e52d4a91aca80304506275f2c0c076317fc6eb583	COPYING
+sha256  6af9fc424d57f29b7e59b35e52d4a91aca80304506275f2c0c076317fc6eb583  COPYING
diff --git a/package/bc/bc.hash b/package/bc/bc.hash
index 6feca831d2..a2565a2b5f 100644
--- a/package/bc/bc.hash
+++ b/package/bc/bc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a  bc-1.07.1.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
+sha256  62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a  bc-1.07.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/bcache-tools/bcache-tools.hash b/package/bcache-tools/bcache-tools.hash
index d80ec44a73..7548c4aabc 100644
--- a/package/bcache-tools/bcache-tools.hash
+++ b/package/bcache-tools/bcache-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-1.0.8.tar.gz
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
+sha256  d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-1.0.8.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index d0459969b5..4276939083 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
-sha256 0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
+sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
+sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
diff --git a/package/berkeleydb/berkeleydb.hash b/package/berkeleydb/berkeleydb.hash
index 7529329748..7fbf9492f3 100644
--- a/package/berkeleydb/berkeleydb.hash
+++ b/package/berkeleydb/berkeleydb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	76a25560d9e52a198d37a31440fd07632b5f1f8f9f2b6d5438f4bc3e7c9013ef  db-5.3.28.NC.tar.gz
-sha256	b78815181a53241f9347c6b47d1031fd669946f863e1edc807a291354cec024b  LICENSE
+sha256  76a25560d9e52a198d37a31440fd07632b5f1f8f9f2b6d5438f4bc3e7c9013ef  db-5.3.28.NC.tar.gz
+sha256  b78815181a53241f9347c6b47d1031fd669946f863e1edc807a291354cec024b  LICENSE
diff --git a/package/biosdevname/biosdevname.hash b/package/biosdevname/biosdevname.hash
index f4470c32dd..8dc16b1e9e 100644
--- a/package/biosdevname/biosdevname.hash
+++ b/package/biosdevname/biosdevname.hash
@@ -1,3 +1,3 @@
 # Locally computed hashes, not provided by upstream
-sha256 3a67fee0c315996bbba586c1c077e57625382d38dc48fb3c9e84d56a7a5effad  biosdevname-0.7.3.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  3a67fee0c315996bbba586c1c077e57625382d38dc48fb3c9e84d56a7a5effad  biosdevname-0.7.3.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index 0d2e5a1f1a..bdaf90c012 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,6 +1,6 @@
 # From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.md5
-md5 34630d13332fd1575bcc8531b0a596be  bitstream-1.5.tar.bz2
+md5  34630d13332fd1575bcc8531b0a596be  bitstream-1.5.tar.bz2
 # From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.sha256
-sha256 45fc5a5a6e4537a69fa8440821e87b76252135180a3070c631b0b36ce0a3b90a  bitstream-1.5.tar.bz2
+sha256  45fc5a5a6e4537a69fa8440821e87b76252135180a3070c631b0b36ce0a3b90a  bitstream-1.5.tar.bz2
 # Locally computed
-sha256 9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
+sha256  9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bonnie/bonnie.hash b/package/bonnie/bonnie.hash
index c8118e9d62..969167a5fd 100644
--- a/package/bonnie/bonnie.hash
+++ b/package/bonnie/bonnie.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb  bonnie++-1.03e.tgz
+sha256  cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb  bonnie++-1.03e.tgz
 sha256  bdfeef85436885bc317fdbae3732b17a39e7910eb855553a83b4d2cf9032e773  copyright.txt
diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
index 2c6d02f4e3..102086b9fc 100644
--- a/package/bsdiff/bsdiff.hash
+++ b/package/bsdiff/bsdiff.hash
@@ -1,4 +1,4 @@
 # From http://www.daemonology.net/bsdiff/:
-md5	e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
+md5  e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
 # locally computed
 sha256  fc0a6e634ef77dcf14bf36c7b6d1e57ba1ac5c4809073dfaacb3b5f7ab277eb7  bsdiff.c
diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
index cf66c402fc..a451166d28 100644
--- a/package/bzip2/bzip2.hash
+++ b/package/bzip2/bzip2.hash
@@ -1,4 +1,4 @@
 # From https://sourceware.org/pub/bzip2/sha512.sum
-sha512 083f5e675d73f3233c7930ebe20425a533feedeaaa9d8cc86831312a6581cefbe6ed0d08d2fa89be81082f2a5abdabca8b3c080bf97218a1bd59dc118a30b9f3  bzip2-1.0.8.tar.gz
+sha512  083f5e675d73f3233c7930ebe20425a533feedeaaa9d8cc86831312a6581cefbe6ed0d08d2fa89be81082f2a5abdabca8b3c080bf97218a1bd59dc118a30b9f3  bzip2-1.0.8.tar.gz
 # Locally calculated
-sha256 c6dbbf828498be844a89eaa3b84adbab3199e342eb5cb2ed2f0d4ba7ec0f38a3  LICENSE
+sha256  c6dbbf828498be844a89eaa3b84adbab3199e342eb5cb2ed2f0d4ba7ec0f38a3  LICENSE
diff --git a/package/cache-calibrator/cache-calibrator.hash b/package/cache-calibrator/cache-calibrator.hash
index a4b4b70cf7..cd6c63d011 100644
--- a/package/cache-calibrator/cache-calibrator.hash
+++ b/package/cache-calibrator/cache-calibrator.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2018ed8fa733155d44ceb1c0066c5cf8df7771cdf7cfca0a07b8dd9bebd9c221 calibrator.c
-sha256 a853663f5b4fb3ad77bf2790ab53146f456b8d9b9ddf83b99fe28c0bdec42514 calibrator.c.license
+sha256  2018ed8fa733155d44ceb1c0066c5cf8df7771cdf7cfca0a07b8dd9bebd9c221  calibrator.c
+sha256  a853663f5b4fb3ad77bf2790ab53146f456b8d9b9ddf83b99fe28c0bdec42514  calibrator.c.license
diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 31ae25bacc..57a1c12638 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Generated locally after checking GPG signature
-sha256 dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90  cage-0.1.4.tar.gz
+sha256  dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90  cage-0.1.4.tar.gz
 
 # Hashes for license files:
-sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
+sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index 949ed3ffee..3b93e24a22 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,9 +1,9 @@
 # From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
-sha1 00e81842ae5e81bb0343108884eb5205be0eac14 cairo-1.16.0.tar.xz
+sha1  00e81842ae5e81bb0343108884eb5205be0eac14  cairo-1.16.0.tar.xz
 # Calculated based on the hash above
-sha256	5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331	cairo-1.16.0.tar.xz
+sha256  5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331  cairo-1.16.0.tar.xz
 
 # Hash for license files:
-sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
-sha256	9e9e8608c4cdda51a78cc3a385f4ec9a2e4c96d5ecad74ac8bca5fca3e563b7d	COPYING-LGPL-2.1
-sha256	53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f	COPYING-MPL-1.1
+sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
+sha256  9e9e8608c4cdda51a78cc3a385f4ec9a2e4c96d5ecad74ac8bca5fca3e563b7d  COPYING-LGPL-2.1
+sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING-MPL-1.1
diff --git a/package/caps/caps.hash b/package/caps/caps.hash
index 958f4b68be..ed18095e83 100644
--- a/package/caps/caps.hash
+++ b/package/caps/caps.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e7496c5bce05abebe3dcb635926153bbb58a9337a6e423f048d3b61d8a4f98c9  caps_0.9.26.tar.bz2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e7496c5bce05abebe3dcb635926153bbb58a9337a6e423f048d3b61d8a4f98c9  caps_0.9.26.tar.bz2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cbootimage/cbootimage.hash b/package/cbootimage/cbootimage.hash
index 7113f84f1b..03d2f0a33d 100644
--- a/package/cbootimage/cbootimage.hash
+++ b/package/cbootimage/cbootimage.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 46cce01f07df977668de9e1d49884d8ed539169994215606a9719d17b9db8804  cbootimage-1.8.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  46cce01f07df977668de9e1d49884d8ed539169994215606a9719d17b9db8804  cbootimage-1.8.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
index fe8897c501..b3a8320790 100644
--- a/package/cctz/cctz.hash
+++ b/package/cctz/cctz.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db cctz-2.3.tar.gz
-sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747 LICENSE.txt
+sha256  8615b20d4e33e02a271c3b93a3b208e3d7d5d66880f5f6208b03426e448f32db  cctz-2.3.tar.gz
+sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
index d3f082e888..2c68067128 100644
--- a/package/cgic/cgic.hash
+++ b/package/cgic/cgic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
-sha256 6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
+sha256  1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
+sha256  6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index 385382b9d5..9675a098b4 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 7bfb88c483136bca9b814316d7f9ff581a805d68d144c1eebdfda3e8dfb5eb3a  cgilua-6.0.2-0.src.rock
-sha256 b82f9b13f9b1a1387f53203a625612914630b520377731b0aab7ce93ad2b18c4  cgilua/doc/us/license.html
+sha256  7bfb88c483136bca9b814316d7f9ff581a805d68d144c1eebdfda3e8dfb5eb3a  cgilua-6.0.2-0.src.rock
+sha256  b82f9b13f9b1a1387f53203a625612914630b520377731b0aab7ce93ad2b18c4  cgilua/doc/us/license.html
diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index de4d6d4ebf..f8614ec385 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  chartjs-2.9.4.tar.gz
-sha256	7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
+sha256  9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  chartjs-2.9.4.tar.gz
+sha256  7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
diff --git a/package/chipmunk/chipmunk.hash b/package/chipmunk/chipmunk.hash
index fc34639aa0..0fb8e15b6d 100644
--- a/package/chipmunk/chipmunk.hash
+++ b/package/chipmunk/chipmunk.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a  Chipmunk-7.0.3.tar.gz
+sha256  1e6f093812d6130e45bdf4cb80280cb3c93d1e1833d8cf989d554d7963b7899a  Chipmunk-7.0.3.tar.gz
 
 # Hash for license file:
-sha256	109cedb0301cba4e05fa99241f162bdad015c9541ae84b420b0148ac1ea588e2  LICENSE.txt
+sha256  109cedb0301cba4e05fa99241f162bdad015c9541ae84b420b0148ac1ea588e2  LICENSE.txt
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 007dd7a7fc..74d67d6ecb 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6 cmocka-1.1.5.tar.xz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
+sha256  f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6  cmocka-1.1.5.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 394904a190..674f09f5a9 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	7a15e4c0ae587db4987d673a790a4f3bea1cab29ce24a506fb21fa7bd2f60bfec70867eaa1c1395cb5b0e0ae81a024fb6109b064da0ef50e7c146d2198871c70	collectd-5.12.0.tar.bz2
-sha256	5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6	collectd-5.12.0.tar.bz2
-sha1	af36fe83e2995270b5632fc21e5a001e6702cdce	collectd-5.12.0.tar.bz2
-sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
+sha512  7a15e4c0ae587db4987d673a790a4f3bea1cab29ce24a506fb21fa7bd2f60bfec70867eaa1c1395cb5b0e0ae81a024fb6109b064da0ef50e7c146d2198871c70  collectd-5.12.0.tar.bz2
+sha256  5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6  collectd-5.12.0.tar.bz2
+sha1  af36fe83e2995270b5632fc21e5a001e6702cdce  collectd-5.12.0.tar.bz2
+sha256  ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4  COPYING
diff --git a/package/comix-cursors/comix-cursors.hash b/package/comix-cursors/comix-cursors.hash
index e03808c3f8..b66a61423b 100644
--- a/package/comix-cursors/comix-cursors.hash
+++ b/package/comix-cursors/comix-cursors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9e68ea8ff230dcc793528aa5da9a38b9bf61c478cd6868b4e4f5da659746a019	ComixCursors-0.9.1.tar.bz2
+sha256  9e68ea8ff230dcc793528aa5da9a38b9bf61c478cd6868b4e4f5da659746a019  ComixCursors-0.9.1.tar.bz2
diff --git a/package/connman-gtk/connman-gtk.hash b/package/connman-gtk/connman-gtk.hash
index fbc4acb14c..72e2fcaaa5 100644
--- a/package/connman-gtk/connman-gtk.hash
+++ b/package/connman-gtk/connman-gtk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	49bdc4769a7c508b0130e4705eef21aec9df1ea4f5c29fee48a0cae8db828fca	connman-gtk-1.1.1.tar.bz2
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  49bdc4769a7c508b0130e4705eef21aec9df1ea4f5c29fee48a0cae8db828fca  connman-gtk-1.1.1.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index ae9af25e8f..dd4fc168bc 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256 590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f  conntrack-tools-1.4.6.tar.bz2
+sha256  590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f  conntrack-tools-1.4.6.tar.bz2
 # Locally calculated
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index 4e9e787842..d53990d0b6 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
-sha256 3f59cccf38e9397f6fb34dcff983a24d336df982edb5b0cde549d0c32c28c9c0  copas-2_0_2/LICENSE
+sha256  efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
+sha256  3f59cccf38e9397f6fb34dcff983a24d336df982edb5b0cde549d0c32c28c9c0  copas-2_0_2/LICENSE
diff --git a/package/coxpcall/coxpcall.hash b/package/coxpcall/coxpcall.hash
index 953005e922..807596a436 100644
--- a/package/coxpcall/coxpcall.hash
+++ b/package/coxpcall/coxpcall.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 11feb07f08927c39b0b93e8c0bbaf15433f86155cba4820a31a09f4754ab3258  coxpcall-1.17.0-1.src.rock
-sha256 11f0f03dda1a28eca658d5e3361c15fd4d048371364aacc5f6870d77a66866c8  coxpcall/doc/license.html
+sha256  11feb07f08927c39b0b93e8c0bbaf15433f86155cba4820a31a09f4754ab3258  coxpcall-1.17.0-1.src.rock
+sha256  11f0f03dda1a28eca658d5e3361c15fd4d048371364aacc5f6870d77a66866c8  coxpcall/doc/license.html
diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index a3a0d4b3f9..b03114635c 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,7 +1,7 @@
 # From https://lists.gnu.org/archive/html/info-gnu/2019-11/msg00002.html
-md5 f3438e672e3fa273a7dc26339dd1eed6  cpio-2.13.tar.bz2
-sha1 4dcefc0e1bc36b11506a354768d82b15e3fe6bb8  cpio-2.13.tar.bz2
+md5  f3438e672e3fa273a7dc26339dd1eed6  cpio-2.13.tar.bz2
+sha1  4dcefc0e1bc36b11506a354768d82b15e3fe6bb8  cpio-2.13.tar.bz2
 # Locally calculated after checking pgp signature
-sha256 eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d  cpio-2.13.tar.bz2
+sha256  eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d  cpio-2.13.tar.bz2
 # Locally calculated
-sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/cppdb/cppdb.hash b/package/cppdb/cppdb.hash
index 6423ef289e..bca9f55959 100644
--- a/package/cppdb/cppdb.hash
+++ b/package/cppdb/cppdb.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/cppcms/files/cppdb/0.3.1/
-md5	129f1d75f46114b79160b93807d5223f	cppdb-0.3.1.tar.bz2
-sha1	c0410dcc482d71696ac9206044b3a3ac03d31f96	cppdb-0.3.1.tar.bz2
+md5  129f1d75f46114b79160b93807d5223f  cppdb-0.3.1.tar.bz2
+sha1  c0410dcc482d71696ac9206044b3a3ac03d31f96  cppdb-0.3.1.tar.bz2
 # locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
 sha256  503ed52ef942d44bb26bd47dd5c6765927b198624e4f375e32cc660dfc2a0981  MIT.txt
diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
index 47577f2a0b..50e33135e8 100644
--- a/package/cppunit/cppunit.hash
+++ b/package/cppunit/cppunit.hash
@@ -1,6 +1,6 @@
 # hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
-md5	9dc669e6145cadd9674873e24943e6dd  cppunit-1.15.1.tar.gz
-sha256	89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7  cppunit-1.15.1.tar.gz
+md5  9dc669e6145cadd9674873e24943e6dd  cppunit-1.15.1.tar.gz
+sha256  89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7  cppunit-1.15.1.tar.gz
 
 # Locally calculated:
-sha256	badf14d0aa3eaf1a7ae5f19a47a8ef2fc71a96802c4bc3d354535693c389f4e5  COPYING
+sha256  badf14d0aa3eaf1a7ae5f19a47a8ef2fc71a96802c4bc3d354535693c389f4e5  COPYING
diff --git a/package/cpuburn-arm/cpuburn-arm.hash b/package/cpuburn-arm/cpuburn-arm.hash
index 55f34f87f8..78f9ab93fc 100644
--- a/package/cpuburn-arm/cpuburn-arm.hash
+++ b/package/cpuburn-arm/cpuburn-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 354381ec8c352e6c84875ac034004df44b0ed0ac097c400b8d2e47652815c3a2  cpuburn-arm-ad7e646700d14b81413297bda02fb7fe96613c3f.tar.gz
-sha256 47f10095a04d16c8d8d52598371fa01b6a6e87134083b9ec3c43d83ff8576f55  cpuburn-a7.S
+sha256  354381ec8c352e6c84875ac034004df44b0ed0ac097c400b8d2e47652815c3a2  cpuburn-arm-ad7e646700d14b81413297bda02fb7fe96613c3f.tar.gz
+sha256  47f10095a04d16c8d8d52598371fa01b6a6e87134083b9ec3c43d83ff8576f55  cpuburn-a7.S
diff --git a/package/cpuload/cpuload.hash b/package/cpuload/cpuload.hash
index b80879ca7d..c3150d7593 100644
--- a/package/cpuload/cpuload.hash
+++ b/package/cpuload/cpuload.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-0.3.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-0.3.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index 9bc8e3d28a..735bcfedd2 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	8b6fd202f3f1d8fa395d3b7a5d821227cfd8bb4a9a584a7ae30cf62cea6287dd	cracklib-2.9.7.tar.gz
-sha256	7f0c45faf84a2494f15d1e2720394aca4a379163a70c4acad948186c0047d389	cracklib-words-2.9.7.gz
-sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	COPYING.LIB
+sha256  8b6fd202f3f1d8fa395d3b7a5d821227cfd8bb4a9a584a7ae30cf62cea6287dd  cracklib-2.9.7.tar.gz
+sha256  7f0c45faf84a2494f15d1e2720394aca4a379163a70c4acad948186c0047d389  cracklib-words-2.9.7.gz
+sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/ctorrent/ctorrent.hash b/package/ctorrent/ctorrent.hash
index 3e82902628..1b1d2fceb9 100644
--- a/package/ctorrent/ctorrent.hash
+++ b/package/ctorrent/ctorrent.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/dtorrent/files/dtorrent/3.3.2/
-sha1	d4e221f0292268f80e2430ce9d451dd64cf1ffaa	ctorrent-dnh3.3.2.tar.gz
+sha1  d4e221f0292268f80e2430ce9d451dd64cf1ffaa  ctorrent-dnh3.3.2.tar.gz
 
 # locally calculated
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/cunit/cunit.hash b/package/cunit/cunit.hash
index bbd43a78ca..93a8c4208b 100644
--- a/package/cunit/cunit.hash
+++ b/package/cunit/cunit.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214  CUnit-2.1-3.tar.bz2
-sha256 5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
+sha256  f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214  CUnit-2.1-3.tar.bz2
+sha256  5d9d73d41a57dd2f34487ef3978a2c13cdb97294baeeb81fcd274796399eb15f  COPYING
diff --git a/package/curlpp/curlpp.hash b/package/curlpp/curlpp.hash
index 2b14a235ee..e413995669 100644
--- a/package/curlpp/curlpp.hash
+++ b/package/curlpp/curlpp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 97e3819bdcffc3e4047b6ac57ca14e04af85380bd93afe314bee9dd5c7f46a0a  v0.8.1.tar.gz
+sha256  97e3819bdcffc3e4047b6ac57ca14e04af85380bd93afe314bee9dd5c7f46a0a  v0.8.1.tar.gz
 
 # Hash for license files:
-sha256 8b9e3afd4d06ad3c169e788e5187a3e9f4f35671e9a7322f7e74bea9643b5b5a  doc/LICENSE
+sha256  8b9e3afd4d06ad3c169e788e5187a3e9f4f35671e9a7322f7e74bea9643b5b5a  doc/LICENSE
diff --git a/package/cwiid/cwiid.hash b/package/cwiid/cwiid.hash
index 6446b8022d..92b4b215dc 100644
--- a/package/cwiid/cwiid.hash
+++ b/package/cwiid/cwiid.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 3adf3bf018721dee3c47e12ba4dd71810a239918dce925aa4079cb2a98bca5fe  cwiid-fadf11e89b579bcc0336a0692ac15c93785f3f82.tar.gz
+sha256  3adf3bf018721dee3c47e12ba4dd71810a239918dce925aa4079cb2a98bca5fe  cwiid-fadf11e89b579bcc0336a0692ac15c93785f3f82.tar.gz
 # License files, locally calculated
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/cxxtest/cxxtest.hash b/package/cxxtest/cxxtest.hash
index be2cbd3227..c24e258fa8 100644
--- a/package/cxxtest/cxxtest.hash
+++ b/package/cxxtest/cxxtest.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8	cxxtest-4.4.tar.gz
+sha256  1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8  cxxtest-4.4.tar.gz
 
 # Hash for license file:
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 19e2053a0a..c2577c6719 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,6 +1,6 @@
 # From https://github.com/zeromq/czmq/releases
-md5 471e9ec120fc66a2fe2aae14359e3cfa czmq-4.2.1.tar.gz
-sha1 75ced09c143f93fae65238375e3a799c40eaed4c czmq-4.2.1.tar.gz
+md5  471e9ec120fc66a2fe2aae14359e3cfa  czmq-4.2.1.tar.gz
+sha1  75ced09c143f93fae65238375e3a799c40eaed4c  czmq-4.2.1.tar.gz
 # Locally calculated
-sha256 5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39 czmq-4.2.1.tar.gz
-sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENSE
+sha256  5d720a204c2a58645d6f7643af15d563a712dad98c9d32c1ed913377daa6ac39  czmq-4.2.1.tar.gz
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/dacapo/dacapo.hash b/package/dacapo/dacapo.hash
index ca7ad46383..ba099b72cf 100644
--- a/package/dacapo/dacapo.hash
+++ b/package/dacapo/dacapo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 be3db084adcb2867760e1197b3ccf541c3213d918daa19386d8e236648d24be8  dacapo-9.12-MR1-bach.jar
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  be3db084adcb2867760e1197b3ccf541c3213d918daa19386d8e236648d24be8  dacapo-9.12-MR1-bach.jar
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index a57f52b888..6bd62c5984 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
-sha256 141953aa7714e3145a6adfd71d6acbbe377e07ab920bc8ec4039394774da8a6e  dado-1.8.3/doc/license.html
+sha256  5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
+sha256  141953aa7714e3145a6adfd71d6acbbe377e07ab920bc8ec4039394774da8a6e  dado-1.8.3/doc/license.html
diff --git a/package/datatables-buttons/datatables-buttons.hash b/package/datatables-buttons/datatables-buttons.hash
index eda8df34b2..fdbbe5faf0 100644
--- a/package/datatables-buttons/datatables-buttons.hash
+++ b/package/datatables-buttons/datatables-buttons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
-sha256	21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  License.txt
+sha256  427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
+sha256  21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  License.txt
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
index dc94620208..7bd5697dbe 100644
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
+++ b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
-sha256	e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  License.txt
+sha256  53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
+sha256  e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  License.txt
diff --git a/package/datatables-responsive/datatables-responsive.hash b/package/datatables-responsive/datatables-responsive.hash
index d10313f368..df133f040c 100644
--- a/package/datatables-responsive/datatables-responsive.hash
+++ b/package/datatables-responsive/datatables-responsive.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
-sha256	da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  License.txt
+sha256  47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
+sha256  da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  License.txt
diff --git a/package/datatables/datatables.hash b/package/datatables/datatables.hash
index d6eeadfb37..bb31fcac3d 100644
--- a/package/datatables/datatables.hash
+++ b/package/datatables/datatables.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
-sha256	c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  license.txt
+sha256  e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
+sha256  c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  license.txt
diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
index 670bffa7a7..5f01e6f91b 100644
--- a/package/dc3dd/dc3dd.hash
+++ b/package/dc3dd/dc3dd.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2/
-sha1 1bfe81a921a8473a6ecb46f328ecaab761afb55d dc3dd-7.2.641.tar.xz
+sha1  1bfe81a921a8473a6ecb46f328ecaab761afb55d  dc3dd-7.2.641.tar.xz
 # Locally computed
 sha256  7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d  dc3dd-7.2.641.tar.xz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 16a45d4ea1..449e93eeff 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
-sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
+sha256  bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151  debianutils_4.11.tar.xz
 # Locally calculated
-sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
+sha256  3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567  debian/copyright
diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index 358a6f01d2..a24db5b275 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
-sha256 bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
+sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
index 9ea22a360a..e6f4773da9 100644
--- a/package/dhrystone/dhrystone.hash
+++ b/package/dhrystone/dhrystone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
+sha256  038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
index 55932ce6af..65b60e7aa7 100644
--- a/package/dieharder/dieharder.hash
+++ b/package/dieharder/dieharder.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f  dieharder-3.31.1.tgz
-sha256 c475bcd1afa6fc15a65174e31c599c0d23706a34e4b9f2fcb03a4dad5438d53f  COPYING
+sha256  6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f  dieharder-3.31.1.tgz
+sha256  c475bcd1afa6fc15a65174e31c599c0d23706a34e4b9f2fcb03a4dad5438d53f  COPYING
diff --git a/package/dmraid/dmraid.hash b/package/dmraid/dmraid.hash
index af84732f93..7c1bb9a56b 100644
--- a/package/dmraid/dmraid.hash
+++ b/package/dmraid/dmraid.hash
@@ -1,5 +1,5 @@
 # From http://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
-md5	819338fcef98e8e25819f0516722beeb dmraid-1.0.0.rc16-3.tar.bz2
+md5  819338fcef98e8e25819f0516722beeb  dmraid-1.0.0.rc16-3.tar.bz2
 # locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  1.0.0.rc16-3/dmraid/LICENSE_GPL
 sha256  4bc391fcf852e03c3a7564cb146af6e47717562eed296b28bce123ee1b0396b8  1.0.0.rc16-3/dmraid/LICENSE
diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index aa29a6d6cb..42d71c8095 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,5 +1,5 @@
 # from https://pypi.python.org/pypi/docker-compose/json
-sha256	a5d58e974fd717e24b0dda6669a46bc03548d9023ef38d965acdc32d4d5fa753  docker-compose-1.24.1.tar.gz
+sha256  a5d58e974fd717e24b0dda6669a46bc03548d9023ef38d965acdc32d4d5fa753  docker-compose-1.24.1.tar.gz
 
 # locally computed
-sha256	552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
+sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/doom-wad/doom-wad.hash b/package/doom-wad/doom-wad.hash
index fa069c1b77..80136fa08e 100644
--- a/package/doom-wad/doom-wad.hash
+++ b/package/doom-wad/doom-wad.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6	doom19s.zip
+sha256  cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6  doom19s.zip
diff --git a/package/dt/dt.hash b/package/dt/dt.hash
index 9c1102579d..e0cc0caea6 100644
--- a/package/dt/dt.hash
+++ b/package/dt/dt.hash
@@ -1,7 +1,7 @@
 # From http://pkgs.fedoraproject.org/repo/pkgs/dt/dt-source-v18.32.tar.gz
 # (directory name is md5 hash)
-md5	3054aeaaba047a1dbe90c2132a382ee2	dt-source-v18.32.tar.gz
+md5  3054aeaaba047a1dbe90c2132a382ee2  dt-source-v18.32.tar.gz
 
 # Locally calculated
-sha256	10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6	dt-source-v18.32.tar.gz
-sha256  49f47f20de4b44dc3505ed0cc55bfbfe0fc3e41956ab546f1eeedcf554def54c	LICENSE
+sha256  10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6  dt-source-v18.32.tar.gz
+sha256  49f47f20de4b44dc3505ed0cc55bfbfe0fc3e41956ab546f1eeedcf554def54c  LICENSE
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index fbbf21a015..48167de8ae 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 72c1a94f3e6788af1e72b8cac13bb53e0989fe02cd13e191133f5519d2a2fefb  dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe.tar.gz
-sha256 29046ef7ee0b7b127bcc64faf135035820906dea2b379b2efcfc119131a39f7a  anet.h
+sha256  72c1a94f3e6788af1e72b8cac13bb53e0989fe02cd13e191133f5519d2a2fefb  dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe.tar.gz
+sha256  29046ef7ee0b7b127bcc64faf135035820906dea2b379b2efcfc119131a39f7a  anet.h
diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index b32668fa41..1b75d779d9 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,7 +1,7 @@
 # From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.md5
-md5 148a26e1207e111f905461cfb1cd106a  dvblast-3.4.tar.bz2
+md5  148a26e1207e111f905461cfb1cd106a  dvblast-3.4.tar.bz2
 # From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.sha256
-sha256 7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44  dvblast-3.4.tar.bz2
+sha256  7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44  dvblast-3.4.tar.bz2
 # Locally computed
-sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
-sha256 2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
+sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
+sha256  2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
diff --git a/package/dvdauthor/dvdauthor.hash b/package/dvdauthor/dvdauthor.hash
index 833884aa9a..c0ff3e0fba 100644
--- a/package/dvdauthor/dvdauthor.hash
+++ b/package/dvdauthor/dvdauthor.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/dvdauthor/files
-md5 1173dcb8d40e74fc90c0f3a25dbd642d  dvdauthor-0.7.2.tar.gz
-sha1 0e605642140576bfb3e963414d77630d1c073a51  dvdauthor-0.7.2.tar.gz
+md5  1173dcb8d40e74fc90c0f3a25dbd642d  dvdauthor-0.7.2.tar.gz
+sha1  0e605642140576bfb3e963414d77630d1c073a51  dvdauthor-0.7.2.tar.gz
 # Locally computed
 sha256  3020a92de9f78eb36f48b6f22d5a001c47107826634a785a62dfcd080f612eb7  dvdauthor-0.7.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/e2tools/e2tools.hash b/package/e2tools/e2tools.hash
index a109ff1bda..14be7dbd96 100644
--- a/package/e2tools/e2tools.hash
+++ b/package/e2tools/e2tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d06ca71f01483ad6d9a514e31466e7d2357b3465de2813d667a8b2f9638544e  e2tools-0.0.16.4.tar.gz
-sha256 0e79fd282723e1eb3f7381d41233a83ed20cf3e8c83aa53e6847bf7ffe781583  COPYING
+sha256  1d06ca71f01483ad6d9a514e31466e7d2357b3465de2813d667a8b2f9638544e  e2tools-0.0.16.4.tar.gz
+sha256  0e79fd282723e1eb3f7381d41233a83ed20cf3e8c83aa53e6847bf7ffe781583  COPYING
diff --git a/package/ecryptfs-utils/ecryptfs-utils.hash b/package/ecryptfs-utils/ecryptfs-utils.hash
index 8a0b111e5c..7d83e74447 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.hash
+++ b/package/ecryptfs-utils/ecryptfs-utils.hash
@@ -1,5 +1,5 @@
 # From https://launchpad.net/ecryptfs/trunk/111/+download/ecryptfs-utils_111.orig.tar.gz/+md5
-md5 83513228984f671930752c3518cac6fd  ecryptfs-utils_111.orig.tar.gz
+md5  83513228984f671930752c3518cac6fd  ecryptfs-utils_111.orig.tar.gz
 # Locally computed
-sha256 112cb3e37e81a1ecd8e39516725dec0ce55c5f3df6284e0f4cc0f118750a987f  ecryptfs-utils_111.orig.tar.gz
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  112cb3e37e81a1ecd8e39516725dec0ce55c5f3df6284e0f4cc0f118750a987f  ecryptfs-utils_111.orig.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index b521e08a53..132022bf67 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 74c52b4f479120fb6639e753e71163ba3f557a7a67c0be225593f9f05b253f36  efivar-37.tar.gz
-sha256 91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
+sha256  74c52b4f479120fb6639e753e71163ba3f557a7a67c0be225593f9f05b253f36  efivar-37.tar.gz
+sha256  91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/elftosb/elftosb.hash b/package/elftosb/elftosb.hash
index 83f5ce664e..fbdd6c4c0f 100644
--- a/package/elftosb/elftosb.hash
+++ b/package/elftosb/elftosb.hash
@@ -1,4 +1,4 @@
 # From http://repository.timesys.com/buildsources/e/elftosb/elftosb-10.12.01/elftosb-10.12.01.tar.gz.md5sum
-md5	e8005d606c1e0bb3507c82f6eceb3056	elftosb-10.12.01.tar.gz
+md5  e8005d606c1e0bb3507c82f6eceb3056  elftosb-10.12.01.tar.gz
 # locally computed
 sha256  c861c25936b7bc0cf180023d540f2b0d0f5892edd27fd00efef4b6234c1df27a  COPYING
diff --git a/package/elixir/elixir.hash b/package/elixir/elixir.hash
index b4d2f8b6b0..6d083e72de 100644
--- a/package/elixir/elixir.hash
+++ b/package/elixir/elixir.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 f3465d8a8e386f3e74831bf9594ee39e6dfde6aa430fe9260844cfe46aa10139  elixir-1.9.4.tar.gz
-sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE
+sha256  f3465d8a8e386f3e74831bf9594ee39e6dfde6aa430fe9260844cfe46aa10139  elixir-1.9.4.tar.gz
+sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE
diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index ddc61a88e8..6acd70b3f2 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 76082cf981b0865c8a1b300d4641c790a6556461901bbb63700df38300277271  emlog-0.70.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  76082cf981b0865c8a1b300d4641c790a6556461901bbb63700df38300277271  emlog-0.70.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/enscript/enscript.hash b/package/enscript/enscript.hash
index 4c50a165ac..c4706c623b 100644
--- a/package/enscript/enscript.hash
+++ b/package/enscript/enscript.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb	enscript-1.6.6.tar.gz
+sha256  6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb  enscript-1.6.6.tar.gz
 # Locally computed
-sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/erlang-base64url/erlang-base64url.hash b/package/erlang-base64url/erlang-base64url.hash
index becbe5db61..f3272966b7 100644
--- a/package/erlang-base64url/erlang-base64url.hash
+++ b/package/erlang-base64url/erlang-base64url.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7ef7210effd25ac1f82f190fcfaef53e49d7bc40bb94112c4aa07266c32a851b erlang-base64url-1.0.1.tar.gz
-sha256 d59dff2fa4c39f05188ee533fbf06479eef1b47f8cad6353f8ab3726cc6923bc LICENSE.txt
+sha256  7ef7210effd25ac1f82f190fcfaef53e49d7bc40bb94112c4aa07266c32a851b  erlang-base64url-1.0.1.tar.gz
+sha256  d59dff2fa4c39f05188ee533fbf06479eef1b47f8cad6353f8ab3726cc6923bc  LICENSE.txt
diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
index 1e20607334..237bc8810c 100644
--- a/package/erlang-goldrush/erlang-goldrush.hash
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612 erlang-goldrush-0.1.9.tar.gz
-sha256 335dd315c1bf12bd9bde777666c45e92652c9fe633101b12fc6f927b88433b6f LICENSE
+sha256  6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612  erlang-goldrush-0.1.9.tar.gz
+sha256  335dd315c1bf12bd9bde777666c45e92652c9fe633101b12fc6f927b88433b6f  LICENSE
diff --git a/package/erlang-rebar/erlang-rebar.hash b/package/erlang-rebar/erlang-rebar.hash
index b052980095..bc463a9619 100644
--- a/package/erlang-rebar/erlang-rebar.hash
+++ b/package/erlang-rebar/erlang-rebar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07 erlang-rebar-2.6.4.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
+sha256  577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07  erlang-rebar-2.6.4.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE
diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index 53155d41ba..6c6e09ccf0 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835  exfat-utils-1.3.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835  exfat-utils-1.3.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index 4b8ce90190..b40fc7f0e5 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3  fuse-exfat-1.3.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  07652136064da5e4d32df5555f88c138ffa4835a23b88a5bae2015f21006e0d3  fuse-exfat-1.3.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fan-ctrl/fan-ctrl.hash b/package/fan-ctrl/fan-ctrl.hash
index 0bd5d60977..4f26696785 100644
--- a/package/fan-ctrl/fan-ctrl.hash
+++ b/package/fan-ctrl/fan-ctrl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha1 d8ba5bac15e90c36a4e908ca1c98fac83bf702ea fan-ctrl.c?revision=1.3
+sha1  d8ba5bac15e90c36a4e908ca1c98fac83bf702ea  fan-ctrl.c?revision=1.3
diff --git a/package/fbdump/fbdump.hash b/package/fbdump/fbdump.hash
index 8bc8b7c564..51506b83a9 100644
--- a/package/fbdump/fbdump.hash
+++ b/package/fbdump/fbdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c4d521a86229b3106cf69786008ad94f899da5288a19a067deae84951880722d	fbdump-0.4.2.tar.gz
-sha256	231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING
+sha256  c4d521a86229b3106cf69786008ad94f899da5288a19a067deae84951880722d  fbdump-0.4.2.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/fbterm/fbterm.hash b/package/fbterm/fbterm.hash
index 37c32df7a4..ee70361428 100644
--- a/package/fbterm/fbterm.hash
+++ b/package/fbterm/fbterm.hash
@@ -1,4 +1,4 @@
 # From http://code.google.com/p/fbterm/downloads/detail?name=fbterm-1.7.0.tar.gz&can=2&q=
-sha1	dc7b7ff29212c1551f35bf7a50967454d3b8c67c	fbterm-1.7.0.tar.gz
+sha1  dc7b7ff29212c1551f35bf7a50967454d3b8c67c  fbterm-1.7.0.tar.gz
 # locally computed
 sha256  b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 07c0dd9403..f74b8fa335 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
-sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
+sha256  57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
+sha256  2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
index 1c4a17d8c4..b07aad8f18 100644
--- a/package/fftw/fftw.hash
+++ b/package/fftw/fftw.hash
@@ -1,5 +1,5 @@
 # From http://www.fftw.org/fftw-3.3.8.tar.gz.md5sum
-md5 8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
+md5  8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
 # Locally computed
-sha256 6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303	fftw-3.3.7.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING
+sha256  6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303  fftw-3.3.7.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 0d0f75e6b4..6a0223a20f 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca v0.14.0.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  v0.14.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flex/flex.hash b/package/flex/flex.hash
index ee90573902..3bfb04d672 100644
--- a/package/flex/flex.hash
+++ b/package/flex/flex.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995  flex-2.6.4.tar.gz
+sha256  e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995  flex-2.6.4.tar.gz
 # License files, locally calculated
-sha256 97fd685958d93be7f8dab939bb8161dbd6afb0718c63bfc337c24321aea44273  COPYING
+sha256  97fd685958d93be7f8dab939bb8161dbd6afb0718c63bfc337c24321aea44273  COPYING
diff --git a/package/flickcurl/flickcurl.hash b/package/flickcurl/flickcurl.hash
index 92ba68361e..8c3ea1682a 100644
--- a/package/flickcurl/flickcurl.hash
+++ b/package/flickcurl/flickcurl.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256	ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3	flickcurl-1.26.tar.gz
+sha256  ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3  flickcurl-1.26.tar.gz
 # Locally computed
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LIB
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE-2.0.txt
-sha256	3590f30b0fb9446a1f0a7ea5bcbb5786fa66fa362800f53d2575875d74b91909	LICENSE.html
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-2.0.txt
+sha256  3590f30b0fb9446a1f0a7ea5bcbb5786fa66fa362800f53d2575875d74b91909  LICENSE.html
diff --git a/package/flot/flot.hash b/package/flot/flot.hash
index c8272fc0b1..fb7a331975 100644
--- a/package/flot/flot.hash
+++ b/package/flot/flot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21	flot-0.8.3.tar.gz
-sha256	52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c	LICENSE.txt
+sha256  ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21  flot-0.8.3.tar.gz
+sha256  52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c  LICENSE.txt
diff --git a/package/fluid-soundfont/fluid-soundfont.hash b/package/fluid-soundfont/fluid-soundfont.hash
index 7aaac60084..ecc57a1e00 100644
--- a/package/fluid-soundfont/fluid-soundfont.hash
+++ b/package/fluid-soundfont/fluid-soundfont.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2621acaa1c78e4abdb24bdd163230cc577e61276936d6aa6e3180582142f0343  fluid-soundfont_3.1.orig.tar.gz
-sha256 8ef830b65c97a976b86e34bb5fde08d99dfb1db13c4149b5b20bc837ac6c4568  COPYING
+sha256  2621acaa1c78e4abdb24bdd163230cc577e61276936d6aa6e3180582142f0343  fluid-soundfont_3.1.orig.tar.gz
+sha256  8ef830b65c97a976b86e34bb5fde08d99dfb1db13c4149b5b20bc837ac6c4568  COPYING
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 2ea11d5fe4..89bc411f66 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
+sha256  de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index 153f00c3d8..844ee426d4 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
 # From https://lists.freedesktop.org/archives/fontconfig/2018-August/006324.html
-sha256 f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741 fontconfig-2.13.1.tar.bz2
+sha256  f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741  fontconfig-2.13.1.tar.bz2
 
 # Locally calculated
-sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886 COPYING
+sha256  fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  COPYING
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
index 2bf3f15d0f..0949a099b2 100644
--- a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fb6334900972fe389e808845417dd9045fb0f7eb47952fc22a00f4cdaf94af1a  imx-m4fwloader-8cf4d17a09ba23250d43381b49ba00d92406fad9.tar.gz
-sha256 c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
+sha256  fb6334900972fe389e808845417dd9045fb0f7eb47952fc22a00f4cdaf94af1a  imx-m4fwloader-8cf4d17a09ba23250d43381b49ba00d92406fad9.tar.gz
+sha256  c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
index 5d95463903..c41ac57ca4 100644
--- a/package/freescale-imx/imx-uuc/imx-uuc.hash
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7f4d4838d4bf489932ef4a242677db30ad8d9ffd76065e07f4ddee3e6c35db82  imx-uuc-d6afb27e55d73d7ad08cd2dd51c784d8ec9694dc.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  7f4d4838d4bf489932ef4a242677db30ad8d9ffd76065e07f4ddee3e6c35db82  imx-uuc-d6afb27e55d73d7ad08cd2dd51c784d8ec9694dc.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fstrcmp/fstrcmp.hash b/package/fstrcmp/fstrcmp.hash
index 9a43c59c09..fbc53b1b44 100644
--- a/package/fstrcmp/fstrcmp.hash
+++ b/package/fstrcmp/fstrcmp.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/fstrcmp/files/fstrcmp/0.7/
-md5 9c440bbdfcad9fd22e38f2388715b0cc  fstrcmp-0.7.D001.tar.gz
-sha1 bb848118fb157dc624ae9fac0566a64cc85f2ef2  fstrcmp-0.7.D001.tar.gz
+md5  9c440bbdfcad9fd22e38f2388715b0cc  fstrcmp-0.7.D001.tar.gz
+sha1  bb848118fb157dc624ae9fac0566a64cc85f2ef2  fstrcmp-0.7.D001.tar.gz
 # Locally computed
-sha256 e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476  fstrcmp-0.7.D001.tar.gz
-sha256 5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
+sha256  e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476  fstrcmp-0.7.D001.tar.gz
+sha256  5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
diff --git a/package/ftop/ftop.hash b/package/ftop/ftop.hash
index cf0d99dbe2..b7849d65b5 100644
--- a/package/ftop/ftop.hash
+++ b/package/ftop/ftop.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ftop/files/ftop/1.0/
-md5 57c68b6e7431f4219d9eddaebcb395da ftop-1.0.tar.bz2
-sha1 d3ef1b74825f50c7c442d299b29d23c2478f199b ftop-1.0.tar.bz2
+md5  57c68b6e7431f4219d9eddaebcb395da  ftop-1.0.tar.bz2
+sha1  d3ef1b74825f50c7c442d299b29d23c2478f199b  ftop-1.0.tar.bz2
 # Locally computed
-sha256 3a705f4f291384344cd32c3dd5f5f6a7cd7cea7624c83cb7e923966dbcd47f82  ftop-1.0.tar.bz2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3a705f4f291384344cd32c3dd5f5f6a7cd7cea7624c83cb7e923966dbcd47f82  ftop-1.0.tar.bz2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
index 24d0cf9b17..56d754a69e 100644
--- a/package/gconf/gconf.hash
+++ b/package/gconf/gconf.hash
@@ -1,4 +1,4 @@
 # http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
-sha256 1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
+sha256  1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
 # License files, locally calculated
-sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gengetopt/gengetopt.hash b/package/gengetopt/gengetopt.hash
index 35c214fce2..707efacd95 100644
--- a/package/gengetopt/gengetopt.hash
+++ b/package/gengetopt/gengetopt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac gengetopt-2.23.tar.xz
-sha256 afab96ff35204960631dc05506034f9efc01e6d696f0ac93718d6bd43512cda7 COPYING
-sha256 72a43351233d6a581f891cdfff78b7b7d5f2a12522523929c5f7e8f674c2f6fc LICENSE
+sha256  b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac  gengetopt-2.23.tar.xz
+sha256  afab96ff35204960631dc05506034f9efc01e6d696f0ac93718d6bd43512cda7  COPYING
+sha256  72a43351233d6a581f891cdfff78b7b7d5f2a12522523929c5f7e8f674c2f6fc  LICENSE
diff --git a/package/genpart/genpart.hash b/package/genpart/genpart.hash
index b741dbda14..e7e6779391 100644
--- a/package/genpart/genpart.hash
+++ b/package/genpart/genpart.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	bfb39434f31d10f1b8c7b6bc6ec612309838c2819022561541c4d2d5a424e3f2	genpart-1.0.2.tar.bz2
+sha256  bfb39434f31d10f1b8c7b6bc6ec612309838c2819022561541c4d2d5a424e3f2  genpart-1.0.2.tar.bz2
diff --git a/package/geoip/geoip.hash b/package/geoip/geoip.hash
index c2ddf390e6..9d0a02d3b1 100644
--- a/package/geoip/geoip.hash
+++ b/package/geoip/geoip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1dfb748003c5e4b7fd56ba8c4cd786633d5d6f409547584f6910398389636f80  GeoIP-1.6.12.tar.gz
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
+sha256  1dfb748003c5e4b7fd56ba8c4cd786633d5d6f409547584f6910398389636f80  GeoIP-1.6.12.tar.gz
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 1f7fe60332..06aeb85def 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf gflags-2.2.2.tar.gz
+sha256  34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf  gflags-2.2.2.tar.gz
 
 # Hash for license file:
-sha256 90d1f3701813c3cd65eee2dc736746fe46b465918f3f7d6d31463a2018b33fa5  COPYING.txt
+sha256  90d1f3701813c3cd65eee2dc736746fe46b465918f3f7d6d31463a2018b33fa5  COPYING.txt
diff --git a/package/ghostscript-fonts/ghostscript-fonts.hash b/package/ghostscript-fonts/ghostscript-fonts.hash
index d6df0e745a..d1563562fe 100644
--- a/package/ghostscript-fonts/ghostscript-fonts.hash
+++ b/package/ghostscript-fonts/ghostscript-fonts.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/gs-fonts/files/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/
-sha1	2a7198e8178b2e7dba87cb5794da515200b568f5	ghostscript-fonts-std-8.11.tar.gz
+sha1  2a7198e8178b2e7dba87cb5794da515200b568f5  ghostscript-fonts-std-8.11.tar.gz
 # Locally computed
-sha256 0eb6f356119f2e49b2563210852e17f57f9dcc5755f350a69a46a0d641a0c401  ghostscript-fonts-std-8.11.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  0eb6f356119f2e49b2563210852e17f57f9dcc5755f350a69a46a0d641a0c401  ghostscript-fonts-std-8.11.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index f7db1626df..445e9c4b3d 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/giflib/files
-md5	6f03aee4ebe54ac2cc1ab3e4b0a049e5	giflib-5.2.1.tar.gz
-sha1	c3f774dcbdf26afded7788979c8081d33c6426dc	giflib-5.2.1.tar.gz
+md5  6f03aee4ebe54ac2cc1ab3e4b0a049e5  giflib-5.2.1.tar.gz
+sha1  c3f774dcbdf26afded7788979c8081d33c6426dc  giflib-5.2.1.tar.gz
 # Locally computed
-sha256	0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e	COPYING
+sha256  0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e  COPYING
diff --git a/package/gli/gli.hash b/package/gli/gli.hash
index 177358a758..deef901af9 100644
--- a/package/gli/gli.hash
+++ b/package/gli/gli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
-sha256 e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
+sha256  9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
+sha256  e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 2073d6bf04..b0c1d92c74 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5e33b6131cea6a904339734b015110d4342b7dc02d995164fdb86332d28a5aa4  glm-0.9.9.5.tar.gz
-sha256 337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
+sha256  5e33b6131cea6a904339734b015110d4342b7dc02d995164fdb86332d28a5aa4  glm-0.9.9.5.tar.gz
+sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index 9d1b797787..39dd12fa4f 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 137d9c525a05bb605163df0465367d36e943715ca773ce43d5ea66f0597600a3  glorytun-0.3.4.tar.gz
-sha256 3d9ddddb8807c305287d9dbab58473e5307e9c91651c43c654a0828855d2b373  LICENSE
+sha256  137d9c525a05bb605163df0465367d36e943715ca773ce43d5ea66f0597600a3  glorytun-0.3.4.tar.gz
+sha256  3d9ddddb8807c305287d9dbab58473e5307e9c91651c43c654a0828855d2b373  LICENSE
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index e47c5faaba..90343cf385 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624  gnuradio-3.8.2.0.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624  gnuradio-3.8.2.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gob2/gob2.hash b/package/gob2/gob2.hash
index 7edf518f34..9cef2ed612 100644
--- a/package/gob2/gob2.hash
+++ b/package/gob2/gob2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026  gob2-2.0.20.tar.xz
-sha256 b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
-sha256 7222386392eecf784e2f0c406f412f238cb6d25865a8447ae0947b32bb569889  COPYING.generated-code
+sha256  f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026  gob2-2.0.20.tar.xz
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
+sha256  7222386392eecf784e2f0c406f412f238cb6d25865a8447ae0947b32bb569889  COPYING.generated-code
diff --git a/package/googlefontdirectory/googlefontdirectory.hash b/package/googlefontdirectory/googlefontdirectory.hash
index 2525b6fff6..10f3bf60b1 100644
--- a/package/googlefontdirectory/googlefontdirectory.hash
+++ b/package/googlefontdirectory/googlefontdirectory.hash
@@ -1,994 +1,994 @@
 # Locally calculated
-sha256 ec2ddbeee673cce1b0796e3b20fbff5fd836ce9ba6d88deed8b59154fa255f06  googlefontdirectory-94dff3eaa9301b6640cccc63c56d6ff33d82882c.tar.gz
+sha256  ec2ddbeee673cce1b0796e3b20fbff5fd836ce9ba6d88deed8b59154fa255f06  googlefontdirectory-94dff3eaa9301b6640cccc63c56d6ff33d82882c.tar.gz
 # Locally calculated with
 # for i in $(find apache/ ofl/ ufl/ -name 'LICENSE.txt' -o -name 'OFL.txt' -o -name 'LICENCE.txt') ; do printf "sha256 %s\n" "$(sha256sum $i)" ; done
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotocondensed/LICENSE.txt
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanscondensed/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/walterturncoat/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/fontdinerswanky/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/aclonica/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/sunshiney/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/ultra/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/unkempt/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/slackey/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/satisfy/LICENSE.txt
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensans/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/montez/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/kranky/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/arimo/LICENSE.txt
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanshebrew/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/tinos/LICENSE.txt
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanshebrewcondensed/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/justanotherhand/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotoslab/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/homemadeapple/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/craftygirls/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/crushed/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotomono/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/maidenorange/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/roboto/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rochester/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rocksalt/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/creepstercaps/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/nokora/LICENSE.txt
-sha256 3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/mountainsofchristmas/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/cousine/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/syncopate/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/specialelite/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/luckiestguy/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rancho/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/smokum/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/redressed/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/irishgrover/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/comingsoon/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/cherrycreamsoda/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/schoolbell/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/yellowtail/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/calligraffitti/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/permanentmarker/LICENSE.txt
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/chewy/LICENSE.txt
-sha256 0fc8e6675568c02aac6b41dd3cccaf2264fc5969601effe68e09b26635879b2c  ofl/ranchers/OFL.txt
-sha256 ff72e4d89860e64ee38ccf8a5a7e9dc085d5e36115b096a6c7f8bc988e9bec61  ofl/kumarone/OFL.txt
-sha256 643c63caf03855ae29be68035d8888e95eadc767a1d92f163d686da1b0a1cd3c  ofl/cantarell/OFL.txt
-sha256 1d242ab6fbb2dfbba2e7119b00a6328bc59cb2faf7299b844e9b92a2f12c0d8b  ofl/adventpro/OFL.txt
-sha256 01af2625d6247ecd2430d1d1603c579f85989d43b2d9129e08e0ac0df8909918  ofl/tienne/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhaina/OFL.txt
-sha256 f3bc8767749fc133d9b35e84ca024b82f1ac4d1b38deca0adcf8300892303022  ofl/faustina/OFL.txt
-sha256 69c34ca1873308c667ddde663cbf59c0d1cf14cbb945ad010f71d21264249e24  ofl/aubrey/OFL.txt
-sha256 4febcc8d6e539db3e0c652da87bc8704f6d48e71e07f8ddb0974094a3de8da81  ofl/flavors/OFL.txt
-sha256 d24ff874133ecd133e55d7c4070d2edab14d3933477c2bccb3a0d8d1cc9c33bf  ofl/muktavaani/OFL.txt
-sha256 ab5499b975c2dc82f533c6f13c5fca589df4d57c7c400db5f6ca8565ad9c2fd3  ofl/butchermancaps/OFL.txt
-sha256 6a28d4d5d8b4d1ea89ace5a047ac6e0de182acdb8bfa22897bf7702102094f69  ofl/shadowsintolighttwo/OFL.txt
-sha256 7a1d085067cd589026b256dd85af1eaa1087fa0f3d468192724c5138cc14d894  ofl/copse/OFL.txt
-sha256 fd17f80dc48ff767d91d0dd9f821eebfd8b73ee82f55537a9052b6b0107622c8  ofl/voces/OFL.txt
-sha256 186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlowsemicondensed/OFL.txt
-sha256 4aa1da66597f4c5cfde67790992ee55926ef6aaa87b9a10d529ab35e8b91070c  ofl/asapcondensed/OFL.txt
-sha256 301f77908df2b00141b4dcea50cc1a586c3afcee78843bd811088e8263623f9d  ofl/amaticsc/OFL.txt
-sha256 6b6c6721a30480a323cf33acf6a7703dfce46b846827a65f8ee96230060e3c3e  ofl/homenaje/OFL.txt
-sha256 393d494f9ebb5db6a3552ffa03a4c6f3746c22808b40d011b391681da55ca3f6  ofl/kellyslab/OFL.txt
-sha256 ca19ac21c7656f493189093eca52b4239fcc5eacc15ab2e3d67cfbfc0e6e443b  ofl/sirinstencil/OFL.txt
-sha256 980c2b058d331f3c5ca4a1223e549511b71630e4f4a5533879d436d583cb5665  ofl/arbutus/OFL.txt
-sha256 2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsans/OFL.txt
-sha256 7527e73a61f742a0dd050ab2fc7333de71ac7886023c100bca66a0a93b37498e  ofl/headlandone/OFL.txt
-sha256 39b26527bf9ed27b4c85b86341eceea0579f3550bcf448cf06345eaadf947ec9  ofl/rugeboogie/OFL.txt
-sha256 2ac164969308ac200eefc516151934701044f0db5695ae2acc15df2a8d22e5cb  ofl/anaheim/OFL.txt
-sha256 88d3abd47414e7912d0d2eb44ca89e0b1bd7c43cc2ebe58a8a75281ad75a0f60  ofl/stardosstencil/OFL.txt
-sha256 01003114b77326df223f291c48cdf12e95f6a5937437f164347919f2bbde12d4  ofl/josefinslab/OFL.txt
-sha256 83aa5adca2418f091b732a19cc7c30dcb5c00c217051a58f34f5eecb19be0cd3  ofl/average/OFL.txt
-sha256 585c6d2da8bcd8ffa651e0016f2e992a6891b625143a46a1dacf00699a817d9a  ofl/monoton/OFL.txt
-sha256 96e65d9c227a972e38035b849bba1e8b7879eecbb52f278be1e71dd481187f02  ofl/domine/OFL.txt
-sha256 d1bf0acea511ad1f4de53e942cffb8ab0e67c03c6203d6f390d71105d52c33f0  ofl/missfajardose/OFL.txt
-sha256 131d19126a0e7ddd25540fd6bee219cebbc8aee7e8374882998ee6c2f4ff6cf4  ofl/mergeone/OFL.txt
-sha256 042a570b306ab893c6168be7e6e79bbceae46097141357ad0af7ef8bb179ed7b  ofl/goblinone/OFL.txt
-sha256 91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexserif/OFL.txt
-sha256 bc80ea18223ea0db2ed73ab5bfd0cd601906a2b7a163183c6c4ea333be309ce4  ofl/baumans/OFL.txt
-sha256 5f5dbf452c1657370d9280b50d647212a53c80acae6d78e0b5e8c2b26dc62b09  ofl/puritan/OFL.txt
-sha256 90bd333a5cf0ed09264fc3e559d44979373f6c3d983b0f65cc46e952b4eb61f0  ofl/contrailone/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/taviraj/OFL.txt
-sha256 62fab0ba1d5593782cbf048da193f4b1edc16b817577a99d707827513ad80e9a  ofl/overlock/OFL.txt
-sha256 75798d56e448ba4d2aec3ef5f3c2d805d9c6fe2ba688cd3d7162b2dd31e9cf48  ofl/textmeone/OFL.txt
-sha256 eef925ad6afcbba33f7989f5ad826fd68d50cc1ab4d679c52927c8afd40bddf0  ofl/sedansc/OFL.txt
-sha256 466aaa3bbd245e4c91c4e82c0828efe9fcfd913f5b020d75f0918516c2540fa8  ofl/spicyrice/OFL.txt
-sha256 88ac81fcd30e64f6e6b91b61b159c9b700bb3dd59012b72ec61629abcfc7fba1  ofl/medulaone/OFL.txt
-sha256 1d567f7c5f579d9031ae5edfb0108b4681bdd2e036249b228cc2843d3f052a0f  ofl/redactedscript/OFL.txt
-sha256 ce78cc8de3f6edd2738e8c02f2079db7086c9a74314baa5854675f83c33954ff  ofl/kenia/OFL.txt
-sha256 76af3e9e5d8768b17647813a443fcf5df3eb3ced017ee285796625e714d5ea2c  ofl/ruslandisplay/OFL.txt
-sha256 6e54fc004ebeb61322ecab1d86334ebf69e7051632d48eca489beee505d70762  ofl/hermeneusone/OFL.txt
-sha256 8586a7e75681c7297af4cc0641eb2b29e882c5187fe189a1160eceb4e95d4163  ofl/fenix/OFL.txt
-sha256 d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/deliusunicase/OFL.txt
-sha256 197c3f48cff4df3d768230e0bbdbc4305d8b8b9041ea6fb5e00872af66adc5ae  ofl/novamono/OFL.txt
-sha256 08fba9df5c9890f3ab00ee63f63e005ad93a23746f7484f5fe9501a1ad32730e  ofl/allerta/OFL.txt
-sha256 af88d31020bb48a1f78f4384249814d04a44d22feeede2ff4ae79fbb4fcf74da  ofl/rammettoone/OFL.txt
-sha256 397e83b05703a4240be51e2c3a2be1d0d7693d7a2d8b1ff367c26a2b9afc013e  ofl/singleday/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/cedarvillecursive/OFL.txt
-sha256 d416bc9437e1d7d8aba0613395ee49c95ce72d680672e910c6205b545cfcbad8  ofl/cherryswash/OFL.txt
-sha256 513346ac60af1dde9d4a7bcfad3f39909d5697373a8aa1a6ee4376e6d22d3cdf  ofl/niramit/OFL.txt
-sha256 0b1bada9befa95a40d55830fe83fc7f8064e245fea33bdf0f96f57848f3866fa  ofl/coda/OFL.txt
-sha256 2a7b0a41ef401e4e0e955280b07c0a2698932d56aad3181089bdbbaad5760491  ofl/habibi/OFL.txt
-sha256 2d62278530348951887211d79d1dba04acebd6ed3b1c413f6154702efea3ea62  ofl/iceberg/OFL.txt
-sha256 a20db45220b6c4dc9776f24c77dc9ec7a98977d8b3c65b03aabe66b2d08e0791  ofl/cabincondensed/OFL.txt
-sha256 fc1e501d419d84a8f1a800adae092045002d7141241f498237611dbb8ea763d7  ofl/stintultracondensed/OFL.txt
-sha256 9a51726e5f247cb1f07bb8f49c163bc3e9ddee5f367bb5a1871d09b854ed1b7c  ofl/basic/OFL.txt
-sha256 ce0023bc03e1428feb5abfaa939b601d2d827ee5a6c84a2657993a7b16c5290a  ofl/diplomatasc/OFL.txt
-sha256 e30f893523e50ebbe07acd783ae29c7d604e6208cae7646d993e8528ce13e35a  ofl/federo/OFL.txt
-sha256 9d96f445b6e9c701428811d0177f894874f8d6f07ecc30d568c506542368f3ff  ofl/sharetechmono/OFL.txt
-sha256 46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiasanslibre/OFL.txt
-sha256 5951473ab31533bfe1452bbcece47f237a5546c7e7d45ff1aec0289619623294  ofl/fugazone/OFL.txt
-sha256 aa5d677391db4e54ad324b6888792e533c5d800de7ab713302a2fc8bff2f4f6e  ofl/miltonian/OFL.txt
-sha256 e0cde1a4993ed689d463d5e2401f4a60c54cc48a14253ab0f8012d722c417038  ofl/mavenpro/OFL.txt
-sha256 c1eed37b6d213df4edf8f92ec7d1e972f751abd68ecd649b4f0b8e5d8e8561f6  ofl/yrsa/OFL.txt
-sha256 5bbeae56b9db61a9bf85b64d5ed9a74cfcf9ee3e9b005bc2906859ddecd5eaa1  ofl/esteban/OFL.txt
-sha256 7b826efb1b74a50b1c1aef0a1ba4530925b993ceadc3016d1d787c68a61649dd  ofl/tenorsans/OFL.txt
-sha256 28c6d2887c3dfa42488c5418c6c16ead580d33ff0afe60c05159689201f9ec63  ofl/jollylodger/OFL.txt
-sha256 ce0023bc03e1428feb5abfaa939b601d2d827ee5a6c84a2657993a7b16c5290a  ofl/diplomata/OFL.txt
-sha256 8f2e5a9b52cf355023104413827e17dd7126c5a3656492d45eaa1ceb270aa4f1  ofl/yantramanav/OFL.txt
-sha256 fe079cdbbad0f6520eb0a8235bce65b21596dd0c4c5a2694b3325cc87313b618  ofl/shortstack/OFL.txt
-sha256 018d17b5e04c0a217a21979fa6b6d77bd5a143a5f06ea2ea102e427abd1ebfa2  ofl/tradewinds/OFL.txt
-sha256 31c59bcdd538c113ef5c048f56827439facb12b7e5cfd158b04c83727edc453b  ofl/salsa/OFL.txt
-sha256 eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumpenscript/OFL.txt
-sha256 ddf311c28ddf5a5ad9747649837346b67bed9d356789c3072bb27dbce49e514d  ofl/ptserifcaption/OFL.txt
-sha256 c867d1a613bebc4932cf28c060fefb3bcfba3be56ed498b873c79f4eb786af1d  ofl/librebaskerville/OFL.txt
-sha256 694282197de3d750a43689dc64a8116cd19578cd516e7b2490c7b5362c064dbe  ofl/kameron/OFL.txt
-sha256 cb30d3086a8b3ce0b9e3690bf48d6620402b61160bc658076f95180ccd9e9dae  ofl/sourcecodepro/OFL.txt
-sha256 a40c3a6d0c968d3a10b17a2614606de6f20178deccc2447305f31fb106a57fb0  ofl/fresca/OFL.txt
-sha256 5d3457831b42632d958fe1a14a09706d8acb006486a5ca5b2b419cd61cb22e32  ofl/chelaone/OFL.txt
-sha256 6b53fb03a50914cc382f4d025ee595c17c43f24ae870f840bc51969d3e316c7e  ofl/limelight/OFL.txt
-sha256 574430e571a6928624f4bdf044420f7547a26309b7ebf6962296d33294e0a1e0  ofl/combo/OFL.txt
-sha256 fd20b82eb12d16ec31a58fc44f7e6c533b14b425b569d83f616a1f7a9a401e75  ofl/gochihand/OFL.txt
-sha256 0e74984817cdd51dbfbd8309022aa75f733e80dff0cb1d26ad2157e90446ba97  ofl/enriqueta/OFL.txt
-sha256 ddf311c28ddf5a5ad9747649837346b67bed9d356789c3072bb27dbce49e514d  ofl/ptserif/OFL.txt
-sha256 4e69611ba5017f1fde74c31d342f5c85604814b1b45387b9ab46205996dec38e  ofl/astloch/OFL.txt
-sha256 013e33b6b2919fd0ffbdde6080a1c0f4521689fdce0f4876a59cf49ff8ae31c0  ofl/geostarfill/OFL.txt
-sha256 14b3fbd06078a869cf2ba96e6dacb852d373703c86ca7ad54a4cdd6e20fbab19  ofl/knewave/OFL.txt
-sha256 a8103c045a88bf9b28dcd7eb60a6662008f49afc0f3721bc46aaf761fc0409e7  ofl/englebert/OFL.txt
-sha256 bd22e766af8f8e58eb520cb4fa73538826d04f7371b45e82295d22d1e32a4e58  ofl/gidugu/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/justmeagaindownhere/OFL.txt
-sha256 5fba78215eb4e42aed6cb0b5c5df52e0f71246281a866cd4493dfcfcbcab9518  ofl/playball/OFL.txt
-sha256 e75230ee246a04912366cd8d759d081200d80fb0756766c96dd52f73e8b40bed  ofl/romanesco/OFL.txt
-sha256 39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/gamjaflower/OFL.txt
-sha256 244ca4ef7b106d8c660e9a00cecf5d581b6a222f447d7d59a8f61711b2ad3400  ofl/uncialantiqua/OFL.txt
-sha256 36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/didactgothic/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/giveyouglory/OFL.txt
-sha256 638774cdf8233b5ddaf9ebee1821e9de1d5d59c335d8ee3ba0b47fb17833b502  ofl/glegoo/OFL.txt
-sha256 842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsan/OFL.txt
-sha256 a10a07aaa150c147fa3cb22e845013f38e6c2b45fe5ba32a74ed1be9d4c417ae  ofl/odormeanchey/OFL.txt
-sha256 a74380bba78a364ec70b3a5fb6a1161b83cb05cc3e75a0910afbd1b5aff4f9c8  ofl/jaldi/OFL.txt
-sha256 9b8405bf5f503f92401fc990f372b34d469670ab60041d5298d1015d3d0b45f8  ofl/thabit/OFL.txt
-sha256 7c05152b2380228795cb474819744653fb03ddbfe5990b912ec7d9a41387230d  ofl/asap/OFL.txt
-sha256 ca9fe3a0e10bbb082f83ecdc07f5f04845c4bd689c46456da3e6bae23e11aae2  ofl/inder/OFL.txt
-sha256 5b158abb3406e69b7408b562b7199f6ff55a41ea56e260b87176d693b0095e47  ofl/piedra/OFL.txt
-sha256 b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendradisplay/OFL.txt
-sha256 87b7d831a81fe8b37e7e6c672937493f710ff81883eee3adec7b5423297efd16  ofl/sharetech/OFL.txt
-sha256 4ec46c3e4469afa19f0156bac6917472974f9c85c189f9220cf8735d3e810401  ofl/kristi/OFL.txt
-sha256 93f60741563b4f51f2fcdb207fde72b2b23292a47022c729aecd998b360d8038  ofl/bilbo/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindcolombo/OFL.txt
-sha256 afc1b710d644c1262e1765d2401abcf93a545a4cb051955e2243fbabb8164e25  ofl/carroisgothicsc/OFL.txt
-sha256 930fed5b06a415736dc3b4e5f4f01585523b672717564bf677f93966bcd57636  ofl/lustria/OFL.txt
-sha256 9a536e5a3b55c2605b0a553eed383cd3efa42ba48dc45cc6f0635b3c53ee791e  ofl/warnes/OFL.txt
-sha256 879ec56fcc9a961937fd24d542b3b7b3f2b8cb3236b7351e62d16719e25de14c  ofl/griffy/OFL.txt
-sha256 29cca754098468057880970c604e55c4e2bcb8479742e4130c94f2ddc0363f9c  ofl/sixcaps/OFL.txt
-sha256 67261c7ceb3e627da5c94d6617dac6da29bf36b910bee304a7680ad62e2c8b46  ofl/changaone/OFL.txt
-sha256 327bac41d89cf9f32e0efe353228018e1661cff458a5d4905714958514df7bd5  ofl/lalezar/OFL.txt
-sha256 525411e604e7a1d85a4cd42641869f94388f04a6ed77829d6c4edd7fd740ceab  ofl/ramaraja/OFL.txt
-sha256 3d08baba63f1f2427fd96dee8da30b1ef6c1421b3be0e1f07cc2a78abb27c91d  ofl/seaweedscript/OFL.txt
-sha256 4c0a1150a363b42bd8681ff4a00315ac49510a944c4c9978237ff8b90a8920a5  ofl/grandhotel/OFL.txt
-sha256 bc4c7eb365ea342b1a027fb8417fb0152f5d482a2e31c012fbfa29b668827b04  ofl/cutivemono/OFL.txt
-sha256 1818771d183d203703c4b134f028527b535810e2a0666c8fe2785354ddbef686  ofl/battambang/OFL.txt
-sha256 b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendra/OFL.txt
-sha256 9e0d3db586ba0abf5ca398683809dacdf4c81b2960f592bd085fbf206a67ddb0  ofl/sansitaone/OFL.txt
-sha256 fb1dbf3725bbdd389b2c569e0eed5091d8d10eed2833ec7efacfc3542e408615  ofl/scheherazade/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorant/OFL.txt
-sha256 156ea6985861158c7dea63ecaac4c78ab0ed737d168ddffc3e34c687985a033b  ofl/sansation/OFL.txt
-sha256 a9b3e7e1cf5735dc49d802b88b1858a2a50307ba2a877ddf3f0b27d8b1d0abc5  ofl/blackandwhitepicture/OFL.txt
-sha256 5fe7f3c9410c29534ddd9dfaf64d3994ed4236096d0d543ae69eacc3b25632b1  ofl/bitter/OFL.txt
-sha256 f6f60d5d4cf4f4b1fc4e41353c897a2f5a16e6396c0cd8fa8bdfd2f4586a9a68  ofl/alegreya/OFL.txt
-sha256 e88691a5e0a8a3f788f31db959701ec90a1d5e7505f1cc53c5663180a7d23c81  ofl/lohitbengali/OFL.txt
-sha256 ac55580be2df22a06d29a47501e2ae11e1d399620f5a779e17a66f016ba6d5ff  ofl/portersansblock/OFL.txt
-sha256 27d9af34210253e7ca1251fbace86c6f65b40031d6ce1a75493a1b2093631298  ofl/vt323/OFL.txt
-sha256 9452ef55386e77bd284ca466587d72802337621d7f10aa700e449753883b3397  ofl/trocchi/OFL.txt
-sha256 a9b3e7e1cf5735dc49d802b88b1858a2a50307ba2a877ddf3f0b27d8b1d0abc5  ofl/stylish/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindkochi/OFL.txt
-sha256 3173acd82f8c6159b5b1037b539fcbd4edff68e65c2ea8b9412b5a5ca97b08ff  ofl/archivoblack/OFL.txt
-sha256 c832a4230a713d080aa2f2544d9a298ed911f689b2c48f7f276a0196b16d2b8a  ofl/cookie/OFL.txt
-sha256 ae28423a5e63cb65e651ccf62c9091b322fff1d2d4e87ad9f98b1096c2e7abb5  ofl/metrophobic/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindsiliguri/OFL.txt
-sha256 8c22fb3866eaebd77a2cb8e8ecbb095381ff32300db57758326fef35a26132f5  ofl/ranga/OFL.txt
-sha256 d2875ded3e44e9ae53ea2b35e825dafffa19e82c5d14addb9f1150fcd7a3463d  ofl/mina/OFL.txt
-sha256 8242e7737bce317f7a7f2b887ac87f5bb21305ab96bee92aadc3febac16c35bf  ofl/voltaire/OFL.txt
-sha256 fca01a37b10879d7685c7d03fc5a04086b15cdb2cb4f870cb687aa5a9a0a1361  ofl/jimnightshade/OFL.txt
-sha256 2492bb8645caaf622bdc3e880cdc9b069921e7341346d7b193666c866a1935d0  ofl/condiment/OFL.txt
-sha256 e6ac721b16f309c89fb443680afda427ea34968bad190a80edf281d01d65fa99  ofl/andadasc/OFL.txt
-sha256 1e5d6660366ddcfca4f2fc10e2acfba9fa4d97d40aec80d7dbfd41d730a420ae  ofl/cinzeldecorative/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/coveredbyyourgrace/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindvadodara/OFL.txt
-sha256 5c36e7ec460b285185ea23847aa1f508708d9ce15d5c055279defd022972f836  ofl/rakkas/OFL.txt
-sha256 0b7eae990329ac175a2e1c329060b3a4d6876e4e0cd7e5235511578352f7b191  ofl/biorhyme/OFL.txt
-sha256 c54957d55e7c9e66c28e474cd39de75dc044e8f69056788cae44eb78841ceef1  ofl/montserratsubrayada/OFL.txt
-sha256 fccf4916b5f84ef5f88d93fec464421aaf4121d11d4be8d74ee2d032f7661d6c  ofl/padauk/OFL.txt
-sha256 9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/prociono/OFL.txt
-sha256 0c3f4763f49c2cd37757a2856ad470aec6a416981ac6d6e3f900c1128be39de7  ofl/elsie/OFL.txt
-sha256 0d5fa0cce86012de872273700eef4fd162459e7c24a6a314911380627391071b  ofl/bigshotone/OFL.txt
-sha256 ca64dee162bf239c7b92d854d388bcd30552edc3ae1ef5e31714acda34c988db  ofl/jomhuria/OFL.txt
-sha256 bd77eae571de83ba3884c74c7983e8ac5cdf858badc36906179346dcd7e82454  ofl/gentiumbookbasic/OFL.txt
-sha256 2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeehairline/OFL.txt
-sha256 9c56b4e2e4e922cc37e19e1a9e2e1128beaa17a812e1b67c8ac371b0fb57ae03  ofl/kopubbatang/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/tillana/OFL.txt
-sha256 486c4d5b9baf0d0ba5546ef3c43fcfe22c062299ab6948045a43efffe4b0f74b  ofl/italiana/OFL.txt
-sha256 4539710406c656519f8ddc789056a7cd6f4fe66b44cc2f52ebca6e251bb26e13  ofl/imprima/OFL.txt
-sha256 7f55affd2bce8ed9be13297ba8df1a4a7e9835c2a006126dc2a1eb4ce75a7943  ofl/muli/OFL.txt
-sha256 867b506cb023eae20c1accde77b2e0abf7d8a9e2620da8dbebac9f7b1117ca0b  ofl/cantoraone/OFL.txt
-sha256 aa72b0185d828cb2fafa62a154e84bd3e20c88ada30326089bb20542b6363aaa  ofl/manuale/OFL.txt
-sha256 4664e83780a263c53dbab95d3590a5a9db914aeb9a3c78f7e7ad451f9151c998  ofl/spacemono/OFL.txt
-sha256 fc59ca3cd3bcb47bd4df597519111ec130c25cabcc57a8808dd2d243cdcec6ae  ofl/oldenburg/OFL.txt
-sha256 43c372f43d145c22e654781860506a75cb85b086dc76028a62a28a446506d253  ofl/italianno/OFL.txt
-sha256 a7fe1f3d23034092b015aaeb53d2ecbc9e592be96b10bdfbcf8700ec6a6ffc97  ofl/fascinateinline/OFL.txt
-sha256 d13a278247ce39695f5ea6b721103faa668083022c5280b78c6392263e473929  ofl/bonbon/OFL.txt
-sha256 f0be7437bbb8b91ad4a4f7a5f3d0020368e494a803d892df03e8886d51f2db3a  ofl/candal/OFL.txt
-sha256 a68d8ec6bea7f277053ae93bf563d4b97c233f09f8e79f86ffe5db66f31fdddf  ofl/prozalibre/OFL.txt
-sha256 b00c646b7d04a6da1665a148815b8c589c1e05ed7e1febf7ccbd91758747cb03  ofl/quattrocentosans/OFL.txt
-sha256 a3deaae17ab9a15dc3c2778126aa6f80d41d567741853f84b16a9e1318ed799a  ofl/koulen/OFL.txt
-sha256 50f7b09af5ff677f611a96cdf5eb916307c59b29f2e8144942718cb432a9bf6f  ofl/margarine/OFL.txt
-sha256 72a22b6dd29b6b0cdcc98de30701b46532c9f7314ee095df3063d10775dd70c3  ofl/trochut/OFL.txt
-sha256 325e890b8b26fe0a683c3ba24c506d902bdd7034d9c47bd7fa2bb72b5433b9c9  ofl/shrikhand/OFL.txt
-sha256 62fab0ba1d5593782cbf048da193f4b1edc16b817577a99d707827513ad80e9a  ofl/overlocksc/OFL.txt
-sha256 d941aa56e280b4f204272c4b1add01a8ebc7af3e8e69ba8ba9118aa2a5306dde  ofl/berkshireswash/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantsc/OFL.txt
-sha256 36c285c5472c625901d4a13da7e31c5ea6126678d31d56cf95572c49f27c8950  ofl/passionone/OFL.txt
-sha256 fbc351e1b5428e4f45834647dc23a5f8aaa3e744e2f4117ca03c44f640b9a3a2  ofl/stintultraexpanded/OFL.txt
-sha256 021d5f1df697848da51620394659187be77cbe382ff2f896bc84ffb89c0c2d52  ofl/portlligatsans/OFL.txt
-sha256 85b700bfba1250a6f8bdf930cd7113faf3d8e9dc52cd89eb98c3ac8a038a4aa9  ofl/londrinasketch/OFL.txt
-sha256 c972795e48b096b6d4e3a947b0bb21c1baf1922a6e07ff9ada587c058f228740  ofl/coustard/OFL.txt
-sha256 eb4a7a082fb0e7dde0a8f975d33f02907ccbe40751c8115e790cf3679787d01c  ofl/strait/OFL.txt
-sha256 9b1cfccef4a7e19f90e2901f808f3aec4335d3cc81f978453ad0c8ded14447a0  ofl/novascript/OFL.txt
-sha256 43c89012c2b640187aae7e0c83d5ffa8381a0368c00e8426594358d44d3811e3  ofl/nunitosans/OFL.txt
-sha256 fdecdad755f4e5e95bee491c7521f31625dc08283562ea8579543c90430eb269  ofl/karlatamilinclined/OFL.txt
-sha256 5e80642a11aff2ead815949a8a929aff3fb7b9b6a24391406068a1b204dcc8ba  ofl/abeezee/OFL.txt
-sha256 bd77eae571de83ba3884c74c7983e8ac5cdf858badc36906179346dcd7e82454  ofl/gentiumbasic/OFL.txt
-sha256 f2fcbde4b8968400d661e7dcc23052b1885815c8e3b45323b26cbb833352f5de  ofl/timmana/OFL.txt
-sha256 c8af073a60e30b55ef5d0e4f80cea168e06dd65bdee7ec18c1ea8de8f7228780  ofl/strong/OFL.txt
-sha256 2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeinline/OFL.txt
-sha256 013e33b6b2919fd0ffbdde6080a1c0f4521689fdce0f4876a59cf49ff8ae31c0  ofl/geostar/OFL.txt
-sha256 e55c615ed00ce0054bd356041a41e5942b4a8cadceac1e32696ba2ef5f06f748  ofl/andika/OFL.txt
-sha256 4705fc9bceb299b2a951d23c321d31f3679871bb99ceadb978907704d211f4f2  ofl/pacifico/OFL.txt
-sha256 2887c5bb38abbde9ccc608c4dcc4b0dba0fefc0c74eec011033bcfbd3ffcb235  ofl/jacquesfrancois/OFL.txt
-sha256 99d67fff016522688b8f913377f8ae9f6da6ffeae42cf67c0e5e87cfb0928d33  ofl/unna/OFL.txt
-sha256 bba4a13f03d0fd5b476cc148feda6895dd8d65f34b2107ba9d010ad9539d6c0a  ofl/faunaone/OFL.txt
-sha256 842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulhangang/OFL.txt
-sha256 58bbdbe5c48dd1d7cfd658425a455c29811181873d3a46a4932c29e5b0ec16e6  ofl/euphoriascript/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/laila/OFL.txt
-sha256 17b90cece30db64934b7299fd76b033a3774c8a990e78badc74c59a5be8e0727  ofl/cairo/OFL.txt
-sha256 5f8ff4a3f951c104e99245bdb952be08c73369222048bbf19fa3bf7170d10949  ofl/sanchez/OFL.txt
-sha256 8eb1c1019fe7fe6d0b6e7d7bbbba1d9cbdd969d8c5f26455708f6cfb8a77284c  ofl/nanummyeongjo/OFL.txt
-sha256 942d51cf079299e83e9dd7a9a37eb92260524e8d1d576b2f0b3f7ca207c53f8e  ofl/newrocker/OFL.txt
-sha256 117fa195cff980e3b10fd8e8e21658c6ec954b0886647970a03c9694d3553b69  ofl/galindo/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/athiti/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/annieuseyourtelescope/OFL.txt
-sha256 f2ab7e5c5c750fa03a8d8f64c72a089ed86fbd3dc172440fcc704b27816d5957  ofl/noticiatext/OFL.txt
-sha256 9a33b452a3107542c35fc5fcee80e4d8798c82aca071c2f6f58a0f8dc5ad61fe  ofl/cevicheone/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balootammudu/OFL.txt
-sha256 8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasansextracondensed/OFL.txt
-sha256 746b384383888d9325ed2fa9c40d2456b458aa190dd2b8c515ed4f02a1075bb7  ofl/magra/OFL.txt
-sha256 8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasanscondensed/OFL.txt
-sha256 fe9183a0b7c1ae626b14004cd533c89ec7c192aba017f81ab71ede910256abb2  ofl/abhayalibre/OFL.txt
-sha256 876db27db250a9b9c03fc2ef30a5efe1f37c2ed2686d368c3779583bdf746912  ofl/balthazar/OFL.txt
-sha256 4342add6f0f2261f8579f31c10a55938930559703eed18be4a33b74eb749d298  ofl/doppioone/OFL.txt
-sha256 d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/deliusswashcaps/OFL.txt
-sha256 16a8be6ac4b009ba1dd1e17cea48762f4915609ea5dca1303f716cf63998739d  ofl/adamina/OFL.txt
-sha256 1d567f7c5f579d9031ae5edfb0108b4681bdd2e036249b228cc2843d3f052a0f  ofl/redacted/OFL.txt
-sha256 866669fde730bf2785f44905ec162f05f2b8d9f6dcf366aca99360fedbfe502c  ofl/dancingscript/OFL.txt
-sha256 008445a4d53fbd71bff9cf733bdfd841a1b15fb58ef3473f7bab4c456e3b2930  ofl/ovo/OFL.txt
-sha256 b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendrasc/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellgreatprimersc/OFL.txt
-sha256 95d23e4559ea8c6a36aa04fab56e1dca0780f5d93734072d4501023296543102  ofl/archivo/OFL.txt
-sha256 3747fdcbfe4f51d6a2f101c35105bacde3715b3c32b34b6b03e5fb37983f89fc  ofl/quando/OFL.txt
-sha256 38a83f1f8b6efc3ab354b8b6eed22e8524dc71280844dc24811d95ae27b34952  ofl/khyay/OFL.txt
-sha256 b8fb5cd1bafb52e652c733fdb75ee20c763e97acb0398f6b4bbe1d8ada0c07e5  ofl/misssaintdelafield/OFL.txt
-sha256 a3b0977c5c25101d45054cf9199b9127b05fddc79d4da7dcf400821824e5a6d0  ofl/radley/OFL.txt
-sha256 41f82bb4d24b304f30f7136bc47abdd083782e4265c984160f5649d1e78ea49c  ofl/montserratalternates/OFL.txt
-sha256 7c05152b2380228795cb474819744653fb03ddbfe5990b912ec7d9a41387230d  ofl/asapvfbeta/OFL.txt
-sha256 d3909465d5838d9d1c72b975ff1ed4f410a85dccd43801be525bf2b2bde89f92  ofl/snippet/OFL.txt
-sha256 2ee5e8e47cd7d08f60bb9555f72b25912c9e81b13f5bc9a0551ddf943da6ca98  ofl/mukta/OFL.txt
-sha256 f323edc1e5a6d8fa16120aa15367cdfb15468474cc621f9bda1a2f73c5d08d73  ofl/sedgwickavedisplay/OFL.txt
-sha256 eef925ad6afcbba33f7989f5ad826fd68d50cc1ab4d679c52927c8afd40bddf0  ofl/sedan/OFL.txt
-sha256 4281c00ab5b8f672fc8d686f48cb886ffbe900c8c9ee22473ca7e72e7cef8fbe  ofl/wellfleet/OFL.txt
-sha256 8b89f3af5fd02216793ff3dfe9a04dc22dfe5c213422ae21558ff1da6a1e94dd  ofl/cabinvfbeta/OFL.txt
-sha256 4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laomuangdon/OFL.txt
-sha256 399b33eb38cdfc76b8665defa5f81d52e8193d630ad5858c893db6bc20031bc9  ofl/rye/OFL.txt
-sha256 aa5d677391db4e54ad324b6888792e533c5d800de7ab713302a2fc8bff2f4f6e  ofl/miltoniantattoo/OFL.txt
-sha256 8594350034ab1cb85a1946ef8852e69290255816c311450a66fed6eeda9d6292  ofl/anonymouspro/OFL.txt
-sha256 1e5d6660366ddcfca4f2fc10e2acfba9fa4d97d40aec80d7dbfd41d730a420ae  ofl/cinzel/OFL.txt
-sha256 351740da2d452b48193483f22f64918a6dfd64a7abe225c6187ad3f36e0d9cd8  ofl/postnobillsjaffna/OFL.txt
-sha256 64a73da7af818283168543e24bd214aded1bfec06f013bf9cebc20064a8560c5  ofl/elmessiri/OFL.txt
-sha256 4fece81b541808b40293b0cd3f5b1990274e1100e1c20455dc2987cd96639d3f  ofl/metamorphous/OFL.txt
-sha256 8d325681662a30f58f57c92ab656dcbc9679deb78a493e4c0eab75321b2df6c3  ofl/worksans/OFL.txt
-sha256 2887c5bb38abbde9ccc608c4dcc4b0dba0fefc0c74eec011033bcfbd3ffcb235  ofl/jacquesfrancoisshadow/OFL.txt
-sha256 aac8f0cda6159b7251d1034651bcb42e07611495bc8cd764c89d22f3123032f8  ofl/aladin/OFL.txt
-sha256 81d0973236b5b5709a80a217a330db36eabedf57bf4031de46b4660b69901234  ofl/leaguescript/OFL.txt
-sha256 5454dc5cf2f46a2005f42f13ee2a998c7d0afd7f556f32fda208c72b266f7adc  ofl/cambo/OFL.txt
-sha256 b2d4b0c773afce947728ab99fca43b242b7edb0da26fe29f60c7c2d5094ec23e  ofl/suwannaphum/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/labelleaurore/OFL.txt
-sha256 6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejumyeongjo/OFL.txt
-sha256 cbdf9d35f32a9a2f02fb23c8b89c115a5a8e45feaaa2266920c4594c83dd5ed4  ofl/tenaliramakrishna/OFL.txt
-sha256 95d23e4559ea8c6a36aa04fab56e1dca0780f5d93734072d4501023296543102  ofl/archivovfbeta/OFL.txt
-sha256 967d75b89eef1f8a0ba1f5ee7dfb13427621f9116c6e7878ca04da8c9aa8641b  ofl/mrssheppards/OFL.txt
-sha256 8af83da84dd4299842f871285a88049352ab301ffa1f233d2595b29506158635  ofl/blackopsone/OFL.txt
-sha256 548890e4083028f04e5feba04b6e00554654d840aab81c8664eb66c2216a571b  ofl/palanquin/OFL.txt
-sha256 c4cd9f38c3246ee6a68c264f017320dc1af09677d386166d8cda806d9a12e0d2  ofl/jockeyone/OFL.txt
-sha256 a36ab46c8b1a74a480a1c51d6a5af08b643e870c6d247f233bc97c97c8ad2098  ofl/tuffy/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/nothingyoucoulddo/OFL.txt
-sha256 b5c776129b160163c84620b35fd45dea45edf49789cda5a94c2290c230581e0b  ofl/scopeone/OFL.txt
-sha256 dd028a807788d5e22e9f8cc18f026cda23369954673658f2ecc7d30bdb364b89  ofl/sintony/OFL.txt
-sha256 8928e999ff156e35852ab41d7a906598a8285acd3bcd81dff67213a6cd98d43e  ofl/mallanna/OFL.txt
-sha256 473c5e3123102434d05c66a9fc8b19cf285a3bf71cd8a91a41acef44d1448e62  ofl/sevillana/OFL.txt
-sha256 22d1914919d3fe08b179dc31169fc743ca7eede7827b91a5d48c23c8cdc7cb81  ofl/anticslab/OFL.txt
-sha256 026610186158060ad351fb20cd1452def5d35b2531634c090ce8cd1d9e9aeaf2  ofl/michroma/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/shadowsintolight/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/architectsdaughter/OFL.txt
-sha256 61056041809e0ba18bf8b9d637a375ab1c725025428533d74d668d88b2cb8b89  ofl/simonetta/OFL.txt
-sha256 0a852a06f0256a6684662663ccb1d8e08d131abd1f70cf8d972a344cf31aa381  ofl/scada/OFL.txt
-sha256 f46c3ea04f38ea73c0731d73dfba3d7361d4b38970feb31a3558bd1b75e0656a  ofl/lobstertwo/OFL.txt
-sha256 f30a7045e4e21201182b2b9fc4e4b96189aaeaceb2c8e9b68d8bd3dc4e3c5a27  ofl/greatvibes/OFL.txt
-sha256 9bc1eb1c679510b32d2e3f5f4f3b47726b1657aa121494aa68ba0b124a3c3a53  ofl/ewert/OFL.txt
-sha256 1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode39/OFL.txt
-sha256 359671bf16c00cae69cb66d041296b2adc7a4becd73a463cb8c5e101d97c7986  ofl/arvo/OFL.txt
-sha256 c09e3b81d9cfeec46bc29a3374000e8ad013d694bdf24a288088491dd4cd5c69  ofl/creepster/OFL.txt
-sha256 29bd0cfd0fb2a45f9b057c834a057724bae1f63b525a8ac83d3e7525706d9f80  ofl/inconsolata/OFL.txt
-sha256 85814924eca98e1fa530901cc5167d0012aaf31122f9570d7e9755443dd9335b  ofl/siamreap/OFL.txt
-sha256 223fa23e8419ee762c662e0faf912dfcf386fa7093ac9ff690e380ce1993ba55  ofl/asar/OFL.txt
-sha256 a0369b1d5f654110f2fe101db56a02d02806f1e609ab233368bc573ec45050e5  ofl/butcherman/OFL.txt
-sha256 4f8b437578b20bff261adfe6c02f63bcf7dbb6a45ab37804b3547e5d5f44927b  ofl/nosifercaps/OFL.txt
-sha256 793891edf1f4f4f35b52fcc9706b03f779c7ea18ab8e9e441242d63ef0279488  ofl/autourone/OFL.txt
-sha256 842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulhangangcondensed/OFL.txt
-sha256 1c023b4aca0e441c55c45c86cdff57fa524a96778f291d9a29a4ad777b70e2e3  ofl/arbutusslab/OFL.txt
-sha256 de61c87e08286ad3215398340e9403125ab03c91b33bdf29de6d3e8a386d2d28  ofl/dangrek/OFL.txt
-sha256 53ad6a474f68ddfc3fe72449de3ede4d3f033b2f24b77833b1d56edf505486d2  ofl/sura/OFL.txt
-sha256 247edbf968c0a5b8defd6a9e420080a8bbca6ea002bfb326d12a472a6f95637b  ofl/cuprum/OFL.txt
-sha256 0623888cc2391c6c9853c04eafa7f687fef1a8328bbb848feab05d9e2a98764d  ofl/emilyscandy/OFL.txt
-sha256 1c43e70c49ef7a9b35fcb3758fec8ec5969ff1274c4834b4466b9014f3b9f55f  ofl/volkhov/OFL.txt
-sha256 cc31fe974951d56d542f33782d07b2d5577a4afdddba89744e6bd69bcbf3a853  ofl/karlatamilupright/OFL.txt
-sha256 cd354a6084383c50398fae709ebe3a5dd98b947c486c1fe9de5f89caf81f980c  ofl/snowburstone/OFL.txt
-sha256 8a59454b7f1cc0b1fa29805781769047e5c269aa629e3422c2d7fc04b89e5c1f  ofl/rosarivo/OFL.txt
-sha256 de71817dafdecfee21268b8c4f106146e1d00988c4fd6546b10445eb26b24cc0  ofl/expletussans/OFL.txt
-sha256 d1829ff3455bbf3b9d13dfb0a57758a863107c9108aab48558f26f37f1094180  ofl/firamono/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/rajdhani/OFL.txt
-sha256 26e4c39c4905bd7f1068b0bab008f5a4a9b945e2d7fda31e52719fc5aa9655bf  ofl/vibur/OFL.txt
-sha256 49f2a11271968a2ce019a43bf5401d1593652a18f27ea59037ff5e39856d2df7  ofl/changa/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/maitree/OFL.txt
-sha256 2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsanscaption/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindmadurai/OFL.txt
-sha256 f354ef1e7256644b320c5e1d9a07a819c2e2b930166003c96680894f9fba81be  ofl/mrssaintdelafield/OFL.txt
-sha256 5c289da4a19f054ace8e31a144a6a254601898cd7faf9eaa301141afda0adbbe  ofl/coiny/OFL.txt
-sha256 0886960207bb5bcf81a46ce663bab6c52a742dad80ee2cff5cbcda6f1df88568  ofl/rhodiumlibre/OFL.txt
-sha256 8f94e5901c371537043e0c762c827ce33963e7bd186fbea0abafc035ef7120a7  ofl/emblemaone/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/gloriahallelujah/OFL.txt
-sha256 24af1fb3ab8dfeddc83162b7f3b6c1104149b6c3022f1aa948ef4f8ff7e6bf7c  ofl/poetsenone/OFL.txt
-sha256 f3ee3eb20a9d565bee2bbc0d616de382a113327d7506565b2f3d3bee5f489375  ofl/bowlbyone/OFL.txt
-sha256 70f664de65e7bb62e1ac728f20a9bb28de7fdc18be594186137a9e15ce9dcee5  ofl/niconne/OFL.txt
-sha256 e604b133509815768e6ec4738bb04844ce9a23e80099d2b61e5d75ef46acbeb0  ofl/ruluko/OFL.txt
-sha256 42ad5a49e171bec80308a1c9e8e66b03e638b3ea65af7fafa6fc0e42f45e7626  ofl/suravaram/OFL.txt
-sha256 4fe81901e6f84cfce1145c715e931352a9a12aa7ac75cc193eb523c0cb0e5eb5  ofl/lohitdevanagari/OFL.txt
-sha256 2937c7789b0e4fdeda6eafe93164a2ab36e20386704c4cb6f87b1deb620ec0da  ofl/leckerlione/OFL.txt
-sha256 91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexmono/OFL.txt
-sha256 fce9f9e2fb268507a89fceea0b3eccc044f39fc3492968a04fd9e04df5ae95fa  ofl/sourcesanspro/OFL.txt
-sha256 e12a3e737fa75c0ee072d965b6185710f35e38a4f7a0793ebc66ba14a216109b  ofl/meiescript/OFL.txt
-sha256 d2f9c74aba2716333b0a3d283083f9fdc93b2e060c5ae094c79e97e8cba9d7e6  ofl/squadaone/OFL.txt
-sha256 5d6517d497bea6116ed35079b30374043f6d90b19c8d97fc4e5ec48520d1e08b  ofl/zcoolkuaile/OFL.txt
-sha256 f8a20490ee8ad3adb2205ea44b279b19099a3a1d6b62849e90b4db20a77deeb8  ofl/brunoace/OFL.txt
-sha256 75b2a5f39a53b4cf9286eb3d2cc1f895a8f3442680013c77124121bc347a6448  ofl/lemonada/OFL.txt
-sha256 715ba72697e14daa9b29a333545f69bde7c497b9f77d0a2a4c4a5a752d961801  ofl/marcellus/OFL.txt
-sha256 1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode128text/OFL.txt
-sha256 eba176d3ae86af6b41e9b744e4d18fb56e2a6ad671381bddb61fabb86b1d39c1  ofl/croissantone/OFL.txt
-sha256 12404fcefccc3cb964cb2406510ba679b30f7d7ae689db08df5b455ae24b3feb  ofl/paytoneone/OFL.txt
-sha256 e2a176ce310235bf281f1124454e21331390ae1b4c429a2d80ae642d333a5a7f  ofl/frankruhllibre/OFL.txt
-sha256 2d83a49d05906b5e23285168e72c0d019fc15e3ad110376f640feeeda34c27d1  ofl/hennypenny/OFL.txt
-sha256 d7d8074c2dd46804990c184e25849947ab76c5ac7607fbf3966543455769bb73  ofl/yeonsung/OFL.txt
-sha256 13831d02389d917d22fcfa6c79f98f8acbf61d230add0e73a4d4dc5f3bfb9e56  ofl/chakrapetch/OFL.txt
-sha256 c39e284759a441660d4c4d852c537e271d0fd5c301fe46d065a972b6ee144ba8  ofl/aksarabaligalang/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindmysuru/OFL.txt
-sha256 0da6a3e5b24a9fa04085c20a2a1d3101eeb1e0bff56a2291f407187e1b2adcf2  ofl/mrdafoe/OFL.txt
-sha256 a815f65bc72d90494b01842d3171f7cb0f9f935e023d9cc260904d221ef1064a  ofl/b612/OFL.txt
-sha256 e2f2dc7a667954c16a919acff5351e8ea89813d10f5a7504e1f4668fffbfa14b  ofl/barrio/OFL.txt
-sha256 8c495ddd455def58a45310376a747bb61bf86e4b071cc527b3618bccd3ef00fa  ofl/chauphilomeneone/OFL.txt
-sha256 b687f920fe20fe48d8f7709421e5deeb4becea295c80ce62aadcffc54132fa1b  ofl/stalinone/OFL.txt
-sha256 a90a8ebe28f3c2905a44557166010a3d219ffcce1703c3c3280ea8728d5e2ebd  ofl/heebo/OFL.txt
-sha256 c267a00c9476c78a2336d7b372b536885b8b24173a29ed53496f67a742c14961  ofl/alefhebrew/OFL.txt
-sha256 2cd51b11e821dad2fb7acc54d68bd9a139fc7a1207e17c432ba9ce49bba3d493  ofl/fasterone/OFL.txt
-sha256 ca424122f42a8d8442bc4cfd902f5f027ea67b5417705f5af1d1235927781720  ofl/amethysta/OFL.txt
-sha256 bb8fac04b8535d39fb9851c9d886248d25bc0c82000066c92dd577c3369f512b  ofl/chenla/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/lovedbytheking/OFL.txt
-sha256 53a9ce47085d9fef613c7ecb3730dc80d25962510bbea231b89564f58240f251  ofl/gaegu/OFL.txt
-sha256 9d96f445b6e9c701428811d0177f894874f8d6f07ecc30d568c506542368f3ff  ofl/share/OFL.txt
-sha256 9465823369fbe1ae0b5a3065021d53ef8c56e113e664229455dc80b237fa6a07  ofl/nobile/OFL.txt
-sha256 0dd8e32457e18621737b593ab0fac49905cd948a078ed0e64f4890df714a1dfb  ofl/amita/OFL.txt
-sha256 791936b10381b512512317572fb5eee91bf503344d52c37335e402fc1cf19992  ofl/reemkufi/OFL.txt
-sha256 898a9cf80636e86d6b6009b96795fda29e431ee701c28c36f274a7e8a7d8246b  ofl/rubik/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloothambi/OFL.txt
-sha256 382232d1add5623ba5b06394afa071f4eeecccb6d2b2bd02cfecff4a8a45065a  ofl/fondamento/OFL.txt
-sha256 0c3f4763f49c2cd37757a2856ad470aec6a416981ac6d6e3f900c1128be39de7  ofl/elsieswashcaps/OFL.txt
-sha256 d849309d514833fe3d7a610e10f6cd5d99b4f9552bfa304969acbf89c66e4422  ofl/smythe/OFL.txt
-sha256 53f9c99fa3d47f7d632a42ee7bab4a834a60a744f6026d676c3a223cef2b2ef3  ofl/vollkorn/OFL.txt
-sha256 a1077580b649c7b0e05ea0e9369d48687b4ab1c585573bf86b0dcce7dde177c0  ofl/junge/OFL.txt
-sha256 a9b40759b5821a0c2ad07cbd2c2a61dca4b3e222e6370a7d5bfb6b373bf4fb10  ofl/sunflower/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindguntur/OFL.txt
-sha256 84b11cc0aac8fdb93af94872bc4b8f015caabf4919db63ab7f916ccff8e52f56  ofl/josefinsans/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/dawningofanewday/OFL.txt
-sha256 f27cbf1055db7b9dd80bce5cd12b462f2d9ed7313d84dd8bfef1ddd2b61bdfc5  ofl/chicle/OFL.txt
-sha256 aba8997e16b1e3888c6e855ba883c70d96bd4375bff8cb9c7ce0f097200f74b8  ofl/abrilfatface/OFL.txt
-sha256 8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasans/OFL.txt
-sha256 d484e0dce424a9e360adabb568b6773db5f1566df71ce3e9dcd66a6cc2c38d33  ofl/ericaone/OFL.txt
-sha256 1b3b78123c94dcbc9fd4ec174317336c8c93423da62dc946b8852553cb13ddee  ofl/economica/OFL.txt
-sha256 74584d937293a9cacdcd2eb05851b71aa1527901c18b87961d2f877c77a1b486  ofl/kanit/OFL.txt
-sha256 a6a74417db7c37f69495da556a3eb86a22a784ffb0131e3e0a5a47ce8d7fa5fb  ofl/shanti/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldoublepicasc/OFL.txt
-sha256 963f283b5410c7df62067a35cd7def0802c583a880e7cd7e326832ec3985ec87  ofl/spectral/OFL.txt
-sha256 11bdf9c7abd81f46a88b0b017d78a0e51f451e9dc0c2272813aa9f456ee886ca  ofl/kiteone/OFL.txt
-sha256 6827fa45930d5847fca5b3d3898b3d87a229fba772a5b6c5bc33bf73ec83478d  ofl/khmer/OFL.txt
-sha256 5ae0cfa62a70251d9a2c3c5430ed3bafa480005f23e4b9525488f2318e5c10ca  ofl/mrbedfort/OFL.txt
-sha256 34b8afbcab7508bea23847288332a8c05a507364ca6f0c8756ce560d7d59d506  ofl/mada/OFL.txt
-sha256 b67eed9578defb59cc4ff4b58428fb816786e499e84cdeafca54723b055c169e  ofl/viga/OFL.txt
-sha256 afc1cda4eedcfe27c8cf30fe3e9879587cb43cc2882d4cb91dd3e3fc9eecd0bf  ofl/farsan/OFL.txt
-sha256 cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanscondensed/OFL.txt
-sha256 9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/lindenhill/OFL.txt
-sha256 a89ac8075be60f2beba79bed3fa253415a373dbdc3bb108b23f4854d0dd495b8  ofl/pathwaygothicone/OFL.txt
-sha256 4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindjalandhar/OFL.txt
-sha256 f22a2beea88d631a620b15683fd03e79f13ad3297ad97fa5e42283c0b1a3a038  ofl/marckscript/OFL.txt
-sha256 faf47a1ceab38b07205b9d58fbbf9ac39772ea47cc731aca7816276da7226a22  ofl/terminaldosis/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellgreatprimer/OFL.txt
-sha256 d2f87f90d108a947f98c030d9d8e4bf27e761ce83f222453b9a7230c5fb309e1  ofl/novaflat/OFL.txt
-sha256 2da0fa5707f1fab1c802969b098fd1b92ca0b3b233a80e27fca416647c064dfc  ofl/exo/OFL.txt
-sha256 f9e5dfcdb2947c0db70465668706b0617cd052b6f86e582dff8741d9e5cded0a  ofl/yinmar/OFL.txt
-sha256 bcb0bda74430ccc281a616a81d0a287fed5a423815b00b222e0b7f603f85b26f  ofl/caesardressing/OFL.txt
-sha256 a94cfd8d1f5c33f9a7506def359b907f3313f7008bb57fc893985963cd342f8f  ofl/arsenal/OFL.txt
-sha256 52caec7d90533523fa7da64e95faf90ea32a663ce21847a39234b61e18d25044  ofl/bokor/OFL.txt
-sha256 ef0bdccd20de76d517fb3939161d05ecd5808382fb8fa82cde5fcdb3adcb8029  ofl/engagement/OFL.txt
-sha256 0d75673e4c98de3e11337dbd90b05d0232edfcade5c1c02fbc0118c85aea25da  ofl/macondo/OFL.txt
-sha256 9cd20277e2c89d47e3997435e3a16539d20173d850fbb42474990f71642e473e  ofl/matesc/OFL.txt
-sha256 a7ba785ad99b6eae0444ab89910e512d4af9865937fddbcb5c72c4f59f55d6ad  ofl/merriweather/OFL.txt
-sha256 010cb216e8f3fbb2836fa3f38787a412b749352de546797f57c03c3bcfe46b1f  ofl/nunito/OFL.txt
-sha256 91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexsans/OFL.txt
-sha256 cb8bbf7a86eefa8c146f24ae5be74fffa887ba83719ab3c87036be8e3d0191e2  ofl/montaga/OFL.txt
-sha256 1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode128/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/overtherainbow/OFL.txt
-sha256 3621f156cc7a26e0a9cb413332e0bb35a0e76b36dbfe0b1c885b565a7bf3051e  ofl/drsugiyama/OFL.txt
-sha256 fbb941b371c6348ee2572ce8c78fb66128a61885f960dec1906c4e44ca4b4d3c  ofl/reeniebeanie/OFL.txt
-sha256 9e19c0d2e7e7adcbe9dfd0749e34dda41e7e356e0f2cc082d61d2fc9b6e0cef7  ofl/gfsdidot/OFL.txt
-sha256 812fc4af0c63d31e0e81cc153af74e397407b0630e918b8b965bcbb192bc0656  ofl/artifika/OFL.txt
-sha256 e8ad3f3de5baeff6bac6e711d8c406e0a6b8a61d2944741532d8965d893a2681  ofl/pirataone/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantupright/OFL.txt
-sha256 65f43260cf7e66b57ddca8d148384a6602e2c06edd389a8b3cf388045127b47d  ofl/lusitana/OFL.txt
-sha256 518962c41d4a5e96b0016bd8d8acc965413ea1a0102467e4955931e702b14a0d  ofl/iceland/OFL.txt
-sha256 2171558d2482764644a2f793696fa2e48c361730ecc87686b9a29082d6daeb10  ofl/khula/OFL.txt
-sha256 d336c098ea798bf14de111cd90dff7d6bc340852405246511345d0f8564fe76e  ofl/fingerpaint/OFL.txt
-sha256 ea274e87939d38032b31fb741af75bff9fa3f8d4a8b652265f9e0ce1ad7e9f80  ofl/asul/OFL.txt
-sha256 eb1992aec1cf892ec94ffc116d79b62c7cb03dc108141b94a57a4195d210b514  ofl/meddon/OFL.txt
-sha256 9b584984f9db0ee30347391a76eff9c0a6b03dc450c3c6afe3757a2cb3a4db87  ofl/tajawal/OFL.txt
-sha256 1dd84b611f4bed7f9ff9089e76a96337b187e6f283a4ab33bcb987f844f2c4db  ofl/parisienne/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/hind/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldwpica/OFL.txt
-sha256 de08ff7a460541753999b1208f1254f1d31f16b421312aca4d4b8179d997de38  ofl/aleo/OFL.txt
-sha256 7706a84d7e49e2273877106334a1eded8ae89fb5839fb81e0f2bb27c846f667e  ofl/lora/OFL.txt
-sha256 cc31fe974951d56d542f33782d07b2d5577a4afdddba89744e6bd69bcbf3a853  ofl/karla/OFL.txt
-sha256 0409c6582424508453ce41648067efaacf0c790622918493d8f1d934bc5329a0  ofl/bigelowrules/OFL.txt
-sha256 9e2d92fb24b4a548ab030c509ba88267e224f2523728ee9bb35cf334811106bd  ofl/exo2/OFL.txt
-sha256 f480fd19e7018942ecaf460f7a4ab9ccee0aec579abcb07d559dbede913864c6  ofl/alikeangular/OFL.txt
-sha256 6ea7a3ef1d07feb592693f3f22c26d0b09321ff81814292b49be99888d0da9d7  ofl/ponnala/OFL.txt
-sha256 0b7eae990329ac175a2e1c329060b3a4d6876e4e0cd7e5235511578352f7b191  ofl/biorhymeexpanded/OFL.txt
-sha256 21b54eb0d7513524798a00dfbaf99a02c003a0012a728cc5f0e02d24c50482fb  ofl/caveat/OFL.txt
-sha256 adadb8d5d34fe2218dca0f4a4919a9b6f81dfaebb289e5446ac7b3063d6965e9  ofl/tangerine/OFL.txt
-sha256 16741ac498178f645283cfb45b7a487b6d361b5de5730c5ea729f056f414f6b0  ofl/ropasans/OFL.txt
-sha256 1e5bf8207a40678bc401e2e5456d0db1f2a183b550a30976b48dcdd6a4e4c46c  ofl/caudex/OFL.txt
-sha256 6f9e3a1c51f617e7b110862426204ec7a56d8c6d2f731373b5de6b8d069099b6  ofl/ebgaramond/OFL.txt
-sha256 c2368518f12463a93cfed44e1460f36085dc60df06f415ee9b0319809987ccce  ofl/frijole/OFL.txt
-sha256 5f247fad3e8a86b6c0779dff09277047c1ce2b0b7580a1093347a8af755352ba  ofl/sawarabigothic/OFL.txt
-sha256 6627b9c2c8ff8e0c6ef23f1b0125dd5b293320c10c916d402fef64916c296d0e  ofl/kreon/OFL.txt
-sha256 723764a50d4e6985dfcbd75fcb40dbd3abab37ba25ae626486d4a32084854487  ofl/kdamthmor/OFL.txt
-sha256 846ce83956a732edd57b74d9ba988d58abc8c8e6d0926859559318ce6aed139d  ofl/mclaren/OFL.txt
-sha256 ba01480319f922ecebbc73f1a523e7f8876e92b16553a32c494bcd3f6f5a27fa  ofl/ledger/OFL.txt
-sha256 c3bfad2900a83f571d5c984d490d51c56aef14806c28dde38125593e1e71daca  ofl/mrdehaviland/OFL.txt
-sha256 12af42b715a3901bfa7add1351e45b6ce22f3061555d52db45e963274c349360  ofl/arimamadurai/OFL.txt
-sha256 aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/miriamlibre/OFL.txt
-sha256 3169e7e0e87168908218f11d660a52c0b81b5952fd73918a596e70721d68d3e5  ofl/inika/OFL.txt
-sha256 e711c816f7de931244976f51166baa15446fc307e5d0ea04fdca1bc2c04afb1c  ofl/nixieone/OFL.txt
-sha256 1ba345a91338581e5f8fccc3e37e447ddea5b99ec9caec1b76c7c39492387d2f  ofl/signika/OFL.txt
-sha256 b01cec9e5e2035b70a6aeb61c673d1f6d5c91539845be07733bd9880fddeb9f0  ofl/kadwa/OFL.txt
-sha256 d7577acbab1d70f2e6bd1b21d8f61db189d6aabe6375bc2d96564b8d94031664  ofl/stalemate/OFL.txt
-sha256 5946eec3a7d3bda02825930156e4716198e7753641dd3303a3e8c386c8011909  ofl/eatercaps/OFL.txt
-sha256 ae6de2f6fc00f76cc7eb0d97c1ae5e0b7ec734f20ad7f58cf4c74738dc822d21  ofl/chelseamarket/OFL.txt
-sha256 860cbfdc9dbc3f0e8d35af80c31e8f20945bff393d4f483dfc157469e01d321c  ofl/gorditas/OFL.txt
-sha256 9a2d8c5a3de0a6e62432322115dce136139948411dba33cd86525c0a02749fb8  ofl/unicaone/OFL.txt
-sha256 4fe01b13ffb41faa8f030d84843a95dab32792dfeeca7c072abbfd3f4d6896ad  ofl/audiowide/OFL.txt
-sha256 173ea2d0bdda981829719623c35699e8c0e4aa508e0af12817ad7ccbfa4c6137  ofl/originalsurfer/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/trirong/OFL.txt
-sha256 58bdc69f4c6177125c6e7cdbc78f710f5f9952f11bba7bd5b17bd7ef169d731f  ofl/goudybookletter1911/OFL.txt
-sha256 2950994bcfb8e903f0539d28a8ec4af077e0aa1fa7946c33c912d2d6969c2971  ofl/glassantiqua/OFL.txt
-sha256 7344b8b8c97c4f88c0ff8bb72bb024bba72f404be1c740b6596a73ed15d28df3  ofl/vampiroone/OFL.txt
-sha256 cacad5bf45bf5c81f4b6cbd114261bc8a08f6110b66a4c6fad8bbc16618a3096  ofl/daysone/OFL.txt
-sha256 0677891e6a143f297350d260ad766ad33bfc18ed5fa4f213acf648d6b597ec1a  ofl/alegreyasanssc/OFL.txt
-sha256 c8155eb9337078a9ea9f1e576ac813a03030ca43e2694593e90cd4fee6fce937  ofl/sumana/OFL.txt
-sha256 95803fae1b063e592c67b5867f1f36df1df526e5ebf33c6cd4d4afa31a9d5586  ofl/sitara/OFL.txt
-sha256 c254ae01c407f4a2bd0ad163e4c1a795d57ddfa8967c21b8a28c250b44d13963  ofl/sawarabimincho/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellfrenchcanon/OFL.txt
-sha256 25995bcf8e8ddea1aafa5449870567cbbeae7e26b27ba30aca5642f2c02e9757  ofl/quantico/OFL.txt
-sha256 455755e2e7ce9dbac6beb3729c97c57d6f74a638dcb5be548ec953021fbdbfb3  ofl/ntr/OFL.txt
-sha256 ad6f73fa3edb7aea340aadbc63c0d7ef7663abed82664432ae09a6b377fa313f  ofl/librefranklin/OFL.txt
-sha256 581f08727777cb2a1a1ec95c0f981ce64fb1ad4354f78a0ac4f3481afa605577  ofl/moulpali/OFL.txt
-sha256 4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laomuangkhong/OFL.txt
-sha256 08fdc7cbd92b9bbc4d41d0945ae7f25450d91c5fc8c66c68df331af3505e4ec3  ofl/rougescript/OFL.txt
-sha256 694d5c15c1dac5e26653e18b94394d911e471549ec9b7d6247ade62e486b4915  ofl/asset/OFL.txt
-sha256 bddfe669338d0dbc24c15ccd31dbf5c101a213da38049c24baca9ccb7fde45a4  ofl/wallpoet/OFL.txt
-sha256 2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsansnarrow/OFL.txt
-sha256 3cbf579238e4eacd90ad67883d971aa346ce8990d658635f78f98d608a6830a2  ofl/zillaslabhighlight/OFL.txt
-sha256 87000f71a897c8c130c7777d058c5868f84316f99a32644b3bf595cd11edeb12  ofl/sancreek/OFL.txt
-sha256 08fba9df5c9890f3ab00ee63f63e005ad93a23746f7484f5fe9501a1ad32730e  ofl/allertastencil/OFL.txt
-sha256 9608d22ae5c586628c9904e773b7c6a6520fc16e1492ebcb5ea55d9523399964  ofl/anton/OFL.txt
-sha256 f3758ee70600ecd5450f01ea373204b202e048d0454c9db2d1175c5a5dd1e92f  ofl/vesperlibre/OFL.txt
-sha256 e43f121c788cca4a14049e58864e28021174b055710ba38e0964e816dbf905af  ofl/fruktur/OFL.txt
-sha256 5e0da210fb04058a8c0087985d2d456b931c2579811a49655721d3cf0c36b6d6  ofl/notoserif/OFL.txt
-sha256 a1580ba69a8d706bd95e1e72ee0b5cfda0a478fbbab6a4af13b4a9e1b28faac0  ofl/revalia/OFL.txt
-sha256 f323edc1e5a6d8fa16120aa15367cdfb15468474cc621f9bda1a2f73c5d08d73  ofl/sedgwickave/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellfrenchcanonsc/OFL.txt
-sha256 0836fd874230b17f840efcf7d3bb529f5a7b5befbfeef94478519cfe2d8551c2  ofl/courgette/OFL.txt
-sha256 e3ed3ad6cb257e16dc1789900707c5cd1cdef2d60d155389342604991cf693f9  ofl/bahiana/OFL.txt
-sha256 391ac3126dacc95b92a8f3408467879edb3245344bc411530a30d5aada52df92  ofl/gugi/OFL.txt
-sha256 88dcde7d08e509a3eec64886292a36cbd58ed9bb52f37f91f55656fb9d21ddb8  ofl/supermercadoone/OFL.txt
-sha256 41423e9e1d0ea79d0e78bd5fe9e0b27f4c23140706f5dfbfe116839c83aae91c  ofl/charm/OFL.txt
-sha256 43186c592361336474683e302dcc988831a53857bef188c4466f6b45dc238f84  ofl/fredokaone/OFL.txt
-sha256 a21fa252efb7a1ff84de6a36df4386959668aa046f28161b4047829f7d9cd1b5  ofl/damion/OFL.txt
-sha256 842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsancondensed/OFL.txt
-sha256 bfc205682f5454b42a732ec857b665293ab8bc6f0ee901a0967219ba7ffdb190  ofl/gfsneohellenic/OFL.txt
-sha256 59b91c9912b80714852a43897cbc9414d6457e22072dc99a4cea6e2bb4f3c65c  ofl/freehand/OFL.txt
-sha256 8b89f3af5fd02216793ff3dfe9a04dc22dfe5c213422ae21558ff1da6a1e94dd  ofl/cabin/OFL.txt
-sha256 b598b7fddfd578950aa1fe6e0e2607b779abfaa686b83af8ec65c860f646b2cd  ofl/rumraisin/OFL.txt
-sha256 2bd35914efa381c80f9fb62d6ea7d736d3c0739196a3783c3122593c3408392c  ofl/gurajada/OFL.txt
-sha256 5625e91bd7c2a45c8b9f59106d587bd025470b462ea901df691defe0099621e1  ofl/taprom/OFL.txt
-sha256 37d5360d8d2433689e78302a93cd88e9add8a2294046476625edada2d4328deb  ofl/averagesans/OFL.txt
-sha256 f8e2b58dd7a8c8e21e5d744b45876bce7e010a647c071c1ed42ff0e618d4ea59  ofl/frederickathegreat/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balootamma/OFL.txt
-sha256 09685e225ba9b697b2ccd2d4098cac5ecbed0679960605258a271af60749887b  ofl/francoisone/OFL.txt
-sha256 39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/himelody/OFL.txt
-sha256 08a12877eda24767239f26b527bfce0c515efaf623c66da6baad92a6d5315e9a  ofl/content/OFL.txt
-sha256 0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/saira/OFL.txt
-sha256 d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/delius/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/pridi/OFL.txt
-sha256 c1eed37b6d213df4edf8f92ec7d1e972f751abd68ecd649b4f0b8e5d8e8561f6  ofl/rasa/OFL.txt
-sha256 4e66943af352059c059dd658774f25fbc831f1ad478f9f0890c06ecc2dd324c7  ofl/metalmania/OFL.txt
-sha256 f5b03ea0b27c7f5afb9702771ee57679ae8ba6b471b6ba9e62d985d3256f1929  ofl/playfairdisplay/OFL.txt
-sha256 593f0bc55c75b673772b378eaee314f128283745c4bb1cfdb9b8012a3b6c46fe  ofl/skranji/OFL.txt
-sha256 46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiagruesalibre/OFL.txt
-sha256 14d28541780d90f6577bb7abcc6f005bf6969614294e75c82abb8758a696ad46  ofl/quicksand/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloochettan/OFL.txt
-sha256 35dca6122235851d236bd861124f4a893d409eba021cd8c6a292a19df0f4640d  ofl/codystar/OFL.txt
-sha256 ab721b35816e470fb11619ad3705f75d08dccd0864505e3d782e94fd937f6620  ofl/allan/OFL.txt
-sha256 d9cdb075679d15a99bab2a8541b9c4fdc71347502111fbe9affd1d462219d96b  ofl/indieflower/OFL.txt
-sha256 1313ae342eae4e1810304b6cd32f6815dd11b8e45812a2af98e58b6960684fa0  ofl/petrona/OFL.txt
-sha256 1e4015251ca58d4f349b4ac930259c6f3d6381ce68f8b4b27d54d53f8f63f972  ofl/angkor/OFL.txt
-sha256 46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averialibre/OFL.txt
-sha256 8e28b778b6e1a7ff9ca72f4dee2d53120aa2856dc1bfd0be44307e365b0e45bb  ofl/cardo/OFL.txt
-sha256 a02e8715fcdf3325c474b7209399f50230897bfa828fe4eea2639ced1a1d574b  ofl/blackhansans/OFL.txt
-sha256 d530c14e9cc263c567b47742ef20df2a41374f00732ba4f290f52adad428b1a2  ofl/meerainimai/OFL.txt
-sha256 2e2fe5f1d8916a5160060594a96c1a5116406d26847afdbd09618481e2abd6fc  ofl/denkone/OFL.txt
-sha256 56c4ff36faaaf336bc5fee659ff6fab2413d67499cc22acc29079b3892d8931b  ofl/miniver/OFL.txt
-sha256 0d75673e4c98de3e11337dbd90b05d0232edfcade5c1c02fbc0118c85aea25da  ofl/macondoswashcaps/OFL.txt
-sha256 742a6a4386db47a2987c7c3b4aeedfb5adedfb3356c118de450a664735686535  ofl/graduate/OFL.txt
-sha256 9e53298e3629e00ae4c31531cca09051ddaa654a5de4f7b55e596132fff86e1f  ofl/dhurjati/OFL.txt
-sha256 df9fcd8f62ae79aba7fa5b0563a08dfede1fa0909d668287d70c395d88f5fe02  ofl/fjordone/OFL.txt
-sha256 02faa476b17db0044d0c502a3ce12fdc81eeeb9bd618e6a005407c79d6081bbb  ofl/monofett/OFL.txt
-sha256 1edecf3f971a11dcfd777cbda6f08c0f9a77bf57a0a2a89d8142fb933894ce16  ofl/amiri/OFL.txt
-sha256 6e6efa9b0556d100cfe60690cff5d9be7144df77adabfd2c278dbfee451351ea  ofl/phetsarath/OFL.txt
-sha256 2348c4852e6322105d130aa2addbe24c962e330094ad6dfbfd9fbd2281d76b0b  ofl/bellefair/OFL.txt
-sha256 3bbcf1617d93d3a949a10da78ae91c58be536fb04567ab4b5b9fd207126f1db5  ofl/buenard/OFL.txt
-sha256 faf47a1ceab38b07205b9d58fbbf9ac39772ea47cc731aca7816276da7226a22  ofl/dosis/OFL.txt
-sha256 3ac1301549523d9861fedca12871f24e575fbd26d520632fc00ba849b471d275  ofl/russoone/OFL.txt
-sha256 44b51296985184d9b27fc2c8e5b317906c5d65d9dc834e81c07902d3e5e1cf1a  ofl/brawler/OFL.txt
-sha256 afb8c471158619593df0fb501453bd39fda42396e2cc3911e2a0a471c11b863c  ofl/sarala/OFL.txt
-sha256 de985adf63cff6b1bcb7c5cb55f1c5850fb1d36289d20a0e26d97a281bfcf956  ofl/aldrich/OFL.txt
-sha256 194e25172d0144f29aff4b6fb2931ff0be0139448a5cd867db37863c9179330a  ofl/stalinistone/OFL.txt
-sha256 ae05f8781a5ef38380ef3efe8cad86783610b6a780c6c278d7472f95310fccee  ofl/oswald/OFL.txt
-sha256 2dab153a33dcb2101bba3f194d27d953c848a0fabf2e336650a81f84a0c33b3f  ofl/pragatinarrow/OFL.txt
-sha256 9d61931b909f9a738964f8fb311eb8fa40dba1ef9f1688b36039ebb15ee1805e  ofl/questrial/OFL.txt
-sha256 e315abc82a78710c7242e2f2e6529651fd631d4d50e6ad98ea194f9b54c3d701  ofl/alfaslabone/OFL.txt
-sha256 4653c63a4bab99aa50de5190853fa21ea6c0a25d69d49f5a42cd51f0f67665e0  ofl/boogaloo/OFL.txt
-sha256 bd8323cd1d2b6bbdfbbf99cb41ec1156d0352ced170de4aa3a96d95e6e20bf5b  ofl/amiko/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/sueellenfrancisco/OFL.txt
-sha256 ed93e9833f18acc2775380a28139fd88d3ebf82df7cb814042498467be3463bb  ofl/lemon/OFL.txt
-sha256 1f00d1f970b4ea469b6936e599b599bb217edaab792e586658ef2e71cf438685  ofl/itim/OFL.txt
-sha256 fa28ba897eb819768d6bc00c30aa03ef560e80e5f6fb872eaea089c66992f502  ofl/notable/OFL.txt
-sha256 96199bf9ff12dd471a66911dee95440737b437e7f5a6fd30e9e950c16d66e8df  ofl/unifrakturmaguntia/OFL.txt
-sha256 36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/judson/OFL.txt
-sha256 ad4f6ede2e8a017255822a6abee8d10717f1d34c20223de80285ff59e28a1cba  ofl/bangers/OFL.txt
-sha256 f8779e6871bbab04e0a1ddd9997f4d8173b56792a1e7f8b9d691d967a49c7dc3  ofl/andada/OFL.txt
-sha256 49b9214f7b40024abec2fc89a32bdda380f2174ba7005d7636e6ea340157c5a6  ofl/jomolhari/OFL.txt
-sha256 a815f65bc72d90494b01842d3171f7cb0f9f935e023d9cc260904d221ef1064a  ofl/b612mono/OFL.txt
-sha256 5eca89cdd576df5e4b7c694e0425b126a9ca839aa067df85fab33904a8187076  ofl/amaranth/OFL.txt
-sha256 e0cde1a4993ed689d463d5e2401f4a60c54cc48a14253ab0f8012d722c417038  ofl/mavenprovfbeta/OFL.txt
-sha256 eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumgothiccoding/OFL.txt
-sha256 0fbae33ac3aa455c8c0d598347c87f1abfac0d215483f40f5a0e8dd08076df1b  ofl/librebarcode39extended/OFL.txt
-sha256 3670ddaf348c62ada22a2f606158dedcd9ca5fd5422a6173d6593204a8f53d4f  ofl/varta/OFL.txt
-sha256 ab592d1abca19428b89d851706fa7815ec25139c6affb45d366577ca63fb91b7  ofl/yesevaone/OFL.txt
-sha256 e8dd8f53b2fa502ace0636debbe7e357c4888d8d02b8b41d6a9a22d3058a63dc  ofl/peralta/OFL.txt
-sha256 cdf5fc4014abe91588666a9592ec86200e5a4d743b4b6e05d28d47e850bbe5fa  ofl/digitalnumbers/OFL.txt
-sha256 f8c2225a5fdb50e2e75f98cf6e69f198571f605f1b7f6f7eacc0947e2fcdbe8d  ofl/sreekrushnadevaraya/OFL.txt
-sha256 a80ee908b60f5bec9c10b135d3da93730e2194107d1f7fd3f61bd8c1a97b3e0c  ofl/yesteryear/OFL.txt
-sha256 6d216cec166b6e139adaa599053dd49720c053e1f2adb4845de3cc9c3704344d  ofl/play/OFL.txt
-sha256 46751a31966477e3f038d1e5ff1146a33234a3a523a0e6a21be3221cba082a34  ofl/muktamahee/OFL.txt
-sha256 505bb8f3c30f2006b4e02d250fda31ed94b651a35f1124a201ca1c405ce989af  ofl/biryani/OFL.txt
-sha256 5641212407f956b828bf632afc4bbb3344f461f82255ab56756d9e3e8604c7b1  ofl/martelsans/OFL.txt
-sha256 1ed119b01f03187dbe2f5f89c95431b9a4ca46db604fd263164d8b4055189f46  ofl/lateef/OFL.txt
-sha256 4938e917ac54665be1dd862f54634d991b39c5d1eef69345d66a5089e401bfb4  ofl/creteround/OFL.txt
-sha256 9263f9488a9ed1d5f4218581b642e0f054f9a20d208f1a53c19c9f7dbd27eaf2  ofl/peddana/OFL.txt
-sha256 e75ed24435d1711de0bebfaa621c3eb5564798c88cc0c1d1f8d529bbaae703a9  ofl/yanonekaffeesatz/OFL.txt
-sha256 708e33bed791c40638926a7577bcef8ff8748f84045f3825277540cbb8d483ba  ofl/poiretone/OFL.txt
-sha256 f1d1a3536fa4b9c71d04fe4c8d8bbfc0cc5c457d6883f45086b04d0bc07ed12d  ofl/vastshadow/OFL.txt
-sha256 f9f28345ffcd6cea6e3c6699e4579cd1948053d80fe89a6a5a2ecb269afc95f8  ofl/nikukyu/OFL.txt
-sha256 c1bcd16ffc9d095822fd6b7fa1a24c7918b24815ed05711421f804293d2efa62  ofl/actor/OFL.txt
-sha256 ae629d13b06d9afc5cf3c07d585f3192b89b7decaffc5c4dfcfa7ce11a2a2b11  ofl/raviprakash/OFL.txt
-sha256 bdce62dd98db969b73f93f8e8e2151004c20ad871ceb15ad9bfcbdf2cf939dba  ofl/pompiere/OFL.txt
-sha256 39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/poorstory/OFL.txt
-sha256 757f49d04406c93c40d1781e7867fd85a1f9fdfbfe03a5ae332900da802fffc6  ofl/harmattan/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/khand/OFL.txt
-sha256 74ba064d03f1f1c4a952da936c3eb71866c34404916734de3cae73b34357e59e  ofl/lato/OFL.txt
-sha256 94625b91cba99cf9c8e580febf5e738b2e3c7cde9034a16bcfb7538b672137e5  ofl/zcoolxiaowei/OFL.txt
-sha256 3e908f3a95680bdf3c8456bfbf76392605b34cb3fba109e46441056ab966cb35  ofl/modernantiqua/OFL.txt
-sha256 6a809aeba8af2115ca4b4c3597b1fbeb836a45f0489070f330f9c2dff870da8d  ofl/galada/OFL.txt
-sha256 2c3737ea83b48d48624068d1bbd1d9f8049eb7cf2e1f67435e420375c42e0686  ofl/spirax/OFL.txt
-sha256 92f750829545386017c3418d890769778b76fd01dfb41c62fcbb0d42ba0303eb  ofl/dorsa/OFL.txt
-sha256 656a20870fbcb8f559f1c6308c1df90ac93d7cd0279aab49b43a43b5e58534e6  ofl/neucha/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/zeyada/OFL.txt
-sha256 4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laosanspro/OFL.txt
-sha256 33e3a83e377c6a41149044bd919f50d9a971d801052d4e0c0a98cb417b42ae38  ofl/risque/OFL.txt
-sha256 b4fc1d55ce610f255c5712f8169543f9610536d002deb99bbc99bfbba9f8a560  ofl/pangolin/OFL.txt
-sha256 511125dc85198375795fdbc109d088654d3b7f9dbd3ccb7bf93d844aef0b153c  ofl/ptmono/OFL.txt
-sha256 819e3b25f9b50f12299a3db1638be3813efc6b938f2b86693a218d20ec4e3209  ofl/londrinashadow/OFL.txt
-sha256 e3ea566dbf689a9110b2094f9f2e5d16d7ec31720147651efc1005ca20420dd4  ofl/flamenco/OFL.txt
-sha256 186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlowcondensed/OFL.txt
-sha256 705960c3281a5765ecc0b59bd4ed7ca59eed165748076bc2fc3e8fdbfeb944b0  ofl/pressstart2p/OFL.txt
-sha256 7e896665d0863d2a17a671001dbe2528a5f9302f1dff9222af8b0834e9088d0c  ofl/kiranghaerang/OFL.txt
-sha256 5f1f5510eff7922864bf326ffa1d4a62f01add5193e9367b542378e5a808b500  ofl/handlee/OFL.txt
-sha256 3173acd82f8c6159b5b1037b539fcbd4edff68e65c2ea8b9412b5a5ca97b08ff  ofl/archivonarrow/OFL.txt
-sha256 82831e8f12ecb6deb2f4d9919a04049895b4619e0301fa6b699c861bd7311c54  ofl/kavoon/OFL.txt
-sha256 1a5e3792a425687a523fc7c0f8ab5d01d58bf853149d57f3dec4b4fc6932fcf6  ofl/hanuman/OFL.txt
-sha256 7f91d7d8854e5cb4fc630807c0f4d57c07777769dc597173fe0aef5e58f0992c  ofl/qwigley/OFL.txt
-sha256 354b4be0340cd58e381fdf58793a108897bf944a7f8faf9e877c476ed6c730d1  ofl/convergence/OFL.txt
-sha256 1e20933206ca06421c7c378184da5476d195314cf4bcda2bf122cd45d69a956e  ofl/oxygenmono/OFL.txt
-sha256 a7fe1f3d23034092b015aaeb53d2ecbc9e592be96b10bdfbcf8700ec6a6ffc97  ofl/fascinate/OFL.txt
-sha256 4dbbe5c21b46f2647d227dde69b971a1b46de1435e0752a9eda1ce120725a93c  ofl/norican/OFL.txt
-sha256 1f581506286e960436548dba0701aab278f7e67f2adc6bdae2958923867d1e64  ofl/hanalei/OFL.txt
-sha256 56edbe5fff7981dae6f6eff32f61ba04cd54324e5abfa44b1257b2a307ea561c  ofl/poly/OFL.txt
-sha256 59bda6b53e28d388de5eac7bbb8f3e65889dc8489be3d922f95a525354110c0e  ofl/tharlon/OFL.txt
-sha256 3fa0ceff4b9a2d28dde43bc63cde3acfb5e6e92d13a53e484ca0e501e18c7e2e  ofl/lekton/OFL.txt
-sha256 ad9ce814ff266b57d3c4698d3fadca4b41a6f942a0ddd215db5cc66abf92d668  ofl/mako/OFL.txt
-sha256 c4afe82f49c05689c40dd4e262803b29c6e611e7b4efd3a0418f574b2be79d9a  ofl/carterone/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/karma/OFL.txt
-sha256 d38acce513eccb51d7ac34ca47be279e1fcfdeca1ed088bdd2d281dc6ca939ee  ofl/badscript/OFL.txt
-sha256 31eb7046f4c80e0f96944c4b40b0772de68b34783b794fc13aab3f54c2ef6d9b  ofl/thasadith/OFL.txt
-sha256 06c79c896894160a5810d869a822fa7d02a0e2ccffd97920b8cf3b880380f6e5  ofl/amstelvaralpha/OFL.txt
-sha256 4faa2d9e2ce0a4b5b37e62ee6fafe474a539b31578f7214ed97cc3503aeb8ebd  ofl/oldstandardtt/OFL.txt
-sha256 1e511bb01d29562932157365418c02d954d8faeef794bcd54729177fb2b03db0  ofl/istokweb/OFL.txt
-sha256 846e8cc6dc69bf685d2db14cfa758ff3d9d771d54c9e0d3b511f0ecb97ac0e8a  ofl/cambay/OFL.txt
-sha256 6c181f5a0045e8f414e1c232c35972ab83ea084ac44825f517ba001628d97b21  ofl/kronaone/OFL.txt
-sha256 d7f96801a28ea11eaa51bc4a9c87fd91f2133bc298068e6e2847a15ddda23089  ofl/librecaslontext/OFL.txt
-sha256 1f00d1f970b4ea469b6936e599b599bb217edaab792e586658ef2e71cf438685  ofl/sriracha/OFL.txt
-sha256 22c4588bdc14621220ba14515d52041d1312541e034a15d1f5c2a88fc6075276  ofl/merriweathersans/OFL.txt
-sha256 1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode39text/OFL.txt
-sha256 5b26c88d163b1430561f53fd3d9021d6057f3c67d25534a5d8d232cfbf8ee2a4  ofl/wireone/OFL.txt
-sha256 57f8d60cfe9212b971f07253e303746128edd06b21e3a0e4e188308e569f03e5  ofl/orienta/OFL.txt
-sha256 c87702d8b70f714fbefb554660e8ca57a43ef62a59089d11cbf0c6bd51d56928  ofl/lohittamil/OFL.txt
-sha256 6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejuhallasan/OFL.txt
-sha256 9437c26410bcd543607a6775e7d0e359c1df3926d68c92dbaceb26ce79cc0fd3  ofl/bevan/OFL.txt
-sha256 50265d2b41f8ad2dd350532d2286509aa694021b4aa0490b06f0068e4ed78c27  ofl/herrvonmuellerhoff/OFL.txt
-sha256 9acc45e5ba18b5b38868fad1f51c03df4f5d7a43061d46314843de45c4444233  ofl/ribeyemarrow/OFL.txt
-sha256 1fac7a3e4e43b091c2d31aef7a375d2b969c42b2d5fce8e2d40b5f7b1233ddb7  ofl/moul/OFL.txt
-sha256 331c71cbd8f1d8a70cd6eec3d55553b64e6261a9bb0982fa12e6e48baca827c5  ofl/philosopher/OFL.txt
-sha256 1e20933206ca06421c7c378184da5476d195314cf4bcda2bf122cd45d69a956e  ofl/oxygen/OFL.txt
-sha256 89418a3c7b5726c3f8828a7b7c3f1cad661cf5b7a1be3d2bd9ea243f8d9890c8  ofl/sniglet/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balooda/OFL.txt
-sha256 89d9d01291eeb91074ccf1f7ce07e7a1d9d421ec1191f8e84d440cb50830ed92  ofl/purplepurse/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloopaaji/OFL.txt
-sha256 9acc45e5ba18b5b38868fad1f51c03df4f5d7a43061d46314843de45c4444233  ofl/ribeye/OFL.txt
-sha256 f938d4076b66a13cf984ce88d92a07ff9802e8ae5e1f4a28cdc43fad122ae611  ofl/spinnaker/OFL.txt
-sha256 89bf0833b785c49b0f271273ab440bdc20c85bf0322537dc901df940bf1579da  ofl/amarante/OFL.txt
-sha256 377f4f9c19e935228552478eb68cc2ed82910988a60ba60e2ac73b09f32d02d1  ofl/patrickhand/OFL.txt
-sha256 684ef102ca4c5ff61cf1c1e5c2c6326f3c26f848446f98b8862dcca716a87601  ofl/quattrocento/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/rozhaone/OFL.txt
-sha256 61be7c29f4835e2be7243db12213d75d53ff028f29f4b493212a1688b1d3a1ba  ofl/titanone/OFL.txt
-sha256 9df0700fcd0ef48abd74459a8650d35f59397fbaa00c5b00527e57cc155689c0  ofl/durusans/OFL.txt
-sha256 b1958132ff727bd74409aa37ec0abbe4be13b1b379e1210e6fb77fc608c607d5  ofl/kodchasan/OFL.txt
-sha256 f1888ed385b528866a472d02f4e06ef0873aca5b3c63ff1f6116cbb150dc9a13  ofl/metal/OFL.txt
-sha256 e36d420a3b382b337c386338d8abc3635e10de5dfca7f822fc63ac659a0dcfc3  ofl/amaticasc/OFL.txt
-sha256 8fbe530adcbe30c658393c3f2b5a4785d6765afcefdfe47f594730131f3a0abd  ofl/oleoscript/OFL.txt
-sha256 60ddc0ee6e443b78940b5f92bcbab76c98ec6965e0da9fbdaf267383ab72bba8  ofl/anticdidone/OFL.txt
-sha256 afc1b710d644c1262e1765d2401abcf93a545a4cb051955e2243fbabb8164e25  ofl/carroisgothic/OFL.txt
-sha256 3184f6a99f589c78740fbff6ddaaabb43b8cc2f3852da36e60aeb024ea8d6f00  ofl/eaglelake/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/halant/OFL.txt
-sha256 9a9f089005f389717106bb3ba427cda9bd51b8a477078644566543f2a60ca85d  ofl/rambla/OFL.txt
-sha256 99d2f30e282d6174af8ff68597f58bb53c0dcb2b104a4c1b8d19da49021d00d3  ofl/unifrakturcook/OFL.txt
-sha256 2bb0c0200723d923f8e20d08b8bd1c7af7f5cef8bb2d63ce44bd268b54334621  ofl/fjallaone/OFL.txt
-sha256 72afba97d1ac9409a9fd3bb91a02a639427ca1988977909dad273e293a508d7e  ofl/staatliches/OFL.txt
-sha256 88aece7d90f2bb7049719f11619a560af22af3451af141f12aa4f46bb157a99b  ofl/lobster/OFL.txt
-sha256 955655cafa13f187f45a79dcf451942fd1118a8426abc5a25ffc5dbb00709da6  ofl/juliussansone/OFL.txt
-sha256 9e1c955538817c3fab7160cb3110501e73ce109eeb58c4992a14e8323d900849  ofl/pecita/OFL.txt
-sha256 96d82a96abc02fb457ddde0227833dbde9d1d02876c91f0a4e27845ca0d692fa  ofl/atomicage/OFL.txt
-sha256 7729f005b7a087368e2cf61fc4b65cdc85988e47d0e6e38c93a72de345e86b41  ofl/newscycle/OFL.txt
-sha256 336fab6956d78eb34b50cd7bc6b16116c44735fbd0bf9f4def769ca4d8e218a9  ofl/sofia/OFL.txt
-sha256 b26cae1321380296ba8311b632a397d5eac11b47197f9d0aa0b9310f1531ad60  ofl/sarabun/OFL.txt
-sha256 aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/suezone/OFL.txt
-sha256 d3711c90a7deda6210d30e41b945f16bdaa00662b30ee0b7c36abfee82525bfe  ofl/kokoro/OFL.txt
-sha256 513b7871a360a6eccd426bab59743fbff36764588f47381423f04ad6b3d821d9  ofl/alexbrush/OFL.txt
-sha256 67f64c5509e5151796599e3ad47c3131cbe0c80c4f9430b90236a1249c2eacc9  ofl/roundedmplus1c/OFL.txt
-sha256 4a7d2f227b91046ef7a54f8f735668d86e45f4fd4089268de292a6e9de108253  ofl/bentham/OFL.txt
-sha256 3c187c861dc291b9f7f96f655656f9ac2d57b33da425bd5962810be728344f57  ofl/brunoacesc/OFL.txt
-sha256 869e4c29978c318b33c2e5c7c8f24d2e947f249071bb1471620036a9d1ba87ad  ofl/k2d/OFL.txt
-sha256 6383249ddffbd87f2bbd7878ceba2dee0f1a2193cd7a4f41c00aaceb8e6d8b5b  ofl/meriendaone/OFL.txt
-sha256 ed50ebe2fa922554980909192526fe94966556626d6d440a462c8e7eaed74cdc  ofl/sortsmillgoudy/OFL.txt
-sha256 d64c91b0306b53fabed08762068eea8b918d654fb0721c288f13cefa4aaf088c  ofl/butterflykids/OFL.txt
-sha256 bc1175730d609233043cde47e48f69831f012e85537c5ec1a2cf4836757c1540  ofl/mali/OFL.txt
-sha256 fe5e822667a4b2e083b8fdd7a37546163f26f6481b58742236abffdcfb3e6c71  ofl/baijamjuree/OFL.txt
-sha256 b0316f404a7b291e40921c605160181065791a5010a2d2d5691fc7e28cdbdff2  ofl/underdog/OFL.txt
-sha256 c026db4c1a557cae47e6930876965f9cbc05758eb1f5d6f59b6b61c8f342a57f  ofl/alice/OFL.txt
-sha256 aad1e82802172d4c1d22dd015a5b8b4275e5665a49c1df54ed64716fca7ae194  ofl/corben/OFL.txt
-sha256 878aec7282ab41d058cedbf90e14512bcb4fbd0658496de8c2dfc592ed1f0cd0  ofl/lilyscriptone/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellenglishsc/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/sarpanch/OFL.txt
-sha256 aff3cea99bf300b4b29f4dc04867cf9b49d83de8c5ecaf991c446d506b56173e  ofl/wendyone/OFL.txt
-sha256 b054962de0af1397d5350fddb4d6bb20f5f2e073b543eeeb694c7c3b27144fc5  ofl/chivo/OFL.txt
-sha256 19849b33c59d0cffeaad0dbdc38db767e95e03cd36fbbfe6b67a9878aa5758df  ofl/fasthand/OFL.txt
-sha256 a57810cbca0b4715ae8610dd7a268260cebbdd4fd76d304e371517f828150669  ofl/stoke/OFL.txt
-sha256 47a0b7e315bc56ca0326fca46302d87d48a61e3528d4196e966b62f5bf0243f2  ofl/armata/OFL.txt
-sha256 eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumgothic/OFL.txt
-sha256 616e75d879831bedfa7725c078e09bb56f8a17f40b194e16691b12251bb42b3e  ofl/majormonodisplay/OFL.txt
-sha256 75c7ccf4f537a7a3ebbedd299c1d2542e13d3b27aaf76a0a2d9fa91a2a8fcd3a  ofl/felipa/OFL.txt
-sha256 ee2c069b30f3e9a5aaf52357117ee3443ee27f17c29a2ec68861db283379905c  ofl/dynalight/OFL.txt
-sha256 fbe0442a6b1ce162c95e241df76cab5ef2daf6a5ac84ae1a7a6749f32c051098  ofl/breeserif/OFL.txt
-sha256 43d530580461a574f6dfed9e15af6a74e95f7c04d9bfa1174a63ff036e8eee07  ofl/rubikmonoone/OFL.txt
-sha256 40bd3f35477284c021978816e9d3b8723ff2283fd7065fafaa5bb3004e41b237  ofl/songmyung/OFL.txt
-sha256 460966d12f306a007930575c3b8bc336fe0c32f880d622af6d3b745a06ca79a4  ofl/benchnine/OFL.txt
-sha256 f6f60d5d4cf4f4b1fc4e41353c897a2f5a16e6396c0cd8fa8bdfd2f4586a9a68  ofl/alegreyasc/OFL.txt
-sha256 0c922e2d65050677c26ae8dc501bc9ad3e0059c4b10df2fc9717d7bdacdfeb6d  ofl/ramabhadra/OFL.txt
-sha256 548890e4083028f04e5feba04b6e00554654d840aab81c8664eb66c2216a571b  ofl/palanquindark/OFL.txt
-sha256 e39d6ec64a37ed1523a59940695a61ea5e7882d9bbe0e7eb11653fda4b04fc79  ofl/kottaone/OFL.txt
-sha256 1bfe7d2aca99042eabf37079152fef8abdda2c36dad454ae89b858a3cb1078c5  ofl/forum/OFL.txt
-sha256 5505d1a010ee0f2eeecdf624984d2a6170480adab3091170abbcedd85361f1b9  ofl/novacut/OFL.txt
-sha256 715ba72697e14daa9b29a333545f69bde7c497b9f77d0a2a4c4a5a752d961801  ofl/marcellussc/OFL.txt
-sha256 0786594992757ea0290ae4a490ab9249728f372adb13959c0c8ae4fec83057ff  ofl/quintessential/OFL.txt
-sha256 ca13e9cd1faaa6afb9e43dcb534a8984cec3218993fb4b436468a79a1657ee19  ofl/keaniaone/OFL.txt
-sha256 760fb433c515570f6b77ebc60299c2c91d5f03848c659452a9d2458b28935768  ofl/numans/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantunicase/OFL.txt
-sha256 1d1b7f3480c8d9b65c26d205e41dcbfa85731588d6ea50bccfa78e91f242d629  ofl/loversquarrel/OFL.txt
-sha256 1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/prompt/OFL.txt
-sha256 eb6c70cb6b575ad22df022d454df7a20582915e6e8da19b579c6cbef37a26bb5  ofl/gafata/OFL.txt
-sha256 93f60741563b4f51f2fcdb207fde72b2b23292a47022c729aecd998b360d8038  ofl/bilboswashcaps/OFL.txt
-sha256 4579982a484a9745864de2cda666fd7b5017f9182b74dbb4cd53d84c1d1b2231  ofl/gruppo/OFL.txt
-sha256 cd059851dc2abcd2865ae318e8b949736f958794210acb90316530fd100fc904  ofl/geo/OFL.txt
-sha256 af9b97696048d509e3d70f8108b7c4381084f95c8fedd97acaa76b0b287668be  ofl/molle/OFL.txt
-sha256 6958d8c61b6b223f81bdc2109941e5d0004996dde61e197d628e0293f4f1bc58  ofl/miama/OFL.txt
-sha256 7e98b49a12b51240c85b04eb0d9919a6fec7dbd491bef6cbddc22d3f851bd1f1  ofl/marmelad/OFL.txt
-sha256 b9d592c3bf421197d9b7e353416b8e2ec81584988824b43d38c86d997a08b868  ofl/myanmarsanspro/OFL.txt
-sha256 e414e07f7a4da16ed47ebec80d52dd79f21d3ca42bc92385a755d8078a038814  ofl/playfairdisplaysc/OFL.txt
-sha256 0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairaextracondensed/OFL.txt
-sha256 bc85bae0b512b799bbfb2b916e4d0a34cfd963d09778cd783e248b479e67760a  ofl/comfortaa/OFL.txt
-sha256 caa697668c3cf3e622753fb202c6c2e29648b94a3499dc7b869a14192e38c553  ofl/sourceserifpro/OFL.txt
-sha256 81d6c3788a6b641cb9f543389d9d5c0cd3bf94fbb5639be19c102b9274c34291  ofl/mousememoirs/OFL.txt
-sha256 dd028a807788d5e22e9f8cc18f026cda23369954673658f2ecc7d30bdb364b89  ofl/arya/OFL.txt
-sha256 53f9c99fa3d47f7d632a42ee7bab4a834a60a744f6026d676c3a223cef2b2ef3  ofl/vollkornsc/OFL.txt
-sha256 6506b2fa2a14259a8859608a6148a4591d67bbaef4d8e1948b43c4078561b0e5  ofl/tauri/OFL.txt
-sha256 6cca1abc09d677cf00a55674ce2775e0eeb6dc5c0137b0401816680b9e500f81  ofl/marvel/OFL.txt
-sha256 e98ce988fba1c138f4e7c0c5120809706ab1b24a3c29638ca83ab2ff082e08db  ofl/chango/OFL.txt
-sha256 0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairasemicondensed/OFL.txt
-sha256 42e7b456fee0d0dc86927579b3d2626d42bb0f4cc9778f3a92ca8ada4e46348e  ofl/novaslim/OFL.txt
-sha256 1b8eef90c567309fef17962cc969dd9ed1de69176517238e744018bb983e7c1c  ofl/mandali/OFL.txt
-sha256 9e262d6d7fb789aab6a8ecc53fc9c78387eeb9f935dcd289282d8e751b6bf743  ofl/antonio/OFL.txt
-sha256 07dbf75115edfc1fd75580aa19c4c730201a099e8f86a9869887dfbed0547266  ofl/offside/OFL.txt
-sha256 f177d98c67b84250ec87a03ca6ad161e84cab15b435e960039b971797a065f4a  ofl/martel/OFL.txt
-sha256 bb3e8082faf86b1474a6b042125ef0f83669d28110b72f70416a7587b7b9f144  ofl/unlock/OFL.txt
-sha256 c4955dfe15a5db10326aa58ef767460c42cd12a3acdb3e698eee2704eb373d94  ofl/electrolize/OFL.txt
-sha256 cf6dd07485d67d20f105afb9981dffdb6b180b59af45a228839cf3fb0277c9fb  ofl/arapey/OFL.txt
-sha256 87e8d9aca71dbe0481ba8611fc90d7e3aebfa3e2546420c403e7078898b0c484  ofl/allura/OFL.txt
-sha256 55e13d77a4457aa9c60f10c5b97baea3343d3bac30960d49554a033cb9eaff7c  ofl/sail/OFL.txt
-sha256 1c5bc055869d5e9151ec7774082727db720ec4293c65be67f91a4bdcaeb02998  ofl/righteous/OFL.txt
-sha256 de5ff32211a4340b01477af39ee339d639438955e409f79b666d4b9207f3c92c  ofl/dohyeon/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/waitingforthesunrise/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellenglish/OFL.txt
-sha256 44a7c6e4c5572392ae122d3b1d8c6ba6fd640a7797e675384585d947f2773e3c  ofl/jua/OFL.txt
-sha256 1ba345a91338581e5f8fccc3e37e447ddea5b99ec9caec1b76c7c39492387d2f  ofl/signikanegative/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantgaramond/OFL.txt
-sha256 9ee6b2ec20a06c599a07412690876eb457bf192c10e886e60d8bdffb80bc21a3  ofl/sahitya/OFL.txt
-sha256 dcc832bd71ea62cbf97f06327a1b5442905b49ea446801421d71f7d1362db215  ofl/dokdo/OFL.txt
-sha256 8aa063e3a1299c5e1821f386f5ca8bc157ac561bd12c739ffa81c6f0821450c0  ofl/donegalone/OFL.txt
-sha256 e588abf45ca2b19c340c4b27349c9b6b6e5e198316fd965128ed9f4422942cbe  ofl/raleway/OFL.txt
-sha256 9860b97028024085855e503e32c1971bfd603374641cd018c136433ebcf5a338  ofl/gravitasone/OFL.txt
-sha256 ee9d043332991eb6bf2bd56fb04db3c558c1ee2f0cb9aa7b18366c77e34fef30  ofl/jura/OFL.txt
-sha256 15b1a21c3fa37a475ba6b0c0cfe289c7952548caf6e432068ddaf98d139ce419  ofl/belleza/OFL.txt
-sha256 c5a77946a56488790364d060628385d51226da62a18f30d2be0181d82ee62b00  ofl/suranna/OFL.txt
-sha256 36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/megrim/OFL.txt
-sha256 0fbae33ac3aa455c8c0d598347c87f1abfac0d215483f40f5a0e8dd08076df1b  ofl/librebarcode39extendedtext/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/teko/OFL.txt
-sha256 d324289a26909a519fb16c3d468a56ab909ad6d9070cac5742e5d59ad9bd9815  ofl/gildadisplay/OFL.txt
-sha256 c0bcb72e68dd416db0bb9fcec7a7fa62321b0147cde00d8c8f82748e33aefd34  ofl/novasquare/OFL.txt
-sha256 794d72ffdd25e8f7ca8e1d68db088c30ddbf2fdb369b6cc8217d4fa5fa6dc62f  ofl/adobeblank/OFL.txt
-sha256 806cb93632b8091cd36554642a96b2752bab50015da6a2b456d786c1f9aef5a5  ofl/carme/OFL.txt
-sha256 0677891e6a143f297350d260ad766ad33bfc18ed5fa4f213acf648d6b597ec1a  ofl/alegreyasans/OFL.txt
-sha256 08b6f5cceaefcf2881eb009adeb78edd0fabf9c8f0eaf8b88f07a690222227e6  ofl/varelaround/OFL.txt
-sha256 3f0f27931c92453994176af3b1e7954f9aac39fe145374d6d08c47c822e82e59  ofl/princesssofia/OFL.txt
-sha256 2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeoutline/OFL.txt
-sha256 455397ca15d39e9178bbbf4b485a29187751d60f7ceb7829980a521d5ab6848d  ofl/sofadione/OFL.txt
-sha256 b7574cd4c76770e5e3915d16bd93f09663bd77cb041a4ec09d824c52b540529a  ofl/germaniaone/OFL.txt
-sha256 39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/eastseadokdo/OFL.txt
-sha256 520a0c239d39b379b61c4de5f8e3b02db20b0dfc137481843eac01f02c41f4a2  ofl/aguafinascript/OFL.txt
-sha256 ffaf7bc750bdaa0b95b09eb80e419748bfaf46268c6612860f0a5e19e17abb12  ofl/orbitron/OFL.txt
-sha256 c6b9c7322fe0203d4d8a0f98541136d8d76da76b92c79d206b09991b98338cc8  ofl/gemunulibre/OFL.txt
-sha256 2f871c2e81de6d0c72c981615002c30bc9f1637003d6d3d4c3f0149886b70569  ofl/mervalescript/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhaijaan/OFL.txt
-sha256 842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsanvertical/OFL.txt
-sha256 00a6fe8dfdc48d6206bcc4f10a765515a73433dfba7255eff966963beb26facb  ofl/dhyana/OFL.txt
-sha256 cd2dea62cd4b0c5fb335cf07ff04fd5c4bacb49b8d6c2bbbef9766c663d79b1c  ofl/patuaone/OFL.txt
-sha256 c0a8947de199b422d30c16137e4decd5362e3a1d504422880d69c02bd6046dac  ofl/cagliostro/OFL.txt
-sha256 c267a00c9476c78a2336d7b372b536885b8b24173a29ed53496f67a742c14961  ofl/alef/OFL.txt
-sha256 2cc926050c4c6ccd9a0288b7792e2fcf93e5629ee6269e35986f092275e5a1b9  ofl/sarina/OFL.txt
-sha256 f1bce31b817dee01c1e4ef8bc45d8ecb95f01f4abbf0a985007cb3cd0fd8123d  ofl/zcoolqingkehuangyou/OFL.txt
-sha256 9788e3b3e67f22ab5846a0bb867a230e7df2468c3cd20f730a5d9c34e673d090  ofl/rubikone/OFL.txt
-sha256 f3bc8767749fc133d9b35e84ca024b82f1ac4d1b38deca0adcf8300892303022  ofl/faustinavfbeta/OFL.txt
-sha256 ee81f11dd1970e9749afd2a572256f8eefce65532872762a4d7a3d5daa0812c8  ofl/shojumaru/OFL.txt
-sha256 4f4bc3806a1e55789c6ef75ca5fc628297b05292f74966474dc0d40324abc609  ofl/abel/OFL.txt
-sha256 064539f87826887d2062b7823b2b97b7625d68b642f6c945c99c0b8dc8084195  ofl/rationale/OFL.txt
-sha256 a345b13576140008a697ac66ca8c76cd63b1dd076712bc30a0f5e97dcc53cc83  ofl/markoone/OFL.txt
-sha256 203693528d6d2e8dc5e639c6ea42b3e825b59dd6447294e37b306fe734650091  ofl/arizonia/OFL.txt
-sha256 9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/fanwoodtext/OFL.txt
-sha256 3997621a219c7758e31dbafdd3cbd2bcb0b6144a41d1ca068d04dbcc4bafcde6  ofl/milonga/OFL.txt
-sha256 2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeshade/OFL.txt
-sha256 162a3b5c72cba845280a6f887c11d02984540b924510138c8b1eb473bcdafb6a  ofl/concertone/OFL.txt
-sha256 21b54eb0d7513524798a00dfbaf99a02c003a0012a728cc5f0e02d24c50482fb  ofl/caveatbrush/OFL.txt
-sha256 186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlow/OFL.txt
-sha256 9551ade371e7bcb1f6d9959273bbf1fed3bdf398efb5c57cc1fd85d6a13e9e5e  ofl/londrinaoutline/OFL.txt
-sha256 f15a9a3a9a665c2d17655b8fedad86d9a8f30081d46bb91236beb1bc7294a589  ofl/akronim/OFL.txt
-sha256 76a55594c9a18b7d94b8119de838237eb834bae4e8c646d6d363aee587b7b427  ofl/slabo13px/OFL.txt
-sha256 0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairacondensed/OFL.txt
-sha256 96b7bc175186cd0153a9682a1c9bb1da7103ab13a83abef8026bc64582ca616f  ofl/oregano/OFL.txt
-sha256 6fc386ac48a529b85c21f90a6c8d2111c6271b3063f9ddd78e92645db5259510  ofl/tulpenone/OFL.txt
-sha256 13e862ac3f67130f58bd4bebb61c588d147b5a555b1ac6959570799c4f648cd0  ofl/capriola/OFL.txt
-sha256 d24ff874133ecd133e55d7c4070d2edab14d3933477c2bccb3a0d8d1cc9c33bf  ofl/muktamalar/OFL.txt
-sha256 85814924eca98e1fa530901cc5167d0012aaf31122f9570d7e9755443dd9335b  ofl/siemreap/OFL.txt
-sha256 f76c1013cffb3e0de0e7dad19ee5b4b7849c7ab10b67218515e39cfd87e554a7  ofl/julee/OFL.txt
-sha256 c264f64bb2b91ca0dfdeab75d71719120271fa6a30035396416af235ef481c1e  ofl/merienda/OFL.txt
-sha256 d102f22055cfa31a9659228483de3c726010f0b3b416b78e3cbefcb54816e812  ofl/galdeano/OFL.txt
-sha256 2db02cb5d05d5f8a003ffefce36a32a16520ad4cab9ed90635ff953b583e4e82  ofl/sigmarone/OFL.txt
-sha256 cdcc959c42ab255b4cea4bd82f2db5c24a2da7ecabe615d02d5a5dba3716e446  ofl/racingsansone/OFL.txt
-sha256 c88333734ad7cd30540ec6614d12aa829a0395715de30e336d22ddfa3005db42  ofl/catamaran/OFL.txt
-sha256 26daffa24723bb188643085cfc5423f9d78d22a395df4a7928380e430545a201  ofl/bubblegumsans/OFL.txt
-sha256 de2246895f0ac21fe05b095d586d36cbc9f987ebcaed1e050c61e69667caf1c6  ofl/hannari/OFL.txt
-sha256 b54d54664cddcbf05f5b4ea3aec7e89317eb917cf465920969e7b22361e0f4a5  ofl/seymourone/OFL.txt
-sha256 46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiaseriflibre/OFL.txt
-sha256 91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexsanscondensed/OFL.txt
-sha256 5802c9e3509199c7aa9a13ea410ae27febbc0cdea184bf7d227170fac703bba8  ofl/passeroone/OFL.txt
-sha256 2400b30a72d2b1555255b81625576dfb552584a19a9c85ad8d43ff77bceab13b  ofl/plaster/OFL.txt
-sha256 4bed7eaae70cab1bdf2bcf9b1cb562fcd9cc26d1c3533c4ade0ec70516dfb3a4  ofl/trykker/OFL.txt
-sha256 45b1f44d2cb859ea4b7be2f322c57b8ff7be55075c336744e62b5550cd0a97eb  ofl/medievalsharp/OFL.txt
-sha256 19c6ecf65a6b0687dd324b093ced5f1020a1fcabfc8ddaaeca6906cd05153e23  ofl/overpass/OFL.txt
-sha256 ff1f38ac4e694a4ad5bd3d7a5146cd8bd73fd57aae794ced76a24b0d68e41206  ofl/pinyonscript/OFL.txt
-sha256 6aa923334ec515d26b1a61bb978a0bb5bd8884de7529add1625beef2f4a53f74  ofl/nicomoji/OFL.txt
-sha256 cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesansexpanded/OFL.txt
-sha256 38fab5a643fa935a4e11edae2d7b2bbe9866b4f4828c2be2f41451b3f27cb67a  ofl/paprika/OFL.txt
-sha256 a5fc033225d145b43fd7391482ae7689825414ce29a01614d651a3012b57c81e  ofl/monsieurladoulaise/OFL.txt
-sha256 ecc91fac753ad9ba5bb7e7819a5c59ee1e3cf89032133c6b4b0318d63c35933b  ofl/alike/OFL.txt
-sha256 6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejugothic/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldoublepica/OFL.txt
-sha256 9cd20277e2c89d47e3997435e3a16539d20173d850fbb42474990f71642e473e  ofl/mate/OFL.txt
-sha256 351740da2d452b48193483f22f64918a6dfd64a7abe225c6187ad3f36e0d9cd8  ofl/postnobillscolombo/OFL.txt
-sha256 aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/secularone/OFL.txt
-sha256 cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesans/OFL.txt
-sha256 136a256d6050ed32bbf96736d70b9099c6359e83dabeb6847cdf6b8ef84319cc  ofl/kantumruy/OFL.txt
-sha256 72060253bd481a8dc18664bb9117072dc07c0f0270a40617c230654821774850  ofl/pattaya/OFL.txt
-sha256 56d9c3529facf93873a2a1626dd038054d244b3af30a1e3ffe0e78bbda1c7622  ofl/preahvihear/OFL.txt
-sha256 1a2debd5ad8e656b26bb3b29213caa8f7e557a2f31454b11ebb6c3e3b59aa5d4  ofl/cutefont/OFL.txt
-sha256 f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/kalam/OFL.txt
-sha256 d941c5b788d47aa469ee54e30f4c12d6a43c45a295f10c568bdf9772f2893b7b  ofl/oranienbaum/OFL.txt
-sha256 5e0da210fb04058a8c0087985d2d456b931c2579811a49655721d3cf0c36b6d6  ofl/notosans/OFL.txt
-sha256 5ae0cfa62a70251d9a2c3c5430ed3bafa480005f23e4b9525488f2318e5c10ca  ofl/mrbedford/OFL.txt
-sha256 0acef93ca37cf19eeb83a1c6a29b78b08377a211c8d80cd27626e210176828da  ofl/kavivanar/OFL.txt
-sha256 c0562e066174197902a4a10606673d189f067970ef89c6013943b9cf182aadbc  ofl/titilliumweb/OFL.txt
-sha256 f8fbefb5b1004615e6d1e84b1c75e68520d91196f600cb1b07620dd2748eff64  ofl/cantataone/OFL.txt
-sha256 2e2cb5a98da665f2ab82a9fd01fb18c2337f845761b0c163f690ed65f3b94677  ofl/sacramento/OFL.txt
-sha256 251f65282ff48a7e8ef3fb661fc99254d9b3b0c368427c98b1edbfe4ca66e888  ofl/katibeh/OFL.txt
-sha256 31bc966c36352bfd33717382786d0458c38ecf540628ab134e0ce35fde801d28  ofl/poppins/OFL.txt
-sha256 f016385cb4b360e7698d22a48c6b58c0634b1ed5c9c17df78515d43887511df6  ofl/yaldevicolombo/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/swankyandmoomoo/OFL.txt
-sha256 b712dacdda5da76c0213f8478886f893b855665c1153ae438bc3e55a7dc525ef  ofl/kurale/OFL.txt
-sha256 74584d937293a9cacdcd2eb05851b71aa1527901c18b87961d2f877c77a1b486  ofl/chonburi/OFL.txt
-sha256 8f187da1eb4f23e3fe7ba68b1cb2e92881a415dd34c46489698454517e273c4f  ofl/krub/OFL.txt
-sha256 3336bf5d4e7eedba48ecb831f37bf676e901c39f2e6a422cceadd9d2ffa55be8  ofl/kaushanscript/OFL.txt
-sha256 bb655534b6c7bf3e547c1368a68a5b1032d0e96fd08b5cc75f3d7a78528784ef  ofl/novaoval/OFL.txt
-sha256 04b895d77ccec5034191e953e8e5884637269be15fe0675fc25039014eb46349  ofl/monda/OFL.txt
-sha256 d724dea493d89a7a9681186e2fb462b7cd551674960ee4142ae6b325261b5115  ofl/hanna/OFL.txt
-sha256 64ecb0c6bf5cd80c3da76035c00671272966afbd32ffbdbcad95a8b56501fb08  ofl/decovaralpha/OFL.txt
-sha256 0cf28cdcf1cdfd35054352816b2d8c81bd6d6f73632198b61507f26dd4dcbeea  ofl/sansita/OFL.txt
-sha256 d69bcd35f4a121b312a64f7e8eb15bed61c9056e9e9cdaa8d513366142c8e005  ofl/rosario/OFL.txt
-sha256 b4cff421cb89d1e32036e818f291f8ab0d3294ada70b5883d5bcc6470b869702  ofl/eczar/OFL.txt
-sha256 ecb52bab55d8d6185712fe8fd2fd98300f5c8c07fad0d0a97b1e579462b0dd3f  ofl/bayon/OFL.txt
-sha256 ed95c33f80ccca002e3a360b683c43368f9c5eb024e5b992abb51af3c10b59bc  ofl/gothica1/OFL.txt
-sha256 66b5c49d384cba754806a891ebd52f2ca08dd05c0eb3c56170192da466a00a20  ofl/londrinasolid/OFL.txt
-sha256 284a5a26e6db9a04259a5690ad57d52c56a4c515ca2ece1943d950f99e709dcd  ofl/belgrano/OFL.txt
-sha256 6cbe0f55c154b5dee71ca4f2418d69e4e916448ef2ab52dc4541197b292efa24  ofl/sonsieone/OFL.txt
-sha256 255d5debbb80eb2ea762644311f266a279e8778f00156655a516e2b7781a63e1  ofl/lilitaone/OFL.txt
-sha256 490b8f3acbce2331adc9b9d3e75ee6fe07946fb29af429a300c7d066b1250b2d  ofl/crimsontext/OFL.txt
-sha256 eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumbrushscript/OFL.txt
-sha256 f2c0dfa02d6f5c444b4babd7bc0b43be77ea85706e8524342516bc41e43c2f01  ofl/fahkwang/OFL.txt
-sha256 4398885e6b303830d81eea03444aae6fb08a44f41b6acd193c88a2f8cd17606e  ofl/srisakdi/OFL.txt
-sha256 c1f8e0feb0babaacf774b971bcfd791e44125b9d61ff074e4c20924e9661556e  ofl/antic/OFL.txt
-sha256 6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2  ofl/notosanstamil/OFL.txt
-sha256 0b1bada9befa95a40d55830fe83fc7f8064e245fea33bdf0f96f57848f3866fa  ofl/codacaption/OFL.txt
-sha256 b41b99f35b507564e54f6b2f5162ad1c21f94a16837c632da6632b376a341f42  ofl/nosifer/OFL.txt
-sha256 e8d0118fa9d640543e7f6848d1d93f47313c7f56b64f73f37291d859cd5932bf  ofl/souliyo/OFL.txt
-sha256 bff4e5087ece354afccd073621197bbb7dd9349943b5ee6aa12b1adf0b133081  ofl/happymonkey/OFL.txt
-sha256 1f581506286e960436548dba0701aab278f7e67f2adc6bdae2958923867d1e64  ofl/hanaleifill/OFL.txt
-sha256 03082243ebc53e2090bc59987f693982ccee83b30516457b11f6a2349b78f5f8  ofl/rokkitt/OFL.txt
-sha256 1152ca18eaa6159634f1eb209c60df360c1c09a52991e392f8033702036634d4  ofl/assistant/OFL.txt
-sha256 012b1870f81b0d97ca756edd9eea315c7fc22657ac2f1cbdfcb6772fed3e20f3  ofl/bhavuka/OFL.txt
-sha256 ce1108854c91696a8549bb21459f1dc74e8a1ec11664d712c3868c40042f1a8a  ofl/rufina/OFL.txt
-sha256 bac36a7fcafc5702d9d928bb81c7de9f8739eaa820e546c3d2cc52730b652af4  ofl/devonshire/OFL.txt
-sha256 ac987f9cbc5b18d3239d88adb57a4e134049811d24ddda2f6383faa589fd2727  ofl/holtwoodonesc/OFL.txt
-sha256 f3ee3eb20a9d565bee2bbc0d616de382a113327d7506565b2f3d3bee5f489375  ofl/bowlbyonesc/OFL.txt
-sha256 965bd2c907f7bb6f36da4f85e83f29aea8b2f720783deebd7ed7b40678e67672  ofl/mysteryquest/OFL.txt
-sha256 cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanssemiexpanded/OFL.txt
-sha256 19e186a088a50835b38b59409a76b8df2d0252ce114a99e79e306231bbe253b7  ofl/dellarespira/OFL.txt
-sha256 aa36087ecd7e9085e5a1439b0a6d0ee35966e8cd2ccaa649bebe62cae5815e82  ofl/lifesavers/OFL.txt
-sha256 2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldwpicasc/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/loveyalikeasister/OFL.txt
-sha256 a9ef1db03f660130790beeb3b5d91b68536a44a98ec2db3097d02a1c5f91c599  ofl/buda/OFL.txt
-sha256 de318dcb99e332a746edb9f83180ee206fc3bce74ff96ad7d1cb219967ec74af  ofl/pollerone/OFL.txt
-sha256 315a576cbc7ab61c9e347b5725893bc8498fdcb8fc10831793c6864bc2cefba8  ofl/gudea/OFL.txt
-sha256 41f82bb4d24b304f30f7136bc47abdd083782e4265c984160f5649d1e78ea49c  ofl/montserrat/OFL.txt
-sha256 5866fd437bf701cd93f2c41ca2a8b33786975c947bee27882d256b408c9b424a  ofl/podkovavfbeta/OFL.txt
-sha256 377f4f9c19e935228552478eb68cc2ed82910988a60ba60e2ac73b09f32d02d1  ofl/patrickhandsc/OFL.txt
-sha256 ec1d7de447a90e4b6d8f2b4f95c7f89a70e315fdb41969bc716059e4f2461fa4  ofl/clickerscript/OFL.txt
-sha256 7039124ec9c84f9d637637da9f80158f0d3681c82d4e6a811053467f7c33d587  ofl/prostoone/OFL.txt
-sha256 16f8621a8dda01f044b8a58489334dbaadfad44ef2fa1d5ce0864cc2f309df01  ofl/inknutantiqua/OFL.txt
-sha256 ae30055f1e31d12f6235802c25a8872bb7053fca8ed4a604c530f4b2ee83e572  ofl/pontanosans/OFL.txt
-sha256 f1ef4c3ef43322403f5c30e4fb46496969cb5c34a2a6e7247b507254b69caa6a  ofl/novaround/OFL.txt
-sha256 cf5c4103b0ecf3c38e7c26768b5caf05e1b3e16d4d87b32d859b3c19ce7c216c  ofl/petitformalscript/OFL.txt
-sha256 ed80dd9539708a531313f98fb081aeeaa395ab5726931a433845d667b019c855  ofl/abyssinicasil/OFL.txt
-sha256 1404cc9279d4ad713a372a5e1e1d20d7b9b000d2397c8529aeb3df5402446600  ofl/cutive/OFL.txt
-sha256 19c6ecf65a6b0687dd324b093ced5f1020a1fcabfc8ddaaeca6906cd05153e23  ofl/overpassmono/OFL.txt
-sha256 0878e7d6e842bc3c45154059a1c2812de0d31dca343fe6bc16abc9afdee3e3de  ofl/koho/OFL.txt
-sha256 636d62f04d7bda9fcf9354f258f6244e7e18288cae036b95122e204f1acbec80  ofl/neuton/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloo/OFL.txt
-sha256 5866fd437bf701cd93f2c41ca2a8b33786975c947bee27882d256b408c9b424a  ofl/podkova/OFL.txt
-sha256 2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungee/OFL.txt
-sha256 dc35123e99a857674b3e8807e9d7df82220d298423d9fc50ce084fbcdecf602d  ofl/jotione/OFL.txt
-sha256 76a55594c9a18b7d94b8119de838237eb834bae4e8c646d6d363aee587b7b427  ofl/slabo27px/OFL.txt
-sha256 ed50ebe2fa922554980909192526fe94966556626d6d440a462c8e7eaed74cdc  ofl/oflsortsmillgoudytt/OFL.txt
-sha256 d7b108fc1f23fb016a47bb40c63d6f6e04cc35a1edfb991638d7f03621bf7f33  ofl/terminaldosislight/OFL.txt
-sha256 71e5222c549d85a1403b6e709b4328b81d7b51ba021b8bd20df89550da80c087  ofl/yatraone/OFL.txt
-sha256 f139d6f43d2a63a8fb3ded48b8ec747d9d59a7fbb13d077d9b96ac88580bc1ad  ofl/dekko/OFL.txt
-sha256 84b11cc0aac8fdb93af94872bc4b8f015caabf4919db63ab7f916ccff8e52f56  ofl/josefinsansstdlight/OFL.txt
-sha256 8fbe530adcbe30c658393c3f2b5a4785d6765afcefdfe47f594730131f3a0abd  ofl/oleoscriptswashcaps/OFL.txt
-sha256 64dc6a7e2a77aa340c49c3e0829703f540f8d64afa506f44eaa6741580716d0f  ofl/gabriela/OFL.txt
-sha256 17d7a7f5d9f0139535ecec516988c4c73a2ec0f225987288f3fd6ee2622d4450  ofl/federant/OFL.txt
-sha256 c0a7efe98e77cbfcf1a5ca43e874e25cf53d9185c56295bc3b5c407f95dae638  ofl/nats/OFL.txt
-sha256 2ee5e8e47cd7d08f60bb9555f72b25912c9e81b13f5bc9a0551ddf943da6ca98  ofl/ekmukta/OFL.txt
-sha256 e5ccbfc32e4d7fae98b467a9af310ac8d2efd5d90e684426cd24f3eb36090a2c  ofl/acme/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/modak/OFL.txt
-sha256 75a77451968e55a1ab404bd953bd8778983e21116d507b890fbcf838e58c8e8b  ofl/pavanam/OFL.txt
-sha256 36931b77dd81fa96fffad91b6acb54931e600845eb81f91ecf1b4459012c621a  ofl/vidaloka/OFL.txt
-sha256 5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhai/OFL.txt
-sha256 1c45059cea5c6798c8591b0a17961a30328747d44214ff9b8f9c62a683bd6598  ofl/ruda/OFL.txt
-sha256 0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/thegirlnextdoor/OFL.txt
-sha256 4dee45deee99672fbe342b2f4b7aa75b0cd12de18a68f9732c77f096bab47e0e  ofl/molengo/OFL.txt
-sha256 5a5cf278190adf8be3e9905c2b21460241cb376c600bdfd6eb7aceb66036c4bf  ofl/telex/OFL.txt
-sha256 bb49cbf811dafcb11e0de081efcdc8385e45ccc85a5bfc3231ec4861d444dc42  ofl/ruthie/OFL.txt
-sha256 b5c3d12a3085b96011fee65555234bb9d31fa7444cf6f8d5ae6b1f5771394399  ofl/lakkireddy/OFL.txt
-sha256 23b896f4937eac954a383340c92dfcac1c6e05ec21cc08ec6de47d30ad8496a3  ofl/charmonman/OFL.txt
-sha256 39602407e30d466bf169f46d690aaae4f5f039258e5642f91a80bb132ce6e14a  ofl/bubblerone/OFL.txt
-sha256 e31de7000a2a13b2e54ad01e788fd29e979fe05ea1fded44d6e71cc06e33bb2b  ofl/ralewaydots/OFL.txt
-sha256 8218df19bcd9786311bf1126815e8d591027aaf7611ef031af5a31c3fd66e928  ofl/arefruqaa/OFL.txt
-sha256 e37fcc467040ecd81bf4cf59c99ef56b20f57918995e82b3de1d5b4e931bc2e6  ofl/portlligatslab/OFL.txt
-sha256 60fea3a0da19167a3efb9c3792a3a15dc9235405d01bbec1233fdf3e79c74296  ofl/freckleface/OFL.txt
-sha256 da15da6b1496d4de18f97e2ad1b722ef8a1c121149c2c93b2cf7eac6ac27b35c  ofl/mplus1p/OFL.txt
-sha256 d51f3341fd7b3dfa1114d3ef0bdabbe57f60eef86a1458019e0077d676fa1fcb  ofl/lancelot/OFL.txt
-sha256 9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantinfant/OFL.txt
-sha256 cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanssemicondensed/OFL.txt
-sha256 5946eec3a7d3bda02825930156e4716198e7753641dd3303a3e8c386c8011909  ofl/eater/OFL.txt
-sha256 b43e2530c7af69fe1800f180d210b6d2745915ed4e0e404495038c861bb6dbf7  ofl/hammersmithone/OFL.txt
-sha256 5a8751bef5a4fc867ae015099267905034345260f14060fa276aac4051ddd8b4  ofl/varela/OFL.txt
-sha256 f6fc9fbae062e4efc1b0306e27715d43cd64a48b8ffba81c22034b8efee4fce2  ofl/cabinsketch/OFL.txt
-sha256 2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntucondensed/LICENCE.txt
-sha256 2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntumono/LICENCE.txt
-sha256 2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntu/LICENCE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotocondensed/LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanscondensed/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/walterturncoat/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/fontdinerswanky/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/aclonica/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/sunshiney/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/ultra/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/unkempt/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/slackey/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/satisfy/LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensans/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/montez/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/kranky/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/arimo/LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanshebrew/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/tinos/LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanshebrewcondensed/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/justanotherhand/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotoslab/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/homemadeapple/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/craftygirls/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/crushed/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotomono/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/maidenorange/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/roboto/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rochester/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rocksalt/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/creepstercaps/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/nokora/LICENSE.txt
+sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/mountainsofchristmas/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/cousine/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/syncopate/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/specialelite/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/luckiestguy/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/rancho/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/smokum/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/redressed/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/irishgrover/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/comingsoon/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/cherrycreamsoda/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/schoolbell/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/yellowtail/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/calligraffitti/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/permanentmarker/LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/chewy/LICENSE.txt
+sha256  0fc8e6675568c02aac6b41dd3cccaf2264fc5969601effe68e09b26635879b2c  ofl/ranchers/OFL.txt
+sha256  ff72e4d89860e64ee38ccf8a5a7e9dc085d5e36115b096a6c7f8bc988e9bec61  ofl/kumarone/OFL.txt
+sha256  643c63caf03855ae29be68035d8888e95eadc767a1d92f163d686da1b0a1cd3c  ofl/cantarell/OFL.txt
+sha256  1d242ab6fbb2dfbba2e7119b00a6328bc59cb2faf7299b844e9b92a2f12c0d8b  ofl/adventpro/OFL.txt
+sha256  01af2625d6247ecd2430d1d1603c579f85989d43b2d9129e08e0ac0df8909918  ofl/tienne/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhaina/OFL.txt
+sha256  f3bc8767749fc133d9b35e84ca024b82f1ac4d1b38deca0adcf8300892303022  ofl/faustina/OFL.txt
+sha256  69c34ca1873308c667ddde663cbf59c0d1cf14cbb945ad010f71d21264249e24  ofl/aubrey/OFL.txt
+sha256  4febcc8d6e539db3e0c652da87bc8704f6d48e71e07f8ddb0974094a3de8da81  ofl/flavors/OFL.txt
+sha256  d24ff874133ecd133e55d7c4070d2edab14d3933477c2bccb3a0d8d1cc9c33bf  ofl/muktavaani/OFL.txt
+sha256  ab5499b975c2dc82f533c6f13c5fca589df4d57c7c400db5f6ca8565ad9c2fd3  ofl/butchermancaps/OFL.txt
+sha256  6a28d4d5d8b4d1ea89ace5a047ac6e0de182acdb8bfa22897bf7702102094f69  ofl/shadowsintolighttwo/OFL.txt
+sha256  7a1d085067cd589026b256dd85af1eaa1087fa0f3d468192724c5138cc14d894  ofl/copse/OFL.txt
+sha256  fd17f80dc48ff767d91d0dd9f821eebfd8b73ee82f55537a9052b6b0107622c8  ofl/voces/OFL.txt
+sha256  186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlowsemicondensed/OFL.txt
+sha256  4aa1da66597f4c5cfde67790992ee55926ef6aaa87b9a10d529ab35e8b91070c  ofl/asapcondensed/OFL.txt
+sha256  301f77908df2b00141b4dcea50cc1a586c3afcee78843bd811088e8263623f9d  ofl/amaticsc/OFL.txt
+sha256  6b6c6721a30480a323cf33acf6a7703dfce46b846827a65f8ee96230060e3c3e  ofl/homenaje/OFL.txt
+sha256  393d494f9ebb5db6a3552ffa03a4c6f3746c22808b40d011b391681da55ca3f6  ofl/kellyslab/OFL.txt
+sha256  ca19ac21c7656f493189093eca52b4239fcc5eacc15ab2e3d67cfbfc0e6e443b  ofl/sirinstencil/OFL.txt
+sha256  980c2b058d331f3c5ca4a1223e549511b71630e4f4a5533879d436d583cb5665  ofl/arbutus/OFL.txt
+sha256  2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsans/OFL.txt
+sha256  7527e73a61f742a0dd050ab2fc7333de71ac7886023c100bca66a0a93b37498e  ofl/headlandone/OFL.txt
+sha256  39b26527bf9ed27b4c85b86341eceea0579f3550bcf448cf06345eaadf947ec9  ofl/rugeboogie/OFL.txt
+sha256  2ac164969308ac200eefc516151934701044f0db5695ae2acc15df2a8d22e5cb  ofl/anaheim/OFL.txt
+sha256  88d3abd47414e7912d0d2eb44ca89e0b1bd7c43cc2ebe58a8a75281ad75a0f60  ofl/stardosstencil/OFL.txt
+sha256  01003114b77326df223f291c48cdf12e95f6a5937437f164347919f2bbde12d4  ofl/josefinslab/OFL.txt
+sha256  83aa5adca2418f091b732a19cc7c30dcb5c00c217051a58f34f5eecb19be0cd3  ofl/average/OFL.txt
+sha256  585c6d2da8bcd8ffa651e0016f2e992a6891b625143a46a1dacf00699a817d9a  ofl/monoton/OFL.txt
+sha256  96e65d9c227a972e38035b849bba1e8b7879eecbb52f278be1e71dd481187f02  ofl/domine/OFL.txt
+sha256  d1bf0acea511ad1f4de53e942cffb8ab0e67c03c6203d6f390d71105d52c33f0  ofl/missfajardose/OFL.txt
+sha256  131d19126a0e7ddd25540fd6bee219cebbc8aee7e8374882998ee6c2f4ff6cf4  ofl/mergeone/OFL.txt
+sha256  042a570b306ab893c6168be7e6e79bbceae46097141357ad0af7ef8bb179ed7b  ofl/goblinone/OFL.txt
+sha256  91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexserif/OFL.txt
+sha256  bc80ea18223ea0db2ed73ab5bfd0cd601906a2b7a163183c6c4ea333be309ce4  ofl/baumans/OFL.txt
+sha256  5f5dbf452c1657370d9280b50d647212a53c80acae6d78e0b5e8c2b26dc62b09  ofl/puritan/OFL.txt
+sha256  90bd333a5cf0ed09264fc3e559d44979373f6c3d983b0f65cc46e952b4eb61f0  ofl/contrailone/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/taviraj/OFL.txt
+sha256  62fab0ba1d5593782cbf048da193f4b1edc16b817577a99d707827513ad80e9a  ofl/overlock/OFL.txt
+sha256  75798d56e448ba4d2aec3ef5f3c2d805d9c6fe2ba688cd3d7162b2dd31e9cf48  ofl/textmeone/OFL.txt
+sha256  eef925ad6afcbba33f7989f5ad826fd68d50cc1ab4d679c52927c8afd40bddf0  ofl/sedansc/OFL.txt
+sha256  466aaa3bbd245e4c91c4e82c0828efe9fcfd913f5b020d75f0918516c2540fa8  ofl/spicyrice/OFL.txt
+sha256  88ac81fcd30e64f6e6b91b61b159c9b700bb3dd59012b72ec61629abcfc7fba1  ofl/medulaone/OFL.txt
+sha256  1d567f7c5f579d9031ae5edfb0108b4681bdd2e036249b228cc2843d3f052a0f  ofl/redactedscript/OFL.txt
+sha256  ce78cc8de3f6edd2738e8c02f2079db7086c9a74314baa5854675f83c33954ff  ofl/kenia/OFL.txt
+sha256  76af3e9e5d8768b17647813a443fcf5df3eb3ced017ee285796625e714d5ea2c  ofl/ruslandisplay/OFL.txt
+sha256  6e54fc004ebeb61322ecab1d86334ebf69e7051632d48eca489beee505d70762  ofl/hermeneusone/OFL.txt
+sha256  8586a7e75681c7297af4cc0641eb2b29e882c5187fe189a1160eceb4e95d4163  ofl/fenix/OFL.txt
+sha256  d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/deliusunicase/OFL.txt
+sha256  197c3f48cff4df3d768230e0bbdbc4305d8b8b9041ea6fb5e00872af66adc5ae  ofl/novamono/OFL.txt
+sha256  08fba9df5c9890f3ab00ee63f63e005ad93a23746f7484f5fe9501a1ad32730e  ofl/allerta/OFL.txt
+sha256  af88d31020bb48a1f78f4384249814d04a44d22feeede2ff4ae79fbb4fcf74da  ofl/rammettoone/OFL.txt
+sha256  397e83b05703a4240be51e2c3a2be1d0d7693d7a2d8b1ff367c26a2b9afc013e  ofl/singleday/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/cedarvillecursive/OFL.txt
+sha256  d416bc9437e1d7d8aba0613395ee49c95ce72d680672e910c6205b545cfcbad8  ofl/cherryswash/OFL.txt
+sha256  513346ac60af1dde9d4a7bcfad3f39909d5697373a8aa1a6ee4376e6d22d3cdf  ofl/niramit/OFL.txt
+sha256  0b1bada9befa95a40d55830fe83fc7f8064e245fea33bdf0f96f57848f3866fa  ofl/coda/OFL.txt
+sha256  2a7b0a41ef401e4e0e955280b07c0a2698932d56aad3181089bdbbaad5760491  ofl/habibi/OFL.txt
+sha256  2d62278530348951887211d79d1dba04acebd6ed3b1c413f6154702efea3ea62  ofl/iceberg/OFL.txt
+sha256  a20db45220b6c4dc9776f24c77dc9ec7a98977d8b3c65b03aabe66b2d08e0791  ofl/cabincondensed/OFL.txt
+sha256  fc1e501d419d84a8f1a800adae092045002d7141241f498237611dbb8ea763d7  ofl/stintultracondensed/OFL.txt
+sha256  9a51726e5f247cb1f07bb8f49c163bc3e9ddee5f367bb5a1871d09b854ed1b7c  ofl/basic/OFL.txt
+sha256  ce0023bc03e1428feb5abfaa939b601d2d827ee5a6c84a2657993a7b16c5290a  ofl/diplomatasc/OFL.txt
+sha256  e30f893523e50ebbe07acd783ae29c7d604e6208cae7646d993e8528ce13e35a  ofl/federo/OFL.txt
+sha256  9d96f445b6e9c701428811d0177f894874f8d6f07ecc30d568c506542368f3ff  ofl/sharetechmono/OFL.txt
+sha256  46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiasanslibre/OFL.txt
+sha256  5951473ab31533bfe1452bbcece47f237a5546c7e7d45ff1aec0289619623294  ofl/fugazone/OFL.txt
+sha256  aa5d677391db4e54ad324b6888792e533c5d800de7ab713302a2fc8bff2f4f6e  ofl/miltonian/OFL.txt
+sha256  e0cde1a4993ed689d463d5e2401f4a60c54cc48a14253ab0f8012d722c417038  ofl/mavenpro/OFL.txt
+sha256  c1eed37b6d213df4edf8f92ec7d1e972f751abd68ecd649b4f0b8e5d8e8561f6  ofl/yrsa/OFL.txt
+sha256  5bbeae56b9db61a9bf85b64d5ed9a74cfcf9ee3e9b005bc2906859ddecd5eaa1  ofl/esteban/OFL.txt
+sha256  7b826efb1b74a50b1c1aef0a1ba4530925b993ceadc3016d1d787c68a61649dd  ofl/tenorsans/OFL.txt
+sha256  28c6d2887c3dfa42488c5418c6c16ead580d33ff0afe60c05159689201f9ec63  ofl/jollylodger/OFL.txt
+sha256  ce0023bc03e1428feb5abfaa939b601d2d827ee5a6c84a2657993a7b16c5290a  ofl/diplomata/OFL.txt
+sha256  8f2e5a9b52cf355023104413827e17dd7126c5a3656492d45eaa1ceb270aa4f1  ofl/yantramanav/OFL.txt
+sha256  fe079cdbbad0f6520eb0a8235bce65b21596dd0c4c5a2694b3325cc87313b618  ofl/shortstack/OFL.txt
+sha256  018d17b5e04c0a217a21979fa6b6d77bd5a143a5f06ea2ea102e427abd1ebfa2  ofl/tradewinds/OFL.txt
+sha256  31c59bcdd538c113ef5c048f56827439facb12b7e5cfd158b04c83727edc453b  ofl/salsa/OFL.txt
+sha256  eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumpenscript/OFL.txt
+sha256  ddf311c28ddf5a5ad9747649837346b67bed9d356789c3072bb27dbce49e514d  ofl/ptserifcaption/OFL.txt
+sha256  c867d1a613bebc4932cf28c060fefb3bcfba3be56ed498b873c79f4eb786af1d  ofl/librebaskerville/OFL.txt
+sha256  694282197de3d750a43689dc64a8116cd19578cd516e7b2490c7b5362c064dbe  ofl/kameron/OFL.txt
+sha256  cb30d3086a8b3ce0b9e3690bf48d6620402b61160bc658076f95180ccd9e9dae  ofl/sourcecodepro/OFL.txt
+sha256  a40c3a6d0c968d3a10b17a2614606de6f20178deccc2447305f31fb106a57fb0  ofl/fresca/OFL.txt
+sha256  5d3457831b42632d958fe1a14a09706d8acb006486a5ca5b2b419cd61cb22e32  ofl/chelaone/OFL.txt
+sha256  6b53fb03a50914cc382f4d025ee595c17c43f24ae870f840bc51969d3e316c7e  ofl/limelight/OFL.txt
+sha256  574430e571a6928624f4bdf044420f7547a26309b7ebf6962296d33294e0a1e0  ofl/combo/OFL.txt
+sha256  fd20b82eb12d16ec31a58fc44f7e6c533b14b425b569d83f616a1f7a9a401e75  ofl/gochihand/OFL.txt
+sha256  0e74984817cdd51dbfbd8309022aa75f733e80dff0cb1d26ad2157e90446ba97  ofl/enriqueta/OFL.txt
+sha256  ddf311c28ddf5a5ad9747649837346b67bed9d356789c3072bb27dbce49e514d  ofl/ptserif/OFL.txt
+sha256  4e69611ba5017f1fde74c31d342f5c85604814b1b45387b9ab46205996dec38e  ofl/astloch/OFL.txt
+sha256  013e33b6b2919fd0ffbdde6080a1c0f4521689fdce0f4876a59cf49ff8ae31c0  ofl/geostarfill/OFL.txt
+sha256  14b3fbd06078a869cf2ba96e6dacb852d373703c86ca7ad54a4cdd6e20fbab19  ofl/knewave/OFL.txt
+sha256  a8103c045a88bf9b28dcd7eb60a6662008f49afc0f3721bc46aaf761fc0409e7  ofl/englebert/OFL.txt
+sha256  bd22e766af8f8e58eb520cb4fa73538826d04f7371b45e82295d22d1e32a4e58  ofl/gidugu/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/justmeagaindownhere/OFL.txt
+sha256  5fba78215eb4e42aed6cb0b5c5df52e0f71246281a866cd4493dfcfcbcab9518  ofl/playball/OFL.txt
+sha256  e75230ee246a04912366cd8d759d081200d80fb0756766c96dd52f73e8b40bed  ofl/romanesco/OFL.txt
+sha256  39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/gamjaflower/OFL.txt
+sha256  244ca4ef7b106d8c660e9a00cecf5d581b6a222f447d7d59a8f61711b2ad3400  ofl/uncialantiqua/OFL.txt
+sha256  36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/didactgothic/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/giveyouglory/OFL.txt
+sha256  638774cdf8233b5ddaf9ebee1821e9de1d5d59c335d8ee3ba0b47fb17833b502  ofl/glegoo/OFL.txt
+sha256  842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsan/OFL.txt
+sha256  a10a07aaa150c147fa3cb22e845013f38e6c2b45fe5ba32a74ed1be9d4c417ae  ofl/odormeanchey/OFL.txt
+sha256  a74380bba78a364ec70b3a5fb6a1161b83cb05cc3e75a0910afbd1b5aff4f9c8  ofl/jaldi/OFL.txt
+sha256  9b8405bf5f503f92401fc990f372b34d469670ab60041d5298d1015d3d0b45f8  ofl/thabit/OFL.txt
+sha256  7c05152b2380228795cb474819744653fb03ddbfe5990b912ec7d9a41387230d  ofl/asap/OFL.txt
+sha256  ca9fe3a0e10bbb082f83ecdc07f5f04845c4bd689c46456da3e6bae23e11aae2  ofl/inder/OFL.txt
+sha256  5b158abb3406e69b7408b562b7199f6ff55a41ea56e260b87176d693b0095e47  ofl/piedra/OFL.txt
+sha256  b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendradisplay/OFL.txt
+sha256  87b7d831a81fe8b37e7e6c672937493f710ff81883eee3adec7b5423297efd16  ofl/sharetech/OFL.txt
+sha256  4ec46c3e4469afa19f0156bac6917472974f9c85c189f9220cf8735d3e810401  ofl/kristi/OFL.txt
+sha256  93f60741563b4f51f2fcdb207fde72b2b23292a47022c729aecd998b360d8038  ofl/bilbo/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindcolombo/OFL.txt
+sha256  afc1b710d644c1262e1765d2401abcf93a545a4cb051955e2243fbabb8164e25  ofl/carroisgothicsc/OFL.txt
+sha256  930fed5b06a415736dc3b4e5f4f01585523b672717564bf677f93966bcd57636  ofl/lustria/OFL.txt
+sha256  9a536e5a3b55c2605b0a553eed383cd3efa42ba48dc45cc6f0635b3c53ee791e  ofl/warnes/OFL.txt
+sha256  879ec56fcc9a961937fd24d542b3b7b3f2b8cb3236b7351e62d16719e25de14c  ofl/griffy/OFL.txt
+sha256  29cca754098468057880970c604e55c4e2bcb8479742e4130c94f2ddc0363f9c  ofl/sixcaps/OFL.txt
+sha256  67261c7ceb3e627da5c94d6617dac6da29bf36b910bee304a7680ad62e2c8b46  ofl/changaone/OFL.txt
+sha256  327bac41d89cf9f32e0efe353228018e1661cff458a5d4905714958514df7bd5  ofl/lalezar/OFL.txt
+sha256  525411e604e7a1d85a4cd42641869f94388f04a6ed77829d6c4edd7fd740ceab  ofl/ramaraja/OFL.txt
+sha256  3d08baba63f1f2427fd96dee8da30b1ef6c1421b3be0e1f07cc2a78abb27c91d  ofl/seaweedscript/OFL.txt
+sha256  4c0a1150a363b42bd8681ff4a00315ac49510a944c4c9978237ff8b90a8920a5  ofl/grandhotel/OFL.txt
+sha256  bc4c7eb365ea342b1a027fb8417fb0152f5d482a2e31c012fbfa29b668827b04  ofl/cutivemono/OFL.txt
+sha256  1818771d183d203703c4b134f028527b535810e2a0666c8fe2785354ddbef686  ofl/battambang/OFL.txt
+sha256  b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendra/OFL.txt
+sha256  9e0d3db586ba0abf5ca398683809dacdf4c81b2960f592bd085fbf206a67ddb0  ofl/sansitaone/OFL.txt
+sha256  fb1dbf3725bbdd389b2c569e0eed5091d8d10eed2833ec7efacfc3542e408615  ofl/scheherazade/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorant/OFL.txt
+sha256  156ea6985861158c7dea63ecaac4c78ab0ed737d168ddffc3e34c687985a033b  ofl/sansation/OFL.txt
+sha256  a9b3e7e1cf5735dc49d802b88b1858a2a50307ba2a877ddf3f0b27d8b1d0abc5  ofl/blackandwhitepicture/OFL.txt
+sha256  5fe7f3c9410c29534ddd9dfaf64d3994ed4236096d0d543ae69eacc3b25632b1  ofl/bitter/OFL.txt
+sha256  f6f60d5d4cf4f4b1fc4e41353c897a2f5a16e6396c0cd8fa8bdfd2f4586a9a68  ofl/alegreya/OFL.txt
+sha256  e88691a5e0a8a3f788f31db959701ec90a1d5e7505f1cc53c5663180a7d23c81  ofl/lohitbengali/OFL.txt
+sha256  ac55580be2df22a06d29a47501e2ae11e1d399620f5a779e17a66f016ba6d5ff  ofl/portersansblock/OFL.txt
+sha256  27d9af34210253e7ca1251fbace86c6f65b40031d6ce1a75493a1b2093631298  ofl/vt323/OFL.txt
+sha256  9452ef55386e77bd284ca466587d72802337621d7f10aa700e449753883b3397  ofl/trocchi/OFL.txt
+sha256  a9b3e7e1cf5735dc49d802b88b1858a2a50307ba2a877ddf3f0b27d8b1d0abc5  ofl/stylish/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindkochi/OFL.txt
+sha256  3173acd82f8c6159b5b1037b539fcbd4edff68e65c2ea8b9412b5a5ca97b08ff  ofl/archivoblack/OFL.txt
+sha256  c832a4230a713d080aa2f2544d9a298ed911f689b2c48f7f276a0196b16d2b8a  ofl/cookie/OFL.txt
+sha256  ae28423a5e63cb65e651ccf62c9091b322fff1d2d4e87ad9f98b1096c2e7abb5  ofl/metrophobic/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindsiliguri/OFL.txt
+sha256  8c22fb3866eaebd77a2cb8e8ecbb095381ff32300db57758326fef35a26132f5  ofl/ranga/OFL.txt
+sha256  d2875ded3e44e9ae53ea2b35e825dafffa19e82c5d14addb9f1150fcd7a3463d  ofl/mina/OFL.txt
+sha256  8242e7737bce317f7a7f2b887ac87f5bb21305ab96bee92aadc3febac16c35bf  ofl/voltaire/OFL.txt
+sha256  fca01a37b10879d7685c7d03fc5a04086b15cdb2cb4f870cb687aa5a9a0a1361  ofl/jimnightshade/OFL.txt
+sha256  2492bb8645caaf622bdc3e880cdc9b069921e7341346d7b193666c866a1935d0  ofl/condiment/OFL.txt
+sha256  e6ac721b16f309c89fb443680afda427ea34968bad190a80edf281d01d65fa99  ofl/andadasc/OFL.txt
+sha256  1e5d6660366ddcfca4f2fc10e2acfba9fa4d97d40aec80d7dbfd41d730a420ae  ofl/cinzeldecorative/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/coveredbyyourgrace/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindvadodara/OFL.txt
+sha256  5c36e7ec460b285185ea23847aa1f508708d9ce15d5c055279defd022972f836  ofl/rakkas/OFL.txt
+sha256  0b7eae990329ac175a2e1c329060b3a4d6876e4e0cd7e5235511578352f7b191  ofl/biorhyme/OFL.txt
+sha256  c54957d55e7c9e66c28e474cd39de75dc044e8f69056788cae44eb78841ceef1  ofl/montserratsubrayada/OFL.txt
+sha256  fccf4916b5f84ef5f88d93fec464421aaf4121d11d4be8d74ee2d032f7661d6c  ofl/padauk/OFL.txt
+sha256  9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/prociono/OFL.txt
+sha256  0c3f4763f49c2cd37757a2856ad470aec6a416981ac6d6e3f900c1128be39de7  ofl/elsie/OFL.txt
+sha256  0d5fa0cce86012de872273700eef4fd162459e7c24a6a314911380627391071b  ofl/bigshotone/OFL.txt
+sha256  ca64dee162bf239c7b92d854d388bcd30552edc3ae1ef5e31714acda34c988db  ofl/jomhuria/OFL.txt
+sha256  bd77eae571de83ba3884c74c7983e8ac5cdf858badc36906179346dcd7e82454  ofl/gentiumbookbasic/OFL.txt
+sha256  2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeehairline/OFL.txt
+sha256  9c56b4e2e4e922cc37e19e1a9e2e1128beaa17a812e1b67c8ac371b0fb57ae03  ofl/kopubbatang/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/tillana/OFL.txt
+sha256  486c4d5b9baf0d0ba5546ef3c43fcfe22c062299ab6948045a43efffe4b0f74b  ofl/italiana/OFL.txt
+sha256  4539710406c656519f8ddc789056a7cd6f4fe66b44cc2f52ebca6e251bb26e13  ofl/imprima/OFL.txt
+sha256  7f55affd2bce8ed9be13297ba8df1a4a7e9835c2a006126dc2a1eb4ce75a7943  ofl/muli/OFL.txt
+sha256  867b506cb023eae20c1accde77b2e0abf7d8a9e2620da8dbebac9f7b1117ca0b  ofl/cantoraone/OFL.txt
+sha256  aa72b0185d828cb2fafa62a154e84bd3e20c88ada30326089bb20542b6363aaa  ofl/manuale/OFL.txt
+sha256  4664e83780a263c53dbab95d3590a5a9db914aeb9a3c78f7e7ad451f9151c998  ofl/spacemono/OFL.txt
+sha256  fc59ca3cd3bcb47bd4df597519111ec130c25cabcc57a8808dd2d243cdcec6ae  ofl/oldenburg/OFL.txt
+sha256  43c372f43d145c22e654781860506a75cb85b086dc76028a62a28a446506d253  ofl/italianno/OFL.txt
+sha256  a7fe1f3d23034092b015aaeb53d2ecbc9e592be96b10bdfbcf8700ec6a6ffc97  ofl/fascinateinline/OFL.txt
+sha256  d13a278247ce39695f5ea6b721103faa668083022c5280b78c6392263e473929  ofl/bonbon/OFL.txt
+sha256  f0be7437bbb8b91ad4a4f7a5f3d0020368e494a803d892df03e8886d51f2db3a  ofl/candal/OFL.txt
+sha256  a68d8ec6bea7f277053ae93bf563d4b97c233f09f8e79f86ffe5db66f31fdddf  ofl/prozalibre/OFL.txt
+sha256  b00c646b7d04a6da1665a148815b8c589c1e05ed7e1febf7ccbd91758747cb03  ofl/quattrocentosans/OFL.txt
+sha256  a3deaae17ab9a15dc3c2778126aa6f80d41d567741853f84b16a9e1318ed799a  ofl/koulen/OFL.txt
+sha256  50f7b09af5ff677f611a96cdf5eb916307c59b29f2e8144942718cb432a9bf6f  ofl/margarine/OFL.txt
+sha256  72a22b6dd29b6b0cdcc98de30701b46532c9f7314ee095df3063d10775dd70c3  ofl/trochut/OFL.txt
+sha256  325e890b8b26fe0a683c3ba24c506d902bdd7034d9c47bd7fa2bb72b5433b9c9  ofl/shrikhand/OFL.txt
+sha256  62fab0ba1d5593782cbf048da193f4b1edc16b817577a99d707827513ad80e9a  ofl/overlocksc/OFL.txt
+sha256  d941aa56e280b4f204272c4b1add01a8ebc7af3e8e69ba8ba9118aa2a5306dde  ofl/berkshireswash/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantsc/OFL.txt
+sha256  36c285c5472c625901d4a13da7e31c5ea6126678d31d56cf95572c49f27c8950  ofl/passionone/OFL.txt
+sha256  fbc351e1b5428e4f45834647dc23a5f8aaa3e744e2f4117ca03c44f640b9a3a2  ofl/stintultraexpanded/OFL.txt
+sha256  021d5f1df697848da51620394659187be77cbe382ff2f896bc84ffb89c0c2d52  ofl/portlligatsans/OFL.txt
+sha256  85b700bfba1250a6f8bdf930cd7113faf3d8e9dc52cd89eb98c3ac8a038a4aa9  ofl/londrinasketch/OFL.txt
+sha256  c972795e48b096b6d4e3a947b0bb21c1baf1922a6e07ff9ada587c058f228740  ofl/coustard/OFL.txt
+sha256  eb4a7a082fb0e7dde0a8f975d33f02907ccbe40751c8115e790cf3679787d01c  ofl/strait/OFL.txt
+sha256  9b1cfccef4a7e19f90e2901f808f3aec4335d3cc81f978453ad0c8ded14447a0  ofl/novascript/OFL.txt
+sha256  43c89012c2b640187aae7e0c83d5ffa8381a0368c00e8426594358d44d3811e3  ofl/nunitosans/OFL.txt
+sha256  fdecdad755f4e5e95bee491c7521f31625dc08283562ea8579543c90430eb269  ofl/karlatamilinclined/OFL.txt
+sha256  5e80642a11aff2ead815949a8a929aff3fb7b9b6a24391406068a1b204dcc8ba  ofl/abeezee/OFL.txt
+sha256  bd77eae571de83ba3884c74c7983e8ac5cdf858badc36906179346dcd7e82454  ofl/gentiumbasic/OFL.txt
+sha256  f2fcbde4b8968400d661e7dcc23052b1885815c8e3b45323b26cbb833352f5de  ofl/timmana/OFL.txt
+sha256  c8af073a60e30b55ef5d0e4f80cea168e06dd65bdee7ec18c1ea8de8f7228780  ofl/strong/OFL.txt
+sha256  2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeinline/OFL.txt
+sha256  013e33b6b2919fd0ffbdde6080a1c0f4521689fdce0f4876a59cf49ff8ae31c0  ofl/geostar/OFL.txt
+sha256  e55c615ed00ce0054bd356041a41e5942b4a8cadceac1e32696ba2ef5f06f748  ofl/andika/OFL.txt
+sha256  4705fc9bceb299b2a951d23c321d31f3679871bb99ceadb978907704d211f4f2  ofl/pacifico/OFL.txt
+sha256  2887c5bb38abbde9ccc608c4dcc4b0dba0fefc0c74eec011033bcfbd3ffcb235  ofl/jacquesfrancois/OFL.txt
+sha256  99d67fff016522688b8f913377f8ae9f6da6ffeae42cf67c0e5e87cfb0928d33  ofl/unna/OFL.txt
+sha256  bba4a13f03d0fd5b476cc148feda6895dd8d65f34b2107ba9d010ad9539d6c0a  ofl/faunaone/OFL.txt
+sha256  842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulhangang/OFL.txt
+sha256  58bbdbe5c48dd1d7cfd658425a455c29811181873d3a46a4932c29e5b0ec16e6  ofl/euphoriascript/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/laila/OFL.txt
+sha256  17b90cece30db64934b7299fd76b033a3774c8a990e78badc74c59a5be8e0727  ofl/cairo/OFL.txt
+sha256  5f8ff4a3f951c104e99245bdb952be08c73369222048bbf19fa3bf7170d10949  ofl/sanchez/OFL.txt
+sha256  8eb1c1019fe7fe6d0b6e7d7bbbba1d9cbdd969d8c5f26455708f6cfb8a77284c  ofl/nanummyeongjo/OFL.txt
+sha256  942d51cf079299e83e9dd7a9a37eb92260524e8d1d576b2f0b3f7ca207c53f8e  ofl/newrocker/OFL.txt
+sha256  117fa195cff980e3b10fd8e8e21658c6ec954b0886647970a03c9694d3553b69  ofl/galindo/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/athiti/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/annieuseyourtelescope/OFL.txt
+sha256  f2ab7e5c5c750fa03a8d8f64c72a089ed86fbd3dc172440fcc704b27816d5957  ofl/noticiatext/OFL.txt
+sha256  9a33b452a3107542c35fc5fcee80e4d8798c82aca071c2f6f58a0f8dc5ad61fe  ofl/cevicheone/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balootammudu/OFL.txt
+sha256  8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasansextracondensed/OFL.txt
+sha256  746b384383888d9325ed2fa9c40d2456b458aa190dd2b8c515ed4f02a1075bb7  ofl/magra/OFL.txt
+sha256  8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasanscondensed/OFL.txt
+sha256  fe9183a0b7c1ae626b14004cd533c89ec7c192aba017f81ab71ede910256abb2  ofl/abhayalibre/OFL.txt
+sha256  876db27db250a9b9c03fc2ef30a5efe1f37c2ed2686d368c3779583bdf746912  ofl/balthazar/OFL.txt
+sha256  4342add6f0f2261f8579f31c10a55938930559703eed18be4a33b74eb749d298  ofl/doppioone/OFL.txt
+sha256  d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/deliusswashcaps/OFL.txt
+sha256  16a8be6ac4b009ba1dd1e17cea48762f4915609ea5dca1303f716cf63998739d  ofl/adamina/OFL.txt
+sha256  1d567f7c5f579d9031ae5edfb0108b4681bdd2e036249b228cc2843d3f052a0f  ofl/redacted/OFL.txt
+sha256  866669fde730bf2785f44905ec162f05f2b8d9f6dcf366aca99360fedbfe502c  ofl/dancingscript/OFL.txt
+sha256  008445a4d53fbd71bff9cf733bdfd841a1b15fb58ef3473f7bab4c456e3b2930  ofl/ovo/OFL.txt
+sha256  b7eae5e3c3447f70caa14e0c43f5e0d953f54ee59df406f6362863bcee1a0a95  ofl/almendrasc/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellgreatprimersc/OFL.txt
+sha256  95d23e4559ea8c6a36aa04fab56e1dca0780f5d93734072d4501023296543102  ofl/archivo/OFL.txt
+sha256  3747fdcbfe4f51d6a2f101c35105bacde3715b3c32b34b6b03e5fb37983f89fc  ofl/quando/OFL.txt
+sha256  38a83f1f8b6efc3ab354b8b6eed22e8524dc71280844dc24811d95ae27b34952  ofl/khyay/OFL.txt
+sha256  b8fb5cd1bafb52e652c733fdb75ee20c763e97acb0398f6b4bbe1d8ada0c07e5  ofl/misssaintdelafield/OFL.txt
+sha256  a3b0977c5c25101d45054cf9199b9127b05fddc79d4da7dcf400821824e5a6d0  ofl/radley/OFL.txt
+sha256  41f82bb4d24b304f30f7136bc47abdd083782e4265c984160f5649d1e78ea49c  ofl/montserratalternates/OFL.txt
+sha256  7c05152b2380228795cb474819744653fb03ddbfe5990b912ec7d9a41387230d  ofl/asapvfbeta/OFL.txt
+sha256  d3909465d5838d9d1c72b975ff1ed4f410a85dccd43801be525bf2b2bde89f92  ofl/snippet/OFL.txt
+sha256  2ee5e8e47cd7d08f60bb9555f72b25912c9e81b13f5bc9a0551ddf943da6ca98  ofl/mukta/OFL.txt
+sha256  f323edc1e5a6d8fa16120aa15367cdfb15468474cc621f9bda1a2f73c5d08d73  ofl/sedgwickavedisplay/OFL.txt
+sha256  eef925ad6afcbba33f7989f5ad826fd68d50cc1ab4d679c52927c8afd40bddf0  ofl/sedan/OFL.txt
+sha256  4281c00ab5b8f672fc8d686f48cb886ffbe900c8c9ee22473ca7e72e7cef8fbe  ofl/wellfleet/OFL.txt
+sha256  8b89f3af5fd02216793ff3dfe9a04dc22dfe5c213422ae21558ff1da6a1e94dd  ofl/cabinvfbeta/OFL.txt
+sha256  4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laomuangdon/OFL.txt
+sha256  399b33eb38cdfc76b8665defa5f81d52e8193d630ad5858c893db6bc20031bc9  ofl/rye/OFL.txt
+sha256  aa5d677391db4e54ad324b6888792e533c5d800de7ab713302a2fc8bff2f4f6e  ofl/miltoniantattoo/OFL.txt
+sha256  8594350034ab1cb85a1946ef8852e69290255816c311450a66fed6eeda9d6292  ofl/anonymouspro/OFL.txt
+sha256  1e5d6660366ddcfca4f2fc10e2acfba9fa4d97d40aec80d7dbfd41d730a420ae  ofl/cinzel/OFL.txt
+sha256  351740da2d452b48193483f22f64918a6dfd64a7abe225c6187ad3f36e0d9cd8  ofl/postnobillsjaffna/OFL.txt
+sha256  64a73da7af818283168543e24bd214aded1bfec06f013bf9cebc20064a8560c5  ofl/elmessiri/OFL.txt
+sha256  4fece81b541808b40293b0cd3f5b1990274e1100e1c20455dc2987cd96639d3f  ofl/metamorphous/OFL.txt
+sha256  8d325681662a30f58f57c92ab656dcbc9679deb78a493e4c0eab75321b2df6c3  ofl/worksans/OFL.txt
+sha256  2887c5bb38abbde9ccc608c4dcc4b0dba0fefc0c74eec011033bcfbd3ffcb235  ofl/jacquesfrancoisshadow/OFL.txt
+sha256  aac8f0cda6159b7251d1034651bcb42e07611495bc8cd764c89d22f3123032f8  ofl/aladin/OFL.txt
+sha256  81d0973236b5b5709a80a217a330db36eabedf57bf4031de46b4660b69901234  ofl/leaguescript/OFL.txt
+sha256  5454dc5cf2f46a2005f42f13ee2a998c7d0afd7f556f32fda208c72b266f7adc  ofl/cambo/OFL.txt
+sha256  b2d4b0c773afce947728ab99fca43b242b7edb0da26fe29f60c7c2d5094ec23e  ofl/suwannaphum/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/labelleaurore/OFL.txt
+sha256  6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejumyeongjo/OFL.txt
+sha256  cbdf9d35f32a9a2f02fb23c8b89c115a5a8e45feaaa2266920c4594c83dd5ed4  ofl/tenaliramakrishna/OFL.txt
+sha256  95d23e4559ea8c6a36aa04fab56e1dca0780f5d93734072d4501023296543102  ofl/archivovfbeta/OFL.txt
+sha256  967d75b89eef1f8a0ba1f5ee7dfb13427621f9116c6e7878ca04da8c9aa8641b  ofl/mrssheppards/OFL.txt
+sha256  8af83da84dd4299842f871285a88049352ab301ffa1f233d2595b29506158635  ofl/blackopsone/OFL.txt
+sha256  548890e4083028f04e5feba04b6e00554654d840aab81c8664eb66c2216a571b  ofl/palanquin/OFL.txt
+sha256  c4cd9f38c3246ee6a68c264f017320dc1af09677d386166d8cda806d9a12e0d2  ofl/jockeyone/OFL.txt
+sha256  a36ab46c8b1a74a480a1c51d6a5af08b643e870c6d247f233bc97c97c8ad2098  ofl/tuffy/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/nothingyoucoulddo/OFL.txt
+sha256  b5c776129b160163c84620b35fd45dea45edf49789cda5a94c2290c230581e0b  ofl/scopeone/OFL.txt
+sha256  dd028a807788d5e22e9f8cc18f026cda23369954673658f2ecc7d30bdb364b89  ofl/sintony/OFL.txt
+sha256  8928e999ff156e35852ab41d7a906598a8285acd3bcd81dff67213a6cd98d43e  ofl/mallanna/OFL.txt
+sha256  473c5e3123102434d05c66a9fc8b19cf285a3bf71cd8a91a41acef44d1448e62  ofl/sevillana/OFL.txt
+sha256  22d1914919d3fe08b179dc31169fc743ca7eede7827b91a5d48c23c8cdc7cb81  ofl/anticslab/OFL.txt
+sha256  026610186158060ad351fb20cd1452def5d35b2531634c090ce8cd1d9e9aeaf2  ofl/michroma/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/shadowsintolight/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/architectsdaughter/OFL.txt
+sha256  61056041809e0ba18bf8b9d637a375ab1c725025428533d74d668d88b2cb8b89  ofl/simonetta/OFL.txt
+sha256  0a852a06f0256a6684662663ccb1d8e08d131abd1f70cf8d972a344cf31aa381  ofl/scada/OFL.txt
+sha256  f46c3ea04f38ea73c0731d73dfba3d7361d4b38970feb31a3558bd1b75e0656a  ofl/lobstertwo/OFL.txt
+sha256  f30a7045e4e21201182b2b9fc4e4b96189aaeaceb2c8e9b68d8bd3dc4e3c5a27  ofl/greatvibes/OFL.txt
+sha256  9bc1eb1c679510b32d2e3f5f4f3b47726b1657aa121494aa68ba0b124a3c3a53  ofl/ewert/OFL.txt
+sha256  1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode39/OFL.txt
+sha256  359671bf16c00cae69cb66d041296b2adc7a4becd73a463cb8c5e101d97c7986  ofl/arvo/OFL.txt
+sha256  c09e3b81d9cfeec46bc29a3374000e8ad013d694bdf24a288088491dd4cd5c69  ofl/creepster/OFL.txt
+sha256  29bd0cfd0fb2a45f9b057c834a057724bae1f63b525a8ac83d3e7525706d9f80  ofl/inconsolata/OFL.txt
+sha256  85814924eca98e1fa530901cc5167d0012aaf31122f9570d7e9755443dd9335b  ofl/siamreap/OFL.txt
+sha256  223fa23e8419ee762c662e0faf912dfcf386fa7093ac9ff690e380ce1993ba55  ofl/asar/OFL.txt
+sha256  a0369b1d5f654110f2fe101db56a02d02806f1e609ab233368bc573ec45050e5  ofl/butcherman/OFL.txt
+sha256  4f8b437578b20bff261adfe6c02f63bcf7dbb6a45ab37804b3547e5d5f44927b  ofl/nosifercaps/OFL.txt
+sha256  793891edf1f4f4f35b52fcc9706b03f779c7ea18ab8e9e441242d63ef0279488  ofl/autourone/OFL.txt
+sha256  842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulhangangcondensed/OFL.txt
+sha256  1c023b4aca0e441c55c45c86cdff57fa524a96778f291d9a29a4ad777b70e2e3  ofl/arbutusslab/OFL.txt
+sha256  de61c87e08286ad3215398340e9403125ab03c91b33bdf29de6d3e8a386d2d28  ofl/dangrek/OFL.txt
+sha256  53ad6a474f68ddfc3fe72449de3ede4d3f033b2f24b77833b1d56edf505486d2  ofl/sura/OFL.txt
+sha256  247edbf968c0a5b8defd6a9e420080a8bbca6ea002bfb326d12a472a6f95637b  ofl/cuprum/OFL.txt
+sha256  0623888cc2391c6c9853c04eafa7f687fef1a8328bbb848feab05d9e2a98764d  ofl/emilyscandy/OFL.txt
+sha256  1c43e70c49ef7a9b35fcb3758fec8ec5969ff1274c4834b4466b9014f3b9f55f  ofl/volkhov/OFL.txt
+sha256  cc31fe974951d56d542f33782d07b2d5577a4afdddba89744e6bd69bcbf3a853  ofl/karlatamilupright/OFL.txt
+sha256  cd354a6084383c50398fae709ebe3a5dd98b947c486c1fe9de5f89caf81f980c  ofl/snowburstone/OFL.txt
+sha256  8a59454b7f1cc0b1fa29805781769047e5c269aa629e3422c2d7fc04b89e5c1f  ofl/rosarivo/OFL.txt
+sha256  de71817dafdecfee21268b8c4f106146e1d00988c4fd6546b10445eb26b24cc0  ofl/expletussans/OFL.txt
+sha256  d1829ff3455bbf3b9d13dfb0a57758a863107c9108aab48558f26f37f1094180  ofl/firamono/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/rajdhani/OFL.txt
+sha256  26e4c39c4905bd7f1068b0bab008f5a4a9b945e2d7fda31e52719fc5aa9655bf  ofl/vibur/OFL.txt
+sha256  49f2a11271968a2ce019a43bf5401d1593652a18f27ea59037ff5e39856d2df7  ofl/changa/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/maitree/OFL.txt
+sha256  2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsanscaption/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindmadurai/OFL.txt
+sha256  f354ef1e7256644b320c5e1d9a07a819c2e2b930166003c96680894f9fba81be  ofl/mrssaintdelafield/OFL.txt
+sha256  5c289da4a19f054ace8e31a144a6a254601898cd7faf9eaa301141afda0adbbe  ofl/coiny/OFL.txt
+sha256  0886960207bb5bcf81a46ce663bab6c52a742dad80ee2cff5cbcda6f1df88568  ofl/rhodiumlibre/OFL.txt
+sha256  8f94e5901c371537043e0c762c827ce33963e7bd186fbea0abafc035ef7120a7  ofl/emblemaone/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/gloriahallelujah/OFL.txt
+sha256  24af1fb3ab8dfeddc83162b7f3b6c1104149b6c3022f1aa948ef4f8ff7e6bf7c  ofl/poetsenone/OFL.txt
+sha256  f3ee3eb20a9d565bee2bbc0d616de382a113327d7506565b2f3d3bee5f489375  ofl/bowlbyone/OFL.txt
+sha256  70f664de65e7bb62e1ac728f20a9bb28de7fdc18be594186137a9e15ce9dcee5  ofl/niconne/OFL.txt
+sha256  e604b133509815768e6ec4738bb04844ce9a23e80099d2b61e5d75ef46acbeb0  ofl/ruluko/OFL.txt
+sha256  42ad5a49e171bec80308a1c9e8e66b03e638b3ea65af7fafa6fc0e42f45e7626  ofl/suravaram/OFL.txt
+sha256  4fe81901e6f84cfce1145c715e931352a9a12aa7ac75cc193eb523c0cb0e5eb5  ofl/lohitdevanagari/OFL.txt
+sha256  2937c7789b0e4fdeda6eafe93164a2ab36e20386704c4cb6f87b1deb620ec0da  ofl/leckerlione/OFL.txt
+sha256  91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexmono/OFL.txt
+sha256  fce9f9e2fb268507a89fceea0b3eccc044f39fc3492968a04fd9e04df5ae95fa  ofl/sourcesanspro/OFL.txt
+sha256  e12a3e737fa75c0ee072d965b6185710f35e38a4f7a0793ebc66ba14a216109b  ofl/meiescript/OFL.txt
+sha256  d2f9c74aba2716333b0a3d283083f9fdc93b2e060c5ae094c79e97e8cba9d7e6  ofl/squadaone/OFL.txt
+sha256  5d6517d497bea6116ed35079b30374043f6d90b19c8d97fc4e5ec48520d1e08b  ofl/zcoolkuaile/OFL.txt
+sha256  f8a20490ee8ad3adb2205ea44b279b19099a3a1d6b62849e90b4db20a77deeb8  ofl/brunoace/OFL.txt
+sha256  75b2a5f39a53b4cf9286eb3d2cc1f895a8f3442680013c77124121bc347a6448  ofl/lemonada/OFL.txt
+sha256  715ba72697e14daa9b29a333545f69bde7c497b9f77d0a2a4c4a5a752d961801  ofl/marcellus/OFL.txt
+sha256  1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode128text/OFL.txt
+sha256  eba176d3ae86af6b41e9b744e4d18fb56e2a6ad671381bddb61fabb86b1d39c1  ofl/croissantone/OFL.txt
+sha256  12404fcefccc3cb964cb2406510ba679b30f7d7ae689db08df5b455ae24b3feb  ofl/paytoneone/OFL.txt
+sha256  e2a176ce310235bf281f1124454e21331390ae1b4c429a2d80ae642d333a5a7f  ofl/frankruhllibre/OFL.txt
+sha256  2d83a49d05906b5e23285168e72c0d019fc15e3ad110376f640feeeda34c27d1  ofl/hennypenny/OFL.txt
+sha256  d7d8074c2dd46804990c184e25849947ab76c5ac7607fbf3966543455769bb73  ofl/yeonsung/OFL.txt
+sha256  13831d02389d917d22fcfa6c79f98f8acbf61d230add0e73a4d4dc5f3bfb9e56  ofl/chakrapetch/OFL.txt
+sha256  c39e284759a441660d4c4d852c537e271d0fd5c301fe46d065a972b6ee144ba8  ofl/aksarabaligalang/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindmysuru/OFL.txt
+sha256  0da6a3e5b24a9fa04085c20a2a1d3101eeb1e0bff56a2291f407187e1b2adcf2  ofl/mrdafoe/OFL.txt
+sha256  a815f65bc72d90494b01842d3171f7cb0f9f935e023d9cc260904d221ef1064a  ofl/b612/OFL.txt
+sha256  e2f2dc7a667954c16a919acff5351e8ea89813d10f5a7504e1f4668fffbfa14b  ofl/barrio/OFL.txt
+sha256  8c495ddd455def58a45310376a747bb61bf86e4b071cc527b3618bccd3ef00fa  ofl/chauphilomeneone/OFL.txt
+sha256  b687f920fe20fe48d8f7709421e5deeb4becea295c80ce62aadcffc54132fa1b  ofl/stalinone/OFL.txt
+sha256  a90a8ebe28f3c2905a44557166010a3d219ffcce1703c3c3280ea8728d5e2ebd  ofl/heebo/OFL.txt
+sha256  c267a00c9476c78a2336d7b372b536885b8b24173a29ed53496f67a742c14961  ofl/alefhebrew/OFL.txt
+sha256  2cd51b11e821dad2fb7acc54d68bd9a139fc7a1207e17c432ba9ce49bba3d493  ofl/fasterone/OFL.txt
+sha256  ca424122f42a8d8442bc4cfd902f5f027ea67b5417705f5af1d1235927781720  ofl/amethysta/OFL.txt
+sha256  bb8fac04b8535d39fb9851c9d886248d25bc0c82000066c92dd577c3369f512b  ofl/chenla/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/lovedbytheking/OFL.txt
+sha256  53a9ce47085d9fef613c7ecb3730dc80d25962510bbea231b89564f58240f251  ofl/gaegu/OFL.txt
+sha256  9d96f445b6e9c701428811d0177f894874f8d6f07ecc30d568c506542368f3ff  ofl/share/OFL.txt
+sha256  9465823369fbe1ae0b5a3065021d53ef8c56e113e664229455dc80b237fa6a07  ofl/nobile/OFL.txt
+sha256  0dd8e32457e18621737b593ab0fac49905cd948a078ed0e64f4890df714a1dfb  ofl/amita/OFL.txt
+sha256  791936b10381b512512317572fb5eee91bf503344d52c37335e402fc1cf19992  ofl/reemkufi/OFL.txt
+sha256  898a9cf80636e86d6b6009b96795fda29e431ee701c28c36f274a7e8a7d8246b  ofl/rubik/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloothambi/OFL.txt
+sha256  382232d1add5623ba5b06394afa071f4eeecccb6d2b2bd02cfecff4a8a45065a  ofl/fondamento/OFL.txt
+sha256  0c3f4763f49c2cd37757a2856ad470aec6a416981ac6d6e3f900c1128be39de7  ofl/elsieswashcaps/OFL.txt
+sha256  d849309d514833fe3d7a610e10f6cd5d99b4f9552bfa304969acbf89c66e4422  ofl/smythe/OFL.txt
+sha256  53f9c99fa3d47f7d632a42ee7bab4a834a60a744f6026d676c3a223cef2b2ef3  ofl/vollkorn/OFL.txt
+sha256  a1077580b649c7b0e05ea0e9369d48687b4ab1c585573bf86b0dcce7dde177c0  ofl/junge/OFL.txt
+sha256  a9b40759b5821a0c2ad07cbd2c2a61dca4b3e222e6370a7d5bfb6b373bf4fb10  ofl/sunflower/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindguntur/OFL.txt
+sha256  84b11cc0aac8fdb93af94872bc4b8f015caabf4919db63ab7f916ccff8e52f56  ofl/josefinsans/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/dawningofanewday/OFL.txt
+sha256  f27cbf1055db7b9dd80bce5cd12b462f2d9ed7313d84dd8bfef1ddd2b61bdfc5  ofl/chicle/OFL.txt
+sha256  aba8997e16b1e3888c6e855ba883c70d96bd4375bff8cb9c7ce0f097200f74b8  ofl/abrilfatface/OFL.txt
+sha256  8f24842e9174beda18a556c2ae7d54f5dc444340c19a3a9ef77e23bca366adbd  ofl/firasans/OFL.txt
+sha256  d484e0dce424a9e360adabb568b6773db5f1566df71ce3e9dcd66a6cc2c38d33  ofl/ericaone/OFL.txt
+sha256  1b3b78123c94dcbc9fd4ec174317336c8c93423da62dc946b8852553cb13ddee  ofl/economica/OFL.txt
+sha256  74584d937293a9cacdcd2eb05851b71aa1527901c18b87961d2f877c77a1b486  ofl/kanit/OFL.txt
+sha256  a6a74417db7c37f69495da556a3eb86a22a784ffb0131e3e0a5a47ce8d7fa5fb  ofl/shanti/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldoublepicasc/OFL.txt
+sha256  963f283b5410c7df62067a35cd7def0802c583a880e7cd7e326832ec3985ec87  ofl/spectral/OFL.txt
+sha256  11bdf9c7abd81f46a88b0b017d78a0e51f451e9dc0c2272813aa9f456ee886ca  ofl/kiteone/OFL.txt
+sha256  6827fa45930d5847fca5b3d3898b3d87a229fba772a5b6c5bc33bf73ec83478d  ofl/khmer/OFL.txt
+sha256  5ae0cfa62a70251d9a2c3c5430ed3bafa480005f23e4b9525488f2318e5c10ca  ofl/mrbedfort/OFL.txt
+sha256  34b8afbcab7508bea23847288332a8c05a507364ca6f0c8756ce560d7d59d506  ofl/mada/OFL.txt
+sha256  b67eed9578defb59cc4ff4b58428fb816786e499e84cdeafca54723b055c169e  ofl/viga/OFL.txt
+sha256  afc1cda4eedcfe27c8cf30fe3e9879587cb43cc2882d4cb91dd3e3fc9eecd0bf  ofl/farsan/OFL.txt
+sha256  cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanscondensed/OFL.txt
+sha256  9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/lindenhill/OFL.txt
+sha256  a89ac8075be60f2beba79bed3fa253415a373dbdc3bb108b23f4854d0dd495b8  ofl/pathwaygothicone/OFL.txt
+sha256  4b255eb44f613a8e426e195f0d0b7e10fcba1af7eb6047d9a7f4f3c449940e19  ofl/hindjalandhar/OFL.txt
+sha256  f22a2beea88d631a620b15683fd03e79f13ad3297ad97fa5e42283c0b1a3a038  ofl/marckscript/OFL.txt
+sha256  faf47a1ceab38b07205b9d58fbbf9ac39772ea47cc731aca7816276da7226a22  ofl/terminaldosis/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellgreatprimer/OFL.txt
+sha256  d2f87f90d108a947f98c030d9d8e4bf27e761ce83f222453b9a7230c5fb309e1  ofl/novaflat/OFL.txt
+sha256  2da0fa5707f1fab1c802969b098fd1b92ca0b3b233a80e27fca416647c064dfc  ofl/exo/OFL.txt
+sha256  f9e5dfcdb2947c0db70465668706b0617cd052b6f86e582dff8741d9e5cded0a  ofl/yinmar/OFL.txt
+sha256  bcb0bda74430ccc281a616a81d0a287fed5a423815b00b222e0b7f603f85b26f  ofl/caesardressing/OFL.txt
+sha256  a94cfd8d1f5c33f9a7506def359b907f3313f7008bb57fc893985963cd342f8f  ofl/arsenal/OFL.txt
+sha256  52caec7d90533523fa7da64e95faf90ea32a663ce21847a39234b61e18d25044  ofl/bokor/OFL.txt
+sha256  ef0bdccd20de76d517fb3939161d05ecd5808382fb8fa82cde5fcdb3adcb8029  ofl/engagement/OFL.txt
+sha256  0d75673e4c98de3e11337dbd90b05d0232edfcade5c1c02fbc0118c85aea25da  ofl/macondo/OFL.txt
+sha256  9cd20277e2c89d47e3997435e3a16539d20173d850fbb42474990f71642e473e  ofl/matesc/OFL.txt
+sha256  a7ba785ad99b6eae0444ab89910e512d4af9865937fddbcb5c72c4f59f55d6ad  ofl/merriweather/OFL.txt
+sha256  010cb216e8f3fbb2836fa3f38787a412b749352de546797f57c03c3bcfe46b1f  ofl/nunito/OFL.txt
+sha256  91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexsans/OFL.txt
+sha256  cb8bbf7a86eefa8c146f24ae5be74fffa887ba83719ab3c87036be8e3d0191e2  ofl/montaga/OFL.txt
+sha256  1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode128/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/overtherainbow/OFL.txt
+sha256  3621f156cc7a26e0a9cb413332e0bb35a0e76b36dbfe0b1c885b565a7bf3051e  ofl/drsugiyama/OFL.txt
+sha256  fbb941b371c6348ee2572ce8c78fb66128a61885f960dec1906c4e44ca4b4d3c  ofl/reeniebeanie/OFL.txt
+sha256  9e19c0d2e7e7adcbe9dfd0749e34dda41e7e356e0f2cc082d61d2fc9b6e0cef7  ofl/gfsdidot/OFL.txt
+sha256  812fc4af0c63d31e0e81cc153af74e397407b0630e918b8b965bcbb192bc0656  ofl/artifika/OFL.txt
+sha256  e8ad3f3de5baeff6bac6e711d8c406e0a6b8a61d2944741532d8965d893a2681  ofl/pirataone/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantupright/OFL.txt
+sha256  65f43260cf7e66b57ddca8d148384a6602e2c06edd389a8b3cf388045127b47d  ofl/lusitana/OFL.txt
+sha256  518962c41d4a5e96b0016bd8d8acc965413ea1a0102467e4955931e702b14a0d  ofl/iceland/OFL.txt
+sha256  2171558d2482764644a2f793696fa2e48c361730ecc87686b9a29082d6daeb10  ofl/khula/OFL.txt
+sha256  d336c098ea798bf14de111cd90dff7d6bc340852405246511345d0f8564fe76e  ofl/fingerpaint/OFL.txt
+sha256  ea274e87939d38032b31fb741af75bff9fa3f8d4a8b652265f9e0ce1ad7e9f80  ofl/asul/OFL.txt
+sha256  eb1992aec1cf892ec94ffc116d79b62c7cb03dc108141b94a57a4195d210b514  ofl/meddon/OFL.txt
+sha256  9b584984f9db0ee30347391a76eff9c0a6b03dc450c3c6afe3757a2cb3a4db87  ofl/tajawal/OFL.txt
+sha256  1dd84b611f4bed7f9ff9089e76a96337b187e6f283a4ab33bcb987f844f2c4db  ofl/parisienne/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/hind/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldwpica/OFL.txt
+sha256  de08ff7a460541753999b1208f1254f1d31f16b421312aca4d4b8179d997de38  ofl/aleo/OFL.txt
+sha256  7706a84d7e49e2273877106334a1eded8ae89fb5839fb81e0f2bb27c846f667e  ofl/lora/OFL.txt
+sha256  cc31fe974951d56d542f33782d07b2d5577a4afdddba89744e6bd69bcbf3a853  ofl/karla/OFL.txt
+sha256  0409c6582424508453ce41648067efaacf0c790622918493d8f1d934bc5329a0  ofl/bigelowrules/OFL.txt
+sha256  9e2d92fb24b4a548ab030c509ba88267e224f2523728ee9bb35cf334811106bd  ofl/exo2/OFL.txt
+sha256  f480fd19e7018942ecaf460f7a4ab9ccee0aec579abcb07d559dbede913864c6  ofl/alikeangular/OFL.txt
+sha256  6ea7a3ef1d07feb592693f3f22c26d0b09321ff81814292b49be99888d0da9d7  ofl/ponnala/OFL.txt
+sha256  0b7eae990329ac175a2e1c329060b3a4d6876e4e0cd7e5235511578352f7b191  ofl/biorhymeexpanded/OFL.txt
+sha256  21b54eb0d7513524798a00dfbaf99a02c003a0012a728cc5f0e02d24c50482fb  ofl/caveat/OFL.txt
+sha256  adadb8d5d34fe2218dca0f4a4919a9b6f81dfaebb289e5446ac7b3063d6965e9  ofl/tangerine/OFL.txt
+sha256  16741ac498178f645283cfb45b7a487b6d361b5de5730c5ea729f056f414f6b0  ofl/ropasans/OFL.txt
+sha256  1e5bf8207a40678bc401e2e5456d0db1f2a183b550a30976b48dcdd6a4e4c46c  ofl/caudex/OFL.txt
+sha256  6f9e3a1c51f617e7b110862426204ec7a56d8c6d2f731373b5de6b8d069099b6  ofl/ebgaramond/OFL.txt
+sha256  c2368518f12463a93cfed44e1460f36085dc60df06f415ee9b0319809987ccce  ofl/frijole/OFL.txt
+sha256  5f247fad3e8a86b6c0779dff09277047c1ce2b0b7580a1093347a8af755352ba  ofl/sawarabigothic/OFL.txt
+sha256  6627b9c2c8ff8e0c6ef23f1b0125dd5b293320c10c916d402fef64916c296d0e  ofl/kreon/OFL.txt
+sha256  723764a50d4e6985dfcbd75fcb40dbd3abab37ba25ae626486d4a32084854487  ofl/kdamthmor/OFL.txt
+sha256  846ce83956a732edd57b74d9ba988d58abc8c8e6d0926859559318ce6aed139d  ofl/mclaren/OFL.txt
+sha256  ba01480319f922ecebbc73f1a523e7f8876e92b16553a32c494bcd3f6f5a27fa  ofl/ledger/OFL.txt
+sha256  c3bfad2900a83f571d5c984d490d51c56aef14806c28dde38125593e1e71daca  ofl/mrdehaviland/OFL.txt
+sha256  12af42b715a3901bfa7add1351e45b6ce22f3061555d52db45e963274c349360  ofl/arimamadurai/OFL.txt
+sha256  aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/miriamlibre/OFL.txt
+sha256  3169e7e0e87168908218f11d660a52c0b81b5952fd73918a596e70721d68d3e5  ofl/inika/OFL.txt
+sha256  e711c816f7de931244976f51166baa15446fc307e5d0ea04fdca1bc2c04afb1c  ofl/nixieone/OFL.txt
+sha256  1ba345a91338581e5f8fccc3e37e447ddea5b99ec9caec1b76c7c39492387d2f  ofl/signika/OFL.txt
+sha256  b01cec9e5e2035b70a6aeb61c673d1f6d5c91539845be07733bd9880fddeb9f0  ofl/kadwa/OFL.txt
+sha256  d7577acbab1d70f2e6bd1b21d8f61db189d6aabe6375bc2d96564b8d94031664  ofl/stalemate/OFL.txt
+sha256  5946eec3a7d3bda02825930156e4716198e7753641dd3303a3e8c386c8011909  ofl/eatercaps/OFL.txt
+sha256  ae6de2f6fc00f76cc7eb0d97c1ae5e0b7ec734f20ad7f58cf4c74738dc822d21  ofl/chelseamarket/OFL.txt
+sha256  860cbfdc9dbc3f0e8d35af80c31e8f20945bff393d4f483dfc157469e01d321c  ofl/gorditas/OFL.txt
+sha256  9a2d8c5a3de0a6e62432322115dce136139948411dba33cd86525c0a02749fb8  ofl/unicaone/OFL.txt
+sha256  4fe01b13ffb41faa8f030d84843a95dab32792dfeeca7c072abbfd3f4d6896ad  ofl/audiowide/OFL.txt
+sha256  173ea2d0bdda981829719623c35699e8c0e4aa508e0af12817ad7ccbfa4c6137  ofl/originalsurfer/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/trirong/OFL.txt
+sha256  58bdc69f4c6177125c6e7cdbc78f710f5f9952f11bba7bd5b17bd7ef169d731f  ofl/goudybookletter1911/OFL.txt
+sha256  2950994bcfb8e903f0539d28a8ec4af077e0aa1fa7946c33c912d2d6969c2971  ofl/glassantiqua/OFL.txt
+sha256  7344b8b8c97c4f88c0ff8bb72bb024bba72f404be1c740b6596a73ed15d28df3  ofl/vampiroone/OFL.txt
+sha256  cacad5bf45bf5c81f4b6cbd114261bc8a08f6110b66a4c6fad8bbc16618a3096  ofl/daysone/OFL.txt
+sha256  0677891e6a143f297350d260ad766ad33bfc18ed5fa4f213acf648d6b597ec1a  ofl/alegreyasanssc/OFL.txt
+sha256  c8155eb9337078a9ea9f1e576ac813a03030ca43e2694593e90cd4fee6fce937  ofl/sumana/OFL.txt
+sha256  95803fae1b063e592c67b5867f1f36df1df526e5ebf33c6cd4d4afa31a9d5586  ofl/sitara/OFL.txt
+sha256  c254ae01c407f4a2bd0ad163e4c1a795d57ddfa8967c21b8a28c250b44d13963  ofl/sawarabimincho/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellfrenchcanon/OFL.txt
+sha256  25995bcf8e8ddea1aafa5449870567cbbeae7e26b27ba30aca5642f2c02e9757  ofl/quantico/OFL.txt
+sha256  455755e2e7ce9dbac6beb3729c97c57d6f74a638dcb5be548ec953021fbdbfb3  ofl/ntr/OFL.txt
+sha256  ad6f73fa3edb7aea340aadbc63c0d7ef7663abed82664432ae09a6b377fa313f  ofl/librefranklin/OFL.txt
+sha256  581f08727777cb2a1a1ec95c0f981ce64fb1ad4354f78a0ac4f3481afa605577  ofl/moulpali/OFL.txt
+sha256  4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laomuangkhong/OFL.txt
+sha256  08fdc7cbd92b9bbc4d41d0945ae7f25450d91c5fc8c66c68df331af3505e4ec3  ofl/rougescript/OFL.txt
+sha256  694d5c15c1dac5e26653e18b94394d911e471549ec9b7d6247ade62e486b4915  ofl/asset/OFL.txt
+sha256  bddfe669338d0dbc24c15ccd31dbf5c101a213da38049c24baca9ccb7fde45a4  ofl/wallpoet/OFL.txt
+sha256  2758cf7a872827f39661cf8cc24188113c030447aefb5ca7145993650076ca8c  ofl/ptsansnarrow/OFL.txt
+sha256  3cbf579238e4eacd90ad67883d971aa346ce8990d658635f78f98d608a6830a2  ofl/zillaslabhighlight/OFL.txt
+sha256  87000f71a897c8c130c7777d058c5868f84316f99a32644b3bf595cd11edeb12  ofl/sancreek/OFL.txt
+sha256  08fba9df5c9890f3ab00ee63f63e005ad93a23746f7484f5fe9501a1ad32730e  ofl/allertastencil/OFL.txt
+sha256  9608d22ae5c586628c9904e773b7c6a6520fc16e1492ebcb5ea55d9523399964  ofl/anton/OFL.txt
+sha256  f3758ee70600ecd5450f01ea373204b202e048d0454c9db2d1175c5a5dd1e92f  ofl/vesperlibre/OFL.txt
+sha256  e43f121c788cca4a14049e58864e28021174b055710ba38e0964e816dbf905af  ofl/fruktur/OFL.txt
+sha256  5e0da210fb04058a8c0087985d2d456b931c2579811a49655721d3cf0c36b6d6  ofl/notoserif/OFL.txt
+sha256  a1580ba69a8d706bd95e1e72ee0b5cfda0a478fbbab6a4af13b4a9e1b28faac0  ofl/revalia/OFL.txt
+sha256  f323edc1e5a6d8fa16120aa15367cdfb15468474cc621f9bda1a2f73c5d08d73  ofl/sedgwickave/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellfrenchcanonsc/OFL.txt
+sha256  0836fd874230b17f840efcf7d3bb529f5a7b5befbfeef94478519cfe2d8551c2  ofl/courgette/OFL.txt
+sha256  e3ed3ad6cb257e16dc1789900707c5cd1cdef2d60d155389342604991cf693f9  ofl/bahiana/OFL.txt
+sha256  391ac3126dacc95b92a8f3408467879edb3245344bc411530a30d5aada52df92  ofl/gugi/OFL.txt
+sha256  88dcde7d08e509a3eec64886292a36cbd58ed9bb52f37f91f55656fb9d21ddb8  ofl/supermercadoone/OFL.txt
+sha256  41423e9e1d0ea79d0e78bd5fe9e0b27f4c23140706f5dfbfe116839c83aae91c  ofl/charm/OFL.txt
+sha256  43186c592361336474683e302dcc988831a53857bef188c4466f6b45dc238f84  ofl/fredokaone/OFL.txt
+sha256  a21fa252efb7a1ff84de6a36df4386959668aa046f28161b4047829f7d9cd1b5  ofl/damion/OFL.txt
+sha256  842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsancondensed/OFL.txt
+sha256  bfc205682f5454b42a732ec857b665293ab8bc6f0ee901a0967219ba7ffdb190  ofl/gfsneohellenic/OFL.txt
+sha256  59b91c9912b80714852a43897cbc9414d6457e22072dc99a4cea6e2bb4f3c65c  ofl/freehand/OFL.txt
+sha256  8b89f3af5fd02216793ff3dfe9a04dc22dfe5c213422ae21558ff1da6a1e94dd  ofl/cabin/OFL.txt
+sha256  b598b7fddfd578950aa1fe6e0e2607b779abfaa686b83af8ec65c860f646b2cd  ofl/rumraisin/OFL.txt
+sha256  2bd35914efa381c80f9fb62d6ea7d736d3c0739196a3783c3122593c3408392c  ofl/gurajada/OFL.txt
+sha256  5625e91bd7c2a45c8b9f59106d587bd025470b462ea901df691defe0099621e1  ofl/taprom/OFL.txt
+sha256  37d5360d8d2433689e78302a93cd88e9add8a2294046476625edada2d4328deb  ofl/averagesans/OFL.txt
+sha256  f8e2b58dd7a8c8e21e5d744b45876bce7e010a647c071c1ed42ff0e618d4ea59  ofl/frederickathegreat/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balootamma/OFL.txt
+sha256  09685e225ba9b697b2ccd2d4098cac5ecbed0679960605258a271af60749887b  ofl/francoisone/OFL.txt
+sha256  39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/himelody/OFL.txt
+sha256  08a12877eda24767239f26b527bfce0c515efaf623c66da6baad92a6d5315e9a  ofl/content/OFL.txt
+sha256  0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/saira/OFL.txt
+sha256  d8eb8611f8c98d20cbf18a28425652d6022dc2a5cca15026b920f1f2bc92a612  ofl/delius/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/pridi/OFL.txt
+sha256  c1eed37b6d213df4edf8f92ec7d1e972f751abd68ecd649b4f0b8e5d8e8561f6  ofl/rasa/OFL.txt
+sha256  4e66943af352059c059dd658774f25fbc831f1ad478f9f0890c06ecc2dd324c7  ofl/metalmania/OFL.txt
+sha256  f5b03ea0b27c7f5afb9702771ee57679ae8ba6b471b6ba9e62d985d3256f1929  ofl/playfairdisplay/OFL.txt
+sha256  593f0bc55c75b673772b378eaee314f128283745c4bb1cfdb9b8012a3b6c46fe  ofl/skranji/OFL.txt
+sha256  46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiagruesalibre/OFL.txt
+sha256  14d28541780d90f6577bb7abcc6f005bf6969614294e75c82abb8758a696ad46  ofl/quicksand/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloochettan/OFL.txt
+sha256  35dca6122235851d236bd861124f4a893d409eba021cd8c6a292a19df0f4640d  ofl/codystar/OFL.txt
+sha256  ab721b35816e470fb11619ad3705f75d08dccd0864505e3d782e94fd937f6620  ofl/allan/OFL.txt
+sha256  d9cdb075679d15a99bab2a8541b9c4fdc71347502111fbe9affd1d462219d96b  ofl/indieflower/OFL.txt
+sha256  1313ae342eae4e1810304b6cd32f6815dd11b8e45812a2af98e58b6960684fa0  ofl/petrona/OFL.txt
+sha256  1e4015251ca58d4f349b4ac930259c6f3d6381ce68f8b4b27d54d53f8f63f972  ofl/angkor/OFL.txt
+sha256  46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averialibre/OFL.txt
+sha256  8e28b778b6e1a7ff9ca72f4dee2d53120aa2856dc1bfd0be44307e365b0e45bb  ofl/cardo/OFL.txt
+sha256  a02e8715fcdf3325c474b7209399f50230897bfa828fe4eea2639ced1a1d574b  ofl/blackhansans/OFL.txt
+sha256  d530c14e9cc263c567b47742ef20df2a41374f00732ba4f290f52adad428b1a2  ofl/meerainimai/OFL.txt
+sha256  2e2fe5f1d8916a5160060594a96c1a5116406d26847afdbd09618481e2abd6fc  ofl/denkone/OFL.txt
+sha256  56c4ff36faaaf336bc5fee659ff6fab2413d67499cc22acc29079b3892d8931b  ofl/miniver/OFL.txt
+sha256  0d75673e4c98de3e11337dbd90b05d0232edfcade5c1c02fbc0118c85aea25da  ofl/macondoswashcaps/OFL.txt
+sha256  742a6a4386db47a2987c7c3b4aeedfb5adedfb3356c118de450a664735686535  ofl/graduate/OFL.txt
+sha256  9e53298e3629e00ae4c31531cca09051ddaa654a5de4f7b55e596132fff86e1f  ofl/dhurjati/OFL.txt
+sha256  df9fcd8f62ae79aba7fa5b0563a08dfede1fa0909d668287d70c395d88f5fe02  ofl/fjordone/OFL.txt
+sha256  02faa476b17db0044d0c502a3ce12fdc81eeeb9bd618e6a005407c79d6081bbb  ofl/monofett/OFL.txt
+sha256  1edecf3f971a11dcfd777cbda6f08c0f9a77bf57a0a2a89d8142fb933894ce16  ofl/amiri/OFL.txt
+sha256  6e6efa9b0556d100cfe60690cff5d9be7144df77adabfd2c278dbfee451351ea  ofl/phetsarath/OFL.txt
+sha256  2348c4852e6322105d130aa2addbe24c962e330094ad6dfbfd9fbd2281d76b0b  ofl/bellefair/OFL.txt
+sha256  3bbcf1617d93d3a949a10da78ae91c58be536fb04567ab4b5b9fd207126f1db5  ofl/buenard/OFL.txt
+sha256  faf47a1ceab38b07205b9d58fbbf9ac39772ea47cc731aca7816276da7226a22  ofl/dosis/OFL.txt
+sha256  3ac1301549523d9861fedca12871f24e575fbd26d520632fc00ba849b471d275  ofl/russoone/OFL.txt
+sha256  44b51296985184d9b27fc2c8e5b317906c5d65d9dc834e81c07902d3e5e1cf1a  ofl/brawler/OFL.txt
+sha256  afb8c471158619593df0fb501453bd39fda42396e2cc3911e2a0a471c11b863c  ofl/sarala/OFL.txt
+sha256  de985adf63cff6b1bcb7c5cb55f1c5850fb1d36289d20a0e26d97a281bfcf956  ofl/aldrich/OFL.txt
+sha256  194e25172d0144f29aff4b6fb2931ff0be0139448a5cd867db37863c9179330a  ofl/stalinistone/OFL.txt
+sha256  ae05f8781a5ef38380ef3efe8cad86783610b6a780c6c278d7472f95310fccee  ofl/oswald/OFL.txt
+sha256  2dab153a33dcb2101bba3f194d27d953c848a0fabf2e336650a81f84a0c33b3f  ofl/pragatinarrow/OFL.txt
+sha256  9d61931b909f9a738964f8fb311eb8fa40dba1ef9f1688b36039ebb15ee1805e  ofl/questrial/OFL.txt
+sha256  e315abc82a78710c7242e2f2e6529651fd631d4d50e6ad98ea194f9b54c3d701  ofl/alfaslabone/OFL.txt
+sha256  4653c63a4bab99aa50de5190853fa21ea6c0a25d69d49f5a42cd51f0f67665e0  ofl/boogaloo/OFL.txt
+sha256  bd8323cd1d2b6bbdfbbf99cb41ec1156d0352ced170de4aa3a96d95e6e20bf5b  ofl/amiko/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/sueellenfrancisco/OFL.txt
+sha256  ed93e9833f18acc2775380a28139fd88d3ebf82df7cb814042498467be3463bb  ofl/lemon/OFL.txt
+sha256  1f00d1f970b4ea469b6936e599b599bb217edaab792e586658ef2e71cf438685  ofl/itim/OFL.txt
+sha256  fa28ba897eb819768d6bc00c30aa03ef560e80e5f6fb872eaea089c66992f502  ofl/notable/OFL.txt
+sha256  96199bf9ff12dd471a66911dee95440737b437e7f5a6fd30e9e950c16d66e8df  ofl/unifrakturmaguntia/OFL.txt
+sha256  36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/judson/OFL.txt
+sha256  ad4f6ede2e8a017255822a6abee8d10717f1d34c20223de80285ff59e28a1cba  ofl/bangers/OFL.txt
+sha256  f8779e6871bbab04e0a1ddd9997f4d8173b56792a1e7f8b9d691d967a49c7dc3  ofl/andada/OFL.txt
+sha256  49b9214f7b40024abec2fc89a32bdda380f2174ba7005d7636e6ea340157c5a6  ofl/jomolhari/OFL.txt
+sha256  a815f65bc72d90494b01842d3171f7cb0f9f935e023d9cc260904d221ef1064a  ofl/b612mono/OFL.txt
+sha256  5eca89cdd576df5e4b7c694e0425b126a9ca839aa067df85fab33904a8187076  ofl/amaranth/OFL.txt
+sha256  e0cde1a4993ed689d463d5e2401f4a60c54cc48a14253ab0f8012d722c417038  ofl/mavenprovfbeta/OFL.txt
+sha256  eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumgothiccoding/OFL.txt
+sha256  0fbae33ac3aa455c8c0d598347c87f1abfac0d215483f40f5a0e8dd08076df1b  ofl/librebarcode39extended/OFL.txt
+sha256  3670ddaf348c62ada22a2f606158dedcd9ca5fd5422a6173d6593204a8f53d4f  ofl/varta/OFL.txt
+sha256  ab592d1abca19428b89d851706fa7815ec25139c6affb45d366577ca63fb91b7  ofl/yesevaone/OFL.txt
+sha256  e8dd8f53b2fa502ace0636debbe7e357c4888d8d02b8b41d6a9a22d3058a63dc  ofl/peralta/OFL.txt
+sha256  cdf5fc4014abe91588666a9592ec86200e5a4d743b4b6e05d28d47e850bbe5fa  ofl/digitalnumbers/OFL.txt
+sha256  f8c2225a5fdb50e2e75f98cf6e69f198571f605f1b7f6f7eacc0947e2fcdbe8d  ofl/sreekrushnadevaraya/OFL.txt
+sha256  a80ee908b60f5bec9c10b135d3da93730e2194107d1f7fd3f61bd8c1a97b3e0c  ofl/yesteryear/OFL.txt
+sha256  6d216cec166b6e139adaa599053dd49720c053e1f2adb4845de3cc9c3704344d  ofl/play/OFL.txt
+sha256  46751a31966477e3f038d1e5ff1146a33234a3a523a0e6a21be3221cba082a34  ofl/muktamahee/OFL.txt
+sha256  505bb8f3c30f2006b4e02d250fda31ed94b651a35f1124a201ca1c405ce989af  ofl/biryani/OFL.txt
+sha256  5641212407f956b828bf632afc4bbb3344f461f82255ab56756d9e3e8604c7b1  ofl/martelsans/OFL.txt
+sha256  1ed119b01f03187dbe2f5f89c95431b9a4ca46db604fd263164d8b4055189f46  ofl/lateef/OFL.txt
+sha256  4938e917ac54665be1dd862f54634d991b39c5d1eef69345d66a5089e401bfb4  ofl/creteround/OFL.txt
+sha256  9263f9488a9ed1d5f4218581b642e0f054f9a20d208f1a53c19c9f7dbd27eaf2  ofl/peddana/OFL.txt
+sha256  e75ed24435d1711de0bebfaa621c3eb5564798c88cc0c1d1f8d529bbaae703a9  ofl/yanonekaffeesatz/OFL.txt
+sha256  708e33bed791c40638926a7577bcef8ff8748f84045f3825277540cbb8d483ba  ofl/poiretone/OFL.txt
+sha256  f1d1a3536fa4b9c71d04fe4c8d8bbfc0cc5c457d6883f45086b04d0bc07ed12d  ofl/vastshadow/OFL.txt
+sha256  f9f28345ffcd6cea6e3c6699e4579cd1948053d80fe89a6a5a2ecb269afc95f8  ofl/nikukyu/OFL.txt
+sha256  c1bcd16ffc9d095822fd6b7fa1a24c7918b24815ed05711421f804293d2efa62  ofl/actor/OFL.txt
+sha256  ae629d13b06d9afc5cf3c07d585f3192b89b7decaffc5c4dfcfa7ce11a2a2b11  ofl/raviprakash/OFL.txt
+sha256  bdce62dd98db969b73f93f8e8e2151004c20ad871ceb15ad9bfcbdf2cf939dba  ofl/pompiere/OFL.txt
+sha256  39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/poorstory/OFL.txt
+sha256  757f49d04406c93c40d1781e7867fd85a1f9fdfbfe03a5ae332900da802fffc6  ofl/harmattan/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/khand/OFL.txt
+sha256  74ba064d03f1f1c4a952da936c3eb71866c34404916734de3cae73b34357e59e  ofl/lato/OFL.txt
+sha256  94625b91cba99cf9c8e580febf5e738b2e3c7cde9034a16bcfb7538b672137e5  ofl/zcoolxiaowei/OFL.txt
+sha256  3e908f3a95680bdf3c8456bfbf76392605b34cb3fba109e46441056ab966cb35  ofl/modernantiqua/OFL.txt
+sha256  6a809aeba8af2115ca4b4c3597b1fbeb836a45f0489070f330f9c2dff870da8d  ofl/galada/OFL.txt
+sha256  2c3737ea83b48d48624068d1bbd1d9f8049eb7cf2e1f67435e420375c42e0686  ofl/spirax/OFL.txt
+sha256  92f750829545386017c3418d890769778b76fd01dfb41c62fcbb0d42ba0303eb  ofl/dorsa/OFL.txt
+sha256  656a20870fbcb8f559f1c6308c1df90ac93d7cd0279aab49b43a43b5e58534e6  ofl/neucha/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/zeyada/OFL.txt
+sha256  4bf7256c8ee73577ee5e26643d3247ec77017ca04489befd3e0f3412827729c7  ofl/laosanspro/OFL.txt
+sha256  33e3a83e377c6a41149044bd919f50d9a971d801052d4e0c0a98cb417b42ae38  ofl/risque/OFL.txt
+sha256  b4fc1d55ce610f255c5712f8169543f9610536d002deb99bbc99bfbba9f8a560  ofl/pangolin/OFL.txt
+sha256  511125dc85198375795fdbc109d088654d3b7f9dbd3ccb7bf93d844aef0b153c  ofl/ptmono/OFL.txt
+sha256  819e3b25f9b50f12299a3db1638be3813efc6b938f2b86693a218d20ec4e3209  ofl/londrinashadow/OFL.txt
+sha256  e3ea566dbf689a9110b2094f9f2e5d16d7ec31720147651efc1005ca20420dd4  ofl/flamenco/OFL.txt
+sha256  186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlowcondensed/OFL.txt
+sha256  705960c3281a5765ecc0b59bd4ed7ca59eed165748076bc2fc3e8fdbfeb944b0  ofl/pressstart2p/OFL.txt
+sha256  7e896665d0863d2a17a671001dbe2528a5f9302f1dff9222af8b0834e9088d0c  ofl/kiranghaerang/OFL.txt
+sha256  5f1f5510eff7922864bf326ffa1d4a62f01add5193e9367b542378e5a808b500  ofl/handlee/OFL.txt
+sha256  3173acd82f8c6159b5b1037b539fcbd4edff68e65c2ea8b9412b5a5ca97b08ff  ofl/archivonarrow/OFL.txt
+sha256  82831e8f12ecb6deb2f4d9919a04049895b4619e0301fa6b699c861bd7311c54  ofl/kavoon/OFL.txt
+sha256  1a5e3792a425687a523fc7c0f8ab5d01d58bf853149d57f3dec4b4fc6932fcf6  ofl/hanuman/OFL.txt
+sha256  7f91d7d8854e5cb4fc630807c0f4d57c07777769dc597173fe0aef5e58f0992c  ofl/qwigley/OFL.txt
+sha256  354b4be0340cd58e381fdf58793a108897bf944a7f8faf9e877c476ed6c730d1  ofl/convergence/OFL.txt
+sha256  1e20933206ca06421c7c378184da5476d195314cf4bcda2bf122cd45d69a956e  ofl/oxygenmono/OFL.txt
+sha256  a7fe1f3d23034092b015aaeb53d2ecbc9e592be96b10bdfbcf8700ec6a6ffc97  ofl/fascinate/OFL.txt
+sha256  4dbbe5c21b46f2647d227dde69b971a1b46de1435e0752a9eda1ce120725a93c  ofl/norican/OFL.txt
+sha256  1f581506286e960436548dba0701aab278f7e67f2adc6bdae2958923867d1e64  ofl/hanalei/OFL.txt
+sha256  56edbe5fff7981dae6f6eff32f61ba04cd54324e5abfa44b1257b2a307ea561c  ofl/poly/OFL.txt
+sha256  59bda6b53e28d388de5eac7bbb8f3e65889dc8489be3d922f95a525354110c0e  ofl/tharlon/OFL.txt
+sha256  3fa0ceff4b9a2d28dde43bc63cde3acfb5e6e92d13a53e484ca0e501e18c7e2e  ofl/lekton/OFL.txt
+sha256  ad9ce814ff266b57d3c4698d3fadca4b41a6f942a0ddd215db5cc66abf92d668  ofl/mako/OFL.txt
+sha256  c4afe82f49c05689c40dd4e262803b29c6e611e7b4efd3a0418f574b2be79d9a  ofl/carterone/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/karma/OFL.txt
+sha256  d38acce513eccb51d7ac34ca47be279e1fcfdeca1ed088bdd2d281dc6ca939ee  ofl/badscript/OFL.txt
+sha256  31eb7046f4c80e0f96944c4b40b0772de68b34783b794fc13aab3f54c2ef6d9b  ofl/thasadith/OFL.txt
+sha256  06c79c896894160a5810d869a822fa7d02a0e2ccffd97920b8cf3b880380f6e5  ofl/amstelvaralpha/OFL.txt
+sha256  4faa2d9e2ce0a4b5b37e62ee6fafe474a539b31578f7214ed97cc3503aeb8ebd  ofl/oldstandardtt/OFL.txt
+sha256  1e511bb01d29562932157365418c02d954d8faeef794bcd54729177fb2b03db0  ofl/istokweb/OFL.txt
+sha256  846e8cc6dc69bf685d2db14cfa758ff3d9d771d54c9e0d3b511f0ecb97ac0e8a  ofl/cambay/OFL.txt
+sha256  6c181f5a0045e8f414e1c232c35972ab83ea084ac44825f517ba001628d97b21  ofl/kronaone/OFL.txt
+sha256  d7f96801a28ea11eaa51bc4a9c87fd91f2133bc298068e6e2847a15ddda23089  ofl/librecaslontext/OFL.txt
+sha256  1f00d1f970b4ea469b6936e599b599bb217edaab792e586658ef2e71cf438685  ofl/sriracha/OFL.txt
+sha256  22c4588bdc14621220ba14515d52041d1312541e034a15d1f5c2a88fc6075276  ofl/merriweathersans/OFL.txt
+sha256  1103d0731f1360eb156b0047a1337b2d62266fadcef1015d06f6263719c0200b  ofl/librebarcode39text/OFL.txt
+sha256  5b26c88d163b1430561f53fd3d9021d6057f3c67d25534a5d8d232cfbf8ee2a4  ofl/wireone/OFL.txt
+sha256  57f8d60cfe9212b971f07253e303746128edd06b21e3a0e4e188308e569f03e5  ofl/orienta/OFL.txt
+sha256  c87702d8b70f714fbefb554660e8ca57a43ef62a59089d11cbf0c6bd51d56928  ofl/lohittamil/OFL.txt
+sha256  6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejuhallasan/OFL.txt
+sha256  9437c26410bcd543607a6775e7d0e359c1df3926d68c92dbaceb26ce79cc0fd3  ofl/bevan/OFL.txt
+sha256  50265d2b41f8ad2dd350532d2286509aa694021b4aa0490b06f0068e4ed78c27  ofl/herrvonmuellerhoff/OFL.txt
+sha256  9acc45e5ba18b5b38868fad1f51c03df4f5d7a43061d46314843de45c4444233  ofl/ribeyemarrow/OFL.txt
+sha256  1fac7a3e4e43b091c2d31aef7a375d2b969c42b2d5fce8e2d40b5f7b1233ddb7  ofl/moul/OFL.txt
+sha256  331c71cbd8f1d8a70cd6eec3d55553b64e6261a9bb0982fa12e6e48baca827c5  ofl/philosopher/OFL.txt
+sha256  1e20933206ca06421c7c378184da5476d195314cf4bcda2bf122cd45d69a956e  ofl/oxygen/OFL.txt
+sha256  89418a3c7b5726c3f8828a7b7c3f1cad661cf5b7a1be3d2bd9ea243f8d9890c8  ofl/sniglet/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/balooda/OFL.txt
+sha256  89d9d01291eeb91074ccf1f7ce07e7a1d9d421ec1191f8e84d440cb50830ed92  ofl/purplepurse/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloopaaji/OFL.txt
+sha256  9acc45e5ba18b5b38868fad1f51c03df4f5d7a43061d46314843de45c4444233  ofl/ribeye/OFL.txt
+sha256  f938d4076b66a13cf984ce88d92a07ff9802e8ae5e1f4a28cdc43fad122ae611  ofl/spinnaker/OFL.txt
+sha256  89bf0833b785c49b0f271273ab440bdc20c85bf0322537dc901df940bf1579da  ofl/amarante/OFL.txt
+sha256  377f4f9c19e935228552478eb68cc2ed82910988a60ba60e2ac73b09f32d02d1  ofl/patrickhand/OFL.txt
+sha256  684ef102ca4c5ff61cf1c1e5c2c6326f3c26f848446f98b8862dcca716a87601  ofl/quattrocento/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/rozhaone/OFL.txt
+sha256  61be7c29f4835e2be7243db12213d75d53ff028f29f4b493212a1688b1d3a1ba  ofl/titanone/OFL.txt
+sha256  9df0700fcd0ef48abd74459a8650d35f59397fbaa00c5b00527e57cc155689c0  ofl/durusans/OFL.txt
+sha256  b1958132ff727bd74409aa37ec0abbe4be13b1b379e1210e6fb77fc608c607d5  ofl/kodchasan/OFL.txt
+sha256  f1888ed385b528866a472d02f4e06ef0873aca5b3c63ff1f6116cbb150dc9a13  ofl/metal/OFL.txt
+sha256  e36d420a3b382b337c386338d8abc3635e10de5dfca7f822fc63ac659a0dcfc3  ofl/amaticasc/OFL.txt
+sha256  8fbe530adcbe30c658393c3f2b5a4785d6765afcefdfe47f594730131f3a0abd  ofl/oleoscript/OFL.txt
+sha256  60ddc0ee6e443b78940b5f92bcbab76c98ec6965e0da9fbdaf267383ab72bba8  ofl/anticdidone/OFL.txt
+sha256  afc1b710d644c1262e1765d2401abcf93a545a4cb051955e2243fbabb8164e25  ofl/carroisgothic/OFL.txt
+sha256  3184f6a99f589c78740fbff6ddaaabb43b8cc2f3852da36e60aeb024ea8d6f00  ofl/eaglelake/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/halant/OFL.txt
+sha256  9a9f089005f389717106bb3ba427cda9bd51b8a477078644566543f2a60ca85d  ofl/rambla/OFL.txt
+sha256  99d2f30e282d6174af8ff68597f58bb53c0dcb2b104a4c1b8d19da49021d00d3  ofl/unifrakturcook/OFL.txt
+sha256  2bb0c0200723d923f8e20d08b8bd1c7af7f5cef8bb2d63ce44bd268b54334621  ofl/fjallaone/OFL.txt
+sha256  72afba97d1ac9409a9fd3bb91a02a639427ca1988977909dad273e293a508d7e  ofl/staatliches/OFL.txt
+sha256  88aece7d90f2bb7049719f11619a560af22af3451af141f12aa4f46bb157a99b  ofl/lobster/OFL.txt
+sha256  955655cafa13f187f45a79dcf451942fd1118a8426abc5a25ffc5dbb00709da6  ofl/juliussansone/OFL.txt
+sha256  9e1c955538817c3fab7160cb3110501e73ce109eeb58c4992a14e8323d900849  ofl/pecita/OFL.txt
+sha256  96d82a96abc02fb457ddde0227833dbde9d1d02876c91f0a4e27845ca0d692fa  ofl/atomicage/OFL.txt
+sha256  7729f005b7a087368e2cf61fc4b65cdc85988e47d0e6e38c93a72de345e86b41  ofl/newscycle/OFL.txt
+sha256  336fab6956d78eb34b50cd7bc6b16116c44735fbd0bf9f4def769ca4d8e218a9  ofl/sofia/OFL.txt
+sha256  b26cae1321380296ba8311b632a397d5eac11b47197f9d0aa0b9310f1531ad60  ofl/sarabun/OFL.txt
+sha256  aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/suezone/OFL.txt
+sha256  d3711c90a7deda6210d30e41b945f16bdaa00662b30ee0b7c36abfee82525bfe  ofl/kokoro/OFL.txt
+sha256  513b7871a360a6eccd426bab59743fbff36764588f47381423f04ad6b3d821d9  ofl/alexbrush/OFL.txt
+sha256  67f64c5509e5151796599e3ad47c3131cbe0c80c4f9430b90236a1249c2eacc9  ofl/roundedmplus1c/OFL.txt
+sha256  4a7d2f227b91046ef7a54f8f735668d86e45f4fd4089268de292a6e9de108253  ofl/bentham/OFL.txt
+sha256  3c187c861dc291b9f7f96f655656f9ac2d57b33da425bd5962810be728344f57  ofl/brunoacesc/OFL.txt
+sha256  869e4c29978c318b33c2e5c7c8f24d2e947f249071bb1471620036a9d1ba87ad  ofl/k2d/OFL.txt
+sha256  6383249ddffbd87f2bbd7878ceba2dee0f1a2193cd7a4f41c00aaceb8e6d8b5b  ofl/meriendaone/OFL.txt
+sha256  ed50ebe2fa922554980909192526fe94966556626d6d440a462c8e7eaed74cdc  ofl/sortsmillgoudy/OFL.txt
+sha256  d64c91b0306b53fabed08762068eea8b918d654fb0721c288f13cefa4aaf088c  ofl/butterflykids/OFL.txt
+sha256  bc1175730d609233043cde47e48f69831f012e85537c5ec1a2cf4836757c1540  ofl/mali/OFL.txt
+sha256  fe5e822667a4b2e083b8fdd7a37546163f26f6481b58742236abffdcfb3e6c71  ofl/baijamjuree/OFL.txt
+sha256  b0316f404a7b291e40921c605160181065791a5010a2d2d5691fc7e28cdbdff2  ofl/underdog/OFL.txt
+sha256  c026db4c1a557cae47e6930876965f9cbc05758eb1f5d6f59b6b61c8f342a57f  ofl/alice/OFL.txt
+sha256  aad1e82802172d4c1d22dd015a5b8b4275e5665a49c1df54ed64716fca7ae194  ofl/corben/OFL.txt
+sha256  878aec7282ab41d058cedbf90e14512bcb4fbd0658496de8c2dfc592ed1f0cd0  ofl/lilyscriptone/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellenglishsc/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/sarpanch/OFL.txt
+sha256  aff3cea99bf300b4b29f4dc04867cf9b49d83de8c5ecaf991c446d506b56173e  ofl/wendyone/OFL.txt
+sha256  b054962de0af1397d5350fddb4d6bb20f5f2e073b543eeeb694c7c3b27144fc5  ofl/chivo/OFL.txt
+sha256  19849b33c59d0cffeaad0dbdc38db767e95e03cd36fbbfe6b67a9878aa5758df  ofl/fasthand/OFL.txt
+sha256  a57810cbca0b4715ae8610dd7a268260cebbdd4fd76d304e371517f828150669  ofl/stoke/OFL.txt
+sha256  47a0b7e315bc56ca0326fca46302d87d48a61e3528d4196e966b62f5bf0243f2  ofl/armata/OFL.txt
+sha256  eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumgothic/OFL.txt
+sha256  616e75d879831bedfa7725c078e09bb56f8a17f40b194e16691b12251bb42b3e  ofl/majormonodisplay/OFL.txt
+sha256  75c7ccf4f537a7a3ebbedd299c1d2542e13d3b27aaf76a0a2d9fa91a2a8fcd3a  ofl/felipa/OFL.txt
+sha256  ee2c069b30f3e9a5aaf52357117ee3443ee27f17c29a2ec68861db283379905c  ofl/dynalight/OFL.txt
+sha256  fbe0442a6b1ce162c95e241df76cab5ef2daf6a5ac84ae1a7a6749f32c051098  ofl/breeserif/OFL.txt
+sha256  43d530580461a574f6dfed9e15af6a74e95f7c04d9bfa1174a63ff036e8eee07  ofl/rubikmonoone/OFL.txt
+sha256  40bd3f35477284c021978816e9d3b8723ff2283fd7065fafaa5bb3004e41b237  ofl/songmyung/OFL.txt
+sha256  460966d12f306a007930575c3b8bc336fe0c32f880d622af6d3b745a06ca79a4  ofl/benchnine/OFL.txt
+sha256  f6f60d5d4cf4f4b1fc4e41353c897a2f5a16e6396c0cd8fa8bdfd2f4586a9a68  ofl/alegreyasc/OFL.txt
+sha256  0c922e2d65050677c26ae8dc501bc9ad3e0059c4b10df2fc9717d7bdacdfeb6d  ofl/ramabhadra/OFL.txt
+sha256  548890e4083028f04e5feba04b6e00554654d840aab81c8664eb66c2216a571b  ofl/palanquindark/OFL.txt
+sha256  e39d6ec64a37ed1523a59940695a61ea5e7882d9bbe0e7eb11653fda4b04fc79  ofl/kottaone/OFL.txt
+sha256  1bfe7d2aca99042eabf37079152fef8abdda2c36dad454ae89b858a3cb1078c5  ofl/forum/OFL.txt
+sha256  5505d1a010ee0f2eeecdf624984d2a6170480adab3091170abbcedd85361f1b9  ofl/novacut/OFL.txt
+sha256  715ba72697e14daa9b29a333545f69bde7c497b9f77d0a2a4c4a5a752d961801  ofl/marcellussc/OFL.txt
+sha256  0786594992757ea0290ae4a490ab9249728f372adb13959c0c8ae4fec83057ff  ofl/quintessential/OFL.txt
+sha256  ca13e9cd1faaa6afb9e43dcb534a8984cec3218993fb4b436468a79a1657ee19  ofl/keaniaone/OFL.txt
+sha256  760fb433c515570f6b77ebc60299c2c91d5f03848c659452a9d2458b28935768  ofl/numans/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantunicase/OFL.txt
+sha256  1d1b7f3480c8d9b65c26d205e41dcbfa85731588d6ea50bccfa78e91f242d629  ofl/loversquarrel/OFL.txt
+sha256  1d08c63944e639bbfe8a1b81e3c6a63836806c126b3573b9cda0db83fd27ffe9  ofl/prompt/OFL.txt
+sha256  eb6c70cb6b575ad22df022d454df7a20582915e6e8da19b579c6cbef37a26bb5  ofl/gafata/OFL.txt
+sha256  93f60741563b4f51f2fcdb207fde72b2b23292a47022c729aecd998b360d8038  ofl/bilboswashcaps/OFL.txt
+sha256  4579982a484a9745864de2cda666fd7b5017f9182b74dbb4cd53d84c1d1b2231  ofl/gruppo/OFL.txt
+sha256  cd059851dc2abcd2865ae318e8b949736f958794210acb90316530fd100fc904  ofl/geo/OFL.txt
+sha256  af9b97696048d509e3d70f8108b7c4381084f95c8fedd97acaa76b0b287668be  ofl/molle/OFL.txt
+sha256  6958d8c61b6b223f81bdc2109941e5d0004996dde61e197d628e0293f4f1bc58  ofl/miama/OFL.txt
+sha256  7e98b49a12b51240c85b04eb0d9919a6fec7dbd491bef6cbddc22d3f851bd1f1  ofl/marmelad/OFL.txt
+sha256  b9d592c3bf421197d9b7e353416b8e2ec81584988824b43d38c86d997a08b868  ofl/myanmarsanspro/OFL.txt
+sha256  e414e07f7a4da16ed47ebec80d52dd79f21d3ca42bc92385a755d8078a038814  ofl/playfairdisplaysc/OFL.txt
+sha256  0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairaextracondensed/OFL.txt
+sha256  bc85bae0b512b799bbfb2b916e4d0a34cfd963d09778cd783e248b479e67760a  ofl/comfortaa/OFL.txt
+sha256  caa697668c3cf3e622753fb202c6c2e29648b94a3499dc7b869a14192e38c553  ofl/sourceserifpro/OFL.txt
+sha256  81d6c3788a6b641cb9f543389d9d5c0cd3bf94fbb5639be19c102b9274c34291  ofl/mousememoirs/OFL.txt
+sha256  dd028a807788d5e22e9f8cc18f026cda23369954673658f2ecc7d30bdb364b89  ofl/arya/OFL.txt
+sha256  53f9c99fa3d47f7d632a42ee7bab4a834a60a744f6026d676c3a223cef2b2ef3  ofl/vollkornsc/OFL.txt
+sha256  6506b2fa2a14259a8859608a6148a4591d67bbaef4d8e1948b43c4078561b0e5  ofl/tauri/OFL.txt
+sha256  6cca1abc09d677cf00a55674ce2775e0eeb6dc5c0137b0401816680b9e500f81  ofl/marvel/OFL.txt
+sha256  e98ce988fba1c138f4e7c0c5120809706ab1b24a3c29638ca83ab2ff082e08db  ofl/chango/OFL.txt
+sha256  0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairasemicondensed/OFL.txt
+sha256  42e7b456fee0d0dc86927579b3d2626d42bb0f4cc9778f3a92ca8ada4e46348e  ofl/novaslim/OFL.txt
+sha256  1b8eef90c567309fef17962cc969dd9ed1de69176517238e744018bb983e7c1c  ofl/mandali/OFL.txt
+sha256  9e262d6d7fb789aab6a8ecc53fc9c78387eeb9f935dcd289282d8e751b6bf743  ofl/antonio/OFL.txt
+sha256  07dbf75115edfc1fd75580aa19c4c730201a099e8f86a9869887dfbed0547266  ofl/offside/OFL.txt
+sha256  f177d98c67b84250ec87a03ca6ad161e84cab15b435e960039b971797a065f4a  ofl/martel/OFL.txt
+sha256  bb3e8082faf86b1474a6b042125ef0f83669d28110b72f70416a7587b7b9f144  ofl/unlock/OFL.txt
+sha256  c4955dfe15a5db10326aa58ef767460c42cd12a3acdb3e698eee2704eb373d94  ofl/electrolize/OFL.txt
+sha256  cf6dd07485d67d20f105afb9981dffdb6b180b59af45a228839cf3fb0277c9fb  ofl/arapey/OFL.txt
+sha256  87e8d9aca71dbe0481ba8611fc90d7e3aebfa3e2546420c403e7078898b0c484  ofl/allura/OFL.txt
+sha256  55e13d77a4457aa9c60f10c5b97baea3343d3bac30960d49554a033cb9eaff7c  ofl/sail/OFL.txt
+sha256  1c5bc055869d5e9151ec7774082727db720ec4293c65be67f91a4bdcaeb02998  ofl/righteous/OFL.txt
+sha256  de5ff32211a4340b01477af39ee339d639438955e409f79b666d4b9207f3c92c  ofl/dohyeon/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/waitingforthesunrise/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfellenglish/OFL.txt
+sha256  44a7c6e4c5572392ae122d3b1d8c6ba6fd640a7797e675384585d947f2773e3c  ofl/jua/OFL.txt
+sha256  1ba345a91338581e5f8fccc3e37e447ddea5b99ec9caec1b76c7c39492387d2f  ofl/signikanegative/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantgaramond/OFL.txt
+sha256  9ee6b2ec20a06c599a07412690876eb457bf192c10e886e60d8bdffb80bc21a3  ofl/sahitya/OFL.txt
+sha256  dcc832bd71ea62cbf97f06327a1b5442905b49ea446801421d71f7d1362db215  ofl/dokdo/OFL.txt
+sha256  8aa063e3a1299c5e1821f386f5ca8bc157ac561bd12c739ffa81c6f0821450c0  ofl/donegalone/OFL.txt
+sha256  e588abf45ca2b19c340c4b27349c9b6b6e5e198316fd965128ed9f4422942cbe  ofl/raleway/OFL.txt
+sha256  9860b97028024085855e503e32c1971bfd603374641cd018c136433ebcf5a338  ofl/gravitasone/OFL.txt
+sha256  ee9d043332991eb6bf2bd56fb04db3c558c1ee2f0cb9aa7b18366c77e34fef30  ofl/jura/OFL.txt
+sha256  15b1a21c3fa37a475ba6b0c0cfe289c7952548caf6e432068ddaf98d139ce419  ofl/belleza/OFL.txt
+sha256  c5a77946a56488790364d060628385d51226da62a18f30d2be0181d82ee62b00  ofl/suranna/OFL.txt
+sha256  36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166  ofl/megrim/OFL.txt
+sha256  0fbae33ac3aa455c8c0d598347c87f1abfac0d215483f40f5a0e8dd08076df1b  ofl/librebarcode39extendedtext/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/teko/OFL.txt
+sha256  d324289a26909a519fb16c3d468a56ab909ad6d9070cac5742e5d59ad9bd9815  ofl/gildadisplay/OFL.txt
+sha256  c0bcb72e68dd416db0bb9fcec7a7fa62321b0147cde00d8c8f82748e33aefd34  ofl/novasquare/OFL.txt
+sha256  794d72ffdd25e8f7ca8e1d68db088c30ddbf2fdb369b6cc8217d4fa5fa6dc62f  ofl/adobeblank/OFL.txt
+sha256  806cb93632b8091cd36554642a96b2752bab50015da6a2b456d786c1f9aef5a5  ofl/carme/OFL.txt
+sha256  0677891e6a143f297350d260ad766ad33bfc18ed5fa4f213acf648d6b597ec1a  ofl/alegreyasans/OFL.txt
+sha256  08b6f5cceaefcf2881eb009adeb78edd0fabf9c8f0eaf8b88f07a690222227e6  ofl/varelaround/OFL.txt
+sha256  3f0f27931c92453994176af3b1e7954f9aac39fe145374d6d08c47c822e82e59  ofl/princesssofia/OFL.txt
+sha256  2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeoutline/OFL.txt
+sha256  455397ca15d39e9178bbbf4b485a29187751d60f7ceb7829980a521d5ab6848d  ofl/sofadione/OFL.txt
+sha256  b7574cd4c76770e5e3915d16bd93f09663bd77cb041a4ec09d824c52b540529a  ofl/germaniaone/OFL.txt
+sha256  39de3de5f1873f89bca4af37823ab22e28e88d0d8f7fe2f07e82e9e6e9bf7b70  ofl/eastseadokdo/OFL.txt
+sha256  520a0c239d39b379b61c4de5f8e3b02db20b0dfc137481843eac01f02c41f4a2  ofl/aguafinascript/OFL.txt
+sha256  ffaf7bc750bdaa0b95b09eb80e419748bfaf46268c6612860f0a5e19e17abb12  ofl/orbitron/OFL.txt
+sha256  c6b9c7322fe0203d4d8a0f98541136d8d76da76b92c79d206b09991b98338cc8  ofl/gemunulibre/OFL.txt
+sha256  2f871c2e81de6d0c72c981615002c30bc9f1637003d6d3d4c3f0149886b70569  ofl/mervalescript/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhaijaan/OFL.txt
+sha256  842b4f4605b32518a1269c4d030d719ea2c4c317d699fc4441d0219658e18893  ofl/seoulnamsanvertical/OFL.txt
+sha256  00a6fe8dfdc48d6206bcc4f10a765515a73433dfba7255eff966963beb26facb  ofl/dhyana/OFL.txt
+sha256  cd2dea62cd4b0c5fb335cf07ff04fd5c4bacb49b8d6c2bbbef9766c663d79b1c  ofl/patuaone/OFL.txt
+sha256  c0a8947de199b422d30c16137e4decd5362e3a1d504422880d69c02bd6046dac  ofl/cagliostro/OFL.txt
+sha256  c267a00c9476c78a2336d7b372b536885b8b24173a29ed53496f67a742c14961  ofl/alef/OFL.txt
+sha256  2cc926050c4c6ccd9a0288b7792e2fcf93e5629ee6269e35986f092275e5a1b9  ofl/sarina/OFL.txt
+sha256  f1bce31b817dee01c1e4ef8bc45d8ecb95f01f4abbf0a985007cb3cd0fd8123d  ofl/zcoolqingkehuangyou/OFL.txt
+sha256  9788e3b3e67f22ab5846a0bb867a230e7df2468c3cd20f730a5d9c34e673d090  ofl/rubikone/OFL.txt
+sha256  f3bc8767749fc133d9b35e84ca024b82f1ac4d1b38deca0adcf8300892303022  ofl/faustinavfbeta/OFL.txt
+sha256  ee81f11dd1970e9749afd2a572256f8eefce65532872762a4d7a3d5daa0812c8  ofl/shojumaru/OFL.txt
+sha256  4f4bc3806a1e55789c6ef75ca5fc628297b05292f74966474dc0d40324abc609  ofl/abel/OFL.txt
+sha256  064539f87826887d2062b7823b2b97b7625d68b642f6c945c99c0b8dc8084195  ofl/rationale/OFL.txt
+sha256  a345b13576140008a697ac66ca8c76cd63b1dd076712bc30a0f5e97dcc53cc83  ofl/markoone/OFL.txt
+sha256  203693528d6d2e8dc5e639c6ea42b3e825b59dd6447294e37b306fe734650091  ofl/arizonia/OFL.txt
+sha256  9ca8b9e5db7184105da255bb110023cf1cce6caa56186341bb7b09ba97b20ba5  ofl/fanwoodtext/OFL.txt
+sha256  3997621a219c7758e31dbafdd3cbd2bcb0b6144a41d1ca068d04dbcc4bafcde6  ofl/milonga/OFL.txt
+sha256  2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungeeshade/OFL.txt
+sha256  162a3b5c72cba845280a6f887c11d02984540b924510138c8b1eb473bcdafb6a  ofl/concertone/OFL.txt
+sha256  21b54eb0d7513524798a00dfbaf99a02c003a0012a728cc5f0e02d24c50482fb  ofl/caveatbrush/OFL.txt
+sha256  186d750eb496a4c17a76385f82be6aea2ac1cf2de074a811d63786cf374ea73f  ofl/barlow/OFL.txt
+sha256  9551ade371e7bcb1f6d9959273bbf1fed3bdf398efb5c57cc1fd85d6a13e9e5e  ofl/londrinaoutline/OFL.txt
+sha256  f15a9a3a9a665c2d17655b8fedad86d9a8f30081d46bb91236beb1bc7294a589  ofl/akronim/OFL.txt
+sha256  76a55594c9a18b7d94b8119de838237eb834bae4e8c646d6d363aee587b7b427  ofl/slabo13px/OFL.txt
+sha256  0e2ccc5da1dd979f08ba82bca2fb61592506a1e58d3cbfc26d904f0db71bd812  ofl/sairacondensed/OFL.txt
+sha256  96b7bc175186cd0153a9682a1c9bb1da7103ab13a83abef8026bc64582ca616f  ofl/oregano/OFL.txt
+sha256  6fc386ac48a529b85c21f90a6c8d2111c6271b3063f9ddd78e92645db5259510  ofl/tulpenone/OFL.txt
+sha256  13e862ac3f67130f58bd4bebb61c588d147b5a555b1ac6959570799c4f648cd0  ofl/capriola/OFL.txt
+sha256  d24ff874133ecd133e55d7c4070d2edab14d3933477c2bccb3a0d8d1cc9c33bf  ofl/muktamalar/OFL.txt
+sha256  85814924eca98e1fa530901cc5167d0012aaf31122f9570d7e9755443dd9335b  ofl/siemreap/OFL.txt
+sha256  f76c1013cffb3e0de0e7dad19ee5b4b7849c7ab10b67218515e39cfd87e554a7  ofl/julee/OFL.txt
+sha256  c264f64bb2b91ca0dfdeab75d71719120271fa6a30035396416af235ef481c1e  ofl/merienda/OFL.txt
+sha256  d102f22055cfa31a9659228483de3c726010f0b3b416b78e3cbefcb54816e812  ofl/galdeano/OFL.txt
+sha256  2db02cb5d05d5f8a003ffefce36a32a16520ad4cab9ed90635ff953b583e4e82  ofl/sigmarone/OFL.txt
+sha256  cdcc959c42ab255b4cea4bd82f2db5c24a2da7ecabe615d02d5a5dba3716e446  ofl/racingsansone/OFL.txt
+sha256  c88333734ad7cd30540ec6614d12aa829a0395715de30e336d22ddfa3005db42  ofl/catamaran/OFL.txt
+sha256  26daffa24723bb188643085cfc5423f9d78d22a395df4a7928380e430545a201  ofl/bubblegumsans/OFL.txt
+sha256  de2246895f0ac21fe05b095d586d36cbc9f987ebcaed1e050c61e69667caf1c6  ofl/hannari/OFL.txt
+sha256  b54d54664cddcbf05f5b4ea3aec7e89317eb917cf465920969e7b22361e0f4a5  ofl/seymourone/OFL.txt
+sha256  46239ba6485d28553fd944da4ad32a00d9c403aa1c3e111676b0b96fe458d1d4  ofl/averiaseriflibre/OFL.txt
+sha256  91c25c350d3cac39da2736d74f7ba37ef648f5237a4e330a240615bc8d8c4360  ofl/ibmplexsanscondensed/OFL.txt
+sha256  5802c9e3509199c7aa9a13ea410ae27febbc0cdea184bf7d227170fac703bba8  ofl/passeroone/OFL.txt
+sha256  2400b30a72d2b1555255b81625576dfb552584a19a9c85ad8d43ff77bceab13b  ofl/plaster/OFL.txt
+sha256  4bed7eaae70cab1bdf2bcf9b1cb562fcd9cc26d1c3533c4ade0ec70516dfb3a4  ofl/trykker/OFL.txt
+sha256  45b1f44d2cb859ea4b7be2f322c57b8ff7be55075c336744e62b5550cd0a97eb  ofl/medievalsharp/OFL.txt
+sha256  19c6ecf65a6b0687dd324b093ced5f1020a1fcabfc8ddaaeca6906cd05153e23  ofl/overpass/OFL.txt
+sha256  ff1f38ac4e694a4ad5bd3d7a5146cd8bd73fd57aae794ced76a24b0d68e41206  ofl/pinyonscript/OFL.txt
+sha256  6aa923334ec515d26b1a61bb978a0bb5bd8884de7529add1625beef2f4a53f74  ofl/nicomoji/OFL.txt
+sha256  cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesansexpanded/OFL.txt
+sha256  38fab5a643fa935a4e11edae2d7b2bbe9866b4f4828c2be2f41451b3f27cb67a  ofl/paprika/OFL.txt
+sha256  a5fc033225d145b43fd7391482ae7689825414ce29a01614d651a3012b57c81e  ofl/monsieurladoulaise/OFL.txt
+sha256  ecc91fac753ad9ba5bb7e7819a5c59ee1e3cf89032133c6b4b0318d63c35933b  ofl/alike/OFL.txt
+sha256  6939af7114f0a33c7e6142d4c1320d1bbde11aebe6d8f3c48fc5fb3e0f676a7b  ofl/jejugothic/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldoublepica/OFL.txt
+sha256  9cd20277e2c89d47e3997435e3a16539d20173d850fbb42474990f71642e473e  ofl/mate/OFL.txt
+sha256  351740da2d452b48193483f22f64918a6dfd64a7abe225c6187ad3f36e0d9cd8  ofl/postnobillscolombo/OFL.txt
+sha256  aa8a8196a3e22c3bd985e33cd3245ae9a38accba5e79fc0e3b292612a8d6b337  ofl/secularone/OFL.txt
+sha256  cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesans/OFL.txt
+sha256  136a256d6050ed32bbf96736d70b9099c6359e83dabeb6847cdf6b8ef84319cc  ofl/kantumruy/OFL.txt
+sha256  72060253bd481a8dc18664bb9117072dc07c0f0270a40617c230654821774850  ofl/pattaya/OFL.txt
+sha256  56d9c3529facf93873a2a1626dd038054d244b3af30a1e3ffe0e78bbda1c7622  ofl/preahvihear/OFL.txt
+sha256  1a2debd5ad8e656b26bb3b29213caa8f7e557a2f31454b11ebb6c3e3b59aa5d4  ofl/cutefont/OFL.txt
+sha256  f62ef357d3a1c3d27edd35a6e1ba350e8a8d13499797964eeadefbf0b3b15d1f  ofl/kalam/OFL.txt
+sha256  d941c5b788d47aa469ee54e30f4c12d6a43c45a295f10c568bdf9772f2893b7b  ofl/oranienbaum/OFL.txt
+sha256  5e0da210fb04058a8c0087985d2d456b931c2579811a49655721d3cf0c36b6d6  ofl/notosans/OFL.txt
+sha256  5ae0cfa62a70251d9a2c3c5430ed3bafa480005f23e4b9525488f2318e5c10ca  ofl/mrbedford/OFL.txt
+sha256  0acef93ca37cf19eeb83a1c6a29b78b08377a211c8d80cd27626e210176828da  ofl/kavivanar/OFL.txt
+sha256  c0562e066174197902a4a10606673d189f067970ef89c6013943b9cf182aadbc  ofl/titilliumweb/OFL.txt
+sha256  f8fbefb5b1004615e6d1e84b1c75e68520d91196f600cb1b07620dd2748eff64  ofl/cantataone/OFL.txt
+sha256  2e2cb5a98da665f2ab82a9fd01fb18c2337f845761b0c163f690ed65f3b94677  ofl/sacramento/OFL.txt
+sha256  251f65282ff48a7e8ef3fb661fc99254d9b3b0c368427c98b1edbfe4ca66e888  ofl/katibeh/OFL.txt
+sha256  31bc966c36352bfd33717382786d0458c38ecf540628ab134e0ce35fde801d28  ofl/poppins/OFL.txt
+sha256  f016385cb4b360e7698d22a48c6b58c0634b1ed5c9c17df78515d43887511df6  ofl/yaldevicolombo/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/swankyandmoomoo/OFL.txt
+sha256  b712dacdda5da76c0213f8478886f893b855665c1153ae438bc3e55a7dc525ef  ofl/kurale/OFL.txt
+sha256  74584d937293a9cacdcd2eb05851b71aa1527901c18b87961d2f877c77a1b486  ofl/chonburi/OFL.txt
+sha256  8f187da1eb4f23e3fe7ba68b1cb2e92881a415dd34c46489698454517e273c4f  ofl/krub/OFL.txt
+sha256  3336bf5d4e7eedba48ecb831f37bf676e901c39f2e6a422cceadd9d2ffa55be8  ofl/kaushanscript/OFL.txt
+sha256  bb655534b6c7bf3e547c1368a68a5b1032d0e96fd08b5cc75f3d7a78528784ef  ofl/novaoval/OFL.txt
+sha256  04b895d77ccec5034191e953e8e5884637269be15fe0675fc25039014eb46349  ofl/monda/OFL.txt
+sha256  d724dea493d89a7a9681186e2fb462b7cd551674960ee4142ae6b325261b5115  ofl/hanna/OFL.txt
+sha256  64ecb0c6bf5cd80c3da76035c00671272966afbd32ffbdbcad95a8b56501fb08  ofl/decovaralpha/OFL.txt
+sha256  0cf28cdcf1cdfd35054352816b2d8c81bd6d6f73632198b61507f26dd4dcbeea  ofl/sansita/OFL.txt
+sha256  d69bcd35f4a121b312a64f7e8eb15bed61c9056e9e9cdaa8d513366142c8e005  ofl/rosario/OFL.txt
+sha256  b4cff421cb89d1e32036e818f291f8ab0d3294ada70b5883d5bcc6470b869702  ofl/eczar/OFL.txt
+sha256  ecb52bab55d8d6185712fe8fd2fd98300f5c8c07fad0d0a97b1e579462b0dd3f  ofl/bayon/OFL.txt
+sha256  ed95c33f80ccca002e3a360b683c43368f9c5eb024e5b992abb51af3c10b59bc  ofl/gothica1/OFL.txt
+sha256  66b5c49d384cba754806a891ebd52f2ca08dd05c0eb3c56170192da466a00a20  ofl/londrinasolid/OFL.txt
+sha256  284a5a26e6db9a04259a5690ad57d52c56a4c515ca2ece1943d950f99e709dcd  ofl/belgrano/OFL.txt
+sha256  6cbe0f55c154b5dee71ca4f2418d69e4e916448ef2ab52dc4541197b292efa24  ofl/sonsieone/OFL.txt
+sha256  255d5debbb80eb2ea762644311f266a279e8778f00156655a516e2b7781a63e1  ofl/lilitaone/OFL.txt
+sha256  490b8f3acbce2331adc9b9d3e75ee6fe07946fb29af429a300c7d066b1250b2d  ofl/crimsontext/OFL.txt
+sha256  eeacf16032901d0ed0456876ec77b8f0fda6b3fecec7d972f8543eb602e6c30f  ofl/nanumbrushscript/OFL.txt
+sha256  f2c0dfa02d6f5c444b4babd7bc0b43be77ea85706e8524342516bc41e43c2f01  ofl/fahkwang/OFL.txt
+sha256  4398885e6b303830d81eea03444aae6fb08a44f41b6acd193c88a2f8cd17606e  ofl/srisakdi/OFL.txt
+sha256  c1f8e0feb0babaacf774b971bcfd791e44125b9d61ff074e4c20924e9661556e  ofl/antic/OFL.txt
+sha256  6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2  ofl/notosanstamil/OFL.txt
+sha256  0b1bada9befa95a40d55830fe83fc7f8064e245fea33bdf0f96f57848f3866fa  ofl/codacaption/OFL.txt
+sha256  b41b99f35b507564e54f6b2f5162ad1c21f94a16837c632da6632b376a341f42  ofl/nosifer/OFL.txt
+sha256  e8d0118fa9d640543e7f6848d1d93f47313c7f56b64f73f37291d859cd5932bf  ofl/souliyo/OFL.txt
+sha256  bff4e5087ece354afccd073621197bbb7dd9349943b5ee6aa12b1adf0b133081  ofl/happymonkey/OFL.txt
+sha256  1f581506286e960436548dba0701aab278f7e67f2adc6bdae2958923867d1e64  ofl/hanaleifill/OFL.txt
+sha256  03082243ebc53e2090bc59987f693982ccee83b30516457b11f6a2349b78f5f8  ofl/rokkitt/OFL.txt
+sha256  1152ca18eaa6159634f1eb209c60df360c1c09a52991e392f8033702036634d4  ofl/assistant/OFL.txt
+sha256  012b1870f81b0d97ca756edd9eea315c7fc22657ac2f1cbdfcb6772fed3e20f3  ofl/bhavuka/OFL.txt
+sha256  ce1108854c91696a8549bb21459f1dc74e8a1ec11664d712c3868c40042f1a8a  ofl/rufina/OFL.txt
+sha256  bac36a7fcafc5702d9d928bb81c7de9f8739eaa820e546c3d2cc52730b652af4  ofl/devonshire/OFL.txt
+sha256  ac987f9cbc5b18d3239d88adb57a4e134049811d24ddda2f6383faa589fd2727  ofl/holtwoodonesc/OFL.txt
+sha256  f3ee3eb20a9d565bee2bbc0d616de382a113327d7506565b2f3d3bee5f489375  ofl/bowlbyonesc/OFL.txt
+sha256  965bd2c907f7bb6f36da4f85e83f29aea8b2f720783deebd7ed7b40678e67672  ofl/mysteryquest/OFL.txt
+sha256  cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanssemiexpanded/OFL.txt
+sha256  19e186a088a50835b38b59409a76b8df2d0252ce114a99e79e306231bbe253b7  ofl/dellarespira/OFL.txt
+sha256  aa36087ecd7e9085e5a1439b0a6d0ee35966e8cd2ccaa649bebe62cae5815e82  ofl/lifesavers/OFL.txt
+sha256  2a3ca501fc4d5efcad9798531e3e06962b1e20c60e464f6cbd6c17630112c773  ofl/imfelldwpicasc/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/loveyalikeasister/OFL.txt
+sha256  a9ef1db03f660130790beeb3b5d91b68536a44a98ec2db3097d02a1c5f91c599  ofl/buda/OFL.txt
+sha256  de318dcb99e332a746edb9f83180ee206fc3bce74ff96ad7d1cb219967ec74af  ofl/pollerone/OFL.txt
+sha256  315a576cbc7ab61c9e347b5725893bc8498fdcb8fc10831793c6864bc2cefba8  ofl/gudea/OFL.txt
+sha256  41f82bb4d24b304f30f7136bc47abdd083782e4265c984160f5649d1e78ea49c  ofl/montserrat/OFL.txt
+sha256  5866fd437bf701cd93f2c41ca2a8b33786975c947bee27882d256b408c9b424a  ofl/podkovavfbeta/OFL.txt
+sha256  377f4f9c19e935228552478eb68cc2ed82910988a60ba60e2ac73b09f32d02d1  ofl/patrickhandsc/OFL.txt
+sha256  ec1d7de447a90e4b6d8f2b4f95c7f89a70e315fdb41969bc716059e4f2461fa4  ofl/clickerscript/OFL.txt
+sha256  7039124ec9c84f9d637637da9f80158f0d3681c82d4e6a811053467f7c33d587  ofl/prostoone/OFL.txt
+sha256  16f8621a8dda01f044b8a58489334dbaadfad44ef2fa1d5ce0864cc2f309df01  ofl/inknutantiqua/OFL.txt
+sha256  ae30055f1e31d12f6235802c25a8872bb7053fca8ed4a604c530f4b2ee83e572  ofl/pontanosans/OFL.txt
+sha256  f1ef4c3ef43322403f5c30e4fb46496969cb5c34a2a6e7247b507254b69caa6a  ofl/novaround/OFL.txt
+sha256  cf5c4103b0ecf3c38e7c26768b5caf05e1b3e16d4d87b32d859b3c19ce7c216c  ofl/petitformalscript/OFL.txt
+sha256  ed80dd9539708a531313f98fb081aeeaa395ab5726931a433845d667b019c855  ofl/abyssinicasil/OFL.txt
+sha256  1404cc9279d4ad713a372a5e1e1d20d7b9b000d2397c8529aeb3df5402446600  ofl/cutive/OFL.txt
+sha256  19c6ecf65a6b0687dd324b093ced5f1020a1fcabfc8ddaaeca6906cd05153e23  ofl/overpassmono/OFL.txt
+sha256  0878e7d6e842bc3c45154059a1c2812de0d31dca343fe6bc16abc9afdee3e3de  ofl/koho/OFL.txt
+sha256  636d62f04d7bda9fcf9354f258f6244e7e18288cae036b95122e204f1acbec80  ofl/neuton/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloo/OFL.txt
+sha256  5866fd437bf701cd93f2c41ca2a8b33786975c947bee27882d256b408c9b424a  ofl/podkova/OFL.txt
+sha256  2ce1c4fcf4ab9c8474d0824434497d4afa4425db4de5629103698b170ac4ee74  ofl/bungee/OFL.txt
+sha256  dc35123e99a857674b3e8807e9d7df82220d298423d9fc50ce084fbcdecf602d  ofl/jotione/OFL.txt
+sha256  76a55594c9a18b7d94b8119de838237eb834bae4e8c646d6d363aee587b7b427  ofl/slabo27px/OFL.txt
+sha256  ed50ebe2fa922554980909192526fe94966556626d6d440a462c8e7eaed74cdc  ofl/oflsortsmillgoudytt/OFL.txt
+sha256  d7b108fc1f23fb016a47bb40c63d6f6e04cc35a1edfb991638d7f03621bf7f33  ofl/terminaldosislight/OFL.txt
+sha256  71e5222c549d85a1403b6e709b4328b81d7b51ba021b8bd20df89550da80c087  ofl/yatraone/OFL.txt
+sha256  f139d6f43d2a63a8fb3ded48b8ec747d9d59a7fbb13d077d9b96ac88580bc1ad  ofl/dekko/OFL.txt
+sha256  84b11cc0aac8fdb93af94872bc4b8f015caabf4919db63ab7f916ccff8e52f56  ofl/josefinsansstdlight/OFL.txt
+sha256  8fbe530adcbe30c658393c3f2b5a4785d6765afcefdfe47f594730131f3a0abd  ofl/oleoscriptswashcaps/OFL.txt
+sha256  64dc6a7e2a77aa340c49c3e0829703f540f8d64afa506f44eaa6741580716d0f  ofl/gabriela/OFL.txt
+sha256  17d7a7f5d9f0139535ecec516988c4c73a2ec0f225987288f3fd6ee2622d4450  ofl/federant/OFL.txt
+sha256  c0a7efe98e77cbfcf1a5ca43e874e25cf53d9185c56295bc3b5c407f95dae638  ofl/nats/OFL.txt
+sha256  2ee5e8e47cd7d08f60bb9555f72b25912c9e81b13f5bc9a0551ddf943da6ca98  ofl/ekmukta/OFL.txt
+sha256  e5ccbfc32e4d7fae98b467a9af310ac8d2efd5d90e684426cd24f3eb36090a2c  ofl/acme/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/modak/OFL.txt
+sha256  75a77451968e55a1ab404bd953bd8778983e21116d507b890fbcf838e58c8e8b  ofl/pavanam/OFL.txt
+sha256  36931b77dd81fa96fffad91b6acb54931e600845eb81f91ecf1b4459012c621a  ofl/vidaloka/OFL.txt
+sha256  5fb0694694dc307d1eb0121689395e634b6329ff545acc53f55ad66a716b3cf1  ofl/baloobhai/OFL.txt
+sha256  1c45059cea5c6798c8591b0a17961a30328747d44214ff9b8f9c62a683bd6598  ofl/ruda/OFL.txt
+sha256  0e441ae9f18ad0c294cc5b6ae3974c2db1614cab220598578b1b58c4cc334485  ofl/thegirlnextdoor/OFL.txt
+sha256  4dee45deee99672fbe342b2f4b7aa75b0cd12de18a68f9732c77f096bab47e0e  ofl/molengo/OFL.txt
+sha256  5a5cf278190adf8be3e9905c2b21460241cb376c600bdfd6eb7aceb66036c4bf  ofl/telex/OFL.txt
+sha256  bb49cbf811dafcb11e0de081efcdc8385e45ccc85a5bfc3231ec4861d444dc42  ofl/ruthie/OFL.txt
+sha256  b5c3d12a3085b96011fee65555234bb9d31fa7444cf6f8d5ae6b1f5771394399  ofl/lakkireddy/OFL.txt
+sha256  23b896f4937eac954a383340c92dfcac1c6e05ec21cc08ec6de47d30ad8496a3  ofl/charmonman/OFL.txt
+sha256  39602407e30d466bf169f46d690aaae4f5f039258e5642f91a80bb132ce6e14a  ofl/bubblerone/OFL.txt
+sha256  e31de7000a2a13b2e54ad01e788fd29e979fe05ea1fded44d6e71cc06e33bb2b  ofl/ralewaydots/OFL.txt
+sha256  8218df19bcd9786311bf1126815e8d591027aaf7611ef031af5a31c3fd66e928  ofl/arefruqaa/OFL.txt
+sha256  e37fcc467040ecd81bf4cf59c99ef56b20f57918995e82b3de1d5b4e931bc2e6  ofl/portlligatslab/OFL.txt
+sha256  60fea3a0da19167a3efb9c3792a3a15dc9235405d01bbec1233fdf3e79c74296  ofl/freckleface/OFL.txt
+sha256  da15da6b1496d4de18f97e2ad1b722ef8a1c121149c2c93b2cf7eac6ac27b35c  ofl/mplus1p/OFL.txt
+sha256  d51f3341fd7b3dfa1114d3ef0bdabbe57f60eef86a1458019e0077d676fa1fcb  ofl/lancelot/OFL.txt
+sha256  9134ca6996bd33ea2022e109f13f20e29dee1dcd8b2e8878aad576d2ca334e9f  ofl/cormorantinfant/OFL.txt
+sha256  cc8c0c3e81cf543e190f128b83ba7c30959f15865c14dd972fca4917faeceec1  ofl/encodesanssemicondensed/OFL.txt
+sha256  5946eec3a7d3bda02825930156e4716198e7753641dd3303a3e8c386c8011909  ofl/eater/OFL.txt
+sha256  b43e2530c7af69fe1800f180d210b6d2745915ed4e0e404495038c861bb6dbf7  ofl/hammersmithone/OFL.txt
+sha256  5a8751bef5a4fc867ae015099267905034345260f14060fa276aac4051ddd8b4  ofl/varela/OFL.txt
+sha256  f6fc9fbae062e4efc1b0306e27715d43cd64a48b8ffba81c22034b8efee4fce2  ofl/cabinsketch/OFL.txt
+sha256  2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntucondensed/LICENCE.txt
+sha256  2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntumono/LICENCE.txt
+sha256  2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002  ufl/ubuntu/LICENCE.txt
diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 3d8aafbdca..1ea48c454b 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # https://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz.sig
 # with key 93C08C88471097CD
-sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2	gperf-3.1.tar.gz
+sha256  588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2  gperf-3.1.tar.gz
 
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index 0a701a058f..0c2a99cc5b 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 21feb24130c18e4a1f8cc4f72d575903d1f9134dd0604e41e91b5e783d81e320  gst1-imx-0.13.1.tar.gz
-sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  LICENSE
+sha256  21feb24130c18e4a1f8cc4f72d575903d1f9134dd0604e41e91b5e783d81e320  gst1-imx-0.13.1.tar.gz
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  LICENSE
diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 87c59b2cab..26687507f4 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
 # From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
-sha256	05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5	gtkmm-3.22.0.tar.xz
+sha256  05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5  gtkmm-3.22.0.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 3b78b7062b..2e3c430ac0 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,5 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
-sha256	a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6	gtksourceview-3.24.7.tar.xz
+sha256  a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6  gtksourceview-3.24.7.tar.xz
 
 # Locally computed:
-sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index fe46ab5889..c555528efb 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/hanstunnel/files/source/
-md5 8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
-sha1 0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
+md5  8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
+sha1  0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
 # Locally computed
 sha256  f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 0750233858..005447a43b 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,5 +1,5 @@
 # From https://github.com/heimdal/heimdal/releases
-sha1 5dd16703be7255f66a4d65440f0c622aeeca60d9  heimdal-7.7.0.tar.gz
-sha256 f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b  heimdal-7.7.0.tar.gz
+sha1  5dd16703be7255f66a4d65440f0c622aeeca60d9  heimdal-7.7.0.tar.gz
+sha256  f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b  heimdal-7.7.0.tar.gz
 # Locally computed
-sha256 0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
+sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heirloom-mailx/heirloom-mailx.hash b/package/heirloom-mailx/heirloom-mailx.hash
index 1f59f7349d..13e8896809 100644
--- a/package/heirloom-mailx/heirloom-mailx.hash
+++ b/package/heirloom-mailx/heirloom-mailx.hash
@@ -1,4 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-3.dsc
-sha256	015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad	heirloom-mailx_12.5.orig.tar.gz
+sha256  015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad  heirloom-mailx_12.5.orig.tar.gz
 # Locally computed
 sha256  5ddc00aed98a0cf75fc7edfd9f3aeb1e919ae0ad5e9ff55d61f643d62d802b07  COPYING
diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index c396157646..3178c32377 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3e895a0a6d7bd79de25a255a1376d4da88eb09c34efdd0476ab5a907e75bfaf8	httping-2.5.tgz
-sha256  c5db2e5b9a692fcdf2bd370f1533529063fbcf8947a8f5ee9d4b050a14e0566d	license.txt
+sha256  3e895a0a6d7bd79de25a255a1376d4da88eb09c34efdd0476ab5a907e75bfaf8  httping-2.5.tgz
+sha256  c5db2e5b9a692fcdf2bd370f1533529063fbcf8947a8f5ee9d4b050a14e0566d  license.txt
diff --git a/package/ibrcommon/ibrcommon.hash b/package/ibrcommon/ibrcommon.hash
index 9d13f06d38..4b7144214e 100644
--- a/package/ibrcommon/ibrcommon.hash
+++ b/package/ibrcommon/ibrcommon.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	  9c457c1ebc01e6216524636628c647bef34ab11bd96f0e0788be8749374fdc20	ibrcommon-1.0.1.tar.gz
-sha256	  1a0b57773a46d9d4cc2f0d1780a17acc38af506bb1e0234aaa85f8ccd6dc0b92	COPYING
-sha256	  9b8a430c2136ebcf76bd37f50da7d7a80ede413ec6604cc4694ea536e779854c	README
+sha256  9c457c1ebc01e6216524636628c647bef34ab11bd96f0e0788be8749374fdc20  ibrcommon-1.0.1.tar.gz
+sha256  1a0b57773a46d9d4cc2f0d1780a17acc38af506bb1e0234aaa85f8ccd6dc0b92  COPYING
+sha256  9b8a430c2136ebcf76bd37f50da7d7a80ede413ec6604cc4694ea536e779854c  README
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
index 9073165e7f..825f2d6f2a 100644
--- a/package/ifenslave/ifenslave.hash
+++ b/package/ifenslave/ifenslave.hash
@@ -1,5 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave/ifenslave_2.9.dsc
-sha1 a17e88fa298ef337e872c8aa5d7a390921239d1a   ifenslave_2.9.tar.xz
+sha1  a17e88fa298ef337e872c8aa5d7a390921239d1a  ifenslave_2.9.tar.xz
 sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9  ifenslave_2.9.tar.xz
 # Locally computed
 sha256  299e00f3afc0e6ea0685340df73ad444e58e6fe0229989ba0983f5f33e275c41  debian/copyright
diff --git a/package/ifmetric/ifmetric.hash b/package/ifmetric/ifmetric.hash
index 186522efab..7b3733fa44 100644
--- a/package/ifmetric/ifmetric.hash
+++ b/package/ifmetric/ifmetric.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	0fa8510a4e34e555f136f9df81d26618313f2d69a4880c0fb5967f19502f1aec  ifmetric-0.3.tar.gz
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
-sha256	1e33d5a8750b4b3c2cb4fb89a916463f3c838f8eb361abbf72faf244c7dde771  README
+sha256  0fa8510a4e34e555f136f9df81d26618313f2d69a4880c0fb5967f19502f1aec  ifmetric-0.3.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
+sha256  1e33d5a8750b4b3c2cb4fb89a916463f3c838f8eb361abbf72faf244c7dde771  README
diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index fd373a1407..c77627ee56 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,5 +1,5 @@
 # From http://etherlab.org/download/ethercat/ethercat-1.5.2.tar.bz2.md5
-md5	6b4001f8d975865d74a0b108b3bdda3d	ethercat-1.5.2.tar.bz2
+md5  6b4001f8d975865d74a0b108b3bdda3d  ethercat-1.5.2.tar.bz2
 # Locally computed
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/ijs/ijs.hash b/package/ijs/ijs.hash
index 6accb57123..3d860fc85d 100644
--- a/package/ijs/ijs.hash
+++ b/package/ijs/ijs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9  ijs-0.35.tar.bz2
-sha256	f723390b7ee019eccf07763dcb5744acf8bb43034bc3ba3d6f1c94440e365b4f  README
+sha256  11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9  ijs-0.35.tar.bz2
+sha256  f723390b7ee019eccf07763dcb5744acf8bb43034bc3ba3d6f1c94440e365b4f  README
diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 2267a59b79..56d830e54c 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,4 @@
 # sha1 from sourceforge, sha256 locally computed
 sha1  f23d8a406759a469b0223b0bfb302ada4407a1d1  ima-evm-utils-1.4.tar.gz
-sha256 fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/intltool/intltool.hash b/package/intltool/intltool.hash
index de1df87bc7..59983b02e9 100644
--- a/package/intltool/intltool.hash
+++ b/package/intltool/intltool.hash
@@ -1,6 +1,6 @@
 # From https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz/+md5
-md5	12e517cac2b57a0121cda351570f1e63 intltool-0.51.0.tar.gz
+md5  12e517cac2b57a0121cda351570f1e63  intltool-0.51.0.tar.gz
 
 # Locally calculated
-sha256 67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd  intltool-0.51.0.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd  intltool-0.51.0.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/iodine/iodine.hash b/package/iodine/iodine.hash
index 691ef4d7fb..4ba7aa95b8 100644
--- a/package/iodine/iodine.hash
+++ b/package/iodine/iodine.hash
@@ -1,4 +1,4 @@
 # From http://code.kryo.se/iodine/
-md5	fdbf3b81cd69caf5230d76a8b039fd99	iodine-0.7.0.tar.gz
+md5  fdbf3b81cd69caf5230d76a8b039fd99  iodine-0.7.0.tar.gz
 # Locally computed
 sha256  f41a252b2218759aa351270b7ad9791bdd323836b940e35c0614837a5d24dcb7  README
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index edfa384d43..db52d990f2 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,6 +1,6 @@
 # https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
-sha256 b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
+sha256  b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
 # Locally computed
-sha256 973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
-sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
+sha256  973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
+sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/irrlicht/irrlicht.hash b/package/irrlicht/irrlicht.hash
index 1f5631f229..e7cd3ec918 100644
--- a/package/irrlicht/irrlicht.hash
+++ b/package/irrlicht/irrlicht.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.4
-md5 9401cfff801395010b0912211f3cbb4f irrlicht-1.8.4.zip
-sha1 38bf0223fe868d243d6a39d0dc191c8df6e03b3b irrlicht-1.8.4.zip
+md5  9401cfff801395010b0912211f3cbb4f  irrlicht-1.8.4.zip
+sha1  38bf0223fe868d243d6a39d0dc191c8df6e03b3b  irrlicht-1.8.4.zip
 # Locally calculated
 sha256  f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
 sha256  cc86e0b830f9d48933feb198f2741a7d9bb7c34fe8a35302d8ce36b8e2ecb27b  doc/aesGladman.txt
diff --git a/package/iucode-tool/iucode-tool.hash b/package/iucode-tool/iucode-tool.hash
index 6d8fb635d0..ae18339c96 100644
--- a/package/iucode-tool/iucode-tool.hash
+++ b/package/iucode-tool/iucode-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 13a260e8d0..297d0f1930 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
-sha256 3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
+sha256  3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
+sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/joe/joe.hash b/package/joe/joe.hash
index 1e2de4225e..8029a22dc3 100644
--- a/package/joe/joe.hash
+++ b/package/joe/joe.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
-sha1 da7712333f676cfb5ae9f3565fd2225c5a2185ca  joe-4.6.tar.gz
-md5 9017484e6116830d846678b625ea5c43  joe-4.6.tar.gz
+sha1  da7712333f676cfb5ae9f3565fd2225c5a2185ca  joe-4.6.tar.gz
+md5  9017484e6116830d846678b625ea5c43  joe-4.6.tar.gz
 # Locally computed:
-sha256 495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de  joe-4.6.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de  joe-4.6.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/jquery/jquery.hash b/package/jquery/jquery.hash
index e9ef56a46d..173eb95ffd 100644
--- a/package/jquery/jquery.hash
+++ b/package/jquery/jquery.hash
@@ -1,2 +1,2 @@
 # Locally computed hashes, not provided by upstream
-sha256  f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d	jquery-3.5.1.min.js
+sha256  f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d  jquery-3.5.1.min.js
diff --git a/package/jsmin/jsmin.hash b/package/jsmin/jsmin.hash
index c160978519..cc4490557b 100644
--- a/package/jsmin/jsmin.hash
+++ b/package/jsmin/jsmin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
-sha256 b420f61778af09534adc836a5086f5625b8499124051c50baefa218e7c03a58c  jsmin.c
+sha256  aae127bf7291a7b2592f36599e5ed6c6423eac7abe0cd5992f82d6d46fe9ed2d  jsmin-1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b.tar.gz
+sha256  b420f61778af09534adc836a5086f5625b8499124051c50baefa218e7c03a58c  jsmin.c
diff --git a/package/jsmn/jsmn.hash b/package/jsmn/jsmn.hash
index b5a78f6ebf..7eaf680044 100644
--- a/package/jsmn/jsmn.hash
+++ b/package/jsmn/jsmn.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38    jsmn-1.1.0.tar.gz
-sha256  4675b94a50d2afe811c52785463c854f1156056632cce17cc7133939eac8ed55    LICENSE
+sha256  5f0913a10657fe7ec8d5794ccf00a01000e3e1f2f1e1f143c34a0f7b47edcb38  jsmn-1.1.0.tar.gz
+sha256  4675b94a50d2afe811c52785463c854f1156056632cce17cc7133939eac8ed55  LICENSE
diff --git a/package/kyua/kyua.hash b/package/kyua/kyua.hash
index 66681692fc..4b0e5589d3 100644
--- a/package/kyua/kyua.hash
+++ b/package/kyua/kyua.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 db6e5d341d5cf7e49e50aa361243e19087a00ba33742b0855d2685c0b8e721d6 kyua-0.13.tar.gz
-sha256 a6a8f43f6d2ed9b801978cc012cc816c4a9421a6dcea0579d3a40eab4b349674 LICENSE
+sha256  db6e5d341d5cf7e49e50aa361243e19087a00ba33742b0855d2685c0b8e721d6  kyua-0.13.tar.gz
+sha256  a6a8f43f6d2ed9b801978cc012cc816c4a9421a6dcea0579d3a40eab4b349674  LICENSE
diff --git a/package/lbreakout2/lbreakout2.hash b/package/lbreakout2/lbreakout2.hash
index 56d0a9501f..440ffed3d3 100644
--- a/package/lbreakout2/lbreakout2.hash
+++ b/package/lbreakout2/lbreakout2.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lgames/files/lbreakout2/2.6/
-md5 1a9238b83f9f13f09b7a4d53e00b4e84  lbreakout2-2.6.5.tar.gz
-sha1 d92326499165fd368be04378d633e13d42b4d2d7  lbreakout2-2.6.5.tar.gz
+md5  1a9238b83f9f13f09b7a4d53e00b4e84  lbreakout2-2.6.5.tar.gz
+sha1  d92326499165fd368be04378d633e13d42b4d2d7  lbreakout2-2.6.5.tar.gz
 # Locally computed:
 sha256  9104d6175553da3442dc6a5fc407a669e2f5aff3eedc5d30409eb003b7a78d6f  lbreakout2-2.6.5.tar.gz
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index 1a27373f23..cb56f32b56 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lensfun/files/0.3.2
-sha1 1d978b15aa7304d66a4931fa37ca9f8f89396c16 lensfun-0.3.2.tar.gz
-md5 247e59a0812ec451f6cd0d20b3379cb5 lensfun-0.3.2.tar.gz
+sha1  1d978b15aa7304d66a4931fa37ca9f8f89396c16  lensfun-0.3.2.tar.gz
+md5  247e59a0812ec451f6cd0d20b3379cb5  lensfun-0.3.2.tar.gz
 # Locally calculated
 sha256  ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331  lensfun-0.3.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index dced3dddeb..91c6bd11a7 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
-sha256	03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf	libao-1.2.0.tar.gz
+sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
 
 # Hash for license file:
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libart/libart.hash b/package/libart/libart.hash
index 105277b1f2..2cfbe7397d 100644
--- a/package/libart/libart.hash
+++ b/package/libart/libart.hash
@@ -1,5 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
-sha256	2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa	libart_lgpl-2.3.21.tar.gz
+sha256  2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa  libart_lgpl-2.3.21.tar.gz
 
 # Hash for license file:
-sha256	d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5	COPYING
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
index db8e920334..251a50ee45 100644
--- a/package/libasplib/libasplib.hash
+++ b/package/libasplib/libasplib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
-sha256 12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0  LICENSE
+sha256  68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
+sha256  12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0  LICENSE
diff --git a/package/libatasmart/libatasmart.hash b/package/libatasmart/libatasmart.hash
index b661332a77..edf0904157 100644
--- a/package/libatasmart/libatasmart.hash
+++ b/package/libatasmart/libatasmart.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	61f0ea345f63d28ab2ff0dc352c22271661b66bf09642db3a4049ac9dbdb0f8d	libatasmart-0.19.tar.xz
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	LGPL
+sha256  61f0ea345f63d28ab2ff0dc352c22271661b66bf09642db3a4049ac9dbdb0f8d  libatasmart-0.19.tar.xz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
diff --git a/package/libavl/libavl.hash b/package/libavl/libavl.hash
index 4d70f0cca9..eb62ae5a72 100644
--- a/package/libavl/libavl.hash
+++ b/package/libavl/libavl.hash
@@ -1,5 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20160621T164030Z/pool/main/liba/libavl/libavl_0.3.5-4.dsc
-sha256	4497b9e22cdd61ae2fa893b9d5fd6213dc306726d7c4be08c29e173622dca8a0	libavl_0.3.5.orig.tar.gz
+sha256  4497b9e22cdd61ae2fa893b9d5fd6213dc306726d7c4be08c29e173622dca8a0  libavl_0.3.5.orig.tar.gz
 
 # Locally computed
-sha256	767a9accfe3b110153b567983b98889469dfaae02899a632aeadbb81ad611293	COPYING
+sha256  767a9accfe3b110153b567983b98889469dfaae02899a632aeadbb81ad611293  COPYING
diff --git a/package/libbacktrace/libbacktrace.hash b/package/libbacktrace/libbacktrace.hash
index ecd530a33b..bb5e00ee40 100644
--- a/package/libbacktrace/libbacktrace.hash
+++ b/package/libbacktrace/libbacktrace.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  libbacktrace-9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz
-sha256 ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
+sha256  13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  libbacktrace-9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz
+sha256  ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
diff --git a/package/libbson/libbson.hash b/package/libbson/libbson.hash
index 568459900a..e4b636d2fd 100644
--- a/package/libbson/libbson.hash
+++ b/package/libbson/libbson.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	6bb51b863a4641d6d7729e4b55df8f4389ed534c34eb3a1cda906a53df11072c libbson-1.9.5.tar.gz
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
-sha256	8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e THIRD_PARTY_NOTICES
+sha256  6bb51b863a4641d6d7729e4b55df8f4389ed534c34eb3a1cda906a53df11072c  libbson-1.9.5.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
+sha256  8dc5cb3146b026715e6c145621c7732f36c295d825b7b3a03076ad3f238db48e  THIRD_PARTY_NOTICES
diff --git a/package/libcddb/libcddb.hash b/package/libcddb/libcddb.hash
index f3519c2577..b2da48fcaf 100644
--- a/package/libcddb/libcddb.hash
+++ b/package/libcddb/libcddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b	libcddb-1.3.2.tar.bz2
-sha256	7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852	COPYING
+sha256  35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b  libcddb-1.3.2.tar.bz2
+sha256  7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852  COPYING
diff --git a/package/libcdio-paranoia/libcdio-paranoia.hash b/package/libcdio-paranoia/libcdio-paranoia.hash
index 18e6f33dff..f1f64f6c08 100644
--- a/package/libcdio-paranoia/libcdio-paranoia.hash
+++ b/package/libcdio-paranoia/libcdio-paranoia.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a  libcdio-paranoia-10.2+2.0.1.tar.bz2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a  libcdio-paranoia-10.2+2.0.1.tar.bz2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 07bd85ff16..1b157992b2 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256 8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b  libcdio-2.1.0.tar.bz2
+sha256  8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b  libcdio-2.1.0.tar.bz2
 
 # Hash for license file:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
index 8760f91cf5..5e8845ede2 100644
--- a/package/libcgi/libcgi.hash
+++ b/package/libcgi/libcgi.hash
@@ -1,5 +1,5 @@
 # From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.md5
-md5 6efdc968bdf986832b7e220d1b914e57  libcgi-1.3.0.tar.gz
+md5  6efdc968bdf986832b7e220d1b914e57  libcgi-1.3.0.tar.gz
 # From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.sha256
 sha256  d932f380b1a5dbfbddffaa76fac71bf505a9585d441c9ae86bfbf76033d9d8df  libcgi-1.3.0.tar.gz
 
diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
index 6fd19e305c..87540c8144 100644
--- a/package/libcgicc/libcgicc.hash
+++ b/package/libcgicc/libcgicc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0	cgicc-3.2.19.tar.gz
+sha256  2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0  cgicc-3.2.19.tar.gz
 
 # Hash for license files:
 sha256  a2e480f5e8afd7c587a3c0ac2ed3b73ed4b10fa3a553dea26e7b661c7cedda72  COPYING.LIB
diff --git a/package/libcorrect/libcorrect.hash b/package/libcorrect/libcorrect.hash
index 20df38c158..4c6289fb82 100644
--- a/package/libcorrect/libcorrect.hash
+++ b/package/libcorrect/libcorrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
-sha256	135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
+sha256  79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
+sha256  135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
diff --git a/package/libcsv/libcsv.hash b/package/libcsv/libcsv.hash
index 33a521d256..c482d9fed9 100644
--- a/package/libcsv/libcsv.hash
+++ b/package/libcsv/libcsv.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256 d9c0431cb803ceb9896ce74f683e6e5a0954e96ae1d9e4028d6e0f967bebd7e4  libcsv-3.0.3.tar.gz
-sha256 6876b170378d38f65aadd271485f0a5c45beaa043a7d3de5e1636ec927922c83  COPYING.LESSER
+sha256  d9c0431cb803ceb9896ce74f683e6e5a0954e96ae1d9e4028d6e0f967bebd7e4  libcsv-3.0.3.tar.gz
+sha256  6876b170378d38f65aadd271485f0a5c45beaa043a7d3de5e1636ec927922c83  COPYING.LESSER
diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index b69fb7fa2b..93ae2dacdb 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200	libcue-2.2.1.tar.gz
-sha256	c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f	LICENSE
+sha256  f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200  libcue-2.2.1.tar.gz
+sha256  c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f  LICENSE
diff --git a/package/libcuefile/libcuefile.hash b/package/libcuefile/libcuefile.hash
index 47c0c2fd76..2f737af0dc 100644
--- a/package/libcuefile/libcuefile.hash
+++ b/package/libcuefile/libcuefile.hash
@@ -1,7 +1,7 @@
 # From https://www.musepack.net/index.php?pg=src
-md5	1a6ac52e1080fd54f0f59372345f1e4e	libcuefile_r475.tar.gz
+md5  1a6ac52e1080fd54f0f59372345f1e4e  libcuefile_r475.tar.gz
 # Calculated based on the hash above
-sha256	b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7	libcuefile_r475.tar.gz
+sha256  b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7  libcuefile_r475.tar.gz
 
 # Hash for license file:
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libcutl/libcutl.hash b/package/libcutl/libcutl.hash
index 1e0baa7f6e..6c0358cb3a 100644
--- a/package/libcutl/libcutl.hash
+++ b/package/libcutl/libcutl.hash
@@ -1,6 +1,6 @@
 # From https://www.codesynthesis.com/download/libcutl/1.10/libcutl-1.10.0.tar.bz2.sha1
-sha1	2885b79529f8caeb13687d722f5c114186f56956	libcutl-1.10.0.tar.bz2
+sha1  2885b79529f8caeb13687d722f5c114186f56956  libcutl-1.10.0.tar.bz2
 
 # Locally Computed
-sha256	125163c670e372b47d5626d54379ff8fbaded6ccd5db77ac0bf5912a4017121c	libcutl-1.10.0.tar.bz2
-sha256	c7aa98c5af3b67174f16b12a1fed4332a51cd524b82c69e85baa4c2c412da239	LICENSE
+sha256  125163c670e372b47d5626d54379ff8fbaded6ccd5db77ac0bf5912a4017121c  libcutl-1.10.0.tar.bz2
+sha256  c7aa98c5af3b67174f16b12a1fed4332a51cd524b82c69e85baa4c2c412da239  LICENSE
diff --git a/package/libdaemon/libdaemon.hash b/package/libdaemon/libdaemon.hash
index b510321828..72652f0d23 100644
--- a/package/libdaemon/libdaemon.hash
+++ b/package/libdaemon/libdaemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834 libdaemon-0.14.tar.gz
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
+sha256  fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834  libdaemon-0.14.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
index d3a9ae7d4c..3c3e80e8a3 100644
--- a/package/libdcadec/libdcadec.hash
+++ b/package/libdcadec/libdcadec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44	libdcadec-0.2.0.tar.gz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPLv2.1
+sha256  ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44  libdcadec-0.2.0.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/libdri2/libdri2.hash b/package/libdri2/libdri2.hash
index 4cb360ff6b..dbaccbdd6b 100644
--- a/package/libdri2/libdri2.hash
+++ b/package/libdri2/libdri2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c427f5c3fbda3d1df1dc77129e87605f4af1f3ad2adf2653c560d1703aa4395  libdri2-4f1eef3183df2b270c3d5cbef07343ee5127a6a4.tar.gz
-sha256 4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
+sha256  7c427f5c3fbda3d1df1dc77129e87605f4af1f3ad2adf2653c560d1703aa4395  libdri2-4f1eef3183df2b270c3d5cbef07343ee5127a6a4.tar.gz
+sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/libdvbcsa/libdvbcsa.hash b/package/libdvbcsa/libdvbcsa.hash
index 55ad51b595..03ac761255 100644
--- a/package/libdvbcsa/libdvbcsa.hash
+++ b/package/libdvbcsa/libdvbcsa.hash
@@ -1,7 +1,7 @@
 # From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha256
-sha256	4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d	libdvbcsa-1.1.0.tar.gz
+sha256  4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d  libdvbcsa-1.1.0.tar.gz
 # From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
-sha1	5f4640a7e93ae6494f24a881414e5c343f803365				libdvbcsa-1.1.0.tar.gz
+sha1  5f4640a7e93ae6494f24a881414e5c343f803365  libdvbcsa-1.1.0.tar.gz
 
 # Hash for license file:
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libdvbpsi/libdvbpsi.hash b/package/libdvbpsi/libdvbpsi.hash
index 727b1cf497..acf43488d4 100644
--- a/package/libdvbpsi/libdvbpsi.hash
+++ b/package/libdvbpsi/libdvbpsi.hash
@@ -1,6 +1,6 @@
 # From http://download.videolan.org/pub/libdvbpsi/1.3.3/libdvbpsi-1.3.3.tar.bz2.md5
-md5 9b556ab08bb62a8bec61f5c1649bc9a8  libdvbpsi-1.3.3.tar.bz2
+md5  9b556ab08bb62a8bec61f5c1649bc9a8  libdvbpsi-1.3.3.tar.bz2
 # From http://download.videolan.org/pub/libdvbpsi/1.3.3/libdvbpsi-1.3.3.tar.bz2.sha256
-sha256 02b5998bcf289cdfbd8757bedd5987e681309b0a25b3ffe6cebae599f7a00112  libdvbpsi-1.3.3.tar.bz2
+sha256  02b5998bcf289cdfbd8757bedd5987e681309b0a25b3ffe6cebae599f7a00112  libdvbpsi-1.3.3.tar.bz2
 # Hash for license file:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libeastl/libeastl.hash b/package/libeastl/libeastl.hash
index 2d8367c026..c7ba6da09f 100644
--- a/package/libeastl/libeastl.hash
+++ b/package/libeastl/libeastl.hash
@@ -1,2 +1,2 @@
-sha256 9b3484553812b3ec3bad0857f7f675499c81f7cf4ac87e5f3b2acbe72e3a878a  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
-sha256 82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
+sha256  9b3484553812b3ec3bad0857f7f675499c81f7cf4ac87e5f3b2acbe72e3a878a  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
+sha256  82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
diff --git a/package/libee/libee.hash b/package/libee/libee.hash
index 5ad47e162c..4783bbc2dd 100644
--- a/package/libee/libee.hash
+++ b/package/libee/libee.hash
@@ -1,5 +1,5 @@
 # From http://www.libee.org/download/libee-0-4-1/
-md5	7bbf4160876c12db6193c06e2badedb2	libee-0.4.1.tar.gz
+md5  7bbf4160876c12db6193c06e2badedb2  libee-0.4.1.tar.gz
 
 # Hash for license file:
-sha256	275fecbf835387e042ba96884f0f05356a485a6ea8449b2c5295cc11652ad439	COPYING
+sha256  275fecbf835387e042ba96884f0f05356a485a6ea8449b2c5295cc11652ad439  COPYING
diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index 6c874b16a5..04c9d5127f 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
-sha256 87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
+sha256  3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
+sha256  87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
diff --git a/package/libestr/libestr.hash b/package/libestr/libestr.hash
index 6445d01081..61ab327877 100644
--- a/package/libestr/libestr.hash
+++ b/package/libestr/libestr.hash
@@ -1,5 +1,5 @@
 # From http://libestr.adiscon.com/download/libestr-0-1-11/
-sha256	46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024	libestr-0.1.11.tar.gz
+sha256  46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024  libestr-0.1.11.tar.gz
 
 # Hash for license file:
-sha256	835b4793da5cbb8965fbd63905b55a4cb4310b7d1b882077d23066b08f901ff8	COPYING
+sha256  835b4793da5cbb8965fbd63905b55a4cb4310b7d1b882077d23066b08f901ff8  COPYING
diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 110461235f..83860a4f3d 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc	libfcgi-2.4.2.tar.gz
-sha256	f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81	LICENSE.TERMS
+sha256  1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc  libfcgi-2.4.2.tar.gz
+sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE.TERMS
diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
index ed982c9dd7..9115518a3f 100644
--- a/package/libfreefare/libfreefare.hash
+++ b/package/libfreefare/libfreefare.hash
@@ -1,5 +1,5 @@
 # From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
-sha256 bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
+sha256  bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
 
 # Hash for license file:
-sha256 be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
+sha256  be6209dfd763a0ba77fbe990cfd2512804441d8b5f0cad927baa3341b50fcade  COPYING
diff --git a/package/libfreeimage/libfreeimage.hash b/package/libfreeimage/libfreeimage.hash
index 6d8ba20409..388f3bb52d 100644
--- a/package/libfreeimage/libfreeimage.hash
+++ b/package/libfreeimage/libfreeimage.hash
@@ -1,9 +1,9 @@
 # From https://sourceforge.net/projects/freeimage/files/Source%20Distribution/3.18.0/
-md5 f8ba138a3be233a3eed9c456e42e2578 FreeImage3180.zip
-sha1 38daa9d8f1bca2330a2eaa42ec66fbe6ede7dce9 FreeImage3180.zip
+md5  f8ba138a3be233a3eed9c456e42e2578  FreeImage3180.zip
+sha1  38daa9d8f1bca2330a2eaa42ec66fbe6ede7dce9  FreeImage3180.zip
 
 # Locally computed
-sha256 f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd FreeImage3180.zip
-sha256 d51615a1a47f1ddbb027920d60d3fc30a00e1284c795a47857883e641349fadf license-gplv2.txt
-sha256 084be110e3e8757d8e6945cda1fbc7e5073bbe688dc19b92c0d8440155d8e282 license-gplv3.txt
-sha256 0bb9a3123297c73ae6e19c70459fb0e58f313f67ca63176fd43f8e77668b8243 license-fi.txt
+sha256  f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd  FreeImage3180.zip
+sha256  d51615a1a47f1ddbb027920d60d3fc30a00e1284c795a47857883e641349fadf  license-gplv2.txt
+sha256  084be110e3e8757d8e6945cda1fbc7e5073bbe688dc19b92c0d8440155d8e282  license-gplv3.txt
+sha256  0bb9a3123297c73ae6e19c70459fb0e58f313f67ca63176fd43f8e77668b8243  license-fi.txt
diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index f522325945..3ab3224895 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5	fuse-2.9.9.tar.gz
+sha256  d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5  fuse-2.9.9.tar.gz
 
 # Hash for license files:
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 3a2e5ff25c..11cacc13f6 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 1fd034f4b636214cc24e94c563cd10b3f3444d9f0660927b60e63fd4131d97fa libgdiplus-6.0.5.tar.gz
-sha256 81317bf837e02a116dc20b032fa1d0cbf9ec357621f141ff2c2daf26c17cbb5d LICENSE
+sha256  1fd034f4b636214cc24e94c563cd10b3f3444d9f0660927b60e63fd4131d97fa  libgdiplus-6.0.5.tar.gz
+sha256  81317bf837e02a116dc20b032fa1d0cbf9ec357621f141ff2c2daf26c17cbb5d  LICENSE
diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
index b96c5814b4..d01c83be25 100644
--- a/package/libglade/libglade.hash
+++ b/package/libglade/libglade.hash
@@ -1,5 +1,5 @@
 # From http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.sha256sum
-sha256	64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec	libglade-2.6.4.tar.bz2
+sha256  64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec  libglade-2.6.4.tar.bz2
 
 # Hash for license file:
-sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 7edb29bd28..52046bd843 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592	libical-1.0.1.tar.gz
-sha256	c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2	LICENSE
+sha256  089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592  libical-1.0.1.tar.gz
+sha256  c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2  LICENSE
diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
index 93ad555e15..e3a6125e25 100644
--- a/package/libiconv/libiconv.hash
+++ b/package/libiconv/libiconv.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178	libiconv-1.15.tar.gz
+sha256  ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178  libiconv-1.15.tar.gz
 
 # Hash for license files:
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-sha256	56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d	COPYING.LIB
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index b0a901ca98..c523b5d685 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 df1577740ea93dca732e7d7c04786600cb083117901dee793f3d38980754af00  libiio-0.23.tar.gz
-sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
+sha256  df1577740ea93dca732e7d7c04786600cb083117901dee793f3d38980754af00  libiio-0.23.tar.gz
+sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libimxvpuapi/libimxvpuapi.hash b/package/libimxvpuapi/libimxvpuapi.hash
index 6e0e5d60c9..1ab5196c80 100644
--- a/package/libimxvpuapi/libimxvpuapi.hash
+++ b/package/libimxvpuapi/libimxvpuapi.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 7151e10a24929935bada1d3d87626f17e411575b3a4ac0d86440999ad0100a55  libimxvpuapi-0.10.3.tar.gz
-sha256 4bb33cc4cd956b56b779b501f18cae46a9e26f8c8500cca86ed758b8bc5e1788  LICENSE
+sha256  7151e10a24929935bada1d3d87626f17e411575b3a4ac0d86440999ad0100a55  libimxvpuapi-0.10.3.tar.gz
+sha256  4bb33cc4cd956b56b779b501f18cae46a9e26f8c8500cca86ed758b8bc5e1788  LICENSE
diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index b70bb423dc..769035837c 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
-sha256 88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
+sha256  c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
+sha256  88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index b3c2c749c3..49b0880211 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 8a08dcbb4d05ede4357cdc9d61c7f2a7f2cd96b7ce2eb41b28e45b2e378267ad	libkcapi-1.1.5.tar.xz
-sha256 c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a	COPYING
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING.gplv2
-sha256 13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239	COPYING.bsd
+sha256  8a08dcbb4d05ede4357cdc9d61c7f2a7f2cd96b7ce2eb41b28e45b2e378267ad  libkcapi-1.1.5.tar.xz
+sha256  c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a  COPYING
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
+sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
diff --git a/package/libllcp/libllcp.hash b/package/libllcp/libllcp.hash
index e6f6301731..ff946dd38f 100644
--- a/package/libllcp/libllcp.hash
+++ b/package/libllcp/libllcp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4336533304a11ecb3041d211ccecd7759b7c7aad4f44037721803e2da1094d22  libllcp-05dfa8003433a7070bfd8ae02efdb0203bbf34aa.tar.gz
-sha256 9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
+sha256  4336533304a11ecb3041d211ccecd7759b7c7aad4f44037721803e2da1094d22  libllcp-05dfa8003433a7070bfd8ae02efdb0203bbf34aa.tar.gz
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
diff --git a/package/liblog4c-localtime/liblog4c-localtime.hash b/package/liblog4c-localtime/liblog4c-localtime.hash
index d14b79594d..66d1595038 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.hash
+++ b/package/liblog4c-localtime/liblog4c-localtime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a1f68d8251509c0171f8bfea42f9e2a5255a4185f7dcbe67f584aa09709b2496  liblog4c-localtime-1.0.tar.gz
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  a1f68d8251509c0171f8bfea42f9e2a5255a4185f7dcbe67f584aa09709b2496  liblog4c-localtime-1.0.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/liblogging/liblogging.hash b/package/liblogging/liblogging.hash
index 618689b49b..32cab29b10 100644
--- a/package/liblogging/liblogging.hash
+++ b/package/liblogging/liblogging.hash
@@ -1,5 +1,5 @@
 # From http://www.liblogging.org/
-sha256	338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93	liblogging-1.0.6.tar.gz
+sha256  338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93  liblogging-1.0.6.tar.gz
 
 # Hash for license file:
-sha256	a5626f700d3ee92513673b5f43733af5b651d9e7a9157d4bd81ceb9c89ec04b0	COPYING
+sha256  a5626f700d3ee92513673b5f43733af5b651d9e7a9157d4bd81ceb9c89ec04b0  COPYING
diff --git a/package/libloki/libloki.hash b/package/libloki/libloki.hash
index 52d67c8801..ee9c0a55c9 100644
--- a/package/libloki/libloki.hash
+++ b/package/libloki/libloki.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/loki-lib/files/Loki/Loki%200.1.7
-md5 33a24bcbb99fa2ec8fcbbab65649f3f6 loki-0.1.7.tar.bz2
-sha1 006c630217b1e1fd33015dc0597d2d743d8ee4e3 loki-0.1.7.tar.bz2
+md5  33a24bcbb99fa2ec8fcbbab65649f3f6  loki-0.1.7.tar.bz2
+sha1  006c630217b1e1fd33015dc0597d2d743d8ee4e3  loki-0.1.7.tar.bz2
 # locally computed
-sha256 07553754f6be2738559947db69b0718512665bf4a34015fa3a875b6eb1111198 loki-0.1.7.tar.bz2
+sha256  07553754f6be2738559947db69b0718512665bf4a34015fa3a875b6eb1111198  loki-0.1.7.tar.bz2
diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
index 91fe15ced1..493bab5820 100644
--- a/package/libmbus/libmbus.hash
+++ b/package/libmbus/libmbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4	libmbus-0.8.0.tar.gz
-sha256	ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74	COPYING
+sha256  9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4  libmbus-0.8.0.tar.gz
+sha256  ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74  COPYING
diff --git a/package/libmemcached/libmemcached.hash b/package/libmemcached/libmemcached.hash
index 77d7c478bc..ccc31ee7ed 100644
--- a/package/libmemcached/libmemcached.hash
+++ b/package/libmemcached/libmemcached.hash
@@ -1,5 +1,5 @@
 # From https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz/+md5
-md5	b3958716b4e53ddc5992e6c49d97e819	libmemcached-1.0.18.tar.gz
+md5  b3958716b4e53ddc5992e6c49d97e819  libmemcached-1.0.18.tar.gz
 
 # Hash for license file:
-sha256	4e9032d0f539276db05519ee3d09ca6167d2134ec91c556e8c80ef3efe633fd2	COPYING
+sha256  4e9032d0f539276db05519ee3d09ca6167d2134ec91c556e8c80ef3efe633fd2  COPYING
diff --git a/package/libmng/libmng.hash b/package/libmng/libmng.hash
index 02a493f414..df078dcfd0 100644
--- a/package/libmng/libmng.hash
+++ b/package/libmng/libmng.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/libmng/files/libmng-devel/2.0.3/
-md5	e9e899adb1b681b17f14d91e261878c5	libmng-2.0.3.tar.xz
-sha1	0f141482ffcef6f8cd4413f945a59310ac2e49af	libmng-2.0.3.tar.xz
+md5  e9e899adb1b681b17f14d91e261878c5  libmng-2.0.3.tar.xz
+sha1  0f141482ffcef6f8cd4413f945a59310ac2e49af  libmng-2.0.3.tar.xz
 
 # Hash for license file:
-sha256	ba280734838eb3f22a85b92a7e62de357d4d4c325029dce723b0cb125c417c35	LICENSE
+sha256  ba280734838eb3f22a85b92a7e62de357d4d4c325029dce723b0cb125c417c35  LICENSE
diff --git a/package/libmpd/libmpd.hash b/package/libmpd/libmpd.hash
index c0e5c6b3c3..875eba2b05 100644
--- a/package/libmpd/libmpd.hash
+++ b/package/libmpd/libmpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83	libmpd-11.8.17.tar.gz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256  fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83  libmpd-11.8.17.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/libmspack/libmspack.hash b/package/libmspack/libmspack.hash
index b12e9b6280..9e97063f01 100644
--- a/package/libmspack/libmspack.hash
+++ b/package/libmspack/libmspack.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bac862dee6e0fc10d92c70212441d9f8ad9b0222edc9a708c3ead4adb1b24a8e  libmspack-0.10.1alpha.tar.gz
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
+sha256  bac862dee6e0fc10d92c70212441d9f8ad9b0222edc9a708c3ead4adb1b24a8e  libmspack-0.10.1alpha.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
diff --git a/package/libnatpmp/libnatpmp.hash b/package/libnatpmp/libnatpmp.hash
index baf9b35392..38bc3f4444 100644
--- a/package/libnatpmp/libnatpmp.hash
+++ b/package/libnatpmp/libnatpmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
-sha256 e8d8277e1a101fcfedb0cd5a1cc76646522c0da69f3490dd5a4055fc87ea96a2  LICENSE
+sha256  e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
+sha256  e8d8277e1a101fcfedb0cd5a1cc76646522c0da69f3490dd5a4055fc87ea96a2  LICENSE
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
index 1f03d8f983..6962ffc83f 100644
--- a/package/libnet/libnet.hash
+++ b/package/libnet/libnet.hash
@@ -1,5 +1,5 @@
 # From https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz.md5
-md5  a36c669e0cdfda6a2aa3adfb1f6fe60a libnet-1.2.tar.gz
+md5  a36c669e0cdfda6a2aa3adfb1f6fe60a  libnet-1.2.tar.gz
 # Locally computed
 sha256  caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7  libnet-1.2.tar.gz
 sha256  a06f600f67f239898d85f083aeed82ce6015b1c57599ab1def00fb68787ef388  LICENSE
diff --git a/package/libnetfilter_acct/libnetfilter_acct.hash b/package/libnetfilter_acct/libnetfilter_acct.hash
index 0d37c43677..a72d83fb28 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.hash
+++ b/package/libnetfilter_acct/libnetfilter_acct.hash
@@ -1,6 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
-md5	814b2972b2f5c740ff87510bc109168b	libnetfilter_acct-1.0.3.tar.bz2
-sha1	4b9073e4aa989b0f000c8da1ab01b22fceed52b2	libnetfilter_acct-1.0.3.tar.bz2
+md5  814b2972b2f5c740ff87510bc109168b  libnetfilter_acct-1.0.3.tar.bz2
+sha1  4b9073e4aa989b0f000c8da1ab01b22fceed52b2  libnetfilter_acct-1.0.3.tar.bz2
 
 # Hash for license file:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index bb92ebe697..ffb6c62073 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256 6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-4.0.0.tar.gz
-sha256 edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
-sha256 d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENCE-GPL-3.txt
+sha256  6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-4.0.0.tar.gz
+sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
+sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENCE-GPL-3.txt
diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index 8d0b6bd547..b9f72e0770 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
+sha256  1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
 
 # Hash for license file:
-sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
+sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libodb-mysql/libodb-mysql.hash b/package/libodb-mysql/libodb-mysql.hash
index 1c35041af8..c8204a3f65 100644
--- a/package/libodb-mysql/libodb-mysql.hash
+++ b/package/libodb-mysql/libodb-mysql.hash
@@ -1,4 +1,4 @@
-sha1	2021a67577354f1d6bed50c0b257c1920760eda7	libodb-mysql-2.4.0.tar.bz2
+sha1  2021a67577354f1d6bed50c0b257c1920760eda7  libodb-mysql-2.4.0.tar.bz2
 
-sha256	ce2fcdb6ab4a02fc0aff263a891c56949fa41b89e65d7a40d8b656d3ebf0d9bc	libodb-mysql-2.4.0.tar.bz2
-sha256	841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3	LICENSE
+sha256  ce2fcdb6ab4a02fc0aff263a891c56949fa41b89e65d7a40d8b656d3ebf0d9bc  libodb-mysql-2.4.0.tar.bz2
+sha256  841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3  LICENSE
diff --git a/package/libodb-pgsql/libodb-pgsql.hash b/package/libodb-pgsql/libodb-pgsql.hash
index 5799f09236..609b3e9093 100644
--- a/package/libodb-pgsql/libodb-pgsql.hash
+++ b/package/libodb-pgsql/libodb-pgsql.hash
@@ -1,6 +1,6 @@
 # From https://www.codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.bz2.sha1
-sha1	4628d5e296da01dbaf8658fd402b4f709f30ea2d	libodb-pgsql-2.4.0.tar.bz2
+sha1  4628d5e296da01dbaf8658fd402b4f709f30ea2d  libodb-pgsql-2.4.0.tar.bz2
 
 # Locally Computed
-sha256	778a4d38bd1161e1f0b368815514c3335da20c7584e3d07613526dcce53523bc	libodb-pgsql-2.4.0.tar.bz2
-sha256	841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3	LICENSE
+sha256  778a4d38bd1161e1f0b368815514c3335da20c7584e3d07613526dcce53523bc  libodb-pgsql-2.4.0.tar.bz2
+sha256  841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3  LICENSE
diff --git a/package/libodb/libodb.hash b/package/libodb/libodb.hash
index cea5b9eda2..7db7f969f2 100644
--- a/package/libodb/libodb.hash
+++ b/package/libodb/libodb.hash
@@ -1,6 +1,6 @@
 # From https://www.codesynthesis.com/projects/libcutl/
-sha1	42bd2a8023e338e004711e755eb30bd122b844a6	libodb-2.4.0.tar.bz2
+sha1  42bd2a8023e338e004711e755eb30bd122b844a6  libodb-2.4.0.tar.bz2
 
 # Locally Computed
-sha256	66a1bb4e8bb6ef60cc79334f8028c4d4de98d87f2ff6f8123b4cfb7751ce0007	libodb-2.4.0.tar.bz2
-sha256	841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3	LICENSE
+sha256  66a1bb4e8bb6ef60cc79334f8028c4d4de98d87f2ff6f8123b4cfb7751ce0007  libodb-2.4.0.tar.bz2
+sha256  841105a470fc283851c63941510ffd403c726d1910b688f7df95914ab8b1b5a3  LICENSE
diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
index 76b4e66c9b..fca603d9db 100644
--- a/package/libopenaptx/libopenaptx.hash
+++ b/package/libopenaptx/libopenaptx.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
-sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a  libopenaptx-0.2.1.tar.gz
diff --git a/package/liboping/liboping.hash b/package/liboping/liboping.hash
index 926b234f05..7042ed9cf7 100644
--- a/package/liboping/liboping.hash
+++ b/package/liboping/liboping.hash
@@ -1,5 +1,5 @@
 # From http://noping.cc/#download
-sha256	eb38aa93f93e8ab282d97e2582fbaea88b3f889a08cbc9dbf20059c3779d5cd8	liboping-1.10.0.tar.bz2
+sha256  eb38aa93f93e8ab282d97e2582fbaea88b3f889a08cbc9dbf20059c3779d5cd8  liboping-1.10.0.tar.bz2
 
 # Hash for license file:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index 3e8dc02558..0bf97c279c 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking PGP signature
-sha256	  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305	pam_radius-1.4.0.tar.gz
+sha256  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305  pam_radius-1.4.0.tar.gz
 
 # Hash for license file:
-sha256	  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34	LICENSE
+sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  LICENSE
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 23823bb07f..2082be7d04 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003014.html
-md5 b34e2cbdd6aa8f9cc3fa613fd401a6d6  libpciaccess-0.16.tar.bz2
-sha1 ffaa13f2df5f822da1089b55223b217c142ef919  libpciaccess-0.16.tar.bz2
-sha256 214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489  libpciaccess-0.16.tar.bz2
-sha512 2f250048a270dfc0823d4bdd613aa272c58a80eaafd922850f56c4b6f7a45a263ed4cf521b52b49f04484ea44ebefb7407d079aa058318a5751ffb181e38fed1  libpciaccess-0.16.tar.bz2
+md5  b34e2cbdd6aa8f9cc3fa613fd401a6d6  libpciaccess-0.16.tar.bz2
+sha1  ffaa13f2df5f822da1089b55223b217c142ef919  libpciaccess-0.16.tar.bz2
+sha256  214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489  libpciaccess-0.16.tar.bz2
+sha512  2f250048a270dfc0823d4bdd613aa272c58a80eaafd922850f56c4b6f7a45a263ed4cf521b52b49f04484ea44ebefb7407d079aa058318a5751ffb181e38fed1  libpciaccess-0.16.tar.bz2
 # Hash for license file:
-sha256 47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
+sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index e86b8c65ce..b57b1251a0 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/
-md5 015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
-sha1 3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
+md5  015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
+sha1  3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
 # Locally computed:
-sha256 505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
-sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
+sha256  505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
+sha256  bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 8e3164937f..167b5edc9d 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362	libpqxx-6.4.5.tar.gz
-sha256	36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38	COPYING
+sha256  86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362  libpqxx-6.4.5.tar.gz
+sha256  36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38  COPYING
diff --git a/package/libpthread-stubs/libpthread-stubs.hash b/package/libpthread-stubs/libpthread-stubs.hash
index fb33618be8..3f82bb23e9 100644
--- a/package/libpthread-stubs/libpthread-stubs.hash
+++ b/package/libpthread-stubs/libpthread-stubs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733  libpthread-stubs-0.4.tar.bz2
-sha256 78c20706e799f2b8f445e71d3d2ade6ba23b3388fd6cbeed7d71796623febde8  COPYING
+sha256  e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733  libpthread-stubs-0.4.tar.bz2
+sha256  78c20706e799f2b8f445e71d3d2ade6ba23b3388fd6cbeed7d71796623febde8  COPYING
diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
index 9a44ab7d41..a69686f59f 100644
--- a/package/libraw1394/libraw1394.hash
+++ b/package/libraw1394/libraw1394.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
-sha256	03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e  	libraw1394-2.1.2.tar.xz
+sha256  03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e  libraw1394-2.1.2.tar.xz
 # Locally computed
-sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/libreplaygain/libreplaygain.hash b/package/libreplaygain/libreplaygain.hash
index 63e5dca578..0f7bc987bd 100644
--- a/package/libreplaygain/libreplaygain.hash
+++ b/package/libreplaygain/libreplaygain.hash
@@ -1,5 +1,5 @@
 # From https://www.musepack.net/index.php?pg=src
-md5	e27b3b1249b7fbae92d656d9e3d26633	libreplaygain_r475.tar.gz
+md5  e27b3b1249b7fbae92d656d9e3d26633  libreplaygain_r475.tar.gz
 # Calculated based on the hash above
 sha256  8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482  libreplaygain_r475.tar.gz
 # Locally computed
diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
index 2e01a54985..547f82b60c 100644
--- a/package/libroxml/libroxml.hash
+++ b/package/libroxml/libroxml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ed6d68d1bceabf98e5e76907411e2e4d93b2dbd48479ab41dede851f59dad6a3	libroxml-3.0.2.tar.gz
-sha256	fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387	License.txt
+sha256  ed6d68d1bceabf98e5e76907411e2e4d93b2dbd48479ab41dede851f59dad6a3  libroxml-3.0.2.tar.gz
+sha256  fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387  License.txt
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
index 30005e39a9..87744904f8 100644
--- a/package/libserial/libserial.hash
+++ b/package/libserial/libserial.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 063142d6bfe08898316e9a6055f2ddeedef56de06f7cfc8dcdfecc6efabf4bdd libserial-1.0.0.tar.gz
-sha256 c42fdfe17c192cfdb900e22d40ef246db1b473f99165e405eda62b41be27f4bf LICENSE.txt
+sha256  063142d6bfe08898316e9a6055f2ddeedef56de06f7cfc8dcdfecc6efabf4bdd  libserial-1.0.0.tar.gz
+sha256  c42fdfe17c192cfdb900e22d40ef246db1b473f99165e405eda62b41be27f4bf  LICENSE.txt
diff --git a/package/libsha1/libsha1.hash b/package/libsha1/libsha1.hash
index 5a2b0ed138..e896a2f570 100644
--- a/package/libsha1/libsha1.hash
+++ b/package/libsha1/libsha1.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ef4c75007ac41c3dc09e0225943c789ba2b9c632a6cd7b548e0519477ac2f768  libsha1-0.3.tar.gz
-sha256 4c387926596bfeacc5b72ebeb96ab36c299a07568e18592c727a6c11dd512c20  COPYING
+sha256  ef4c75007ac41c3dc09e0225943c789ba2b9c632a6cd7b548e0519477ac2f768  libsha1-0.3.tar.gz
+sha256  4c387926596bfeacc5b72ebeb96ab36c299a07568e18592c727a6c11dd512c20  COPYING
diff --git a/package/libsidplay2/libsidplay2.hash b/package/libsidplay2/libsidplay2.hash
index 5342135adf..b6ba26d654 100644
--- a/package/libsidplay2/libsidplay2.hash
+++ b/package/libsidplay2/libsidplay2.hash
@@ -1,4 +1,4 @@
 # From http://sourceforge.net/projects/sidplay2/files/sidplay2/sidplay-libs-2.1.1/
-sha1	8af6350866edc30b0d331e075fa97292f6f645a5	sidplay-libs-2.1.1.tar.gz
+sha1  8af6350866edc30b0d331e075fa97292f6f645a5  sidplay-libs-2.1.1.tar.gz
 # Locally computed
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  libsidplay/COPYING
diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
index 0898a2fba0..0c47ef49d5 100644
--- a/package/libsigrok/libsigrok.hash
+++ b/package/libsigrok/libsigrok.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c	libsigrok-0.5.2.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c  libsigrok-0.5.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
index 44e03ad37a..a00a662fac 100644
--- a/package/libsigrokdecode/libsigrokdecode.hash
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0  libsigrokdecode-0.5.3.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0  libsigrokdecode-0.5.3.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index bc7b02d64f..37c1a620b6 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking Minisign signature
 # https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz.minisig
-sha256 6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
-sha256 dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
+sha256  6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
+sha256  dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
index 06c96e977b..e4229a90a9 100644
--- a/package/libsquish/libsquish.hash
+++ b/package/libsquish/libsquish.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/libsquish/files
-sha1 51844b9a8bc815a27e2cc0ffbede5fee3ef75110 libsquish-1.15.tgz
-md5 c02645800131e55b519ff8dbe7284f93 libsquish-1.15.tgz
+sha1  51844b9a8bc815a27e2cc0ffbede5fee3ef75110  libsquish-1.15.tgz
+md5  c02645800131e55b519ff8dbe7284f93  libsquish-1.15.tgz
 # Locally calculated
-sha256 a6b8c383bf3ab28460d6507484d605dd722e03971606f0cd3032a3af682b63a5  LICENSE.txt
+sha256  a6b8c383bf3ab28460d6507484d605dd722e03971606f0cd3032a3af682b63a5  LICENSE.txt
diff --git a/package/libsvg-cairo/libsvg-cairo.hash b/package/libsvg-cairo/libsvg-cairo.hash
index 7240ee57b1..d9cfbffa7a 100644
--- a/package/libsvg-cairo/libsvg-cairo.hash
+++ b/package/libsvg-cairo/libsvg-cairo.hash
@@ -1,5 +1,5 @@
 # From http://cairographics.org/snapshots/libsvg-cairo-0.1.6.tar.gz.md5
-md5 d79da7b3a60ad8c8e4b902c9b3563047  libsvg-cairo-0.1.6.tar.gz
+md5  d79da7b3a60ad8c8e4b902c9b3563047  libsvg-cairo-0.1.6.tar.gz
 
 # Locally calculated
 sha256  a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c  libsvg-cairo-0.1.6.tar.gz
diff --git a/package/libsvg/libsvg.hash b/package/libsvg/libsvg.hash
index c314c58015..4a9d42a651 100644
--- a/package/libsvg/libsvg.hash
+++ b/package/libsvg/libsvg.hash
@@ -1,5 +1,5 @@
 # From http://cairographics.org/snapshots/libsvg-0.1.4.tar.gz.md5
-md5 ce0715e3013f78506795fba16e8455d3 libsvg-0.1.4.tar.gz
+md5  ce0715e3013f78506795fba16e8455d3  libsvg-0.1.4.tar.gz
 
 # Locally calculated
 sha256  4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f  libsvg-0.1.4.tar.gz
diff --git a/package/libtelnet/libtelnet.hash b/package/libtelnet/libtelnet.hash
index afbb29e4fb..e64cc5fa1a 100644
--- a/package/libtelnet/libtelnet.hash
+++ b/package/libtelnet/libtelnet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d2f01a9dc0cc01777844b6d27f0f836dad9a4b9a32a31c7bbde0762480262f25  libtelnet-0.23.tar.gz
-sha256 b1faf309467bc1d0aab9b42d6e86a614e78f8fe3580e289966b5b9f9a8f94d99  COPYING
+sha256  d2f01a9dc0cc01777844b6d27f0f836dad9a4b9a32a31c7bbde0762480262f25  libtelnet-0.23.tar.gz
+sha256  b1faf309467bc1d0aab9b42d6e86a614e78f8fe3580e289966b5b9f9a8f94d99  COPYING
diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
index 45376ddaa4..42ffa05045 100644
--- a/package/libtheora/libtheora.hash
+++ b/package/libtheora/libtheora.hash
@@ -1,6 +1,6 @@
 # From http://downloads.xiph.org/releases/theora/SHA256SUMS
-sha256	f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61	libtheora-1.1.1.tar.xz
+sha256  f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61  libtheora-1.1.1.tar.xz
 
 # Locally calculated
-sha256	8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc	COPYING
-sha256	654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4	LICENSE
+sha256  8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc  COPYING
+sha256  654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4  LICENSE
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index fa1af5ec28..9af489ef1a 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1  ltm-1.2.0.tar.xz
+sha256  b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1  ltm-1.2.0.tar.xz
 
 # Hashes for license files:
-sha256 2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
+sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index e2adfa1897..8deaf4fbf6 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f	libtool-2.4.6.tar.xz
+sha256  7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f  libtool-2.4.6.tar.xz
 # License files, locally calculated
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	libltdl/COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libltdl/COPYING.LIB
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
index 3a4fe89a4e..5c755c8bef 100644
--- a/package/libtorrent/libtorrent.hash
+++ b/package/libtorrent/libtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ed115a28f4ae8cfcd33b94a597c076ca74fd549867a26e4fac9505c27288e983  libtorrent-0.13.8.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  ed115a28f4ae8cfcd33b94a597c076ca74fd549867a26e4fac9505c27288e983  libtorrent-0.13.8.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
index 8d4a796e22..164b00276f 100644
--- a/package/libucl/libucl.hash
+++ b/package/libucl/libucl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef  libucl-0.8.1.tar.gz
-sha256 1bf976835764c1d827e07472a0a75adb098682df56681878af05fc0db7439b03  COPYING
+sha256  a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef  libucl-0.8.1.tar.gz
+sha256  1bf976835764c1d827e07472a0a75adb098682df56681878af05fc0db7439b03  COPYING
diff --git a/package/libuecc/libuecc.hash b/package/libuecc/libuecc.hash
index bfc9aaf396..b72519f167 100644
--- a/package/libuecc/libuecc.hash
+++ b/package/libuecc/libuecc.hash
@@ -1,5 +1,5 @@
 # from https://projects.universe-factory.net/projects/fastd/files
-md5     5cd543cb8e7bce83a22c07a0579c95a1                                  libuecc-7.tar.xz
+md5  5cd543cb8e7bce83a22c07a0579c95a1  libuecc-7.tar.xz
 # computed locally
 sha256  b94aef08eab5359d0facaa7ead2ce81b193eef0c61379d9835213ebc0a46257a  libuecc-7.tar.xz
 sha256  ec4d9fcc3a37a7998a9ea4decf38f4c0c91a44fd05bb17638c52fe16f2b12e23  COPYRIGHT
diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
index 11b4f55f04..43f0935a36 100644
--- a/package/libwebsock/libwebsock.hash
+++ b/package/libwebsock/libwebsock.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.lesser
+sha256  34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.lesser
diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index 7aeec70b9e..c3ef1016e8 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d XML-Parser-2.46.tar.gz
-sha256 6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2 README
+sha256  d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d  XML-Parser-2.46.tar.gz
+sha256  6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2  README
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index bd20c85cbb..2840a97f91 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9	lightning-2.1.3.tar.gz
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSER
+sha256  ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9  lightning-2.1.3.tar.gz
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/linux-zigbee/linux-zigbee.hash b/package/linux-zigbee/linux-zigbee.hash
index f337038855..232c1cb438 100644
--- a/package/linux-zigbee/linux-zigbee.hash
+++ b/package/linux-zigbee/linux-zigbee.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	92fbefdf18d45147c2b78ca2ce2d899d4d1da5a3391a4ff6c51a5b14c6d6f87c	lowpan-tools-0.3.1.tar.gz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256  92fbefdf18d45147c2b78ca2ce2d899d4d1da5a3391a4ff6c51a5b14c6d6f87c  lowpan-tools-0.3.1.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 8d9a79d2d1..187768db47 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,6 +1,6 @@
 # hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.1/
-sha1 9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a lirc-0.10.1.tar.bz2
-md5 86c3f8e4efaba10571addb8313d1e040 lirc-0.10.1.tar.bz2
+sha1  9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a  lirc-0.10.1.tar.bz2
+md5  86c3f8e4efaba10571addb8313d1e040  lirc-0.10.1.tar.bz2
 # Locally computed
 sha256  8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2  lirc-0.10.1.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
index 647f11d866..a9e9c6d5b2 100644
--- a/package/ljlinenoise/ljlinenoise.hash
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
-sha256 9b17730cb34ea591fb39688e70bd2be9c13d11b9db1c813b4ae68e3da9b7093e  ljlinenoise-0.1.3/COPYRIGHT
+sha256  7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
+sha256  9b17730cb34ea591fb39688e70bd2be9c13d11b9db1c813b4ae68e3da9b7093e  ljlinenoise-0.1.3/COPYRIGHT
diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
index 6fd7f6a519..e9aba33da1 100644
--- a/package/ljsyscall/ljsyscall.hash
+++ b/package/ljsyscall/ljsyscall.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-0.12.tar.gz
-sha256 c8e21d8e74afbe26c2c8e69b42327d3b48e602117f9ef7b22c31ddca6f46b1f2  COPYRIGHT
+sha256  6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-0.12.tar.gz
+sha256  c8e21d8e74afbe26c2c8e69b42327d3b48e602117f9ef7b22c31ddca6f46b1f2  COPYRIGHT
diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
index 7c8ef60460..fb892fdc3b 100644
--- a/package/lksctp-tools/lksctp-tools.hash
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
-md5	68e9b8fa4d4e331029b247b72d46d7a5	lksctp-tools-1.0.17.tar.gz
-sha1	941b0b5c39e364a971f514bba66120435660e518	lksctp-tools-1.0.17.tar.gz
+md5  68e9b8fa4d4e331029b247b72d46d7a5  lksctp-tools-1.0.17.tar.gz
+sha1  941b0b5c39e364a971f514bba66120435660e518  lksctp-tools-1.0.17.tar.gz
 # Locally computed
 sha256  dee5f35e583183abb9212938643ecb2d858fd89e2e286f4b1d903f65d49d6c76  COPYING.lib
 sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
index f79aabee9d..f4084c8112 100644
--- a/package/log4cpp/log4cpp.hash
+++ b/package/log4cpp/log4cpp.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
-md5 b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
-sha1 74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
+md5  b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
+sha1  74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
 # Locally computed
-sha256 2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  log4cpp/COPYING
+sha256  2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  log4cpp/COPYING
diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
index 539a41a3ce..8e9f5c95bd 100644
--- a/package/logsurfer/logsurfer.hash
+++ b/package/logsurfer/logsurfer.hash
@@ -1,3 +1,3 @@
 # From https://www.crypt.gen.nz/logsurfer/
-md5 4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
-sha256 74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
+md5  4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
+sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index 7a20f063f3..1ccaf242c4 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
+sha256  e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
diff --git a/package/lpty/lpty.hash b/package/lpty/lpty.hash
index 6b21d75a5d..1fe88107ea 100644
--- a/package/lpty/lpty.hash
+++ b/package/lpty/lpty.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
-sha256 c5a128a73cad5f6e111ebd8f4a9fa3500562c57912972eb15627db9610d43dec  lpty-1.0.1-1/doc/LICENSE
+sha256  cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
+sha256  c5a128a73cad5f6e111ebd8f4a9fa3500562c57912972eb15627db9610d43dec  lpty-1.0.1-1/doc/LICENSE
diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
index 111635e50e..fc6c81d4cf 100644
--- a/package/lrandom/lrandom.hash
+++ b/package/lrandom/lrandom.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 9b77af41202feb38b09cb4a99cd49680ea9dbc9df3e640f801be378dd286eab8  lrandom-20180729-1.src.rock
+sha256  9b77af41202feb38b09cb4a99cd49680ea9dbc9df3e640f801be378dd286eab8  lrandom-20180729-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 8ed989825e..48ae2fce85 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
+sha256  fdae3c03390ab4e4b7db3a13d09b79ffe19318739b752d17914adcdb3d2ef9ff  lsqlite3-0.9.5-1.src.rock
diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/lttng-babeltrace/lttng-babeltrace.hash
index 7c114ac7ec..9bf327fc49 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.hash
+++ b/package/lttng-babeltrace/lttng-babeltrace.hash
@@ -1,7 +1,7 @@
 # From http://www.efficios.com/files/babeltrace/babeltrace-1.5.7.tar.bz2.sha256
-sha256 215331e025ffd39c665a34231b9429180e48aca78f79fb972d0bf1322d2b807b  babeltrace-1.5.7.tar.bz2
+sha256  215331e025ffd39c665a34231b9429180e48aca78f79fb972d0bf1322d2b807b  babeltrace-1.5.7.tar.bz2
 
 # Hash for license files
-sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256 12d4222ac628fe4092cba8ed90bc5227a4dedd0b94973273cecbc393325bf1c2  LICENSE
+sha256  2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256  12d4222ac628fe4092cba8ed90bc5227a4dedd0b94973273cecbc393325bf1c2  LICENSE
diff --git a/package/lua-binaryheap/lua-binaryheap.hash b/package/lua-binaryheap/lua-binaryheap.hash
index 3713ea331e..dd5036b423 100644
--- a/package/lua-binaryheap/lua-binaryheap.hash
+++ b/package/lua-binaryheap/lua-binaryheap.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 ecce14dedfa7a1938aa2383c83036b98461876934f169384a2cec6bb46462d87  binaryheap-0.4-1.src.rock
+sha256  ecce14dedfa7a1938aa2383c83036b98461876934f169384a2cec6bb46462d87  binaryheap-0.4-1.src.rock
diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
index 9a4f64b66c..90bc2c19db 100644
--- a/package/lua-bit32/lua-bit32.hash
+++ b/package/lua-bit32/lua-bit32.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 0e273427f2b877270f9cec5642ebe2670242926ba9638d4e6df7e4e1263ca12c  bit32-5.3.5.1-1.src.rock
-sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.10/LICENSE
+sha256  0e273427f2b877270f9cec5642ebe2670242926ba9638d4e6df7e4e1263ca12c  bit32-5.3.5.1-1.src.rock
+sha256  1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.10/LICENSE
diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index 2a23eb3d2b..b052c5199c 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
-sha256 9576e82ef5013fbe80b3bd446a7d9ddd47328baa2186c31d3d885e2a9a8cd31e  lua-cjson/LICENSE
+sha256  455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
+sha256  9576e82ef5013fbe80b3bd446a7d9ddd47328baa2186c31d3d885e2a9a8cd31e  lua-cjson/LICENSE
diff --git a/package/lua-coat/lua-coat.hash b/package/lua-coat/lua-coat.hash
index 491ba2964c..f2e79d69ba 100644
--- a/package/lua-coat/lua-coat.hash
+++ b/package/lua-coat/lua-coat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
-sha256 81b5f657812ccfd63f19c9af1389b5fe6b26f079a4841c5d074940c47bf7cb1e  lua-Coat-0.9.2/COPYRIGHT
+sha256  24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
+sha256  81b5f657812ccfd63f19c9af1389b5fe6b26f079a4841c5d074940c47bf7cb1e  lua-Coat-0.9.2/COPYRIGHT
diff --git a/package/lua-coatpersistent/lua-coatpersistent.hash b/package/lua-coatpersistent/lua-coatpersistent.hash
index a15379e134..0dae3dcab8 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.hash
+++ b/package/lua-coatpersistent/lua-coatpersistent.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
-sha256 5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
-sha256 f8ed30644056ceff4315e694a1c1af4af4f08ec0adabae353ab8f3f5289ffbf3  lua-CoatPersistent-0.2.2/COPYRIGHT
+sha256  e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
+sha256  5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
+sha256  f8ed30644056ceff4315e694a1c1af4af4f08ec0adabae353ab8f3f5289ffbf3  lua-CoatPersistent-0.2.2/COPYRIGHT
diff --git a/package/lua-codegen/lua-codegen.hash b/package/lua-codegen/lua-codegen.hash
index 0b49a5a78c..2fd466ac70 100644
--- a/package/lua-codegen/lua-codegen.hash
+++ b/package/lua-codegen/lua-codegen.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 c09126d7f5d0fa9c867ee9108eb5961dab111320ee35e5f842317f6058e922ec  lua-codegen-0.3.3-1.src.rock
-sha256 f09265c450c3a59558ecc552ea4ba61e5a74dec995738eec545d121718833a80  lua-CodeGen-0.3.3/COPYRIGHT
+sha256  c09126d7f5d0fa9c867ee9108eb5961dab111320ee35e5f842317f6058e922ec  lua-codegen-0.3.3-1.src.rock
+sha256  f09265c450c3a59558ecc552ea4ba61e5a74dec995738eec545d121718833a80  lua-CodeGen-0.3.3/COPYRIGHT
diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index 07783820cc..ccd9a71205 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 e513e75ba0ef4923a1ec0d4f0beb5972a11cc9bd7ac1b0953b5e4f037b259c92  compat53-0.8-1.src.rock
-sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.8/LICENSE
+sha256  e513e75ba0ef4923a1ec0d4f0beb5972a11cc9bd7ac1b0953b5e4f037b259c92  compat53-0.8-1.src.rock
+sha256  1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.8/LICENSE
diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index 43790f2bda..dd3c0c32dc 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
-sha256 8865da757dbc6fe3c8cee4d88bdfd82c1e0e789974a4d0d52db75a985025c1f0  lua-csnappy-0.1.5/COPYRIGHT
+sha256  4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
+sha256  8865da757dbc6fe3c8cee4d88bdfd82c1e0e789974a4d0d52db75a985025c1f0  lua-csnappy-0.1.5/COPYRIGHT
diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index c43b2b147c..07a13e7e8a 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4f7d58c50267b5ebd2145e52aaa5fb63fbf63a74ae765f08e2d0dddd570b6b6a  datafile-0.6-1.src.rock
-sha256 0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
+sha256  4f7d58c50267b5ebd2145e52aaa5fb63fbf63a74ae765f08e2d0dddd570b6b6a  datafile-0.6-1.src.rock
+sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-fifo/lua-fifo.hash b/package/lua-fifo/lua-fifo.hash
index 7d885f413d..61b4e984da 100644
--- a/package/lua-fifo/lua-fifo.hash
+++ b/package/lua-fifo/lua-fifo.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 53dea24ad658614a0254dcb10296a1a0fc5357315ada5724d6362f54c32b4c20  fifo-0.2-0.src.rock
-sha256 8b4423dd4f55a69da1454b7a48346a54fd5b6e0408b38fde25cd29c0922962b6  fifo.lua-0.2/LICENSE
+sha256  53dea24ad658614a0254dcb10296a1a0fc5357315ada5724d6362f54c32b4c20  fifo-0.2-0.src.rock
+sha256  8b4423dd4f55a69da1454b7a48346a54fd5b6e0408b38fde25cd29c0922962b6  fifo.lua-0.2/LICENSE
diff --git a/package/lua-flu/lua-flu.hash b/package/lua-flu/lua-flu.hash
index 63f414d38f..28ffd012df 100644
--- a/package/lua-flu/lua-flu.hash
+++ b/package/lua-flu/lua-flu.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 221ba8f8d3abbf12d5fc217dbb965605391892eb314eff1cd9c7beca90fe9887  flu-20181218-1.src.rock
-sha256 409f7c274eb26874a382241d675a360ba6b2659742c5941e680d71a41dd35913  doub-flu-63f077a988cd/doc/LICENSE.txt
+sha256  221ba8f8d3abbf12d5fc217dbb965605391892eb314eff1cd9c7beca90fe9887  flu-20181218-1.src.rock
+sha256  409f7c274eb26874a382241d675a360ba6b2659742c5941e680d71a41dd35913  doub-flu-63f077a988cd/doc/LICENSE.txt
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
index 491167eeda..0f9284896d 100644
--- a/package/lua-http/lua-http.hash
+++ b/package/lua-http/lua-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 dbe1b29ff89fb937059e4398c9a628361d97d856acc87fd8cd85cb9340cde328  http-0.4-0.src.rock
-sha256 1b486781068bcfd373f8c54f8d78eeab76d900bdf32e589e8330a4c563c2874b  lua-http-0.4/LICENSE.md
+sha256  dbe1b29ff89fb937059e4398c9a628361d97d856acc87fd8cd85cb9340cde328  http-0.4-0.src.rock
+sha256  1b486781068bcfd373f8c54f8d78eeab76d900bdf32e589e8330a4c563c2874b  lua-http-0.4/LICENSE.md
diff --git a/package/lua-iconv/lua-iconv.hash b/package/lua-iconv/lua-iconv.hash
index 8015599e42..b28ce0b31c 100644
--- a/package/lua-iconv/lua-iconv.hash
+++ b/package/lua-iconv/lua-iconv.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
-sha256 30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv-7/COPYING
+sha256  fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
+sha256  30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv-7/COPYING
diff --git a/package/lua-inotify/lua-inotify.hash b/package/lua-inotify/lua-inotify.hash
index 183638954c..3ec4ea9bb1 100644
--- a/package/lua-inotify/lua-inotify.hash
+++ b/package/lua-inotify/lua-inotify.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 9164b5777b132d7e1e073478d8837a526262991c57e32d75d517100f533eb436  inotify-0.5-1.src.rock
-sha256 b02158adb3c7763e1183a9386672f4f037bfeaab0cb0c73d684f34f3ea1993d8  linotify-0.5/COPYRIGHT
+sha256  9164b5777b132d7e1e073478d8837a526262991c57e32d75d517100f533eb436  inotify-0.5-1.src.rock
+sha256  b02158adb3c7763e1183a9386672f4f037bfeaab0cb0c73d684f34f3ea1993d8  linotify-0.5/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
index cb7cf898bc..747004cfa6 100644
--- a/package/lua-livr-extra/lua-livr-extra.hash
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
-sha256 96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
+sha256  42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
+sha256  96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index 73b0fefa71..fe9876909d 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
-sha256 69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
+sha256  e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
+sha256  69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
index 3fad73ca01..012d7035dd 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 0e6d33543689e83911e2cb47965752e00412cbdfca888812ccbde9ec95259c56  lpeg_patterns-0.5-0.src.rock
-sha256 5b0346f2b2432e5f05e8e4ad31503cf84ddf802dacde9e8c3e529efaa4be3348  lpeg_patterns-0.5/LICENSE.md
+sha256  0e6d33543689e83911e2cb47965752e00412cbdfca888812ccbde9ec95259c56  lpeg_patterns-0.5-0.src.rock
+sha256  5b0346f2b2432e5f05e8e4ad31503cf84ddf802dacde9e8c3e529efaa4be3348  lpeg_patterns-0.5/LICENSE.md
diff --git a/package/lua-lunitx/lua-lunitx.hash b/package/lua-lunitx/lua-lunitx.hash
index b97b93f090..8bb9c15407 100644
--- a/package/lua-lunitx/lua-lunitx.hash
+++ b/package/lua-lunitx/lua-lunitx.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 2299facf4977f9b663e1ad402098139116a87a693c3df66e1f6b89e2cf47646f  lunitx-0.8-1.src.rock
-sha256 3fcfcd6010d73bc2b22505b6a91779022a82661809a3e4e0a0bdd7b3463def8f  lunit/LICENSE
+sha256  2299facf4977f9b663e1ad402098139116a87a693c3df66e1f6b89e2cf47646f  lunitx-0.8-1.src.rock
+sha256  3fcfcd6010d73bc2b22505b6a91779022a82661809a3e4e0a0bdd7b3463def8f  lunit/LICENSE
diff --git a/package/lua-lunix/lua-lunix.hash b/package/lua-lunix/lua-lunix.hash
index 3cbf3481b5..6e3c920db4 100644
--- a/package/lua-lunix/lua-lunix.hash
+++ b/package/lua-lunix/lua-lunix.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
-sha256 9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
+sha256  4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
+sha256  9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
diff --git a/package/lua-markdown/lua-markdown.hash b/package/lua-markdown/lua-markdown.hash
index 682b4f84c1..9f58e4cf0d 100644
--- a/package/lua-markdown/lua-markdown.hash
+++ b/package/lua-markdown/lua-markdown.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
-sha256 c13c5634db49d16c87f164ce0b79fb7e1b313c8b66818ebf1c970747a429b39b  markdown/LICENSE
+sha256  bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
+sha256  c13c5634db49d16c87f164ce0b79fb7e1b313c8b66818ebf1c970747a429b39b  markdown/LICENSE
diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index a550a190f8..5c8dd59366 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 cbb1b7b12834b7f49fd20621446ec4d76eff67d324b8182b7988324b10830a43  lua-messagepack-0.5.2-1.src.rock
-sha256 b3b3d8c3d28a4d4f26404cdb7d7d9329e2e831ea2dd2c6b119d958ed113579b2  lua-messagepack-lua53-0.5.2-1.src.rock
-sha256 709fd93a7dd6f8e941e7f0cb9e3eeba1f4de375302f1b19e14bb51aff23c5970  lua-MessagePack-0.5.2/COPYRIGHT
+sha256  cbb1b7b12834b7f49fd20621446ec4d76eff67d324b8182b7988324b10830a43  lua-messagepack-0.5.2-1.src.rock
+sha256  b3b3d8c3d28a4d4f26404cdb7d7d9329e2e831ea2dd2c6b119d958ed113579b2  lua-messagepack-lua53-0.5.2-1.src.rock
+sha256  709fd93a7dd6f8e941e7f0cb9e3eeba1f4de375302f1b19e14bb51aff23c5970  lua-MessagePack-0.5.2/COPYRIGHT
diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index b87cfbbc6e..d1331a489f 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ff8a4d08f02356586fadfe47f01859ba28539cc42013836f79a032bf4ccc78b3  lua-periphery-1.1.1-1.src.rock
-sha256 7c60847b46f718e9651d1eca2f56bf6be09608cf08d130446a521eb8288c98e1  lua-periphery/LICENSE
+sha256  ff8a4d08f02356586fadfe47f01859ba28539cc42013836f79a032bf4ccc78b3  lua-periphery-1.1.1-1.src.rock
+sha256  7c60847b46f718e9651d1eca2f56bf6be09608cf08d130446a521eb8288c98e1  lua-periphery/LICENSE
diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index 4aacc097c7..19547e6c1f 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 df913a055ddc2f029017602732c7a497225f4e0df1bcc6858e13f9f4d9524184  lua-resty-http-0.15-0.src.rock
-sha256 407e4b1412d8afa317dc703a1d318866c3de87d78899402125cbd90548c6057d  lua-resty-http/LICENSE
+sha256  df913a055ddc2f029017602732c7a497225f4e0df1bcc6858e13f9f4d9524184  lua-resty-http-0.15-0.src.rock
+sha256  407e4b1412d8afa317dc703a1d318866c3de87d78899402125cbd90548c6057d  lua-resty-http/LICENSE
diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 2633f3b728..037844e9f7 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
-sha256 ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
+sha256  a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
+sha256  ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
diff --git a/package/lua-sailor/lua-sailor.hash b/package/lua-sailor/lua-sailor.hash
index aec00afe57..36aa88979a 100644
--- a/package/lua-sailor/lua-sailor.hash
+++ b/package/lua-sailor/lua-sailor.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
-sha256 3a19bc44e1a653b39bcb1b91cc8058ac6b1cd1caf7e6cef93517fd559b189065  sailor/LICENSE
+sha256  4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
+sha256  3a19bc44e1a653b39bcb1b91cc8058ac6b1cd1caf7e6cef93517fd559b189065  sailor/LICENSE
diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index bcd0d3071d..418c3e9e43 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
-sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
+sha256  0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
+sha256  5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
diff --git a/package/lua-std-debug/lua-std-debug.hash b/package/lua-std-debug/lua-std-debug.hash
index 3e94b40a9c..8e4bc69f20 100644
--- a/package/lua-std-debug/lua-std-debug.hash
+++ b/package/lua-std-debug/lua-std-debug.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
-sha256 034abdbbe9a13899c813509776d1e04af81bc58c2982b704c8b3663549504a31  _debug-1.0.1/LICENSE.md
+sha256  7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
+sha256  034abdbbe9a13899c813509776d1e04af81bc58c2982b704c8b3663549504a31  _debug-1.0.1/LICENSE.md
diff --git a/package/lua-std-normalize/lua-std-normalize.hash b/package/lua-std-normalize/lua-std-normalize.hash
index 84cdfca422..41a91f1ef2 100644
--- a/package/lua-std-normalize/lua-std-normalize.hash
+++ b/package/lua-std-normalize/lua-std-normalize.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 3a040b6ca43297367c527e12c1aab37acab86289f9415ffb130544c48b17f802  std.normalize-2.0.3-1.src.rock
-sha256 9c9094f0cea86c2c62b893e59a78d5eaed69df0d7da24e122ef9753baeef0f04  normalize-2.0.3/LICENSE.md
+sha256  3a040b6ca43297367c527e12c1aab37acab86289f9415ffb130544c48b17f802  std.normalize-2.0.3-1.src.rock
+sha256  9c9094f0cea86c2c62b893e59a78d5eaed69df0d7da24e122ef9753baeef0f04  normalize-2.0.3/LICENSE.md
diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 68f4d24124..c6c7c656fa 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 67eadaccbb2b6037ea70129f9616da49eaeeaf1477652a8e2cc77740286531cf  stdlib-41.2.2-1.src.rock
-sha256 d3177e0cd97e6ef7c459aa2c6a85f53d9b4ff091f7f296d4ed8bfaf713b6fea2  lua-stdlib-release-v41.2.2/COPYING
+sha256  67eadaccbb2b6037ea70129f9616da49eaeeaf1477652a8e2cc77740286531cf  stdlib-41.2.2-1.src.rock
+sha256  d3177e0cd97e6ef7c459aa2c6a85f53d9b4ff091f7f296d4ed8bfaf713b6fea2  lua-stdlib-release-v41.2.2/COPYING
diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 4ff577e528..1f435709f4 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b3e57955888aba3974d6f5a21219214e2803a38e4623671f7d9d9e0f1851e608  lua-testmore-0.3.6-1.src.rock
-sha256 37a3afb014325b98f0ad919cb40bc9d5a948120e5260e75b9d00c198d350da6d  lua-TestMore-0.3.6/COPYRIGHT
+sha256  b3e57955888aba3974d6f5a21219214e2803a38e4623671f7d9d9e0f1851e608  lua-testmore-0.3.6-1.src.rock
+sha256  37a3afb014325b98f0ad919cb40bc9d5a948120e5260e75b9d00c198d350da6d  lua-TestMore-0.3.6/COPYRIGHT
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 135574f36d..b6720b3603 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 88c456bc0f00d28201b33551d83fa6e5c3ae6025aebec790c37afb317290e4fa  luautf8-0.1.3-1.src.rock
-sha256 74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.3/LICENSE
+sha256  88c456bc0f00d28201b33551d83fa6e5c3ae6025aebec790c37afb317290e4fa  luautf8-0.1.3-1.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.3/LICENSE
diff --git a/package/lua-valua/lua-valua.hash b/package/lua-valua/lua-valua.hash
index 71d43e4faf..d4b1d4758c 100644
--- a/package/lua-valua/lua-valua.hash
+++ b/package/lua-valua/lua-valua.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
-sha256 3444c2e739c88e41e327c6cd15e4a50fea8988570642bad6e6a43d50a7f7961f  valua/LICENSE
+sha256  bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
+sha256  3444c2e739c88e41e327c6cd15e4a50fea8988570642bad6e6a43d50a7f7961f  valua/LICENSE
diff --git a/package/lua-zlib/lua-zlib.hash b/package/lua-zlib/lua-zlib.hash
index 8c108b39ae..cef29efb10 100644
--- a/package/lua-zlib/lua-zlib.hash
+++ b/package/lua-zlib/lua-zlib.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
+sha256  42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 3e865df300..4096fbb26a 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 c5b043db43941a3c6e43d3e3699236846ed6d03a6c4cb12fa1a497f965138d9f  luadbi-sqlite3-0.7.2-1.src.rock
-sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
+sha256  c5b043db43941a3c6e43d3e3699236846ed6d03a6c4cb12fa1a497f965138d9f  luadbi-sqlite3-0.7.2-1.src.rock
+sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index 07a9cc2184..e142f5e62e 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 9ebbbaf4ea1f48628341e9ff3c1de10a57200c02453734f41b8016b0fc7b4956  luadbi-0.7.2-1.src.rock
-sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
+sha256  9ebbbaf4ea1f48628341e9ff3c1de10a57200c02453734f41b8016b0fc7b4956  luadbi-0.7.2-1.src.rock
+sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luaexpatutils/luaexpatutils.hash b/package/luaexpatutils/luaexpatutils.hash
index fe32eea128..8b6befc94a 100644
--- a/package/luaexpatutils/luaexpatutils.hash
+++ b/package/luaexpatutils/luaexpatutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9b50bef94a6ddb6e6d4fffd5392f5c53d15e1a048966b559c4f8eda5e84d4517  luaexpatutils-88c228365b084224c911d34aff06002634b38b50.tar.gz
+sha256  9b50bef94a6ddb6e6d4fffd5392f5c53d15e1a048966b559c4f8eda5e84d4517  luaexpatutils-88c228365b084224c911d34aff06002634b38b50.tar.gz
diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index 747b984802..cbe38294b0 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 576270a55752894254c2cba0d49d73595d37ec4ea8a75e557fdae7aff80e19cf  luafilesystem-1.8.0-1.src.rock
-sha256 beb2c9eed6466d572c3888028a77421206053a3c023429cbd69e5015badba842  luafilesystem/LICENSE
+sha256  576270a55752894254c2cba0d49d73595d37ec4ea8a75e557fdae7aff80e19cf  luafilesystem-1.8.0-1.src.rock
+sha256  beb2c9eed6466d572c3888028a77421206053a3c023429cbd69e5015badba842  luafilesystem/LICENSE
diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index 3b7885aa7e..ea779994d3 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
-sha256 87565fca189b70f2e119b2a99e5e92a7aaab9f2eb05228b56b88e6c2e2f98bcd  luajson/LICENSE
+sha256  28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
+sha256  87565fca189b70f2e119b2a99e5e92a7aaab9f2eb05228b56b88e6c2e2f98bcd  luajson/LICENSE
diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index a65260b132..15ca840f1f 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
-sha256 b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
+sha256  49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
+sha256  b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 294ef95adb..1fc8694e84 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
-sha256 4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
+sha256  d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
+sha256  4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 18527d99ac..bf08fbd51e 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
-sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
+sha256  d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
+sha256  7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index 5406d9454f..f8c7376558 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
-sha256 c8bb3a3947379addb89412e578d0aae95ca37dc6e48a17e128f40e512d10b025  luasql/doc/us/license.html
+sha256  502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
+sha256  c8bb3a3947379addb89412e578d0aae95ca37dc6e48a17e128f40e512d10b025  luasql/doc/us/license.html
diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
index 7e252294bb..b367f29a5c 100644
--- a/package/luksmeta/luksmeta.hash
+++ b/package/luksmeta/luksmeta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
-sha256 4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
+sha256  2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
+sha256  4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/lzma/lzma.hash b/package/lzma/lzma.hash
index 6055d7d986..940c40e6ad 100644
--- a/package/lzma/lzma.hash
+++ b/package/lzma/lzma.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	02aa57f995d15b7acb7c2496d88a39fb0124ea00bf027cc61dd24eddb5942dff	lzma-4.32.7.tar.xz
-sha256	231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c	COPYING.GPLv2
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING.GPLv3
-sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	COPYING.LGPLv2.1
+sha256  02aa57f995d15b7acb7c2496d88a39fb0124ea00bf027cc61dd24eddb5942dff  lzma-4.32.7.tar.xz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPLv2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LGPLv2.1
diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
index 39a2dd4959..6eb9c50535 100644
--- a/package/lzo/lzo.hash
+++ b/package/lzo/lzo.hash
@@ -1,5 +1,5 @@
 # From http://www.oberhumer.com/opensource/lzo/
-sha1 4924676a9bae5db58ef129dc1cebce3baa3c4b5d  lzo-2.10.tar.gz
+sha1  4924676a9bae5db58ef129dc1cebce3baa3c4b5d  lzo-2.10.tar.gz
 # Locally computed
-sha256 c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072  lzo-2.10.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072  lzo-2.10.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
index 8496ac2188..adc20648b6 100644
--- a/package/lzop/lzop.hash
+++ b/package/lzop/lzop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9 lzop-1.03.tar.gz
-sha256 70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c COPYING
+sha256  c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9  lzop-1.03.tar.gz
+sha256  70439f6e2b47057a408d2390ed6663b9875f5a08066a06a060a357ef1df89a8c  COPYING
diff --git a/package/make/make.hash b/package/make/make.hash
index 242cb95643..0bd0e5546f 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,5 +1,5 @@
 # From http://lists.gnu.org/archive/html/info-gnu/2016-06/msg00005.html
-md5 15b012617e7c44c0ed482721629577ac  make-4.2.1.tar.bz2
+md5  15b012617e7c44c0ed482721629577ac  make-4.2.1.tar.bz2
 # Locally calculated after checking signature
 sha256  d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589  make-4.2.1.tar.bz2
 # Locally computed
diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index a144d5189e..9f28090417 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 76464e5ed55e9d21062cf154733ce61217211172629ec8742af902607f14d41a  mali-driver-a742530232d1de41b57465744a1259fa6c35049e.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  76464e5ed55e9d21062cf154733ce61217211172629ec8742af902607f14d41a  mali-driver-a742530232d1de41b57465744a1259fa6c35049e.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/matchbox-common/matchbox-common.hash b/package/matchbox-common/matchbox-common.hash
index b4aa42a15e..683354b8a3 100644
--- a/package/matchbox-common/matchbox-common.hash
+++ b/package/matchbox-common/matchbox-common.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-common/0.9/matchbox-common-0.9.1.tar.bz2.md5
-md5	8e8ba0ee170a9ac78fdc583b00ccf76b	matchbox-common-0.9.1.tar.bz2
+md5  8e8ba0ee170a9ac78fdc583b00ccf76b  matchbox-common-0.9.1.tar.bz2
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-desktop/matchbox-desktop.hash b/package/matchbox-desktop/matchbox-desktop.hash
index 0673e8e10f..61e8b8636e 100644
--- a/package/matchbox-desktop/matchbox-desktop.hash
+++ b/package/matchbox-desktop/matchbox-desktop.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/0.9/matchbox-desktop-0.9.1.tar.bz2.md5
-md5	3335a30b1a1aacfb39f23b505254765c	matchbox-desktop-0.9.1.tar.bz2
+md5  3335a30b1a1aacfb39f23b505254765c  matchbox-desktop-0.9.1.tar.bz2
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-panel/matchbox-panel.hash b/package/matchbox-panel/matchbox-panel.hash
index 5e72b9ec8f..9b4f985b2c 100644
--- a/package/matchbox-panel/matchbox-panel.hash
+++ b/package/matchbox-panel/matchbox-panel.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/0.9/matchbox-panel-0.9.3.tar.bz2.md5
-md5	56d1807636f3919e22e51896ab7ccd2e	matchbox-panel-0.9.3.tar.bz2
+md5  56d1807636f3919e22e51896ab7ccd2e  matchbox-panel-0.9.3.tar.bz2
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-startup-monitor/matchbox-startup-monitor.hash b/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
index c1b5098e92..ec312a6298 100644
--- a/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
+++ b/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/mb-applet-startup-monitor/0.1/mb-applet-startup-monitor-0.1.tar.bz2.md5
-md5	ea4b3c1ebee3f731b77a2d4bf8e9aa3c	mb-applet-startup-monitor-0.1.tar.bz2
+md5  ea4b3c1ebee3f731b77a2d4bf8e9aa3c  mb-applet-startup-monitor-0.1.tar.bz2
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/memstat/memstat.hash b/package/memstat/memstat.hash
index 9a30e342fb..6aa2c54359 100644
--- a/package/memstat/memstat.hash
+++ b/package/memstat/memstat.hash
@@ -1,4 +1,4 @@
 # From http://sourceforge.net/projects/memstattool/files/
-sha1	26071dbc30a2796c0503c7d8060a548ca36f8df9	memstat_1.0.tar.gz
+sha1  26071dbc30a2796c0503c7d8060a548ca36f8df9  memstat_1.0.tar.gz
 # Locally computed
 sha256  5e5db2a2fab637bbbc5d2400141fcb9f1b4b55540d025c2dc54378dc497cb524  debian/copyright
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index fcc4e02cbe..3be5f51a9e 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
-sha256 b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a LICENSE
+sha256  00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca  mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
+sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
index a46a7070ca..f3ced3e8c3 100644
--- a/package/menu-cache/menu-cache.hash
+++ b/package/menu-cache/menu-cache.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lxde/files/menu-cache/1.1/
-md5	99999a0bca48b980105208760c8fd893	menu-cache-1.1.0.tar.xz
-sha1	01e6035aa1fe76d7047bdec235254aa5ce17394a	menu-cache-1.1.0.tar.xz
+md5  99999a0bca48b980105208760c8fd893  menu-cache-1.1.0.tar.xz
+sha1  01e6035aa1fe76d7047bdec235254aa5ce17394a  menu-cache-1.1.0.tar.xz
 
 # Hash for license file:
-sha256	7459fbad62653e4061dbfde3b0cad7c72777838beb10d2d11d969fac6226e7de	COPYING
+sha256  7459fbad62653e4061dbfde3b0cad7c72777838beb10d2d11d969fac6226e7de  COPYING
diff --git a/package/mesa3d-demos/mesa3d-demos.hash b/package/mesa3d-demos/mesa3d-demos.hash
index 8a771df2f8..8a4955f120 100644
--- a/package/mesa3d-demos/mesa3d-demos.hash
+++ b/package/mesa3d-demos/mesa3d-demos.hash
@@ -1,5 +1,5 @@
 # From https://lists.freedesktop.org/archives/mesa-dev/2018-February/186542.html
 md5  6b65a02622765522176d00f553086fa3  mesa-demos-8.4.0.tar.bz2
-sha1 57ba892e919fa22ce3db9f25e7331a6fa33c652c  mesa-demos-8.4.0.tar.bz2
-sha256 01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d  mesa-demos-8.4.0.tar.bz2
-sha512 b72d03cad36e0535ff18dcfb222ec4200064b9264f6da51a6e5f03b0dd912abe188bc1d600b6698de3ce6f63b28d2ce01565886ca8e7079edc4967fbf2fb0957  mesa-demos-8.4.0.tar.bz2
+sha1  57ba892e919fa22ce3db9f25e7331a6fa33c652c  mesa-demos-8.4.0.tar.bz2
+sha256  01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d  mesa-demos-8.4.0.tar.bz2
+sha512  b72d03cad36e0535ff18dcfb222ec4200064b9264f6da51a6e5f03b0dd912abe188bc1d600b6698de3ce6f63b28d2ce01565886ca8e7079edc4967fbf2fb0957  mesa-demos-8.4.0.tar.bz2
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 9257daf5ac..19cf1e29d5 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
 # From https://github.com/troglobit/mg/releases/tag/v3.5
-sha256 a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
+sha256  a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
 # Locally computed:
-sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
+sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index 2d66809291..fee76c07a3 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 de00c475a3c70c56f3ee97cd683cb71009d3521d60b1f589c5a91b4671ede9f3 mini-snmpd-1.6.tar.gz
-sha256 8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56 COPYING
+sha256  de00c475a3c70c56f3ee97cd683cb71009d3521d60b1f589c5a91b4671ede9f3  mini-snmpd-1.6.tar.gz
+sha256  8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56  COPYING
diff --git a/package/minimodem/minimodem.hash b/package/minimodem/minimodem.hash
index 084a5606fb..82c3de53e1 100644
--- a/package/minimodem/minimodem.hash
+++ b/package/minimodem/minimodem.hash
@@ -1,2 +1,2 @@
-sha256 f8cca4db8e3f284d67f843054d6bb4d88a3db5e77b26192410e41e9a06f4378e  minimodem-0.24.tar.gz
-sha256 c298178753129680ef6d3112f0f8b61acc405c86c1997dfe59735257988f8b33  COPYING
+sha256  f8cca4db8e3f284d67f843054d6bb4d88a3db5e77b26192410e41e9a06f4378e  minimodem-0.24.tar.gz
+sha256  c298178753129680ef6d3112f0f8b61acc405c86c1997dfe59735257988f8b33  COPYING
diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 63dcdb9fbe..164c9b2181 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
+sha256  5b427b07c03c2c0468cc782daf1510d315141170246828fcbb7c07f927879973  mjpg-streamer-5a6e0a2db163e6ae9461552b59079870d0959340.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index bbdfd1f03d..c3d7fe2c28 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
 # http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
-sha256	c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
+sha256  c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
 # Locally computed
-sha256	3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
+sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index b008d42ebb..e72ccfbf9d 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 0ac314f75ca2bc4455785f12ceb50da89b6dac90162f9f46afbbb988a8752d4b  monolite-linux-1A5E0066-58DC-428A-B21C-0AD6CDAE2789-latest.tar.gz
+sha256  0ac314f75ca2bc4455785f12ceb50da89b6dac90162f9f46afbbb988a8752d4b  monolite-linux-1A5E0066-58DC-428A-B21C-0AD6CDAE2789-latest.tar.gz
diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index baffe1f143..3558bf9030 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,5 +1,5 @@
 # From https://mailman.mit.edu/pipermail/mosh-users/2017-July/000357.html
-sha256 da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216 mosh-1.3.2.tar.gz
+sha256  da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216  mosh-1.3.2.tar.gz
 # Locally calculcated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 8042495ddc8d99b883335d53552554eccf825fc1f0ba487d0f8e6656baaa8199  COPYING.iOS
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8042495ddc8d99b883335d53552554eccf825fc1f0ba487d0f8e6656baaa8199  COPYING.iOS
diff --git a/package/most/most.hash b/package/most/most.hash
index 151caadc3a..db0eb6db59 100644
--- a/package/most/most.hash
+++ b/package/most/most.hash
@@ -1,6 +1,6 @@
 # From https://www.jedsoft.org/releases/most/
-sha1 db811669a6b22c15478c957b439b5e4483ce1c95 most-5.1.0.tar.gz
+sha1  db811669a6b22c15478c957b439b5e4483ce1c95  most-5.1.0.tar.gz
 # Locally computed
-sha256 db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
-sha256 1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
-sha256 47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
+sha256  db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
+sha256  1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
+sha256  47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
diff --git a/package/multicat/multicat.hash b/package/multicat/multicat.hash
index 9cf84bc50f..63acc15f45 100644
--- a/package/multicat/multicat.hash
+++ b/package/multicat/multicat.hash
@@ -1,6 +1,6 @@
 # From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.md5
-md5 cf4e4bc07d72eda110050d755db14620  multicat-2.3.tar.bz2
+md5  cf4e4bc07d72eda110050d755db14620  multicat-2.3.tar.bz2
 # From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.sha256
-sha256 2be162e9e8b2e6f6aa7686431f102db6c72c8288bd82dbc67ffed631f4a3361e  multicat-2.3.tar.bz2
+sha256  2be162e9e8b2e6f6aa7686431f102db6c72c8288bd82dbc67ffed631f4a3361e  multicat-2.3.tar.bz2
 # locally calculated
-sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d COPYING
+sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 934836e76a..67093cbc9f 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -2,7 +2,7 @@
 sha1  fc17bd01d5860e49b009f28a5ddb629e94af4510  mupdf-1.18.0-source.tar.xz
 
 # Locally computed:
-sha256 592d4f6c0fba41bb954eb1a41616661b62b134d5b383e33bd45a081af5d4a59a  mupdf-1.18.0-source.tar.xz
+sha256  592d4f6c0fba41bb954eb1a41616661b62b134d5b383e33bd45a081af5d4a59a  mupdf-1.18.0-source.tar.xz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/murata-cyw-fw/murata-cyw-fw.hash b/package/murata-cyw-fw/murata-cyw-fw.hash
index c1afb229eb..d3c23dca71 100644
--- a/package/murata-cyw-fw/murata-cyw-fw.hash
+++ b/package/murata-cyw-fw/murata-cyw-fw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 c3ecf357786d6db6f3283c0ea36ec067b1728f801fd8871694aed1502a82e9bc murata-cyw-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
-sha256 03c140ae04f9c2036678262d6457b9c4b4a9ebb523c5e681af6d57b97c11da37 cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
-sha256 8f23ebb9a262112b62ace1e1bedcdeb00523d9a45e8d48a829d4ca35db4f0280 cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
-sha256 3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c LICENCE.cypress
+sha256  c3ecf357786d6db6f3283c0ea36ec067b1728f801fd8871694aed1502a82e9bc  murata-cyw-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
+sha256  03c140ae04f9c2036678262d6457b9c4b4a9ebb523c5e681af6d57b97c11da37  cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
+sha256  8f23ebb9a262112b62ace1e1bedcdeb00523d9a45e8d48a829d4ca35db4f0280  cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
+sha256  3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c  LICENCE.cypress
diff --git a/package/musepack/musepack.hash b/package/musepack/musepack.hash
index b811edd991..5a03bd260a 100644
--- a/package/musepack/musepack.hash
+++ b/package/musepack/musepack.hash
@@ -1,5 +1,5 @@
 # From https://www.musepack.net/index.php?pg=src
-md5	754d67be67f713e54baf70fcfdb2817e	musepack_src_r475.tar.gz
+md5  754d67be67f713e54baf70fcfdb2817e  musepack_src_r475.tar.gz
 # Calculated based on the hash above
 sha256  a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b  musepack_src_r475.tar.gz
 # Locally computed
diff --git a/package/musl-compat-headers/musl-compat-headers.hash b/package/musl-compat-headers/musl-compat-headers.hash
index f8e2a6c598..626145df34 100644
--- a/package/musl-compat-headers/musl-compat-headers.hash
+++ b/package/musl-compat-headers/musl-compat-headers.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h?rev=1.70
+sha256  c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h?rev=1.70
diff --git a/package/musl-fts/musl-fts.hash b/package/musl-fts/musl-fts.hash
index 8838c84793..e1266cfcd7 100644
--- a/package/musl-fts/musl-fts.hash
+++ b/package/musl-fts/musl-fts.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	  49ae567a96dbab22823d045ffebe0d6b14b9b799925e9ca9274d47d26ff482a6  musl-fts-1.2.7.tar.gz
-sha256	  55af87e4017668f54467a3380e7ebbac5e672d8c763bfe95e6fc882a6fdc4046  COPYING
+sha256  49ae567a96dbab22823d045ffebe0d6b14b9b799925e9ca9274d47d26ff482a6  musl-fts-1.2.7.tar.gz
+sha256  55af87e4017668f54467a3380e7ebbac5e672d8c763bfe95e6fc882a6fdc4046  COPYING
diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index 062ac9f6fb..04b658e8d8 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
+sha256  218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
 
 # Hash for license file:
-sha256 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
+sha256  4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
diff --git a/package/neardal/neardal.hash b/package/neardal/neardal.hash
index b8b8b96a44..daee3f3e03 100644
--- a/package/neardal/neardal.hash
+++ b/package/neardal/neardal.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 dae3c432e619a0d3102c5222d0b8fde74413ae519a64ccaae0fc81d31504aecb  neardal-4143d130ed39299bfc59d08d2c7c77dbc7f809e9.tar.gz
-sha256 296a87e9098d3f2ce1ef80c73c53399dc2c7412f35d4175c45810ea15ed86406  COPYING
+sha256  dae3c432e619a0d3102c5222d0b8fde74413ae519a64ccaae0fc81d31504aecb  neardal-4143d130ed39299bfc59d08d2c7c77dbc7f809e9.tar.gz
+sha256  296a87e9098d3f2ce1ef80c73c53399dc2c7412f35d4175c45810ea15ed86406  COPYING
diff --git a/package/netcalc/netcalc.hash b/package/netcalc/netcalc.hash
index 34d64b1679..ba503b6457 100644
--- a/package/netcalc/netcalc.hash
+++ b/package/netcalc/netcalc.hash
@@ -1,5 +1,5 @@
 # From https://github.com/troglobit/netcalc/releases/tag/v2.1.6
-md5 c8660b61370c76d866247fe65966a35b  netcalc-2.1.6.tar.gz
+md5  c8660b61370c76d866247fe65966a35b  netcalc-2.1.6.tar.gz
 # Locally computed:
-sha256 cff41782fcf63d7d4ce6d35f95ed302127f6ddf6fc0ca03a8188af95a7c3243b  netcalc-2.1.6.tar.gz
-sha256 745538f8d515d37af6f03442df982a8b211b129e8dc10d0195e33c4b42f8fe5f  LICENSE
+sha256  cff41782fcf63d7d4ce6d35f95ed302127f6ddf6fc0ca03a8188af95a7c3243b  netcalc-2.1.6.tar.gz
+sha256  745538f8d515d37af6f03442df982a8b211b129e8dc10d0195e33c4b42f8fe5f  LICENSE
diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index b136d82af1..36487d998e 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/newt/CHECKSUMS
-sha256 265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31  newt-0.52.21.tar.gz
-sha512 d53d927996d17223e688bf54dccfabb2a3dc02bfe38ffc455964e86feaca3cd9f9ab5b19774433be430fa4d761cd9b6680b558f297acb86f80daeb6942f7d23c  newt-0.52.21.tar.gz
+sha256  265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac5abb31  newt-0.52.21.tar.gz
+sha512  d53d927996d17223e688bf54dccfabb2a3dc02bfe38ffc455964e86feaca3cd9f9ab5b19774433be430fa4d761cd9b6680b558f297acb86f80daeb6942f7d23c  newt-0.52.21.tar.gz
 # Locally calculated
-sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
index d6c05e16d3..aac5ce0ab8 100644
--- a/package/nfacct/nfacct.hash
+++ b/package/nfacct/nfacct.hash
@@ -1,5 +1,5 @@
 # From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
-md5	94faafdaaed85ca9220c5692be8a408e	nfacct-1.0.2.tar.bz2
-sha1	17d6576778227ea93c62600d9b18ff4932963c6a	nfacct-1.0.2.tar.bz2
+md5  94faafdaaed85ca9220c5692be8a408e  nfacct-1.0.2.tar.bz2
+sha1  17d6576778227ea93c62600d9b18ff4932963c6a  nfacct-1.0.2.tar.bz2
 # Locally computed
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index 07deab08db..8a146c72ed 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859  nginx-dav-ext-3.0.0.tar.gz
-sha256 e377bb81e5024682a66438306e8ff9541d843d3831e480aec2f58eb8d83e48de  LICENSE
+sha256  d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859  nginx-dav-ext-3.0.0.tar.gz
+sha256  e377bb81e5024682a66438306e8ff9541d843d3831e480aec2f58eb8d83e48de  LICENSE
diff --git a/package/nload/nload.hash b/package/nload/nload.hash
index f5b8e58f66..cf211674fa 100644
--- a/package/nload/nload.hash
+++ b/package/nload/nload.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nload/files/nload/0.7.4/
-md5	3c733c528f244ca5a4f76bf185729c39	nload-0.7.4.tar.gz
-sha1	bb0a168c93c588ad4fd5e3a653b3620b79ada1e8	nload-0.7.4.tar.gz
+md5  3c733c528f244ca5a4f76bf185729c39  nload-0.7.4.tar.gz
+sha1  bb0a168c93c588ad4fd5e3a653b3620b79ada1e8  nload-0.7.4.tar.gz
 # Locally computed
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/nss-myhostname/nss-myhostname.hash b/package/nss-myhostname/nss-myhostname.hash
index dfa531c94b..3ea0618a33 100644
--- a/package/nss-myhostname/nss-myhostname.hash
+++ b/package/nss-myhostname/nss-myhostname.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2 nss-myhostname-0.3.tar.gz
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
+sha256  2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2  nss-myhostname-0.3.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index e0cdc403ee..3286f127dc 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
 # From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
-md5 cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
+md5  cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
 # Locally computed:
-sha256 c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
-sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
+sha256  c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nvidia-modprobe/nvidia-modprobe.hash b/package/nvidia-modprobe/nvidia-modprobe.hash
index 99908680f0..10b765e35c 100644
--- a/package/nvidia-modprobe/nvidia-modprobe.hash
+++ b/package/nvidia-modprobe/nvidia-modprobe.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 396b4102d3075a2dee3024652fae206a1b38ace54b8efb1e2c20757a11ec19f1  nvidia-modprobe-450.57.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  396b4102d3075a2dee3024652fae206a1b38ace54b8efb1e2c20757a11ec19f1  nvidia-modprobe-450.57.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/obsidian-cursors/obsidian-cursors.hash b/package/obsidian-cursors/obsidian-cursors.hash
index 8f1775e8a4..a476a0ba05 100644
--- a/package/obsidian-cursors/obsidian-cursors.hash
+++ b/package/obsidian-cursors/obsidian-cursors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9	73135-Obsidian.tar.bz2
+sha256  3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9  73135-Obsidian.tar.bz2
diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index 7ae38c30e8..b8db1723a3 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
-sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
+sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/odb/odb.hash b/package/odb/odb.hash
index 773a9c829b..36c374588c 100644
--- a/package/odb/odb.hash
+++ b/package/odb/odb.hash
@@ -1,6 +1,6 @@
 # From https://www.codesynthesis.com/products/odb/download.xhtml
-sha1	810fc02e591429ed19f5a2699d144fb611fb121b	odb-2.4.0.tar.bz2
+sha1  810fc02e591429ed19f5a2699d144fb611fb121b  odb-2.4.0.tar.bz2
 
 # Locally computed
-sha256	6785154fa98ea3977c8c2ab38cec16c4aa78c2c2039e80cd2908347b1c1d4198	odb-2.4.0.tar.bz2
-sha256	7983b82cb1f1686ac2b55420ded9c0f348f93dd17bf3e048ae3b25c1da51b80e	LICENSE
+sha256  6785154fa98ea3977c8c2ab38cec16c4aa78c2c2039e80cd2908347b1c1d4198  odb-2.4.0.tar.bz2
+sha256  7983b82cb1f1686ac2b55420ded9c0f348f93dd17bf3e048ae3b25c1da51b80e  LICENSE
diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index 821361bb13..c148025b12 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 ee9e524224e5d5304dcf61f1dc5485c569da09d382934ff85b233be3e24821a3  olsr-0.9.8.tar.gz
-sha256 7dcf1fb93ef105e2708b02603bb6ee443115d4819fbf2c5a3a001b46887acb9a  license.txt
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  lib/pud/nmealib/LICENSE
+sha256  ee9e524224e5d5304dcf61f1dc5485c569da09d382934ff85b233be3e24821a3  olsr-0.9.8.tar.gz
+sha256  7dcf1fb93ef105e2708b02603bb6ee443115d4819fbf2c5a3a001b46887acb9a  license.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  lib/pud/nmealib/LICENSE
diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
index fcbf730ab3..5826c68d70 100644
--- a/package/omxplayer/omxplayer.hash
+++ b/package/omxplayer/omxplayer.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha1    a9106203f822fe88eb35980479f46a555086d4a7                          omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
+sha1  a9106203f822fe88eb35980479f46a555086d4a7  omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
 sha256  af2d9450f8947842ea8c401fe9f71eec444013ebbdee29f2ac828c9c493c1329  omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
 
 # Hash for license file:
diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
index b333822b90..2a2d749846 100644
--- a/package/opencore-amr/opencore-amr.hash
+++ b/package/opencore-amr/opencore-amr.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/opencore-amr/files/opencore-amr/
-md5 e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
-sha1 bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
+md5  e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
+sha1  bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
 # Locally computed:
-sha256 2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
-sha256 8b3f1762349248d444ab9acbafe73941254e36e1064954da56bb9ddbd5873ddb  LICENSE
+sha256  2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
+sha256  8b3f1762349248d444ab9acbafe73941254e36e1064954da56bb9ddbd5873ddb  LICENSE
diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 4e76951c8f..a399adc758 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
 # From: https://www.open-mpi.org/software/ompi/v4.0/
-md5 e3da67df1e968c8798827e0e5fe9a510  openmpi-4.0.0.tar.bz2
-sha1 fee1d0287abfb150bae16957de342752c9bdd4e8  openmpi-4.0.0.tar.bz2
+md5  e3da67df1e968c8798827e0e5fe9a510  openmpi-4.0.0.tar.bz2
+sha1  fee1d0287abfb150bae16957de342752c9bdd4e8  openmpi-4.0.0.tar.bz2
 # Locally computed
-sha256 2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b  openmpi-4.0.0.tar.bz2
-sha256 8298a80ed5f09cfd007bae1c0e7d67d1c2810c6389876778dad070c31a691dac  LICENSE
+sha256  2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b  openmpi-4.0.0.tar.bz2
+sha256  8298a80ed5f09cfd007bae1c0e7d67d1c2810c6389876778dad070c31a691dac  LICENSE
diff --git a/package/openobex/openobex.hash b/package/openobex/openobex.hash
index 1cdb09decb..1a113c3379 100644
--- a/package/openobex/openobex.hash
+++ b/package/openobex/openobex.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/openobex/files/openobex/1.7.2/
-sha1 4a5098a62889134cbd2b54997e7ff3e959e601e6  openobex-1.7.2-Source.tar.gz
-md5 f6e0b6cb7dcfd731460a7e9a91429a3a  openobex-1.7.2-Source.tar.gz
+sha1  4a5098a62889134cbd2b54997e7ff3e959e601e6  openobex-1.7.2-Source.tar.gz
+md5  f6e0b6cb7dcfd731460a7e9a91429a3a  openobex-1.7.2-Source.tar.gz
 # License files, locally calculated
-sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
-sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index cd00f902fb..2d8683f09c 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.1/
-md5	04524d1b1f9946176dce0ccb0eecf537	openPOWERLINK_V2.7.1.tar.gz
-sha1	4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd	openPOWERLINK_V2.7.1.tar.gz
+md5  04524d1b1f9946176dce0ccb0eecf537  openPOWERLINK_V2.7.1.tar.gz
+sha1  4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd  openPOWERLINK_V2.7.1.tar.gz
 # sha256 locally computed
 sha256  d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd  openPOWERLINK_V2.7.1.tar.gz
 sha256  348e31e9e5094104463d58d33abd31049fdf209afbc12ea7abb7fd4b4a147429  license.md
diff --git a/package/opentyrian-data/opentyrian-data.hash b/package/opentyrian-data/opentyrian-data.hash
index 9a7079c4ae..26e5db1d2b 100644
--- a/package/opentyrian-data/opentyrian-data.hash
+++ b/package/opentyrian-data/opentyrian-data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277 tyrian21.zip
+sha256  7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277  tyrian21.zip
diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index 1b87458f53..1f66695dad 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86  opus-tools-0.2.tar.gz
+sha256  b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86  opus-tools-0.2.tar.gz
 
 # Hash for license file
-sha256 c28016e58544119d6b93aea28297d040f17dcef7a9f548d3e6a4d0b558c5d248  COPYING
+sha256  c28016e58544119d6b93aea28297d040f17dcef7a9f548d3e6a4d0b558c5d248  COPYING
diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 2a94d3723d..2365e47c7d 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d  opus-1.3.1.tar.gz
+sha256  65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d  opus-1.3.1.tar.gz
 
 # Hash for license file
-sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
+sha256  8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
diff --git a/package/oracle-mysql/oracle-mysql.hash b/package/oracle-mysql/oracle-mysql.hash
index 9d1c86854f..c4ce39437e 100644
--- a/package/oracle-mysql/oracle-mysql.hash
+++ b/package/oracle-mysql/oracle-mysql.hash
@@ -1,5 +1,5 @@
 # From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
-md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
+md5  887f869bcc757957067b9198f707f32f  mysql-5.1.73.tar.gz
 # Locally computed
 sha256  05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5  mysql-5.1.73.tar.gz
 sha256  cbf0dbf56528a629f4358a1339f981202f1a9a0d9542c092b03f486064ced2db  README
diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
index eb427b63bb..8f425417aa 100644
--- a/package/orbit/orbit.hash
+++ b/package/orbit/orbit.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
-sha256 dd7d37caed0f4ee994e9e64ea4ab292dce549bb609412c84fc47ed079275ae98  orbit/doc/us/license.html
-sha256 140134369c1f041abf7d8cd39a5b0c42f8b5e827695ce7c1ef5ca8f0911a0246  orbit/doc/us/license.md
+sha256  91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
+sha256  dd7d37caed0f4ee994e9e64ea4ab292dce549bb609412c84fc47ed079275ae98  orbit/doc/us/license.html
+sha256  140134369c1f041abf7d8cd39a5b0c42f8b5e827695ce7c1ef5ca8f0911a0246  orbit/doc/us/license.md
diff --git a/package/pamtester/pamtester.hash b/package/pamtester/pamtester.hash
index 17497e3159..72a3fabffa 100644
--- a/package/pamtester/pamtester.hash
+++ b/package/pamtester/pamtester.hash
@@ -1,3 +1,3 @@
 # from https://sourceforge.net/projects/pamtester/files/pamtester/0.1.2/
-sha1   33bcc610d7f208b50a0a23c144bdbd1e2cae4ac6  pamtester-0.1.2.tar.gz
-sha256 1e3922a8ab0907c1f3bcc3e00005ef88930e50d0890f40a6a39f5f83b05f05cc LICENSE
+sha1  33bcc610d7f208b50a0a23c144bdbd1e2cae4ac6  pamtester-0.1.2.tar.gz
+sha256  1e3922a8ab0907c1f3bcc3e00005ef88930e50d0890f40a6a39f5f83b05f05cc  LICENSE
diff --git a/package/patch/patch.hash b/package/patch/patch.hash
index 917d951a94..f43400ea71 100644
--- a/package/patch/patch.hash
+++ b/package/patch/patch.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd	patch-2.7.6.tar.xz
+sha256  ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd  patch-2.7.6.tar.xz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
index de33cfb17b..429302bfad 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a0cdfcd875cb2ee4dc9a2c24381eb55b Apache-LogFormat-Compiler-0.36.tar.gz
-sha256 94509503ee74ea820183d070c11630ee5bc0fd8c12cb74fae953ed62e4a1ac17 Apache-LogFormat-Compiler-0.36.tar.gz
+md5  a0cdfcd875cb2ee4dc9a2c24381eb55b  Apache-LogFormat-Compiler-0.36.tar.gz
+sha256  94509503ee74ea820183d070c11630ee5bc0fd8c12cb74fae953ed62e4a1ac17  Apache-LogFormat-Compiler-0.36.tar.gz
 
 # computed by scancpan
-sha256 ab941cfc4794afa2113795b167177d1b25cbc77ebadd016e5727effc2cadd96b LICENSE
+sha256  ab941cfc4794afa2113795b167177d1b25cbc77ebadd016e5727effc2cadd96b  LICENSE
diff --git a/package/perl-appconfig/perl-appconfig.hash b/package/perl-appconfig/perl-appconfig.hash
index 151a2e903f..0f0cf2f22a 100644
--- a/package/perl-appconfig/perl-appconfig.hash
+++ b/package/perl-appconfig/perl-appconfig.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7747d9241561ed5567d5e134b8648707 AppConfig-1.71.tar.gz
-sha256 1177027025ecb09ee64d9f9f255615c04db5e14f7536c344af632032eb887b0f AppConfig-1.71.tar.gz
+md5  7747d9241561ed5567d5e134b8648707  AppConfig-1.71.tar.gz
+sha256  1177027025ecb09ee64d9f9f255615c04db5e14f7536c344af632032eb887b0f  AppConfig-1.71.tar.gz
 
 # computed by scancpan
-sha256 0b22dd532e4123a511d14989c4169ed56b7316cf844c29c7897a1638a4616868 LICENSE
+sha256  0b22dd532e4123a511d14989c4169ed56b7316cf844c29c7897a1638a4616868  LICENSE
diff --git a/package/perl-astro-suntime/perl-astro-suntime.hash b/package/perl-astro-suntime/perl-astro-suntime.hash
index e75293d4fb..05a7af2350 100644
--- a/package/perl-astro-suntime/perl-astro-suntime.hash
+++ b/package/perl-astro-suntime/perl-astro-suntime.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    42cb8c94de8a111ed652196925c22a45 Astro-SunTime-0.06.tar.gz
-sha256 b4a44fddfc055cc42ee67bfd8939354793da7512ea04f30578d42dc6a701112a Astro-SunTime-0.06.tar.gz
+md5  42cb8c94de8a111ed652196925c22a45  Astro-SunTime-0.06.tar.gz
+sha256  b4a44fddfc055cc42ee67bfd8939354793da7512ea04f30578d42dc6a701112a  Astro-SunTime-0.06.tar.gz
 
 # computed by scancpan
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/perl-class-inspector/perl-class-inspector.hash b/package/perl-class-inspector/perl-class-inspector.hash
index ee7a95bfad..3ec20d2098 100644
--- a/package/perl-class-inspector/perl-class-inspector.hash
+++ b/package/perl-class-inspector/perl-class-inspector.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    084c3aeec023639d21ecbaf7d4460b21 Class-Inspector-1.36.tar.gz
-sha256 cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e Class-Inspector-1.36.tar.gz
+md5  084c3aeec023639d21ecbaf7d4460b21  Class-Inspector-1.36.tar.gz
+sha256  cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e  Class-Inspector-1.36.tar.gz
 
 # computed by scancpan
-sha256 401fe9c98bdb5707df71447fb93141f8cb2d85337d45505f5ae50a776a3f6666 LICENSE
+sha256  401fe9c98bdb5707df71447fb93141f8cb2d85337d45505f5ae50a776a3f6666  LICENSE
diff --git a/package/perl-class-load/perl-class-load.hash b/package/perl-class-load/perl-class-load.hash
index c2900d6964..88dc5c8419 100644
--- a/package/perl-class-load/perl-class-load.hash
+++ b/package/perl-class-load/perl-class-load.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e4c831c08df592ce8dfee0c7cfc12fd7 Class-Load-0.25.tar.gz
-sha256 2a48fa779b5297e56156380e8b32637c6c58decb4f4a7f3c7350523e11275f8f Class-Load-0.25.tar.gz
+md5  e4c831c08df592ce8dfee0c7cfc12fd7  Class-Load-0.25.tar.gz
+sha256  2a48fa779b5297e56156380e8b32637c6c58decb4f4a7f3c7350523e11275f8f  Class-Load-0.25.tar.gz
 
 # computed by scancpan
-sha256 dc030e63f20035291b90d09c2c40f296224e85878caf829ea981fc2f10910f9d LICENSE
+sha256  dc030e63f20035291b90d09c2c40f296224e85878caf829ea981fc2f10910f9d  LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
index 82bf91f74c..ee0f5ec32c 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b1398e3682aa2e075b913b9f9000b596 Class-Method-Modifiers-2.13.tar.gz
-sha256 ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63 Class-Method-Modifiers-2.13.tar.gz
+md5  b1398e3682aa2e075b913b9f9000b596  Class-Method-Modifiers-2.13.tar.gz
+sha256  ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63  Class-Method-Modifiers-2.13.tar.gz
 
 # computed by scancpan
-sha256 d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561 LICENSE
+sha256  d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561  LICENSE
diff --git a/package/perl-class-std-fast/perl-class-std-fast.hash b/package/perl-class-std-fast/perl-class-std-fast.hash
index 07e830a5ee..36d6e21cb9 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.hash
+++ b/package/perl-class-std-fast/perl-class-std-fast.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d06d084cb84f295b0aabf2eee78ef746 Class-Std-Fast-v0.0.8.tar.gz
-sha256 1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780 Class-Std-Fast-v0.0.8.tar.gz
+md5  d06d084cb84f295b0aabf2eee78ef746  Class-Std-Fast-v0.0.8.tar.gz
+sha256  1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780  Class-Std-Fast-v0.0.8.tar.gz
 
 # computed by scancpan
-sha256 aa1ab90c498aee078076e9a1f83e5f14bbfd841509582795ab5a9571428c0c38 README
+sha256  aa1ab90c498aee078076e9a1f83e5f14bbfd841509582795ab5a9571428c0c38  README
diff --git a/package/perl-class-std/perl-class-std.hash b/package/perl-class-std/perl-class-std.hash
index 0cc3861416..eaa8705c53 100644
--- a/package/perl-class-std/perl-class-std.hash
+++ b/package/perl-class-std/perl-class-std.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    82bcc56d9769edce671b0bd0e183ec3a Class-Std-0.013.tar.gz
-sha256 bcd6d82f6c8af0fe069fced7dd165a4795b0b6e92351c7d4e5a1ab9a14fc35c6 Class-Std-0.013.tar.gz
+md5  82bcc56d9769edce671b0bd0e183ec3a  Class-Std-0.013.tar.gz
+sha256  bcd6d82f6c8af0fe069fced7dd165a4795b0b6e92351c7d4e5a1ab9a14fc35c6  Class-Std-0.013.tar.gz
 
 # computed by scancpan
-sha256 b8175bf3750dc54096bf1506c681b4f13262e5b82e40244e9a77730c6b72e4d6 README
+sha256  b8175bf3750dc54096bf1506c681b4f13262e5b82e40244e9a77730c6b72e4d6  README
diff --git a/package/perl-cookie-baker/perl-cookie-baker.hash b/package/perl-cookie-baker/perl-cookie-baker.hash
index 3b056c46c8..cc2a84b146 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.hash
+++ b/package/perl-cookie-baker/perl-cookie-baker.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bc8f95893d6ec3093a62d1957e1908f2 Cookie-Baker-0.11.tar.gz
-sha256 59275f474e07c0aa3611e3e684b894e7db913333d8214420be63f12ec18cd7ab Cookie-Baker-0.11.tar.gz
+md5  bc8f95893d6ec3093a62d1957e1908f2  Cookie-Baker-0.11.tar.gz
+sha256  59275f474e07c0aa3611e3e684b894e7db913333d8214420be63f12ec18cd7ab  Cookie-Baker-0.11.tar.gz
 
 # computed by scancpan
-sha256 b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c LICENSE
+sha256  b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c  LICENSE
diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.hash b/package/perl-crypt-blowfish/perl-crypt-blowfish.hash
index f814cb9bd5..6199037ae8 100644
--- a/package/perl-crypt-blowfish/perl-crypt-blowfish.hash
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    792b43cd4e49d2c2cf4a9f6990ff7d1b Crypt-Blowfish-2.14.tar.gz
-sha256 46b3431ffb6bf5b9cb359f79565d48407e652ad2b04fdf5ca62a69e7197a67b1 Crypt-Blowfish-2.14.tar.gz
+md5  792b43cd4e49d2c2cf4a9f6990ff7d1b  Crypt-Blowfish-2.14.tar.gz
+sha256  46b3431ffb6bf5b9cb359f79565d48407e652ad2b04fdf5ca62a69e7197a67b1  Crypt-Blowfish-2.14.tar.gz
 
 # computed by scancpan
-sha256 d61437443e6912d03677874c7baef242f28119c2c5d8b92b0f3f3660200f98d4 COPYRIGHT
+sha256  d61437443e6912d03677874c7baef242f28119c2c5d8b92b0f3f3660200f98d4  COPYRIGHT
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.hash b/package/perl-crypt-cbc/perl-crypt-cbc.hash
index a54772a504..281db4cb74 100644
--- a/package/perl-crypt-cbc/perl-crypt-cbc.hash
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3db5117d60df67e3b400fe367e716be0 Crypt-CBC-2.33.tar.gz
-sha256 6a70de21b6cc7f2b100067e8e188db966e9a8001b5db6fa976e7cb5b294ae645 Crypt-CBC-2.33.tar.gz
+md5  3db5117d60df67e3b400fe367e716be0  Crypt-CBC-2.33.tar.gz
+sha256  6a70de21b6cc7f2b100067e8e188db966e9a8001b5db6fa976e7cb5b294ae645  Crypt-CBC-2.33.tar.gz
 
 # locally computed
-sha256 9548d0beb746167270df647aa97a3e47b957adb4ec103c2cfb8f54b0005f99c7 CBC.pm
+sha256  9548d0beb746167270df647aa97a3e47b957adb4ec103c2cfb8f54b0005f99c7  CBC.pm
diff --git a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
index 07064dfbbe..16602fb92e 100644
--- a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
+++ b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    269db65cbf580c3174471a2cbc9a9d95 Crypt-OpenSSL-AES-0.02.tar.gz
-sha256 b66fab514edf97fc32f58da257582704a210c2b35e297d5c31b7fa2ffd08e908 Crypt-OpenSSL-AES-0.02.tar.gz
+md5  269db65cbf580c3174471a2cbc9a9d95  Crypt-OpenSSL-AES-0.02.tar.gz
+sha256  b66fab514edf97fc32f58da257582704a210c2b35e297d5c31b7fa2ffd08e908  Crypt-OpenSSL-AES-0.02.tar.gz
 
 # computed by scancpan
-sha256 a60b8c187cc5d90f7a43adc6be3c127abaa4c739e1e7fdcff16be358533d037f README
+sha256  a60b8c187cc5d90f7a43adc6be3c127abaa4c739e1e7fdcff16be358533d037f  README
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
index 57677e3445..6c1344fb2a 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bcde8d5a822c91376deda3c4f0c75fbe Crypt-OpenSSL-Random-0.15.tar.gz
-sha256 f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4 Crypt-OpenSSL-Random-0.15.tar.gz
+md5  bcde8d5a822c91376deda3c4f0c75fbe  Crypt-OpenSSL-Random-0.15.tar.gz
+sha256  f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4  Crypt-OpenSSL-Random-0.15.tar.gz
 
 # computed by scancpan
-sha256 fdaba2134145d3e252c5930180b2bcb13b5367ad5a8713d6868f014cd25c496f LICENSE
+sha256  fdaba2134145d3e252c5930180b2bcb13b5367ad5a8713d6868f014cd25c496f  LICENSE
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.hash b/package/perl-datetime-tiny/perl-datetime-tiny.hash
index 62fe407d29..8dc0765751 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.hash
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5ac2924652edb0cf5fda7c9d52162b3f DateTime-Tiny-1.07.tar.gz
-sha256 83568a22838cb518fbeb9e060460ec7f59d5a0b0a1cc06562954c3674d7cf7e4 DateTime-Tiny-1.07.tar.gz
+md5  5ac2924652edb0cf5fda7c9d52162b3f  DateTime-Tiny-1.07.tar.gz
+sha256  83568a22838cb518fbeb9e060460ec7f59d5a0b0a1cc06562954c3674d7cf7e4  DateTime-Tiny-1.07.tar.gz
 
 # computed by scancpan
-sha256 21cda7a55a8d4b32a43c654f0d4d4a1587096b35bf2a93ea12a2e3a8c2c0b88f LICENSE
+sha256  21cda7a55a8d4b32a43c654f0d4d4a1587096b35bf2a93ea12a2e3a8c2c0b88f  LICENSE
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.hash b/package/perl-dbd-mysql/perl-dbd-mysql.hash
index 51de476095..995928fbae 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.hash
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bdf4f4d899b8af29ebd8ebfb7438d05f DBD-mysql-4.046.tar.gz
-sha256 6165652ec959d05b97f5413fa3dff014b78a44cf6de21ae87283b28378daf1f7 DBD-mysql-4.046.tar.gz
+md5  bdf4f4d899b8af29ebd8ebfb7438d05f  DBD-mysql-4.046.tar.gz
+sha256  6165652ec959d05b97f5413fa3dff014b78a44cf6de21ae87283b28378daf1f7  DBD-mysql-4.046.tar.gz
 
 # computed by scancpan
-sha256 7a9ba29702b957805cfa8aa63bca43175625824263232dbade0010d385ab888c LICENSE
+sha256  7a9ba29702b957805cfa8aa63bca43175625824263232dbade0010d385ab888c  LICENSE
diff --git a/package/perl-dbi/perl-dbi.hash b/package/perl-dbi/perl-dbi.hash
index 707accf011..757a4cc5a4 100644
--- a/package/perl-dbi/perl-dbi.hash
+++ b/package/perl-dbi/perl-dbi.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    352f80b1e23769c116082a90905d7398 DBI-1.643.tar.gz
-sha256 8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa DBI-1.643.tar.gz
+md5  352f80b1e23769c116082a90905d7398  DBI-1.643.tar.gz
+sha256  8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa  DBI-1.643.tar.gz
 
 # computed by scancpan
-sha256 33453c8b0d8d474a42669ac702a13c20f39c91a34b3df4e6ca778fc2f0f711c7 LICENSE
+sha256  33453c8b0d8d474a42669ac702a13c20f39c91a34b3df4e6ca778fc2f0f711c7  LICENSE
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
index b3cd6e32f1..727df4d24f 100644
--- a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
+++ b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    24221ba322cf2dc46a1fc99b53e2380b Devel-GlobalDestruction-0.14.tar.gz
-sha256 34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab Devel-GlobalDestruction-0.14.tar.gz
+md5  24221ba322cf2dc46a1fc99b53e2380b  Devel-GlobalDestruction-0.14.tar.gz
+sha256  34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab  Devel-GlobalDestruction-0.14.tar.gz
 
 # computed by scancpan
-sha256 f7adbd1db623233e220f9157521a620dbae4918ae7088845aa61e87b7f62bb23 README
+sha256  f7adbd1db623233e220f9157521a620dbae4918ae7088845aa61e87b7f62bb23  README
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
index 4f31c6a1e4..8a3e625f56 100644
--- a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4ec8bd92e4a765a7cabf402db9640412 Devel-StackTrace-AsHTML-0.15.tar.gz
-sha256 6283dbe2197e2f20009cc4b449997742169cdd951bfc44cbc6e62c2a962d3147 Devel-StackTrace-AsHTML-0.15.tar.gz
+md5  4ec8bd92e4a765a7cabf402db9640412  Devel-StackTrace-AsHTML-0.15.tar.gz
+sha256  6283dbe2197e2f20009cc4b449997742169cdd951bfc44cbc6e62c2a962d3147  Devel-StackTrace-AsHTML-0.15.tar.gz
 
 # computed by scancpan
-sha256 ffecf60c52b85d56c928f5eac889b5044243c3907b810ef640c9f02fbce567ac LICENSE
+sha256  ffecf60c52b85d56c928f5eac889b5044243c3907b810ef640c9f02fbce567ac  LICENSE
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
index 58923cc071..4e64ef1716 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a5b09f7be7f2b10b525a9740676906d8 Devel-StackTrace-2.04.tar.gz
-sha256 cd3c03ed547d3d42c61fa5814c98296139392e7971c092e09a431f2c9f5d6855 Devel-StackTrace-2.04.tar.gz
+md5  a5b09f7be7f2b10b525a9740676906d8  Devel-StackTrace-2.04.tar.gz
+sha256  cd3c03ed547d3d42c61fa5814c98296139392e7971c092e09a431f2c9f5d6855  Devel-StackTrace-2.04.tar.gz
 
 # computed by scancpan
-sha256 dbd3162d261db5b40cac4d85afba619ec6a196398003c57b85c2333e7ef4c393 LICENSE
+sha256  dbd3162d261db5b40cac4d85afba619ec6a196398003c57b85c2333e7ef4c393  LICENSE
diff --git a/package/perl-device-serialport/perl-device-serialport.hash b/package/perl-device-serialport/perl-device-serialport.hash
index 35ddc13d3f..305a5ec388 100644
--- a/package/perl-device-serialport/perl-device-serialport.hash
+++ b/package/perl-device-serialport/perl-device-serialport.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    82c698151f934eb28c65d1838cee7d9e Device-SerialPort-1.04.tar.gz
-sha256 d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7 Device-SerialPort-1.04.tar.gz
+md5  82c698151f934eb28c65d1838cee7d9e  Device-SerialPort-1.04.tar.gz
+sha256  d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7  Device-SerialPort-1.04.tar.gz
 
 # computed by scancpan
-sha256 59432e84eca65c10c4b627f8af0b00833685856b68242b816aea2a38283a124c README
+sha256  59432e84eca65c10c4b627f8af0b00833685856b68242b816aea2a38283a124c  README
diff --git a/package/perl-digest-sha1/perl-digest-sha1.hash b/package/perl-digest-sha1/perl-digest-sha1.hash
index bfc94a12a5..dc32ddcfdb 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.hash
+++ b/package/perl-digest-sha1/perl-digest-sha1.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bd22388f268434f2b24f64e28bf1aa35 Digest-SHA1-2.13.tar.gz
-sha256 68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc Digest-SHA1-2.13.tar.gz
+md5  bd22388f268434f2b24f64e28bf1aa35  Digest-SHA1-2.13.tar.gz
+sha256  68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc  Digest-SHA1-2.13.tar.gz
 
 # computed by scancpan
-sha256 805bee77fab9c72b0bfb452bb623b278f1767de62011e1814de2a6f6115439c8 README
+sha256  805bee77fab9c72b0bfb452bb623b278f1767de62011e1814de2a6f6115439c8  README
diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
index 5605fed4ae..15074e0a27 100644
--- a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
+++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c8725a92b9169708b0f63036812070f2 Dist-CheckConflicts-0.11.tar.gz
-sha256 ea844b9686c94d666d9d444321d764490b2cde2f985c4165b4c2c77665caedc4 Dist-CheckConflicts-0.11.tar.gz
+md5  c8725a92b9169708b0f63036812070f2  Dist-CheckConflicts-0.11.tar.gz
+sha256  ea844b9686c94d666d9d444321d764490b2cde2f985c4165b4c2c77665caedc4  Dist-CheckConflicts-0.11.tar.gz
 
 # computed by scancpan
-sha256 b4e0637ed96008ddcbf7e0ddeb73967df3d0b4dc62a6b7fdb86eac37018cb12e LICENSE
+sha256  b4e0637ed96008ddcbf7e0ddeb73967df3d0b4dc62a6b7fdb86eac37018cb12e  LICENSE
diff --git a/package/perl-encode-detect/perl-encode-detect.hash b/package/perl-encode-detect/perl-encode-detect.hash
index 1893f1db94..a478f62d38 100644
--- a/package/perl-encode-detect/perl-encode-detect.hash
+++ b/package/perl-encode-detect/perl-encode-detect.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ee9faf55d7105c97b02b8ebe590819c7 Encode-Detect-1.01.tar.gz
-sha256 834d893aa7db6ce3f158afbd0e432d6ed15a276e0940db0a74be13fd9c4bbbf1 Encode-Detect-1.01.tar.gz
+md5  ee9faf55d7105c97b02b8ebe590819c7  Encode-Detect-1.01.tar.gz
+sha256  834d893aa7db6ce3f158afbd0e432d6ed15a276e0940db0a74be13fd9c4bbbf1  Encode-Detect-1.01.tar.gz
 
 # computed by scancpan
-sha256 53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f LICENSE
+sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  LICENSE
diff --git a/package/perl-encode-locale/perl-encode-locale.hash b/package/perl-encode-locale/perl-encode-locale.hash
index 258eb295a7..844274242a 100644
--- a/package/perl-encode-locale/perl-encode-locale.hash
+++ b/package/perl-encode-locale/perl-encode-locale.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    fcfdb8e4ee34bcf62aed429b4a23db27 Encode-Locale-1.05.tar.gz
-sha256 176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1 Encode-Locale-1.05.tar.gz
+md5  fcfdb8e4ee34bcf62aed429b4a23db27  Encode-Locale-1.05.tar.gz
+sha256  176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1  Encode-Locale-1.05.tar.gz
 
 # computed by scancpan
-sha256 edfeacafbed5a0f2c4a2a3db3fb0274a7f210768d01c853c60b7feac841c83c8 README
+sha256  edfeacafbed5a0f2c4a2a3db3fb0274a7f210768d01c853c60b7feac841c83c8  README
diff --git a/package/perl-extutils-config/perl-extutils-config.hash b/package/perl-extutils-config/perl-extutils-config.hash
index 518de84188..f4a4b18fc6 100644
--- a/package/perl-extutils-config/perl-extutils-config.hash
+++ b/package/perl-extutils-config/perl-extutils-config.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    565a7b09c7cac5907a25bbe2c959a717 ExtUtils-Config-0.008.tar.gz
-sha256 ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c ExtUtils-Config-0.008.tar.gz
+md5  565a7b09c7cac5907a25bbe2c959a717  ExtUtils-Config-0.008.tar.gz
+sha256  ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c  ExtUtils-Config-0.008.tar.gz
 
 # computed by scancpan
-sha256 33b39fda54675d4d681764049e27b537cac12213aa6650667abea43662264ddc LICENSE
+sha256  33b39fda54675d4d681764049e27b537cac12213aa6650667abea43662264ddc  LICENSE
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.hash b/package/perl-extutils-helpers/perl-extutils-helpers.hash
index 2d291901e6..3f80a96e6d 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.hash
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    83b00c1e401321c425ae5db6b2b2fd12 ExtUtils-Helpers-0.026.tar.gz
-sha256 de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416 ExtUtils-Helpers-0.026.tar.gz
+md5  83b00c1e401321c425ae5db6b2b2fd12  ExtUtils-Helpers-0.026.tar.gz
+sha256  de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416  ExtUtils-Helpers-0.026.tar.gz
 
 # computed by scancpan
-sha256 e5530d0ebc8662df3a970644d867faf12760b1a95ca6e2bf1c5f9af410a418e0 LICENSE
+sha256  e5530d0ebc8662df3a970644d867faf12760b1a95ca6e2bf1c5f9af410a418e0  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 2627a27d50..199706044c 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9a8d66aab1ffec98ea260faf03ac612b ExtUtils-InstallPaths-0.012.tar.gz
-sha256 84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed ExtUtils-InstallPaths-0.012.tar.gz
+md5  9a8d66aab1ffec98ea260faf03ac612b  ExtUtils-InstallPaths-0.012.tar.gz
+sha256  84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed  ExtUtils-InstallPaths-0.012.tar.gz
 
 # computed by scancpan
-sha256 b95d38ac031587625625d92fbd2ee1d5df0d02606057d680e7dcf3598fe629f9 LICENSE
+sha256  b95d38ac031587625625d92fbd2ee1d5df0d02606057d680e7dcf3598fe629f9  LICENSE
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
index abbab34e98..b462d8e683 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5eabd44a5d7d84bf2e8e502491226287 File-ShareDir-Install-0.13.tar.gz
-sha256 45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9 File-ShareDir-Install-0.13.tar.gz
+md5  5eabd44a5d7d84bf2e8e502491226287  File-ShareDir-Install-0.13.tar.gz
+sha256  45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9  File-ShareDir-Install-0.13.tar.gz
 
 # computed by scancpan
-sha256 c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c LICENSE
+sha256  c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c  LICENSE
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
index 87d365d6c6..eb4a53bf81 100644
--- a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4a3ca3098b2455346fe24a66c94d2151 Filesys-Notify-Simple-0.14.tar.gz
-sha256 1fda712d4ba5e1868159ed35f6f8efbfae9d435d6376f5606d533bcb080555a4 Filesys-Notify-Simple-0.14.tar.gz
+md5  4a3ca3098b2455346fe24a66c94d2151  Filesys-Notify-Simple-0.14.tar.gz
+sha256  1fda712d4ba5e1868159ed35f6f8efbfae9d435d6376f5606d533bcb080555a4  Filesys-Notify-Simple-0.14.tar.gz
 
 # computed by scancpan
-sha256 9a5cceb9fdb0064b57eeca0e7ad2af1e57eff51320a13083fc22930d2a190ed7 LICENSE
+sha256  9a5cceb9fdb0064b57eeca0e7ad2af1e57eff51320a13083fc22930d2a190ed7  LICENSE
diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index c0b195eb2a..b2ad4ecc30 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    38c6a188519e6272e9b2b722b315c3d8 GDGraph-1.54.tar.gz
-sha256 b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f GDGraph-1.54.tar.gz
+md5  38c6a188519e6272e9b2b722b315c3d8  GDGraph-1.54.tar.gz
+sha256  b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f  GDGraph-1.54.tar.gz
 
 # Hash for license files
-sha256 710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd Dustismo.LICENSE
-sha256 f44630ad9101e40a101d906a07908c975a9b0742273cfb0c00a51d73afb53e7d README
+sha256  710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd  Dustismo.LICENSE
+sha256  f44630ad9101e40a101d906a07908c975a9b0742273cfb0c00a51d73afb53e7d  README
diff --git a/package/perl-gdtextutil/perl-gdtextutil.hash b/package/perl-gdtextutil/perl-gdtextutil.hash
index add0717f1d..7f336038a8 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.hash
+++ b/package/perl-gdtextutil/perl-gdtextutil.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    941ad06eadc86b47f3a32da405665c41 GDTextUtil-0.86.tar.gz
-sha256 886ecbf85cfe94f4135ee5689c4847a9ae783ecb99e6759e12c734f2dd6116bc GDTextUtil-0.86.tar.gz
+md5  941ad06eadc86b47f3a32da405665c41  GDTextUtil-0.86.tar.gz
+sha256  886ecbf85cfe94f4135ee5689c4847a9ae783ecb99e6759e12c734f2dd6116bc  GDTextUtil-0.86.tar.gz
 
 # Hash for license files
-sha256 710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd Dustismo.LICENSE
-sha256 93ca7dd7f372c79e8ec1f849f2a418a67d195e4027c1b3e3dd8444fb30f3e97c README
+sha256  710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd  Dustismo.LICENSE
+sha256  93ca7dd7f372c79e8ec1f849f2a418a67d195e4027c1b3e3dd8444fb30f3e97c  README
diff --git a/package/perl-hash-multivalue/perl-hash-multivalue.hash b/package/perl-hash-multivalue/perl-hash-multivalue.hash
index 3a68650697..a592250743 100644
--- a/package/perl-hash-multivalue/perl-hash-multivalue.hash
+++ b/package/perl-hash-multivalue/perl-hash-multivalue.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    508015312eb08cd2bcea987c4efbb93d Hash-MultiValue-0.16.tar.gz
-sha256 66181df7aa68e2786faf6895c88b18b95c800a8e4e6fb4c07fd176410a3c73f4 Hash-MultiValue-0.16.tar.gz
+md5  508015312eb08cd2bcea987c4efbb93d  Hash-MultiValue-0.16.tar.gz
+sha256  66181df7aa68e2786faf6895c88b18b95c800a8e4e6fb4c07fd176410a3c73f4  Hash-MultiValue-0.16.tar.gz
 
 # computed by scancpan
-sha256 af32512e13f6722dab770b989c57556a5e3d29a49b22b8ad5668064db8592401 LICENSE
+sha256  af32512e13f6722dab770b989c57556a5e3d29a49b22b8ad5668064db8592401  LICENSE
diff --git a/package/perl-html-tagset/perl-html-tagset.hash b/package/perl-html-tagset/perl-html-tagset.hash
index 9569ece662..648f75f649 100644
--- a/package/perl-html-tagset/perl-html-tagset.hash
+++ b/package/perl-html-tagset/perl-html-tagset.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d2bfa18fe1904df7f683e96611e87437 HTML-Tagset-3.20.tar.gz
-sha256 adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2 HTML-Tagset-3.20.tar.gz
+md5  d2bfa18fe1904df7f683e96611e87437  HTML-Tagset-3.20.tar.gz
+sha256  adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2  HTML-Tagset-3.20.tar.gz
 
 # computed by scancpan
-sha256 275cc182d78ac2db6856442c5d334c925350fb56fe83ee3577f5850317423419 README
+sha256  275cc182d78ac2db6856442c5d334c925350fb56fe83ee3577f5850317423419  README
diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index 7c1fa5b9c3..b278423002 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    2ecbb3aedf6aef062605191813ca3027 HTTP-Date-6.05.tar.gz
-sha256 365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b HTTP-Date-6.05.tar.gz
+md5  2ecbb3aedf6aef062605191813ca3027  HTTP-Date-6.05.tar.gz
+sha256  365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b  HTTP-Date-6.05.tar.gz
 
 # computed by scancpan
-sha256 305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e LICENSE
+sha256  305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e  LICENSE
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.hash b/package/perl-http-headers-fast/perl-http-headers-fast.hash
index 9282f2ef1a..484067f43c 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.hash
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a166a4d0ba47eca8ff9dffb760865f5f HTTP-Headers-Fast-0.22.tar.gz
-sha256 cc431db68496dd884db4bc0c0b7112c1f4a4f1dc68c4f5a3caa757a1e7481b48 HTTP-Headers-Fast-0.22.tar.gz
+md5  a166a4d0ba47eca8ff9dffb760865f5f  HTTP-Headers-Fast-0.22.tar.gz
+sha256  cc431db68496dd884db4bc0c0b7112c1f4a4f1dc68c4f5a3caa757a1e7481b48  HTTP-Headers-Fast-0.22.tar.gz
 
 # computed by scancpan
-sha256 511724425acf76d736145cfbf7c775b024c70ae8674ebf9a24dfda2c8e4032a3 LICENSE
+sha256  511724425acf76d736145cfbf7c775b024c70ae8674ebf9a24dfda2c8e4032a3  LICENSE
diff --git a/package/perl-http-multipartparser/perl-http-multipartparser.hash b/package/perl-http-multipartparser/perl-http-multipartparser.hash
index 079c02f60b..8d0cf39b4d 100644
--- a/package/perl-http-multipartparser/perl-http-multipartparser.hash
+++ b/package/perl-http-multipartparser/perl-http-multipartparser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1b07ebac54ce3288c044a23ba60196d2 HTTP-MultiPartParser-0.02.tar.gz
-sha256 5eddda159f54d16f868e032440ac2b024e55aac48931871b62627f1a16d00b12 HTTP-MultiPartParser-0.02.tar.gz
+md5  1b07ebac54ce3288c044a23ba60196d2  HTTP-MultiPartParser-0.02.tar.gz
+sha256  5eddda159f54d16f868e032440ac2b024e55aac48931871b62627f1a16d00b12  HTTP-MultiPartParser-0.02.tar.gz
 
 # computed by scancpan
-sha256 a339d6cf9253720ba69b311423556cc02c94d5a6f76cf5cdf11af2112e14a074 README
+sha256  a339d6cf9253720ba69b311423556cc02c94d5a6f76cf5cdf11af2112e14a074  README
diff --git a/package/perl-http-negotiate/perl-http-negotiate.hash b/package/perl-http-negotiate/perl-http-negotiate.hash
index e561496f26..9b2cf308e0 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.hash
+++ b/package/perl-http-negotiate/perl-http-negotiate.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1236195250e264d7436e7bb02031671b HTTP-Negotiate-6.01.tar.gz
-sha256 1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016 HTTP-Negotiate-6.01.tar.gz
+md5  1236195250e264d7436e7bb02031671b  HTTP-Negotiate-6.01.tar.gz
+sha256  1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016  HTTP-Negotiate-6.01.tar.gz
 
 # computed by scancpan
-sha256 7a2114bb46279309f8a67e359ab0a578a4e9a7c7add0d1725de46b44f6da6514 README
+sha256  7a2114bb46279309f8a67e359ab0a578a4e9a7c7add0d1725de46b44f6da6514  README
diff --git a/package/perl-i18n/perl-i18n.hash b/package/perl-i18n/perl-i18n.hash
index f6ef8931a2..3e2b59378f 100644
--- a/package/perl-i18n/perl-i18n.hash
+++ b/package/perl-i18n/perl-i18n.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4c3004474d6ff3554f82b52f92b3b1e1 i18n-0.13.tar.gz
-sha256 2dbc3e4e25b41578cd83508fe011209e8f3c2b259fa4b5b6eafaac0d6ce4b457 i18n-0.13.tar.gz
+md5  4c3004474d6ff3554f82b52f92b3b1e1  i18n-0.13.tar.gz
+sha256  2dbc3e4e25b41578cd83508fe011209e8f3c2b259fa4b5b6eafaac0d6ce4b457  i18n-0.13.tar.gz
 
 # computed by scancpan
-sha256 4755e5f2096e8ef0494f1565bf5a028a8fb4eeb5c1250e7d30948d1ed13c5ad7 README
+sha256  4755e5f2096e8ef0494f1565bf5a028a8fb4eeb5c1250e7d30948d1ed13c5ad7  README
diff --git a/package/perl-io-interface/perl-io-interface.hash b/package/perl-io-interface/perl-io-interface.hash
index 75e572f918..b5d990860f 100644
--- a/package/perl-io-interface/perl-io-interface.hash
+++ b/package/perl-io-interface/perl-io-interface.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    806f97aff5a7361b6f54cd494f4cc9fd IO-Interface-1.09.tar.gz
-sha256 e63e81c52eb1e0e60ec2d983f5552d2493e117179925c96757f23c4bd9fa713a IO-Interface-1.09.tar.gz
+md5  806f97aff5a7361b6f54cd494f4cc9fd  IO-Interface-1.09.tar.gz
+sha256  e63e81c52eb1e0e60ec2d983f5552d2493e117179925c96757f23c4bd9fa713a  IO-Interface-1.09.tar.gz
 
 # computed by scancpan
-sha256 b5a5bf59bd1be13f7f498e5aa2ea5c0c603c04a095dcf03a06aa5b83bbccf921 LICENSE
+sha256  b5a5bf59bd1be13f7f498e5aa2ea5c0c603c04a095dcf03a06aa5b83bbccf921  LICENSE
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.hash b/package/perl-io-socket-multicast/perl-io-socket-multicast.hash
index c12da12c41..a8f2a33693 100644
--- a/package/perl-io-socket-multicast/perl-io-socket-multicast.hash
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c96e6cbb367b1d11ffe7bb9fbd833540 IO-Socket-Multicast-1.12.tar.gz
-sha256 70e8af4aa21d19bab5edd9f43a6b3d6277748a65145d46ff0ea2ae4c59495c72 IO-Socket-Multicast-1.12.tar.gz
+md5  c96e6cbb367b1d11ffe7bb9fbd833540  IO-Socket-Multicast-1.12.tar.gz
+sha256  70e8af4aa21d19bab5edd9f43a6b3d6277748a65145d46ff0ea2ae4c59495c72  IO-Socket-Multicast-1.12.tar.gz
 
 # computed by scancpan
-sha256 ea33bda0e2ec6734e29895a37cd1fc005d86f2abbe7e9943e0213ae64844a697 README
+sha256  ea33bda0e2ec6734e29895a37cd1fc005d86f2abbe7e9943e0213ae64844a697  README
diff --git a/package/perl-json-tiny/perl-json-tiny.hash b/package/perl-json-tiny/perl-json-tiny.hash
index 48fae2b0cd..ba7c5b3b57 100644
--- a/package/perl-json-tiny/perl-json-tiny.hash
+++ b/package/perl-json-tiny/perl-json-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    aa006882222e17a94295b3a655aab91b JSON-Tiny-0.58.tar.gz
-sha256 ad42e9137f5148df7fdb22aa52186b306032977bcd70d49f44a288070e4f0f23 JSON-Tiny-0.58.tar.gz
+md5  aa006882222e17a94295b3a655aab91b  JSON-Tiny-0.58.tar.gz
+sha256  ad42e9137f5148df7fdb22aa52186b306032977bcd70d49f44a288070e4f0f23  JSON-Tiny-0.58.tar.gz
 
 # computed by scancpan
-sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
+sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
index 683e8c7d16..fbbf3355b3 100644
--- a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
+++ b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    51acf0cb00cc01a2c8f560d74dd6c593 Locale-Maketext-Lexicon-1.00.tar.gz
-sha256 b73f6b04a58d3f0e38ebf2115a4c1532f1a4eef6fac5c6a2a449e4e14c1ddc7c Locale-Maketext-Lexicon-1.00.tar.gz
+md5  51acf0cb00cc01a2c8f560d74dd6c593  Locale-Maketext-Lexicon-1.00.tar.gz
+sha256  b73f6b04a58d3f0e38ebf2115a4c1532f1a4eef6fac5c6a2a449e4e14c1ddc7c  Locale-Maketext-Lexicon-1.00.tar.gz
 
 # computed by scancpan
-sha256 af693c8c99bee68656f09328c97d50b24eb742ae4473f57cdafaa90691807fbe LICENSE
+sha256  af693c8c99bee68656f09328c97d50b24eb742ae4473f57cdafaa90691807fbe  LICENSE
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
index e125c0d578..0a09f22ad7 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    84b799a90c0d2ce52897a7cb4c0478d0 LWP-MediaTypes-6.04.tar.gz
-sha256 8f1bca12dab16a1c2a7c03a49c5e58cce41a6fec9519f0aadfba8dad997919d9 LWP-MediaTypes-6.04.tar.gz
+md5  84b799a90c0d2ce52897a7cb4c0478d0  LWP-MediaTypes-6.04.tar.gz
+sha256  8f1bca12dab16a1c2a7c03a49c5e58cce41a6fec9519f0aadfba8dad997919d9  LWP-MediaTypes-6.04.tar.gz
 
 # computed by scancpan
-sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
+sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index bf8b17a5b9..317e020ac2 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    69ee516d40011e7e92b77c6f06c0dc01 MailTools-2.21.tar.gz
-sha256 4ad9bd6826b6f03a2727332466b1b7d29890c8d99a32b4b3b0a8d926ee1a44cb MailTools-2.21.tar.gz
+md5  69ee516d40011e7e92b77c6f06c0dc01  MailTools-2.21.tar.gz
+sha256  4ad9bd6826b6f03a2727332466b1b7d29890c8d99a32b4b3b0a8d926ee1a44cb  MailTools-2.21.tar.gz
 
 # computed by scancpan
-sha256 f7558badc4f4875df247bcccb50a8f369bfe4a2c19361f1df7b26ddf6aaaaf6b README
+sha256  f7558badc4f4875df247bcccb50a8f369bfe4a2c19361f1df7b26ddf6aaaaf6b  README
diff --git a/package/perl-math-prime-util/perl-math-prime-util.hash b/package/perl-math-prime-util/perl-math-prime-util.hash
index 789f3a35fc..e28cfe542b 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.hash
+++ b/package/perl-math-prime-util/perl-math-prime-util.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    26496630990db586dfede6551de79cbe Math-Prime-Util-0.73.tar.gz
-sha256 4afa6dd8cdb97499bd4eca6925861812c29d9f5a0f1ac27ad9d2d9c9b5602894 Math-Prime-Util-0.73.tar.gz
+md5  26496630990db586dfede6551de79cbe  Math-Prime-Util-0.73.tar.gz
+sha256  4afa6dd8cdb97499bd4eca6925861812c29d9f5a0f1ac27ad9d2d9c9b5602894  Math-Prime-Util-0.73.tar.gz
 
 # computed by scancpan
-sha256 475b5f12062de0e197fb8cfa44eef3b032342d097752868e72c1239fe52a8942 LICENSE
+sha256  475b5f12062de0e197fb8cfa44eef3b032342d097752868e72c1239fe52a8942  LICENSE
diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
index c6d01afe38..52b6706ff6 100644
--- a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    eccf42cc7e9576dd23b9f39ad59c9b62 MIME-Base64-URLSafe-0.01.tar.gz
-sha256 cb9966c50538bb676ab67bc40a7c841019b23ba2243d0ffcc2ccf084e5c33798 MIME-Base64-URLSafe-0.01.tar.gz
+md5  eccf42cc7e9576dd23b9f39ad59c9b62  MIME-Base64-URLSafe-0.01.tar.gz
+sha256  cb9966c50538bb676ab67bc40a7c841019b23ba2243d0ffcc2ccf084e5c33798  MIME-Base64-URLSafe-0.01.tar.gz
 
 # computed by scancpan
-sha256 2fffac76f75709b6d94111a37f6cd8cab21e8f2b2de73b0b4fa53a5bed4efc15 README
+sha256  2fffac76f75709b6d94111a37f6cd8cab21e8f2b2de73b0b4fa53a5bed4efc15  README
diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
index 41e13eb0b2..f67fe61549 100644
--- a/package/perl-mime-tools/perl-mime-tools.hash
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a2f0e07da2ff4b0478908544cc4b40fa MIME-tools-5.509.tar.gz
-sha256 64579f0c923d81d9a2194586e47c3475519e2646e4b5c102a8920759facf6973 MIME-tools-5.509.tar.gz
+md5  a2f0e07da2ff4b0478908544cc4b40fa  MIME-tools-5.509.tar.gz
+sha256  64579f0c923d81d9a2194586e47c3475519e2646e4b5c102a8920759facf6973  MIME-tools-5.509.tar.gz
 
 # computed by scancpan
-sha256 151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93 COPYING
+sha256  151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93  COPYING
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 357c238dd3..7f03f96c18 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    2332c90c17454107fea3f2614e11a3a9 Module-Build-Tiny-0.039.tar.gz
-sha256 7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c Module-Build-Tiny-0.039.tar.gz
+md5  2332c90c17454107fea3f2614e11a3a9  Module-Build-Tiny-0.039.tar.gz
+sha256  7d580ff6ace0cbe555bf36b86dc8ea232581530cbeaaea09bccb57b55797f11c  Module-Build-Tiny-0.039.tar.gz
 
 # computed by scancpan
-sha256 09fd2bc0428920c455f10c5a6c52e2bb4615114e88966c75ce27a07af028c36b LICENSE
+sha256  09fd2bc0428920c455f10c5a6c52e2bb4615114e88966c75ce27a07af028c36b  LICENSE
diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index aad0b78e3d..09bc5f374a 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    066b193e461d7dfe1eca17a139353001 Module-Build-0.4231.tar.gz
-sha256 7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717 Module-Build-0.4231.tar.gz
+md5  066b193e461d7dfe1eca17a139353001  Module-Build-0.4231.tar.gz
+sha256  7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717  Module-Build-0.4231.tar.gz
 
 # computed by scancpan
-sha256 f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e LICENSE
+sha256  f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e  LICENSE
diff --git a/package/perl-module-implementation/perl-module-implementation.hash b/package/perl-module-implementation/perl-module-implementation.hash
index caf365c024..4e5ebd1dc3 100644
--- a/package/perl-module-implementation/perl-module-implementation.hash
+++ b/package/perl-module-implementation/perl-module-implementation.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    52e3fe0ca6b1eff0488d59b7aacc0667 Module-Implementation-0.09.tar.gz
-sha256 c15f1a12f0c2130c9efff3c2e1afe5887b08ccd033bd132186d1e7d5087fd66d Module-Implementation-0.09.tar.gz
+md5  52e3fe0ca6b1eff0488d59b7aacc0667  Module-Implementation-0.09.tar.gz
+sha256  c15f1a12f0c2130c9efff3c2e1afe5887b08ccd033bd132186d1e7d5087fd66d  Module-Implementation-0.09.tar.gz
 
 # computed by scancpan
-sha256 dd34e4dbcadfaa3db992201873e1cbb4b4f4c18e9bf000821d5c768e66d7ff0b LICENSE
+sha256  dd34e4dbcadfaa3db992201873e1cbb4b4f4c18e9bf000821d5c768e66d7ff0b  LICENSE
diff --git a/package/perl-module-runtime/perl-module-runtime.hash b/package/perl-module-runtime/perl-module-runtime.hash
index c52cb75504..c87963bfb0 100644
--- a/package/perl-module-runtime/perl-module-runtime.hash
+++ b/package/perl-module-runtime/perl-module-runtime.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d3d47222fa2e3dfcb4526f6cc8437b20 Module-Runtime-0.016.tar.gz
-sha256 68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024 Module-Runtime-0.016.tar.gz
+md5  d3d47222fa2e3dfcb4526f6cc8437b20  Module-Runtime-0.016.tar.gz
+sha256  68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024  Module-Runtime-0.016.tar.gz
 
 # computed by scancpan
-sha256 ad1761020436687e8493208336ef53e84589fdba212da59b05b8111cca75ddc1 README
+sha256  ad1761020436687e8493208336ef53e84589fdba212da59b05b8111cca75ddc1  README
diff --git a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
index d0f9dc3ab0..a0b0174fe7 100644
--- a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
+++ b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3d1b01c393e7ed576e4b503d26a88a3e Mojolicious-Plugin-CSPHeader-0.06.tar.gz
-sha256 0523a170af6620dab5b746725f171a138b6cff3d2d84e1a30af891741550f4a7 Mojolicious-Plugin-CSPHeader-0.06.tar.gz
+md5  3d1b01c393e7ed576e4b503d26a88a3e  Mojolicious-Plugin-CSPHeader-0.06.tar.gz
+sha256  0523a170af6620dab5b746725f171a138b6cff3d2d84e1a30af891741550f4a7  Mojolicious-Plugin-CSPHeader-0.06.tar.gz
 
 # computed by scancpan
-sha256 4bb36edd2bcafef11ca615f69607953a31ee05ae172b69990aee317e95653456 LICENSE
+sha256  4bb36edd2bcafef11ca615f69607953a31ee05ae172b69990aee317e95653456  LICENSE
diff --git a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
index ed4bc20748..93a23b010f 100644
--- a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
+++ b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4002f7a7da4c90973ad6eedfb0fcfa16 Mojolicious-Plugin-I18N-1.6.tar.gz
-sha256 32fb5ef8037d954b7ecebef5c1b2b24b420abd829702312f4ad42794f52b514d Mojolicious-Plugin-I18N-1.6.tar.gz
+md5  4002f7a7da4c90973ad6eedfb0fcfa16  Mojolicious-Plugin-I18N-1.6.tar.gz
+sha256  32fb5ef8037d954b7ecebef5c1b2b24b420abd829702312f4ad42794f52b514d  Mojolicious-Plugin-I18N-1.6.tar.gz
 
 # manually computed
-sha256 82b05028033057b388b0040a3b5590a1c51168fe3b9899bffdb5ef7962c4eb47 README.pod
+sha256  82b05028033057b388b0040a3b5590a1c51168fe3b9899bffdb5ef7962c4eb47  README.pod
diff --git a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
index b8a20bdd60..74dcd52284 100644
--- a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
+++ b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    38cf59258547ac866577db2d43632f30 Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
-sha256 940474eaf7a415e5117b004387862473612e079a413590db1eb9c85d17a6648f Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
+md5  38cf59258547ac866577db2d43632f30  Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
+sha256  940474eaf7a415e5117b004387862473612e079a413590db1eb9c85d17a6648f  Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
 
 # computed by scancpan
-sha256 0c38e4629cc9eee869217d62ad765e581e54958596672046a62dfa4cfd87bb09 LICENSE
+sha256  0c38e4629cc9eee869217d62ad765e581e54958596672046a62dfa4cfd87bb09  LICENSE
diff --git a/package/perl-net-snmp/perl-net-snmp.hash b/package/perl-net-snmp/perl-net-snmp.hash
index 0b162e6dcc..74d860d9fc 100644
--- a/package/perl-net-snmp/perl-net-snmp.hash
+++ b/package/perl-net-snmp/perl-net-snmp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6137f04f9942d703f66179f890e3d096 Net-SNMP-v6.0.1.tar.gz
-sha256 14c37bc1cbb3f3cdc7d6c13e0f27a859f14cdcfd5ea54a0467a88bc259b0b741 Net-SNMP-v6.0.1.tar.gz
+md5  6137f04f9942d703f66179f890e3d096  Net-SNMP-v6.0.1.tar.gz
+sha256  14c37bc1cbb3f3cdc7d6c13e0f27a859f14cdcfd5ea54a0467a88bc259b0b741  Net-SNMP-v6.0.1.tar.gz
 
 # computed by scancpan
-sha256 a038159be54a2807dc48e2b946514d59fceab6737d5461d93d55297a98e6e24e LICENSE
+sha256  a038159be54a2807dc48e2b946514d59fceab6737d5461d93d55297a98e6e24e  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 517b3c4da3..7502a60ad1 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d602bdce4e0531c6efc276e3e429ca69 Net-SSLeay-1.85.tar.gz
-sha256 9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8 Net-SSLeay-1.85.tar.gz
+md5  d602bdce4e0531c6efc276e3e429ca69  Net-SSLeay-1.85.tar.gz
+sha256  9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8  Net-SSLeay-1.85.tar.gz
 
 # computed by scancpan
-sha256 b55065185a2172d9f2ea2dd87c18c206ea3dc45a64e5f3deb3eee34d839dc822 LICENSE
+sha256  b55065185a2172d9f2ea2dd87c18c206ea3dc45a64e5f3deb3eee34d839dc822  LICENSE
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.hash b/package/perl-netaddr-ip/perl-netaddr-ip.hash
index ce0477d978..8912fc6ab9 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.hash
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    990dfcbffae356835c536e8ab56a2880 NetAddr-IP-4.079.tar.gz
-sha256 ec5a82dfb7028bcd28bb3d569f95d87dd4166cc19867f2184ed3a59f6d6ca0e7 NetAddr-IP-4.079.tar.gz
+md5  990dfcbffae356835c536e8ab56a2880  NetAddr-IP-4.079.tar.gz
+sha256  ec5a82dfb7028bcd28bb3d569f95d87dd4166cc19867f2184ed3a59f6d6ca0e7  NetAddr-IP-4.079.tar.gz
 
 # computed by scancpan
-sha256 b7fd9b73ea99602016a326e0b62e6646060d18febdd065ceca8bb482208c3d88 Artistic
-sha256 773a84089e32147cffef4c6fa127a14658c8c5866987d71d86f0fe22161780f4 Copying
+sha256  b7fd9b73ea99602016a326e0b62e6646060d18febdd065ceca8bb482208c3d88  Artistic
+sha256  773a84089e32147cffef4c6fa127a14658c8c5866987d71d86f0fe22161780f4  Copying
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.hash b/package/perl-number-bytes-human/perl-number-bytes-human.hash
index af7a6b65a1..55bbf8f8bc 100644
--- a/package/perl-number-bytes-human/perl-number-bytes-human.hash
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    43d2c86a55924aa71535a41de0311efd Number-Bytes-Human-0.11.tar.gz
-sha256 5fc79c49b0b40df780479c43696381343e2b6ad1fe52859f60bc65b66ebe6f2c Number-Bytes-Human-0.11.tar.gz
+md5  43d2c86a55924aa71535a41de0311efd  Number-Bytes-Human-0.11.tar.gz
+sha256  5fc79c49b0b40df780479c43696381343e2b6ad1fe52859f60bc65b66ebe6f2c  Number-Bytes-Human-0.11.tar.gz
 
 # computed by scancpan
-sha256 d42143fe4b63cb5d488d65a44e6c55769b098ea447462ff33316b33a837b7cf9 README
+sha256  d42143fe4b63cb5d488d65a44e6c55769b098ea447462ff33316b33a837b7cf9  README
diff --git a/package/perl-path-class/perl-path-class.hash b/package/perl-path-class/perl-path-class.hash
index d2741dfca4..96f8928fd5 100644
--- a/package/perl-path-class/perl-path-class.hash
+++ b/package/perl-path-class/perl-path-class.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    13e6db714f6d5a0e62ca1c4a7fc4d0f3 Path-Class-0.37.tar.gz
-sha256 654781948602386f2cb2e4473a739f17dc6953d92aabc2498a4ca2561bc248ce Path-Class-0.37.tar.gz
+md5  13e6db714f6d5a0e62ca1c4a7fc4d0f3  Path-Class-0.37.tar.gz
+sha256  654781948602386f2cb2e4473a739f17dc6953d92aabc2498a4ca2561bc248ce  Path-Class-0.37.tar.gz
 
 # computed by scancpan
-sha256 636b5c82eabfe3d4cd86126db9502fd537d1442ad2c88c93dbe221e62b5f1710 LICENSE
+sha256  636b5c82eabfe3d4cd86126db9502fd537d1442ad2c88c93dbe221e62b5f1710  LICENSE
diff --git a/package/perl-stream-buffered/perl-stream-buffered.hash b/package/perl-stream-buffered/perl-stream-buffered.hash
index a40955d8f6..5de355558e 100644
--- a/package/perl-stream-buffered/perl-stream-buffered.hash
+++ b/package/perl-stream-buffered/perl-stream-buffered.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b030fecaa784cd573289ae797c7aeae9 Stream-Buffered-0.03.tar.gz
-sha256 9b2d4390b5de6b0cf4558e4ad04317a73c5e13dd19af29149c4e47c37fb2423b Stream-Buffered-0.03.tar.gz
+md5  b030fecaa784cd573289ae797c7aeae9  Stream-Buffered-0.03.tar.gz
+sha256  9b2d4390b5de6b0cf4558e4ad04317a73c5e13dd19af29149c4e47c37fb2423b  Stream-Buffered-0.03.tar.gz
 
 # computed by scancpan
-sha256 68e8c38e6d2f2b0570a908411f8321b80a7e35ea44f43729807c9ac9a025f591 LICENSE
+sha256  68e8c38e6d2f2b0570a908411f8321b80a7e35ea44f43729807c9ac9a025f591  LICENSE
diff --git a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
index 6bd2441641..bb74dd2f3e 100644
--- a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
+++ b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    72cf6acdd2a0a8b105821a4db98e4ebe Sub-Exporter-Progressive-0.001013.tar.gz
-sha256 d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056 Sub-Exporter-Progressive-0.001013.tar.gz
+md5  72cf6acdd2a0a8b105821a4db98e4ebe  Sub-Exporter-Progressive-0.001013.tar.gz
+sha256  d535b7954d64da1ac1305b1fadf98202769e3599376854b2ced90c382beac056  Sub-Exporter-Progressive-0.001013.tar.gz
 
 # computed by scancpan
-sha256 24c38cba4218e6be62e511bffe21e63aa57335d8929034aa58e8a85eed001e99 LICENSE
+sha256  24c38cba4218e6be62e511bffe21e63aa57335d8929034aa58e8a85eed001e99  LICENSE
diff --git a/package/perl-sub-install/perl-sub-install.hash b/package/perl-sub-install/perl-sub-install.hash
index 3abd9940e6..bbac2a6377 100644
--- a/package/perl-sub-install/perl-sub-install.hash
+++ b/package/perl-sub-install/perl-sub-install.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e1ce4f9cb6b2f6b8778b036c31afa5ab Sub-Install-0.928.tar.gz
-sha256 61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f Sub-Install-0.928.tar.gz
+md5  e1ce4f9cb6b2f6b8778b036c31afa5ab  Sub-Install-0.928.tar.gz
+sha256  61e567a7679588887b7b86d427bc476ea6d77fffe7e0d17d640f89007d98ef0f  Sub-Install-0.928.tar.gz
 
 # computed by scancpan
-sha256 ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca LICENSE
+sha256  ad5fb5c05003488f924c60ead21694d629055c9db2ee2d9dd0cf0041b9fedaca  LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index d918af2358..602ff92cec 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1bb9caee697bcfa738f419d40505e506 Sub-Quote-2.006006.tar.gz
-sha256 6e4e2af42388fa6d2609e0e82417de7cc6be47223f576592c656c73c7524d89d Sub-Quote-2.006006.tar.gz
+md5  1bb9caee697bcfa738f419d40505e506  Sub-Quote-2.006006.tar.gz
+sha256  6e4e2af42388fa6d2609e0e82417de7cc6be47223f576592c656c73c7524d89d  Sub-Quote-2.006006.tar.gz
 
 # computed by scancpan
-sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
+sha256  88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c  LICENSE
diff --git a/package/perl-sys-meminfo/perl-sys-meminfo.hash b/package/perl-sys-meminfo/perl-sys-meminfo.hash
index 207cfad2bf..c80a45520c 100644
--- a/package/perl-sys-meminfo/perl-sys-meminfo.hash
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    88f0632691d7de91cbed95ba1ff29025 Sys-MemInfo-0.99.tar.gz
-sha256 0786319d3a3a8bae5d727939244bf17e140b714f52734d5e9f627203e4cf3e3b Sys-MemInfo-0.99.tar.gz
+md5  88f0632691d7de91cbed95ba1ff29025  Sys-MemInfo-0.99.tar.gz
+sha256  0786319d3a3a8bae5d727939244bf17e140b714f52734d5e9f627203e4cf3e3b  Sys-MemInfo-0.99.tar.gz
 
 # computed by scancpan
-sha256 62854ade112a6782f476bdc7dc9603776c4e064782623d999f966dba131a15de LICENSE
+sha256  62854ade112a6782f476bdc7dc9603776c4e064782623d999f966dba131a15de  LICENSE
diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
index ce4d673540..ac4184b08d 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.hash
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    57172ce9b33c04de460b4e7ad68d2e9c Sys-Mmap-0.20.tar.gz
-sha256 1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf Sys-Mmap-0.20.tar.gz
+md5  57172ce9b33c04de460b4e7ad68d2e9c  Sys-Mmap-0.20.tar.gz
+sha256  1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf  Sys-Mmap-0.20.tar.gz
 
 # computed by scancpan
-sha256 4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c Artistic
-sha256 51c144e9a67644fa8eea0ea63dedb4e837587305b22f073eb5e279e39e7325a8 Copying
+sha256  4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c  Artistic
+sha256  51c144e9a67644fa8eea0ea63dedb4e837587305b22f073eb5e279e39e7325a8  Copying
diff --git a/package/perl-time-parsedate/perl-time-parsedate.hash b/package/perl-time-parsedate/perl-time-parsedate.hash
index 39ce6b93f4..0e51998090 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.hash
+++ b/package/perl-time-parsedate/perl-time-parsedate.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9143d075278857d21c77467d26f1603b Time-ParseDate-2015.103.tar.gz
-sha256 2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1 Time-ParseDate-2015.103.tar.gz
+md5  9143d075278857d21c77467d26f1603b  Time-ParseDate-2015.103.tar.gz
+sha256  2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1  Time-ParseDate-2015.103.tar.gz
 
 # locally calculated
-sha256 6d8de888d0662f75cfa3bf21b261741d5634ac9cdd8604d6173850546a3d40a9 lib/Time/JulianDay.pm
-sha256 9ae411fbaf87add414e7357417032dfedce652c393643bc5cb5b7698041a1dca lib/Time/Timezone.pm
+sha256  6d8de888d0662f75cfa3bf21b261741d5634ac9cdd8604d6173850546a3d40a9  lib/Time/JulianDay.pm
+sha256  9ae411fbaf87add414e7357417032dfedce652c393643bc5cb5b7698041a1dca  lib/Time/Timezone.pm
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
index c4ed488905..43f65a00c3 100644
--- a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    cbe0e1c3ee54738d900c739ea348efda WWW-Form-UrlEncoded-0.26.tar.gz
-sha256 c0480b5f1f15b71163ec327b8e7842298f0cb3ace97e63d7034af1e94a2d90f4 WWW-Form-UrlEncoded-0.26.tar.gz
+md5  cbe0e1c3ee54738d900c739ea348efda  WWW-Form-UrlEncoded-0.26.tar.gz
+sha256  c0480b5f1f15b71163ec327b8e7842298f0cb3ace97e63d7034af1e94a2d90f4  WWW-Form-UrlEncoded-0.26.tar.gz
 
 # computed by scancpan
-sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
+sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-www-robotrules/perl-www-robotrules.hash b/package/perl-www-robotrules/perl-www-robotrules.hash
index 41f2d7a19a..38fd062093 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.hash
+++ b/package/perl-www-robotrules/perl-www-robotrules.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b7186e8b8b3701e70c22abf430742403 WWW-RobotRules-6.02.tar.gz
-sha256 46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e WWW-RobotRules-6.02.tar.gz
+md5  b7186e8b8b3701e70c22abf430742403  WWW-RobotRules-6.02.tar.gz
+sha256  46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e  WWW-RobotRules-6.02.tar.gz
 
 # computed by scancpan
-sha256 fa375c4f771b92fc076b6c66e19440a0fff51dacf489fecd94bf560091279e05 README
+sha256  fa375c4f771b92fc076b6c66e19440a0fff51dacf489fecd94bf560091279e05  README
diff --git a/package/perl-x10/perl-x10.hash b/package/perl-x10/perl-x10.hash
index 5411390e3e..900ff62f1f 100644
--- a/package/perl-x10/perl-x10.hash
+++ b/package/perl-x10/perl-x10.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    20dcca2dfb978bfed3043276aa3481e5 X10-0.04.tar.gz
-sha256 3dcee9d95614b2db70de608e933d42817f93fccd5b1f2f782b0846af487d9134 X10-0.04.tar.gz
+md5  20dcca2dfb978bfed3043276aa3481e5  X10-0.04.tar.gz
+sha256  3dcee9d95614b2db70de608e933d42817f93fccd5b1f2f782b0846af487d9134  X10-0.04.tar.gz
 
 # computed by scancpan
-sha256 e6f320afa82517d663be348dd2515ecb1454a7c851ba5590f13aca01d219be80 README
+sha256  e6f320afa82517d663be348dd2515ecb1454a7c851ba5590f13aca01d219be80  README
diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index 4842f4fec2..3a2f1ae7da 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    dce687dd8b7e82d1c359fd74b1852f64 XML-LibXML-2.0134.tar.gz
-sha256 f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf XML-LibXML-2.0134.tar.gz
+md5  dce687dd8b7e82d1c359fd74b1852f64  XML-LibXML-2.0134.tar.gz
+sha256  f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf  XML-LibXML-2.0134.tar.gz
 
 # computed by scancpan
-sha256 5046a7ec515cc1542beafdf2eadeeff24cc221fc3fde9913dd144fd263ae6100 LICENSE
+sha256  5046a7ec515cc1542beafdf2eadeeff24cc221fc3fde9913dd144fd263ae6100  LICENSE
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
index e5a98ecf48..a00edfd98d 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a8916c6d095bcf073e1108af02e78c97 XML-NamespaceSupport-1.12.tar.gz
-sha256 47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef XML-NamespaceSupport-1.12.tar.gz
+md5  a8916c6d095bcf073e1108af02e78c97  XML-NamespaceSupport-1.12.tar.gz
+sha256  47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef  XML-NamespaceSupport-1.12.tar.gz
 
 # computed by scancpan
-sha256 3fed787f0f9e1d74024ec7ae5f0f4736c693bcf263781da2054eb4bb1337e911 LICENSE
+sha256  3fed787f0f9e1d74024ec7ae5f0f4736c693bcf263781da2054eb4bb1337e911  LICENSE
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.hash b/package/perl-xml-sax-base/perl-xml-sax-base.hash
index 1542922b17..02c5124d08 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.hash
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ec347a14065dd7aec7d9fb181b2d7946 XML-SAX-Base-1.09.tar.gz
-sha256 66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0 XML-SAX-Base-1.09.tar.gz
+md5  ec347a14065dd7aec7d9fb181b2d7946  XML-SAX-Base-1.09.tar.gz
+sha256  66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0  XML-SAX-Base-1.09.tar.gz
 
 # computed by scancpan
-sha256 2a9aae56e13888493523ee9053689627e092aafcf2c5fb06f06df07260f91b42 README
+sha256  2a9aae56e13888493523ee9053689627e092aafcf2c5fb06f06df07260f91b42  README
diff --git a/package/perl-xml-sax/perl-xml-sax.hash b/package/perl-xml-sax/perl-xml-sax.hash
index df63047f06..b7c2e4e0c9 100644
--- a/package/perl-xml-sax/perl-xml-sax.hash
+++ b/package/perl-xml-sax/perl-xml-sax.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b62e3754523695c7f5bbcafa3676a38d XML-SAX-1.02.tar.gz
-sha256 4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a XML-SAX-1.02.tar.gz
+md5  b62e3754523695c7f5bbcafa3676a38d  XML-SAX-1.02.tar.gz
+sha256  4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a  XML-SAX-1.02.tar.gz
 
 # computed by scancpan
-sha256 bf2fb225e77b46b8892ef2a8aa5efa92d65b176a870f42559d8b73b308a36509 LICENSE
+sha256  bf2fb225e77b46b8892ef2a8aa5efa92d65b176a870f42559d8b73b308a36509  LICENSE
diff --git a/package/php-pecl-dbus/php-pecl-dbus.hash b/package/php-pecl-dbus/php-pecl-dbus.hash
index f8c5aa5037..f43e2c8b51 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.hash
+++ b/package/php-pecl-dbus/php-pecl-dbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  php-pecl-dbus-315d17558c7614d02e923d898231e51c86a25789.tar.gz
-sha256 ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
+sha256  c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  php-pecl-dbus-315d17558c7614d02e923d898231e51c86a25789.tar.gz
+sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/physfs/physfs.hash b/package/physfs/physfs.hash
index a2219edd25..a56e7dccef 100644
--- a/package/physfs/physfs.hash
+++ b/package/physfs/physfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863  physfs-3.0.2.tar.bz2
-sha256 d80c0b09a1c98c61667ea044eefa2fd98fb70bd5fe12c49ff52b1fc2289a6583  LICENSE.txt
+sha256  304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863  physfs-3.0.2.tar.bz2
+sha256  d80c0b09a1c98c61667ea044eefa2fd98fb70bd5fe12c49ff52b1fc2289a6583  LICENSE.txt
diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 28f2d9cdc5..77c270408c 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e6761ca932ffc6d09bd6b11ff018bdaf70b287ce518b3282d29e0270e88420bb  picocom-3.1.tar.gz
-sha256 9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
+sha256  e6761ca932ffc6d09bd6b11ff018bdaf70b287ce518b3282d29e0270e88420bb  picocom-3.1.tar.gz
+sha256  9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/pimd/pimd.hash b/package/pimd/pimd.hash
index 98c717d2e8..ae79d771f5 100644
--- a/package/pimd/pimd.hash
+++ b/package/pimd/pimd.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d  pimd-2.3.2.tar.gz
+sha256  c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d  pimd-2.3.2.tar.gz
 
 # Hash for license files:
-sha256 3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009  LICENSE
-sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  LICENSE.mrouted
+sha256  3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009  LICENSE
+sha256  4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  LICENSE.mrouted
diff --git a/package/pixiewps/pixiewps.hash b/package/pixiewps/pixiewps.hash
index bb56630388..99a09741a3 100644
--- a/package/pixiewps/pixiewps.hash
+++ b/package/pixiewps/pixiewps.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 d3d3cf57851e3e734fb1797aa078239ef161d1cbeffc4438497d58a425ef22a2  pixiewps-9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59.tar.gz
-sha256 ccb349b4132ed7737f25e5adebfe61f3d52dca33708df1e50352320438d1d4c2  LICENSE.md
+sha256  d3d3cf57851e3e734fb1797aa078239ef161d1cbeffc4438497d58a425ef22a2  pixiewps-9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59.tar.gz
+sha256  ccb349b4132ed7737f25e5adebfe61f3d52dca33708df1e50352320438d1d4c2  LICENSE.md
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 7d08636370..e7f006b023 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 d1331c6fa766c547b071c491de90b9f343c8dbffdb119be8a5a7e491199b93a9 policycoreutils-3.2.tar.gz
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  d1331c6fa766c547b071c491de90b9f343c8dbffdb119be8a5a7e491199b93a9  policycoreutils-3.2.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/popperjs/popperjs.hash b/package/popperjs/popperjs.hash
index d9cdabc32c..a2388f5b7a 100644
--- a/package/popperjs/popperjs.hash
+++ b/package/popperjs/popperjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-1.16.0.tar.gz
-sha256	2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
+sha256  83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-1.16.0.tar.gz
+sha256  2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
diff --git a/package/pound/pound.hash b/package/pound/pound.hash
index 7fbf01b89b..1e88218692 100644
--- a/package/pound/pound.hash
+++ b/package/pound/pound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a7fd8690de0fd390615e79fd0f4bfd56a544b8ef97dd6659c07ecd3207480c25  Pound-2.8.tgz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL.txt
+sha256  a7fd8690de0fd390615e79fd0f4bfd56a544b8ef97dd6659c07ecd3207480c25  Pound-2.8.tgz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL.txt
diff --git a/package/pptp-linux/pptp-linux.hash b/package/pptp-linux/pptp-linux.hash
index 668e01c30b..dc07c15d6f 100644
--- a/package/pptp-linux/pptp-linux.hash
+++ b/package/pptp-linux/pptp-linux.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.10.0/
-md5 8d25341352fdae5ad5b36b9f18254908  pptp-1.10.0.tar.gz
-sha1 173c9b7d204c89fd1538116f165bba1e9101b51c  pptp-1.10.0.tar.gz
+md5  8d25341352fdae5ad5b36b9f18254908  pptp-1.10.0.tar.gz
+sha1  173c9b7d204c89fd1538116f165bba1e9101b51c  pptp-1.10.0.tar.gz
 
 # Locally calculated
-sha256 82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4  pptp-1.10.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4  pptp-1.10.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index e8ccc93a2c..c9af9fe25c 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2 pru-software-support-package-v6.0.1.tar.gz
+sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2  pru-software-support-package-v6.0.1.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/ptm2human/ptm2human.hash b/package/ptm2human/ptm2human.hash
index 5546ef4018..0346019667 100644
--- a/package/ptm2human/ptm2human.hash
+++ b/package/ptm2human/ptm2human.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 28947eeb458d8b6a362cbeb8c5cb6098006274af04ebb4f5da70eac89f927d95  ptm2human-d0b8b6be9897ea5b04fd6460038a4773cec078bc.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
+sha256  28947eeb458d8b6a362cbeb8c5cb6098006274af04ebb4f5da70eac89f927d95  ptm2human-d0b8b6be9897ea5b04fd6460038a4773cec078bc.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/pwgen/pwgen.hash b/package/pwgen/pwgen.hash
index 6dca6363c1..f04e6c3df8 100644
--- a/package/pwgen/pwgen.hash
+++ b/package/pwgen/pwgen.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/pwgen/files/pwgen/2.08/
-md5	6cfba450ac6ff72d11e88a6b0b049165	pwgen-2.08.tar.gz
-sha1	6406deba61297784888c2ec0c14e3c735a85a2b6	pwgen-2.08.tar.gz
+md5  6cfba450ac6ff72d11e88a6b0b049165  pwgen-2.08.tar.gz
+sha1  6406deba61297784888c2ec0c14e3c735a85a2b6  pwgen-2.08.tar.gz
 # Locally computed:
-sha256 5d3e49e01ef782be5841d5d1f7fb64d290cd86459598a913818584a46a2f81a1 debian/copyright
+sha256  5d3e49e01ef782be5841d5d1f7fb64d290cd86459598a913818584a46a2f81a1  debian/copyright
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
index b91e5fa8c0..29ae2d7909 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.hash
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
-md5	de3940a901b269be82c8bd9f28d53ff0  aiohttp-cors-0.7.0.tar.gz
-sha256	4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d  aiohttp-cors-0.7.0.tar.gz
+md5  de3940a901b269be82c8bd9f28d53ff0  aiohttp-cors-0.7.0.tar.gz
+sha256  4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d  aiohttp-cors-0.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	86cb2262ff825ce1c8b8fb9ea9f5174318badc3912639b9275fc25d0e305c556  LICENSE
+sha256  86cb2262ff825ce1c8b8fb9ea9f5174318badc3912639b9275fc25d0e305c556  LICENSE
diff --git a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
index 927bd32895..3cd9462d72 100644
--- a/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
+++ b/package/python-aiohttp-debugtoolbar/python-aiohttp-debugtoolbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_debugtoolbar/json
-md5	496734057cb413d7a49a52a817802dbb  aiohttp-debugtoolbar-0.6.0.tar.gz
-sha256	ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45  aiohttp-debugtoolbar-0.6.0.tar.gz
+md5  496734057cb413d7a49a52a817802dbb  aiohttp-debugtoolbar-0.6.0.tar.gz
+sha256  ec231661133b40136608d39dfb688e7ea0c3d47b6ae6dee52d5bf24ceb9e4d45  aiohttp-debugtoolbar-0.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256	94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
+sha256  94d638be2cb4f186cc62bb567455837757547c15f1b350863aaf05a38843b542  LICENSE
diff --git a/package/python-aiohttp-mako/python-aiohttp-mako.hash b/package/python-aiohttp-mako/python-aiohttp-mako.hash
index 169027e1df..1991acdbce 100644
--- a/package/python-aiohttp-mako/python-aiohttp-mako.hash
+++ b/package/python-aiohttp-mako/python-aiohttp-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-mako/json
-md5	c0f2da2851d0b6e819b5c882f700bb11  aiohttp-mako-0.4.0.tar.gz
-sha256	f10bdee54589b6567e8a0339db582276fdaaa198764541d2f9741f1d3836312c  aiohttp-mako-0.4.0.tar.gz
+md5  c0f2da2851d0b6e819b5c882f700bb11  aiohttp-mako-0.4.0.tar.gz
+sha256  f10bdee54589b6567e8a0339db582276fdaaa198764541d2f9741f1d3836312c  aiohttp-mako-0.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b81fea0e0d4cda42faf00466cabe7b9e2a0cc3a0ffbf20ae3773c18e077c7c52  LICENSE
+sha256  b81fea0e0d4cda42faf00466cabe7b9e2a0cc3a0ffbf20ae3773c18e077c7c52  LICENSE
diff --git a/package/python-aiohttp-security/python-aiohttp-security.hash b/package/python-aiohttp-security/python-aiohttp-security.hash
index 1d2604c90c..2c23df14d6 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.hash
+++ b/package/python-aiohttp-security/python-aiohttp-security.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-security/json
-md5	1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
-sha256	40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
+md5  1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
+sha256  40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
+sha256  a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
diff --git a/package/python-aiologstash/python-aiologstash.hash b/package/python-aiologstash/python-aiologstash.hash
index ff7d2cce99..81ebfedfc3 100644
--- a/package/python-aiologstash/python-aiologstash.hash
+++ b/package/python-aiologstash/python-aiologstash.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiologstash/json
-md5	1e321c11b34477f780f31b2553557d69  aiologstash-2.0.0.tar.gz
-sha256	698522126ffd4e905cd5f52a08092a0a78096c8f0e28bc1e303369873da71f78  aiologstash-2.0.0.tar.gz
+md5  1e321c11b34477f780f31b2553557d69  aiologstash-2.0.0.tar.gz
+sha256  698522126ffd4e905cd5f52a08092a0a78096c8f0e28bc1e303369873da71f78  aiologstash-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	beddf3a80aaaa71ebd6765b13bc680bd0450bb81191249cc889539523f9404ec  LICENSE
+sha256  beddf3a80aaaa71ebd6765b13bc680bd0450bb81191249cc889539523f9404ec  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index 410beb7973..652702c479 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5	5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
-sha256	6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
+md5  5f184e4b97ea161fc2d690aef604f997  aiomonitor-0.4.5.tar.gz
+sha256  6232c1ab14bf06cd7217845801c27340032f74e283bdaf32d01cdd3b7c673d0e  aiomonitor-0.4.5.tar.gz
 # Locally computed sha256 checksums
-sha256	9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
+sha256  9b42fe3a288996988c552e387e7877be7525a1649e62086aedd6b32d3cb56365  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index 476bc8f1a1..8cc1788da4 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5	b46f69561bc85fc52e698b2440ca251e	pyalsaaudio-0.8.4.tar.gz
-sha256	84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085	pyalsaaudio-0.8.4.tar.gz
+md5  b46f69561bc85fc52e698b2440ca251e  pyalsaaudio-0.8.4.tar.gz
+sha256  84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085  pyalsaaudio-0.8.4.tar.gz
 # Locally computed sha256 checksums
-sha256	ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935	LICENSE
+sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 163ea6cee8..15f72eb015 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/argh/json
-md5	edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
+md5  edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
 # Locally computed
-sha256	e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
+sha256  e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
 sha256  9c318783389a2e78735dc3d633e745e5648b826744521857045e84ed2e79ce2e  README.rst
diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index c349ad5a44..631db812dc 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5	5afe03ecc39ae94950ff95e80166d945  asgiref-3.3.4.tar.gz
-sha256	d1216dfbdfb63826470995d31caed36225dcaf34f182e0fa257a4dd9e86f1b78  asgiref-3.3.4.tar.gz
+md5  5afe03ecc39ae94950ff95e80166d945  asgiref-3.3.4.tar.gz
+sha256  d1216dfbdfb63826470995d31caed36225dcaf34f182e0fa257a4dd9e86f1b78  asgiref-3.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
+sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-bunch/python-bunch.hash b/package/python-bunch/python-bunch.hash
index 5cf2cece46..cfde2db603 100644
--- a/package/python-bunch/python-bunch.hash
+++ b/package/python-bunch/python-bunch.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bunch/json
-md5	0a829d64e95ed96defbcae2bf9061bb0  bunch-1.0.1.tar.gz
-sha256	50c77a0fc0cb372dfe48b5e11937d5f70e743adbf42683f3a6d2857645a76aaa  bunch-1.0.1.tar.gz
+md5  0a829d64e95ed96defbcae2bf9061bb0  bunch-1.0.1.tar.gz
+sha256  50c77a0fc0cb372dfe48b5e11937d5f70e743adbf42683f3a6d2857645a76aaa  bunch-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
+sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index e1a628a3a3..32bcae18f9 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/canopen/json
-sha256	4394770d528e93a48936138c4a7b37b5dff26d54f82a435ad9790cd1e43f55b9  canopen-1.0.0.tar.gz
+sha256  4394770d528e93a48936138c4a7b37b5dff26d54f82a435ad9790cd1e43f55b9  canopen-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
+sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
index a47607d9d4..71e0b1eb93 100644
--- a/package/python-cbor/python-cbor.hash
+++ b/package/python-cbor/python-cbor.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cbor/json, sha256 locally computed
-md5	22b03b59784fd78cb6c27aa498af0db6  cbor-1.0.0.tar.gz
-sha256	13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19c39e6acb8609bbb6  cbor-1.0.0.tar.gz
+md5  22b03b59784fd78cb6c27aa498af0db6  cbor-1.0.0.tar.gz
+sha256  13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19c39e6acb8609bbb6  cbor-1.0.0.tar.gz
diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 1d80b4c124..5c98953fa1 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5	9ec9ffd467e181906f257d6c0dbabf45  channels_redis-2.4.1.tar.gz
-sha256	ddfa0c067085fdce24fb80d9c0b848638cbdbf0e1167f14eb2e99d635ad216e6  channels_redis-2.4.1.tar.gz
+md5  9ec9ffd467e181906f257d6c0dbabf45  channels_redis-2.4.1.tar.gz
+sha256  ddfa0c067085fdce24fb80d9c0b848638cbdbf0e1167f14eb2e99d635ad216e6  channels_redis-2.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
+sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index beeef4acc6..2d0097da2b 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5	6f3fb75828b681a69372934a09ac3f32  channels-2.3.1.tar.gz
-sha256	6b8ebd93fe0041a23e31c9f4130d92fadb9c0040c0eb377a004540631325a31d  channels-2.3.1.tar.gz
+md5  6f3fb75828b681a69372934a09ac3f32  channels-2.3.1.tar.gz
+sha256  6b8ebd93fe0041a23e31c9f4130d92fadb9c0040c0eb377a004540631325a31d  channels-2.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
+sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
index 2a5c7f5cdd..c91017d707 100644
--- a/package/python-characteristic/python-characteristic.hash
+++ b/package/python-characteristic/python-characteristic.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
-md5	b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
+md5  b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
 # Locally computed
-sha256	ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
+sha256  ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
 sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
diff --git a/package/python-cheetah/python-cheetah.hash b/package/python-cheetah/python-cheetah.hash
index f7094a8bb1..de397e800c 100644
--- a/package/python-cheetah/python-cheetah.hash
+++ b/package/python-cheetah/python-cheetah.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/pypi/Cheetah3/json
 md5  42bb9da785974c7e4089aa754ff99a73  Cheetah3-3.2.6.post2.tar.gz
-sha256	63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878  Cheetah3-3.2.6.post2.tar.gz
+sha256  63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878  Cheetah3-3.2.6.post2.tar.gz
 # Locally computed sha256 checksums
 sha256  635349ae512fafc2e60eb74a50d0a5276fa06c00b5ecb20da53546449ddc45ea  LICENSE
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index e8144abaf6..06d9453163 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5	7ace4b584a8092deb9f6b0142a627086  cheroot-8.2.1.tar.gz
-sha256	5b525b3e4a755adf78070ab54c1821fb860d4255a9317dba2b88eb2df2441cff  cheroot-8.2.1.tar.gz
+md5  7ace4b584a8092deb9f6b0142a627086  cheroot-8.2.1.tar.gz
+sha256  5b525b3e4a755adf78070ab54c1821fb860d4255a9317dba2b88eb2df2441cff  cheroot-8.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da6dc218683f6dab91c6367f00bf33095d980fb1f04d430c81c5e6994b8605e0  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index d8f97af0f7..2e7a92d6f3 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
-md5	e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
-sha256	6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
+md5  e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
+sha256  6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
 sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE.md
diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index d2033de373..8e646d82ba 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/constantly/json
-md5	f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
 # Locally computed
-sha256	586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-couchdb/python-couchdb.hash b/package/python-couchdb/python-couchdb.hash
index 67b7b12692..c73ee1e0b1 100644
--- a/package/python-couchdb/python-couchdb.hash
+++ b/package/python-couchdb/python-couchdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/couchdb/json
-md5	de40696472202d728cfca4279629e4ff  CouchDB-1.2.tar.gz
-sha256	1386a1a43f25bed3667e3b805222054940d674fa1967fa48e9d2012a18630ab7  CouchDB-1.2.tar.gz
+md5  de40696472202d728cfca4279629e4ff  CouchDB-1.2.tar.gz
+sha256  1386a1a43f25bed3667e3b805222054940d674fa1967fa48e9d2012a18630ab7  CouchDB-1.2.tar.gz
 # Locally computed sha256 checksums
-sha256	c538da1ae16b6d75f6fa65852bb158dbf9e556b01681be5b692692906d244241  COPYING
+sha256  c538da1ae16b6d75f6fa65852bb158dbf9e556b01681be5b692692906d244241  COPYING
diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
index 8ba98d3c01..43ef7dd8e7 100644
--- a/package/python-crcmod/python-crcmod.hash
+++ b/package/python-crcmod/python-crcmod.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/crcmod/json
-md5	2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
+md5  2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
 # Locally computed
-sha256	dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
+sha256  dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
 sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index 44813416cb..f0687a4abd 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5	fa57704c1cb66cc8e537b782bd6b227e  cssselect-1.1.0.tar.gz
-sha256	f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc  cssselect-1.1.0.tar.gz
+md5  fa57704c1cb66cc8e537b782bd6b227e  cssselect-1.1.0.tar.gz
+sha256  f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc  cssselect-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
+sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-daemonize/python-daemonize.hash b/package/python-daemonize/python-daemonize.hash
index aa2c904523..43b0f43d84 100644
--- a/package/python-daemonize/python-daemonize.hash
+++ b/package/python-daemonize/python-daemonize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daemonize/json
-md5	3d64e7a0219ad22e3fca62460f893b6a  daemonize-2.5.0.tar.gz
-sha256	dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3  daemonize-2.5.0.tar.gz
+md5  3d64e7a0219ad22e3fca62460f893b6a  daemonize-2.5.0.tar.gz
+sha256  dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3  daemonize-2.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256	248d0d3147d20a09bed8f03da8ed72f47009073606dcc1bab658f942d34b29f8  LICENSE
+sha256  248d0d3147d20a09bed8f03da8ed72f47009073606dcc1bab658f942d34b29f8  LICENSE
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index cdf5e83ebb..f80d7175cb 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5	564353eaed92659e3b113d966a0288f2  daphne-2.4.1.tar.gz0
+md5  564353eaed92659e3b113d966a0288f2  daphne-2.4.1.tar.gz0
 sha256  1e41d02d78da373c1f8504835cdca6d447b5d64c2941661d4bd968d412b6c383  daphne-2.4.1.tar.gz
 # Locally computed sha256
-sha256 b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669 LICENSE
+sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
index 42a7512e4f..4c43d4bf5e 100644
--- a/package/python-dialog3/python-dialog3.hash
+++ b/package/python-dialog3/python-dialog3.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/pythondialog/json
-md5	07e257d91099b804e040c6ea5ec56041  pythondialog-3.5.1.tar.gz
+md5  07e257d91099b804e040c6ea5ec56041  pythondialog-3.5.1.tar.gz
 # Locally computed
 sha256  34a0687290571f37d7d297514cc36bd4cd044a3a4355271549f91490d3e7ece8  pythondialog-3.5.1.tar.gz
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index 45c9fc8cc4..d8c43d0144 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/dicttoxml/json
-md5	ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
+md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
 # Locally computed
-sha256	ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
+sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-django-enumfields/python-django-enumfields.hash b/package/python-django-enumfields/python-django-enumfields.hash
index 352fa8d907..99c6ca5e4c 100644
--- a/package/python-django-enumfields/python-django-enumfields.hash
+++ b/package/python-django-enumfields/python-django-enumfields.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django-enumfields/json
-md5	 e06bcaecd583ee40e30d556bfcbf0d66  django-enumfields-2.1.1.tar.gz
+md5  e06bcaecd583ee40e30d556bfcbf0d66  django-enumfields-2.1.1.tar.gz
 sha256  f64841732a9c343f5071220e0abcf5f51c9472c06e3c33d7c6a7ec27b6087561  django-enumfields-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  75b9c8c2514f22d66070ffc975c4d3132de01e0cc7b3a9662731bcb46cd2a042  LICENSE
diff --git a/package/python-docker-pycreds/python-docker-pycreds.hash b/package/python-docker-pycreds/python-docker-pycreds.hash
index d93a3a1d31..06f2faf669 100644
--- a/package/python-docker-pycreds/python-docker-pycreds.hash
+++ b/package/python-docker-pycreds/python-docker-pycreds.hash
@@ -1,4 +1,4 @@
 # md5 and sha256 from https://pypi.python.org/pypi/docker-pycreds/json
-md5	322f570cea6b4661c6ac335683988e18  docker-pycreds-0.4.0.tar.gz
-sha256	6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4  docker-pycreds-0.4.0.tar.gz
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+md5  322f570cea6b4661c6ac335683988e18  docker-pycreds-0.4.0.tar.gz
+sha256  6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4  docker-pycreds-0.4.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index 0006a8a7da..678245a979 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5	e1e8dc73e3220fe9eec1faf80b0290de  docker-4.1.0.tar.gz
-sha256	6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1  docker-4.1.0.tar.gz
+md5  e1e8dc73e3220fe9eec1faf80b0290de  docker-4.1.0.tar.gz
+sha256  6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1  docker-4.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
+sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-dockerpty/python-dockerpty.hash b/package/python-dockerpty/python-dockerpty.hash
index f5ed252bcf..c934b3475f 100644
--- a/package/python-dockerpty/python-dockerpty.hash
+++ b/package/python-dockerpty/python-dockerpty.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/dockerpty/json, sha256 locally computed
-md5	028bacb34536f3ee6a2ccd668c27e8e4  dockerpty-0.4.1.tar.gz
-sha256	69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce  dockerpty-0.4.1.tar.gz
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+md5  028bacb34536f3ee6a2ccd668c27e8e4  dockerpty-0.4.1.tar.gz
+sha256  69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce  dockerpty-0.4.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
index c645452109..95c092e5e0 100644
--- a/package/python-entrypoints/python-entrypoints.hash
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/entrypoints/json
-md5	c5c61ea2e46a0c50ea08f4af7955a0b1  entrypoints-0.3.tar.gz
-sha256	c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451  entrypoints-0.3.tar.gz
+md5  c5c61ea2e46a0c50ea08f4af7955a0b1  entrypoints-0.3.tar.gz
+sha256  c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451  entrypoints-0.3.tar.gz
 # Locally computed sha256 checksums
-sha256	de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
+sha256  de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-fastentrypoints/python-fastentrypoints.hash b/package/python-fastentrypoints/python-fastentrypoints.hash
index 71165d61fa..0d505cd109 100644
--- a/package/python-fastentrypoints/python-fastentrypoints.hash
+++ b/package/python-fastentrypoints/python-fastentrypoints.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.org/pypi/fastentrypoints/json, sha256 locally computed
-md5	390ad9a9229164a06156a5b1f0ef1b22  fastentrypoints-0.12.tar.gz
-sha256	ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b  fastentrypoints-0.12.tar.gz
-sha256	d1ce3f6a7bb1a7194c7d826a0ca318176b12e58616d9e3d8f366ad43802787c4  fastentrypoints.py
+md5  390ad9a9229164a06156a5b1f0ef1b22  fastentrypoints-0.12.tar.gz
+sha256  ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b  fastentrypoints-0.12.tar.gz
+sha256  d1ce3f6a7bb1a7194c7d826a0ca318176b12e58616d9e3d8f366ad43802787c4  fastentrypoints.py
diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index 46a019c98b..484af86179 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,6 +1,6 @@
 # From: https://pypi.org/project/Flask-Babel/#copy-hash-modal-80f92a70-1c66-4cce-bb3d-8d6f98287e3f
 md5  50d5e92d96ef58787bf85b5a1b0a5567  Flask-Babel-2.0.0.tar.gz
-sha256	f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d  Flask-Babel-2.0.0.tar.gz
+sha256  f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d  Flask-Babel-2.0.0.tar.gz
 
 # License files
-sha256	a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
+sha256  a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flup/python-flup.hash b/package/python-flup/python-flup.hash
index d544d75e9e..b28f05acf6 100644
--- a/package/python-flup/python-flup.hash
+++ b/package/python-flup/python-flup.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flup/json
-md5	a64e7a6374e043480ee92534c735964e  flup-1.0.3.tar.gz
-sha256	5eb09f26eb0751f8380d8ac43d1dfb20e1d42eca0fa45ea9289fa532a79cd159  flup-1.0.3.tar.gz
+md5  a64e7a6374e043480ee92534c735964e  flup-1.0.3.tar.gz
+sha256  5eb09f26eb0751f8380d8ac43d1dfb20e1d42eca0fa45ea9289fa532a79cd159  flup-1.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256	66a60ebc732165d199ec018fb9876d9f8168a5a8575375e64cc1b3d78c32b481  PKG-INFO
+sha256  66a60ebc732165d199ec018fb9876d9f8168a5a8575375e64cc1b3d78c32b481  PKG-INFO
diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
index c43018103e..4fb5d2a2d7 100644
--- a/package/python-future/python-future.hash
+++ b/package/python-future/python-future.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.python.org/pypi/future/json
-md5	e4579c836b9c025872efe230f6270349  future-0.18.2.tar.gz
-sha256	b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d  future-0.18.2.tar.gz
+md5  e4579c836b9c025872efe230f6270349  future-0.18.2.tar.gz
+sha256  b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d  future-0.18.2.tar.gz
 # Locally computed sha256 checksums
-sha256	916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
+sha256  916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index 7d9bf78f70..7bc187cf53 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitdb/json
-md5	3f52187435ab0b6e64a15782ffaf29ab  gitdb-4.0.7.tar.gz
-sha256	96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005  gitdb-4.0.7.tar.gz
+md5  3f52187435ab0b6e64a15782ffaf29ab  gitdb-4.0.7.tar.gz
+sha256  96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005  gitdb-4.0.7.tar.gz
 # Locally computed sha256 checksums
-sha256	efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
+sha256  efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-huepy/python-huepy.hash b/package/python-huepy/python-huepy.hash
index 5a1a8fc1e3..32d0eb2674 100644
--- a/package/python-huepy/python-huepy.hash
+++ b/package/python-huepy/python-huepy.hash
@@ -1,4 +1,4 @@
 # Locally computer sha256 checksums
-md5	da6514d9d61fb75ac9470f6863ce1aca  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
-sha256	63147cef5ecae5c1ab38000be91def351710e6bef2c5f67b5303418becf6c0f2  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+md5  da6514d9d61fb75ac9470f6863ce1aca  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
+sha256  63147cef5ecae5c1ab38000be91def351710e6bef2c5f67b5303418becf6c0f2  python-huepy-a9851d5aea10d2299cc62b3f6dce26ac4ef2ea3e.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/python-ibmiotf/python-ibmiotf.hash b/package/python-ibmiotf/python-ibmiotf.hash
index 6b60aa5279..9ed99c4f9d 100644
--- a/package/python-ibmiotf/python-ibmiotf.hash
+++ b/package/python-ibmiotf/python-ibmiotf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ibmiotf/json
-md5	a103427c15b2bc96d72de5e58975638c  ibmiotf-0.4.0.tar.gz
-sha256	753a29858d48ebd89aff8b73c207028814714d8a004a3c19b436c9bbeaa65ce6  ibmiotf-0.4.0.tar.gz
+md5  a103427c15b2bc96d72de5e58975638c  ibmiotf-0.4.0.tar.gz
+sha256  753a29858d48ebd89aff8b73c207028814714d8a004a3c19b436c9bbeaa65ce6  ibmiotf-0.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	2c153c48f67e56031036fc28d12f76238a5151494bdfc24b6b81ec734c387a2d  LICENSE
+sha256  2c153c48f67e56031036fc28d12f76238a5151494bdfc24b6b81ec734c387a2d  LICENSE
diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index 238d41e06d..afcfcd2ffb 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/iniparse/#copy-hash-modal-5fdd923b-0592-4d2d-8b49-03472f948290
-md5 2054bab923df21107652d009f2373789 iniparse-0.5.tar.gz
+md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
 sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
 
 # sha256 locally computed
diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
index fcaf8cc564..fc10e180f3 100644
--- a/package/python-iowait/python-iowait.hash
+++ b/package/python-iowait/python-iowait.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
-md5	f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
-sha256	ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
+md5  f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
+sha256  ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
index 579cc76423..fd719c93a0 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.hash
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/ipython_genutils/json
-md5 5a4f9781f78466da0ea1a648f3e1f79f ipython_genutils-0.2.0.tar.gz
+md5  5a4f9781f78466da0ea1a648f3e1f79f  ipython_genutils-0.2.0.tar.gz
 # Locally computed
 sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
 sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 6489e8594f..088ee2269e 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
-md5     63d4f5a2df2625ec3979c9633da1505e  jaraco.classes-2.0.tar.gz
+md5  63d4f5a2df2625ec3979c9633da1505e  jaraco.classes-2.0.tar.gz
 sha256  dcc2c4a8ca4b344cdbf2e1be7124a5c4f192574cdbb453b62350ae8240a2caf5  jaraco.classes-2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index 051a39bfcf..95380aff98 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5     c245ade3e753bc556415f1fec102f232  jaraco.functools-2.0.tar.gz
+md5  c245ade3e753bc556415f1fec102f232  jaraco.functools-2.0.tar.gz
 sha256  35ba944f52b1a7beee8843a5aa6752d1d5b79893eeb7770ea98be6b637bf9345  jaraco.functools-2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-json-schema-validator/python-json-schema-validator.hash b/package/python-json-schema-validator/python-json-schema-validator.hash
index 7360abab9a..94a0235a6d 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.hash
+++ b/package/python-json-schema-validator/python-json-schema-validator.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/json-schema-validator/json, sha256 locally computed
-md5	7691b41739faaa8b0965279e72889932  json-schema-validator-2.4.1.tar.gz
-sha256	1562a21d83e56231cef09b9aa2c06e8f845974bd26f24be293de6cab9a2fac91  json-schema-validator-2.4.1.tar.gz
+md5  7691b41739faaa8b0965279e72889932  json-schema-validator-2.4.1.tar.gz
+sha256  1562a21d83e56231cef09b9aa2c06e8f845974bd26f24be293de6cab9a2fac91  json-schema-validator-2.4.1.tar.gz
diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index 16e200b03f..1b0548fd25 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonmodels/json
-md5	96132e252887f840d23792c03fad2039  jsonmodels-2.4.tar.gz
-sha256	abc8dc334a1794513e511a75639f77c271ef6a2992b6793f3753c7335dd18775  jsonmodels-2.4.tar.gz
+md5  96132e252887f840d23792c03fad2039  jsonmodels-2.4.tar.gz
+sha256  abc8dc334a1794513e511a75639f77c271ef6a2992b6793f3753c7335dd18775  jsonmodels-2.4.tar.gz
 # Locally computed sha256 checksums
-sha256	3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
+sha256  3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 159579f79c..692217f437 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5	1eb6d586ee5794de4bf39c1f513a3139  keyring-19.2.0.tar.gz
-sha256	91037ccaf0c9a112a76f7740e4a416b9457a69b66c2799421581bee710a974b3  keyring-19.2.0.tar.gz
+md5  1eb6d586ee5794de4bf39c1f513a3139  keyring-19.2.0.tar.gz
+sha256  91037ccaf0c9a112a76f7740e4a416b9457a69b66c2799421581bee710a974b3  keyring-19.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 9cdb27002c..aa7d79ced7 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
-sha256 95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
+sha256  48168c0ace18319c649e31907f6d8586f648e503560f506f128798b99393bcdb  python-kiwisolver-1.1.0.tar.gz
+sha256  95c32f73d43fa54d8146badbcbd73b83acb7fa2cc81a7cef7784b3cd33b146a0  LICENSE
diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index bbbc6e0a74..7d2302e088 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
 md5  b087646fb0c8c4cf7e8123af72f885b9  libusb1-2.0.1.tar.gz
 sha256  d3ba82ecf7ab6a48d21dac6697e26504670cc3522b8e5941bd28fb56cf3f6c46  libusb1-2.0.1.tar.gz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-lockfile/python-lockfile.hash b/package/python-lockfile/python-lockfile.hash
index ac1b7d2d4d..641f4b64d3 100644
--- a/package/python-lockfile/python-lockfile.hash
+++ b/package/python-lockfile/python-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/lockfile/#copy-hash-modal-3c1db9ec-dd6e-4d06-8543-91094f428ac0
-md5	a6a1a82957a23afdf44cfdd039b65ff9  lockfile-0.12.2.tar.gz
-sha256	6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799  lockfile-0.12.2.tar.gz
+md5  a6a1a82957a23afdf44cfdd039b65ff9  lockfile-0.12.2.tar.gz
+sha256  6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799  lockfile-0.12.2.tar.gz
 # Locally computed sha256
-sha256 a26276d53dacb369641f31aa0fe37216028a0d93753f862ae206ce04f54b7b29 LICENSE
+sha256  a26276d53dacb369641f31aa0fe37216028a0d93753f862ae206ce04f54b7b29  LICENSE
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 7cbcf6caf0..d77acad76e 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5	719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
-sha256	66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
+md5  719970ea22dd274797bb4328161d700f  Logbook-1.5.3.tar.gz
+sha256  66f454ada0f56eae43066f604a222b09893f98c1adc18df169710761b8f32fe8  Logbook-1.5.3.tar.gz
 # Locally computed sha256 checksums
-sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
+sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
index 3c22e9707a..0770e0d1b1 100644
--- a/package/python-m2r/python-m2r.hash
+++ b/package/python-m2r/python-m2r.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2r/json
-md5	8bdb45c19e2b59bb5ffb9a0348e81ad8  m2r-0.2.1.tar.gz
-sha256	bf90bad66cda1164b17e5ba4a037806d2443f2a4d5ddc9f6a5554a0322aaed99  m2r-0.2.1.tar.gz
+md5  8bdb45c19e2b59bb5ffb9a0348e81ad8  m2r-0.2.1.tar.gz
+sha256  bf90bad66cda1164b17e5ba4a037806d2443f2a4d5ddc9f6a5554a0322aaed99  m2r-0.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256	28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
+sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index 81e83ac0de..0d7117811c 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/project/matplotlib/#files
-sha256	fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
+sha256  fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
 # Locally computed sha256 checksums
-sha256	5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
+sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-mimeparse/python-mimeparse.hash b/package/python-mimeparse/python-mimeparse.hash
index 9721c5fa0c..00985841dc 100644
--- a/package/python-mimeparse/python-mimeparse.hash
+++ b/package/python-mimeparse/python-mimeparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mimeparse/json
-md5	a32ae1df93be1ddb581d1c0fa124bab4  python-mimeparse-1.6.0.tar.gz
-sha256	76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78  python-mimeparse-1.6.0.tar.gz
+md5  a32ae1df93be1ddb581d1c0fa124bab4  python-mimeparse-1.6.0.tar.gz
+sha256  76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78  python-mimeparse-1.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256	89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index f545308f4b..a7a5936096 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5	fb6ab174ece938dea09f8b2adad771e4  mistune-0.8.4.tar.gz
-sha256	59a3429db53c50b5c6bcc8a07f8848cb00d7dc8bdb431a4ab41920d201d4756e  mistune-0.8.4.tar.gz
+md5  fb6ab174ece938dea09f8b2adad771e4  mistune-0.8.4.tar.gz
+sha256  59a3429db53c50b5c6bcc8a07f8848cb00d7dc8bdb431a4ab41920d201d4756e  mistune-0.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  0c5259c3dd0a7c46f4835221645f62a0638c9b9faa02af08676e8069e1ff964b  LICENSE
diff --git a/package/python-nested-dict/python-nested-dict.hash b/package/python-nested-dict/python-nested-dict.hash
index 15f0ed8b5f..e5193e2372 100644
--- a/package/python-nested-dict/python-nested-dict.hash
+++ b/package/python-nested-dict/python-nested-dict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/nested-dict/json
-md5	e08e2e8de6d002f9ddda4eea5a4528c2  nested_dict-1.61.tar.gz
-sha256	de0fb5bac82ba7bcc23736f09373f18628ea57f92bbaa13480d23f261c41e771  nested_dict-1.61.tar.gz
+md5  e08e2e8de6d002f9ddda4eea5a4528c2  nested_dict-1.61.tar.gz
+sha256  de0fb5bac82ba7bcc23736f09373f18628ea57f92bbaa13480d23f261c41e771  nested_dict-1.61.tar.gz
 # Locally computed sha256 checksums
-sha256	c84eb6b667b91fd9b8991f500c168354eb51af5b2dd970d8ee51ce336d9aeed1  LICENSE.TXT
+sha256  c84eb6b667b91fd9b8991f500c168354eb51af5b2dd970d8ee51ce336d9aeed1  LICENSE.TXT
diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index 91b200768f..d55390aad3 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/netaddr/json
-md5 34cad578473b66ad77bc3b2a7613ed4a netaddr-0.8.0.tar.gz
+md5  34cad578473b66ad77bc3b2a7613ed4a  netaddr-0.8.0.tar.gz
 # Locally computed
-sha256 d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243 netaddr-0.8.0.tar.gz
+sha256  d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243  netaddr-0.8.0.tar.gz
 sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 6ca94450f0..105949d50e 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,5 +1,5 @@
 # md5 and sha256 from https://pypi.python.org/pypi/python-networkmanager/json
-md5	f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
-sha256	aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
+md5  f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
+sha256  aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
 # Locally computed
 sha256  be40f44d54bb5e0f0eee28e957ad020a00a6e3adb0290262e92129eba1c044cf  COPYING
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 7c111f7bc8..c0dcc5d27f 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -4,5 +4,5 @@ sha256  76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05  numpy-
 sha256  bc1b0af15cdc9415ea26c5f1df352c226ac86425ec0fb9ab38d111018bf1c6f2  LICENSE.txt
 sha256  2be6947e0432ecf7950ee8fe38681316749dd06d1de17c9ec4de6d2f55adb3a1  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
-sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
-sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
+sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
+sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e  tools/npy_tempita/license.txt
diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 35afcccedb..bf3993e919 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5	e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
-sha256	e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
-sha256	76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
-sha256	e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
-sha256	3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
+md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
+sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
+sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
+sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
+sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index 4ff5abb38b..0b9b7b7cd6 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path.py/json
-md5	307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
-sha256	9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
+md5  307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
+sha256  9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pathtools/python-pathtools.hash b/package/python-pathtools/python-pathtools.hash
index 6d7b2975db..00099af19b 100644
--- a/package/python-pathtools/python-pathtools.hash
+++ b/package/python-pathtools/python-pathtools.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/pathtools/json
-md5	9a1af5c605768ea5804b03b734ff0f82  pathtools-0.1.2.tar.gz
+md5  9a1af5c605768ea5804b03b734ff0f82  pathtools-0.1.2.tar.gz
 # sha256 calculated by scanpypi
-sha256	7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0  pathtools-0.1.2.tar.gz
+sha256  7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0  pathtools-0.1.2.tar.gz
 # Locally computed
 sha256  b52d83fba08f61bd1e603fee1b44cbc7ead9fcb512a5ceb8c53fec90ba415ac4  LICENSE
diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index 87df05d881..a38c8d5a03 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pexpect/json
-md5	153eb25184249d6a85fde9acf4804085  pexpect-4.8.0.tar.gz
-sha256	fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c  pexpect-4.8.0.tar.gz
+md5  153eb25184249d6a85fde9acf4804085  pexpect-4.8.0.tar.gz
+sha256  fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c  pexpect-4.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256	4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
+sha256  4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pickleshare/python-pickleshare.hash b/package/python-pickleshare/python-pickleshare.hash
index 1b6afcc68c..1b849e1791 100644
--- a/package/python-pickleshare/python-pickleshare.hash
+++ b/package/python-pickleshare/python-pickleshare.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pickleshare/json
-md5	44ab782615894a812ab96669a122a634  pickleshare-0.7.5.tar.gz
-sha256	87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca  pickleshare-0.7.5.tar.gz
+md5  44ab782615894a812ab96669a122a634  pickleshare-0.7.5.tar.gz
+sha256  87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca  pickleshare-0.7.5.tar.gz
 # Locally computed sha256 checksums
-sha256	db1fefc1789444409514c0cae0bfab7f8e374ff9b78e092cecb1e0aeb6a36d90  LICENSE
+sha256  db1fefc1789444409514c0cae0bfab7f8e374ff9b78e092cecb1e0aeb6a36d90  LICENSE
diff --git a/package/python-piexif/python-piexif.hash b/package/python-piexif/python-piexif.hash
index 9663ed722d..5ae7f406f8 100644
--- a/package/python-piexif/python-piexif.hash
+++ b/package/python-piexif/python-piexif.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256	abfd9a67795e23d7a76f9407d60841efa68c5d6e43376b295bb821a30602c569  python-piexif-1.1.3.tar.gz
-sha256	d517a0940b8eb92ace7fc88f75892d84d260d85b3062d36d9e6445bc5091f697  LICENSE.txt
+sha256  abfd9a67795e23d7a76f9407d60841efa68c5d6e43376b295bb821a30602c569  python-piexif-1.1.3.tar.gz
+sha256  d517a0940b8eb92ace7fc88f75892d84d260d85b3062d36d9e6445bc5091f697  LICENSE.txt
diff --git a/package/python-ply/python-ply.hash b/package/python-ply/python-ply.hash
index 1eba3b0ffe..88d30d67d7 100644
--- a/package/python-ply/python-ply.hash
+++ b/package/python-ply/python-ply.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ply/json
-md5	6465f602e656455affcd7c5734c638f8  ply-3.11.tar.gz
-sha256	00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3  ply-3.11.tar.gz
+md5  6465f602e656455affcd7c5734c638f8  ply-3.11.tar.gz
+sha256  00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3  ply-3.11.tar.gz
 # Locally computed sha256 checksums
-sha256	1095b93b81d2043c5c55e0859875b416f75edb6d5eccb4bf2ace1b5445d1c84f  README.md
+sha256  1095b93b81d2043c5c55e0859875b416f75edb6d5eccb4bf2ace1b5445d1c84f  README.md
diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 14338df055..1e212b15e5 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5	0ab51a12b7462a5275946a3645a71e92  portend-2.5.tar.gz
-sha256	19dc27bfb3c72471bd30a235a4d5fbefef8a7e31cab367744b5d87a205e7bfd9  portend-2.5.tar.gz
+md5  0ab51a12b7462a5275946a3645a71e92  portend-2.5.tar.gz
+sha256  19dc27bfb3c72471bd30a235a4d5fbefef8a7e31cab367744b5d87a205e7bfd9  portend-2.5.tar.gz
 # Locally computed sha256 checksums
-sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pyaes/python-pyaes.hash b/package/python-pyaes/python-pyaes.hash
index 25a15f1e19..c9e9a7ea72 100644
--- a/package/python-pyaes/python-pyaes.hash
+++ b/package/python-pyaes/python-pyaes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaes/json
-md5	20fd5c6e29dcfdd08098e85a859a54ec  pyaes-1.6.1.tar.gz
-sha256	02c1b1405c38d3c370b085fb952dd8bea3fadcee6411ad99f312cc129c536d8f  pyaes-1.6.1.tar.gz
+md5  20fd5c6e29dcfdd08098e85a859a54ec  pyaes-1.6.1.tar.gz
+sha256  02c1b1405c38d3c370b085fb952dd8bea3fadcee6411ad99f312cc129c536d8f  pyaes-1.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256	1efe6c78b28b4203d397ea9b68bdc9c658d21cd9afaf8ae8223def83f2a7ebbd  LICENSE.txt
+sha256  1efe6c78b28b4203d397ea9b68bdc9c658d21cd9afaf8ae8223def83f2a7ebbd  LICENSE.txt
diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index a6ddeb24a6..8b113d4ab7 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/PyICU/json
-md5 7656f5cc53a7c18b40e653d6eefdee14   PyICU-1.9.7.tar.gz
+md5  7656f5cc53a7c18b40e653d6eefdee14  PyICU-1.9.7.tar.gz
 # Locally computed
 sha256  db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
 sha256  74bbadee4ee3c3a1ac0ecfbd74bc7ce64046de1ceddf4717dc923809ca8ffce3  LICENSE
diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 62dac5cbbf..5570c1c9f6 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5	c48e442cef7b1e865b4d96ab92f509ad pylibftdi-0.18.1.tar.gz
-sha256	bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
+md5  c48e442cef7b1e865b4d96ab92f509ad  pylibftdi-0.18.1.tar.gz
+sha256  bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0e40132339e1ef7d17d93837fbc273d1e87302e9295162bd19c9161e5700ddcc  LICENSE.txt
diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
index b54b4aad27..c946ba9d9b 100644
--- a/package/python-pyqrcode/python-pyqrcode.hash
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/pyqrcode/json
-md5	371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
+md5  371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
 # Locally computed
-sha256	fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
+sha256  fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
 sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
index 91738321a9..376f9786e5 100644
--- a/package/python-pyratemp/python-pyratemp.hash
+++ b/package/python-pyratemp/python-pyratemp.hash
@@ -1,5 +1,5 @@
 #md5 from https://pypi.python.org/pypi?:action=show_md5&digest=e4bbe5d4a98016efef882b2b2f47defb
-md5     e4bbe5d4a98016efef882b2b2f47defb pyratemp-0.3.2.tgz
+md5  e4bbe5d4a98016efef882b2b2f47defb  pyratemp-0.3.2.tgz
 # Locally calculated:
 sha256  c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71  pyratemp-0.3.2.tgz
 sha256  3de57a97f9c8492808867ae2ac2b33b422a8a34d29d0ea981b9e85c0963462db  LICENSE
diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 35f397b14a..c292379ebf 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5	371683b62314211b8bc9807ac8ef1144  pyroute2-0.5.7.tar.gz
-sha256	963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98  pyroute2-0.5.7.tar.gz
+md5  371683b62314211b8bc9807ac8ef1144  pyroute2-0.5.7.tar.gz
+sha256  963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98  pyroute2-0.5.7.tar.gz
 # Locally computed sha256
-sha256 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
-sha256 e329111754f1340de20b6084cae4d264b7b4fc8fb48964173f8ee0cb7440a51c  README.license.md
+sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
+sha256  e329111754f1340de20b6084cae4d264b7b4fc8fb48964173f8ee0cb7440a51c  README.license.md
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index b0c7a5d270..bb13f0ef00 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5	10a9dd140ad512eed9f37344df83ce9d  pysmi-0.3.4.tar.gz
-sha256	bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c  pysmi-0.3.4.tar.gz
+md5  10a9dd140ad512eed9f37344df83ce9d  pysmi-0.3.4.tar.gz
+sha256  bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c  pysmi-0.3.4.tar.gz
 # Locally computed sha256 checksums
-sha256	c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
+sha256  c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 22d8dcb47e..52a507f4b3 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
-md5	01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
+md5  01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
 # Locally computed
-sha256	00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
+sha256  00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
 sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 582f9d6661..3b0af1af62 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5	2222880259daf6e2cb322e938c818276  pysnmp-4.4.12.tar.gz
-sha256	0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9  pysnmp-4.4.12.tar.gz
+md5  2222880259daf6e2cb322e938c818276  pysnmp-4.4.12.tar.gz
+sha256  0c3dbef2f958caca96071fe5c19de43e9c1b0484ab02a0cf08b190bcee768ba9  pysnmp-4.4.12.tar.gz
 # Locally computed sha256 checksums
-sha256	d0b2edd772164395320fc5ad7dfaa9806fa038fb29762b347c549891d7a79237  LICENSE.rst
+sha256  d0b2edd772164395320fc5ad7dfaa9806fa038fb29762b347c549891d7a79237  LICENSE.rst
diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
index dc61bfbc5c..2c1f13d681 100644
--- a/package/python-pysocks/python-pysocks.hash
+++ b/package/python-pysocks/python-pysocks.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysocks/json
-md5	89b1a6865c61bae67a32417517612ee6  PySocks-1.7.1.tar.gz
-sha256	3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0  PySocks-1.7.1.tar.gz
+md5  89b1a6865c61bae67a32417517612ee6  PySocks-1.7.1.tar.gz
+sha256  3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0  PySocks-1.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256	7027e214e014eb78b7adcc1ceda5aca713a79fc4f6a0c52c9da5b3e707e6ffe9  LICENSE
+sha256  7027e214e014eb78b7adcc1ceda5aca713a79fc4f6a0c52c9da5b3e707e6ffe9  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index fb873caf71..675ce5680e 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5	23ba6121e2f916dfbf4015516779dfcd  pytablereader-0.26.1.tar.gz
-sha256	f2e1477de8886267b765af7861baacc65606761bfabb0689f118cc5d27861f26  pytablereader-0.26.1.tar.gz
+md5  23ba6121e2f916dfbf4015516779dfcd  pytablereader-0.26.1.tar.gz
+sha256  f2e1477de8886267b765af7861baacc65606761bfabb0689f118cc5d27861f26  pytablereader-0.26.1.tar.gz
 # Locally computed sha256 checksums
-sha256	7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
+sha256  7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 8933fe37d5..27a84f5fda 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5	4909dcdba8c6df35e14dbecbc6c94b6c  pytablewriter-0.46.1.tar.gz
-sha256	9d52ecc84bb89197c312e193b4ff04a3c934b914f3c32e4826d44a0acbc7764f  pytablewriter-0.46.1.tar.gz
+md5  4909dcdba8c6df35e14dbecbc6c94b6c  pytablewriter-0.46.1.tar.gz
+sha256  9d52ecc84bb89197c312e193b4ff04a3c934b914f3c32e4826d44a0acbc7764f  pytablewriter-0.46.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
index 0cfce57618..f24cd42e5a 100644
--- a/package/python-pyxb/python-pyxb.hash
+++ b/package/python-pyxb/python-pyxb.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
-md5	4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
-sha256	2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
+md5  4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
+sha256  2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
index 6f264193ec..7f6fc5b116 100644
--- a/package/python-raven/python-raven.hash
+++ b/package/python-raven/python-raven.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/raven/json
-md5	3676f31dadfa61526444dd0245c78a38  raven-6.10.0.tar.gz
-sha256	3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54  raven-6.10.0.tar.gz
+md5  3676f31dadfa61526444dd0245c78a38  raven-6.10.0.tar.gz
+sha256  3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54  raven-6.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
+sha256  5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 1b733fd7eb..833570b113 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
-md5	b1509735c4b4cf95df2619facbc3672e  requests-toolbelt-0.9.1.tar.gz
-sha256	968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0  requests-toolbelt-0.9.1.tar.gz
+md5  b1509735c4b4cf95df2619facbc3672e  requests-toolbelt-0.9.1.tar.gz
+sha256  968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0  requests-toolbelt-0.9.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3a1a3cffa7abc000cbd726a664f56c33c532a55480f9e056dfe941cf93b7c37f  LICENSE
+sha256  3a1a3cffa7abc000cbd726a664f56c33c532a55480f9e056dfe941cf93b7c37f  LICENSE
diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index 620efd27ad..09d1a90765 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/rpi_gpio/json
 # sha256 from https://pypi.python.org/pypi/rpi_gpio/json
-md5 777617f9dea9a1680f9af43db0cf150e RPi.GPIO-0.7.0.tar.gz
-sha256 7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f RPi.GPIO-0.7.0.tar.gz
+md5  777617f9dea9a1680f9af43db0cf150e  RPi.GPIO-0.7.0.tar.gz
+sha256  7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f  RPi.GPIO-0.7.0.tar.gz
 # Locally computed
 sha256  a668b3edecb3e69e81ec25987257008208ffcba9d6c43682033b8060c5f2f994  LICENCE.txt
diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
index 5c01701ef3..1547c592a2 100644
--- a/package/python-scandir/python-scandir.hash
+++ b/package/python-scandir/python-scandir.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scandir/json
-md5	f8378f4d9f95a6a78e97ab01aa900c1d  scandir-1.10.0.tar.gz
-sha256	4d4631f6062e658e9007ab3149a9b914f3548cb38bfb021c64f39a025ce578ae  scandir-1.10.0.tar.gz
+md5  f8378f4d9f95a6a78e97ab01aa900c1d  scandir-1.10.0.tar.gz
+sha256  4d4631f6062e658e9007ab3149a9b914f3548cb38bfb021c64f39a025ce578ae  scandir-1.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a5e2fbdc239744419d29407cdbc92793c4d9c1d956c174f7cb7f96fa6d058c86  LICENSE.txt
+sha256  a5e2fbdc239744419d29407cdbc92793c4d9c1d956c174f7cb7f96fa6d058c86  LICENSE.txt
diff --git a/package/python-sdnotify/python-sdnotify.hash b/package/python-sdnotify/python-sdnotify.hash
index b4106418ef..6d5bd1466c 100644
--- a/package/python-sdnotify/python-sdnotify.hash
+++ b/package/python-sdnotify/python-sdnotify.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdnotify/json
-md5	749ddca1c70be1697fecc443fb1fdb16  sdnotify-0.3.2.tar.gz
-sha256	73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1  sdnotify-0.3.2.tar.gz
+md5  749ddca1c70be1697fecc443fb1fdb16  sdnotify-0.3.2.tar.gz
+sha256  73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1  sdnotify-0.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256	038351c6f544a386576da41d5fe1320437ed211507565dd9c334c8290055b88e  LICENSE.txt
+sha256  038351c6f544a386576da41d5fe1320437ed211507565dd9c334c8290055b88e  LICENSE.txt
diff --git a/package/python-see/python-see.hash b/package/python-see/python-see.hash
index c48ee88b8b..de63b101bd 100644
--- a/package/python-see/python-see.hash
+++ b/package/python-see/python-see.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/see/json, sha256 locally computed
-md5	cb3bf4d314f73a8f7a2fd3d2d99aab54  see-1.4.1.tar.gz
-sha256	14f8f8a88a909a7d7dea81f0016e3fdfabd3b5d335992e102a382e1a71672bd1  see-1.4.1.tar.gz
+md5  cb3bf4d314f73a8f7a2fd3d2d99aab54  see-1.4.1.tar.gz
+sha256  14f8f8a88a909a7d7dea81f0016e3fdfabd3b5d335992e102a382e1a71672bd1  see-1.4.1.tar.gz
 sha256  dccbd040a7deacee7f05e5e46a8eba6e786ac319f0cb94c36f92d789585911a6  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
index e4f169ed9d..6b3b1de3dd 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5	1c9351fa5cebd12e76488737a7c78f2e  setuptools_scm_git_archive-1.1.tar.gz
-sha256	6026f61089b73fa1b5ee737e95314f41cb512609b393530385ed281d0b46c062  setuptools_scm_git_archive-1.1.tar.gz
+md5  1c9351fa5cebd12e76488737a7c78f2e  setuptools_scm_git_archive-1.1.tar.gz
+sha256  6026f61089b73fa1b5ee737e95314f41cb512609b393530385ed281d0b46c062  setuptools_scm_git_archive-1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-shutilwhich/python-shutilwhich.hash b/package/python-shutilwhich/python-shutilwhich.hash
index b1a2c7854f..ddf3cefdaa 100644
--- a/package/python-shutilwhich/python-shutilwhich.hash
+++ b/package/python-shutilwhich/python-shutilwhich.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=915947c5cdae7afd748ac715ee547adb, sha256 locally computed.
-md5	915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
-sha256	db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
+md5  915947c5cdae7afd748ac715ee547adb  shutilwhich-1.1.0.tar.gz
+sha256  db1f39c6461e42f630fa617bb8c79090f7711c9ca493e615e43d0610ecb64dc6  shutilwhich-1.1.0.tar.gz
diff --git a/package/python-simplegeneric/python-simplegeneric.hash b/package/python-simplegeneric/python-simplegeneric.hash
index 24f652c8e7..1dc42d35e2 100644
--- a/package/python-simplegeneric/python-simplegeneric.hash
+++ b/package/python-simplegeneric/python-simplegeneric.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/simplegeneric, sha256 locally computed
-md5 f9c1fab00fd981be588fc32759f474e3 simplegeneric-0.8.1.zip
-sha256 dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173 simplegeneric-0.8.1.zip
+md5  f9c1fab00fd981be588fc32759f474e3  simplegeneric-0.8.1.zip
+sha256  dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173  simplegeneric-0.8.1.zip
diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 7b4a91de0c..404670aef3 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5	f1d4f2ec14e2c782a62e451587477598  SimpleSQLite-0.45.2.tar.gz
-sha256	0b19c99c36b63173a715649f94a2fc3aee8deb9b70c683d584bca85e5930244b  SimpleSQLite-0.45.2.tar.gz
+md5  f1d4f2ec14e2c782a62e451587477598  SimpleSQLite-0.45.2.tar.gz
+sha256  0b19c99c36b63173a715649f94a2fc3aee8deb9b70c683d584bca85e5930244b  SimpleSQLite-0.45.2.tar.gz
 # Locally computed sha256 checksums
-sha256	98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
+sha256  98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
diff --git a/package/python-smbus-cffi/python-smbus-cffi.hash b/package/python-smbus-cffi/python-smbus-cffi.hash
index ed851eb6fa..4474d0b9a3 100644
--- a/package/python-smbus-cffi/python-smbus-cffi.hash
+++ b/package/python-smbus-cffi/python-smbus-cffi.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f621c871bd658ee665751ad78e3b2df9
-md5     f621c871bd658ee665751ad78e3b2df9  smbus-cffi-0.5.1.tar.gz
+md5  f621c871bd658ee665751ad78e3b2df9  smbus-cffi-0.5.1.tar.gz
 # Locally computed
 sha256  fb4195aaabfc01586863f60d3190b5cb1bf8f12622fd597e23e48768dad6bde8  smbus-cffi-0.5.1.tar.gz
 sha256  d54f57bf73bd1ff19a424b6deab6ff08f6089a2469c8de360b167f755e4ecb4c  LICENSE
diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index 13128ee3e5..c74d7c470c 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # sha256 from https://pypi.org/project/spidev
-sha256	8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d  spidev-3.5.tar.gz
+sha256  8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d  spidev-3.5.tar.gz
 
 # locally computed
-sha256	153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
+sha256  153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 991293b5a9..3274e10fd3 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5	af9722657ba51131703dbe75f24b054a  SQLAlchemy-1.3.10.tar.gz
-sha256	0f0768b5db594517e1f5e1572c73d14cf295140756431270d89496dc13d5e46c  SQLAlchemy-1.3.10.tar.gz
+md5  af9722657ba51131703dbe75f24b054a  SQLAlchemy-1.3.10.tar.gz
+sha256  0f0768b5db594517e1f5e1572c73d14cf295140756431270d89496dc13d5e46c  SQLAlchemy-1.3.10.tar.gz
 # Locally computed sha256 checksums
-sha256	0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
+sha256  0acffa15f3427e94014235e3c44376f6fe5df0ff461a93a9116eebcce74c056e  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index a03abe342b..d7e329eda2 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5	2ce34181d6b7b234c9f3c0ecd1ffb93e  sqlparse-0.3.0.tar.gz
-sha256	7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873  sqlparse-0.3.0.tar.gz
+md5  2ce34181d6b7b234c9f3c0ecd1ffb93e  sqlparse-0.3.0.tar.gz
+sha256  7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873  sqlparse-0.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
+sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 1e5cee5cec..789b48590d 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/
-md5 5071ea5bcb976186e92a3f5e75df221d systemd-python-234.tar.gz
+md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
 # Locally computed
 sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index e959246138..0fca58354b 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5	f8b2b0df1adf3f83b829a85e31bddb2d  tempora-1.14.1.tar.gz
-sha256	cb60b1d2b1664104e307f8e5269d7f4acdb077c82e35cd57246ae14a3427d2d6  tempora-1.14.1.tar.gz
+md5  f8b2b0df1adf3f83b829a85e31bddb2d  tempora-1.14.1.tar.gz
+sha256  cb60b1d2b1664104e307f8e5269d7f4acdb077c82e35cd57246ae14a3427d2d6  tempora-1.14.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 7cccc3ec97..36365cc3d3 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5	043e89644f8909d462fbbfa511c768df  termcolor-1.1.0.tar.gz
-sha256	1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b  termcolor-1.1.0.tar.gz
+md5  043e89644f8909d462fbbfa511c768df  termcolor-1.1.0.tar.gz
+sha256  1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b  termcolor-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	497b3272b67b94a7aa58fa3748d21b62b29ccb783b1cda816f594e3932590bbf  COPYING.txt
+sha256  497b3272b67b94a7aa58fa3748d21b62b29ccb783b1cda816f594e3932590bbf  COPYING.txt
diff --git a/package/python-tomako/python-tomako.hash b/package/python-tomako/python-tomako.hash
index 65576f4196..e2d56536a1 100644
--- a/package/python-tomako/python-tomako.hash
+++ b/package/python-tomako/python-tomako.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/tomako/json
-md5	a2e9e99be4ddf2263ed441ddc3dfcf96  tomako-0.1.0.post1.tar.gz
+md5  a2e9e99be4ddf2263ed441ddc3dfcf96  tomako-0.1.0.post1.tar.gz
 # Locally computed
-sha256	2d8ec113199408eb16ec00361aac6f10b716925779b6331083f304d01dafd150  tomako-0.1.0.post1.tar.gz
+sha256  2d8ec113199408eb16ec00361aac6f10b716925779b6331083f304d01dafd150  tomako-0.1.0.post1.tar.gz
 sha256  2b55167354e331f089d5f7a9a9ef4149b0baa95abd6860b6390a04001e1f2bb8  LICENSE
diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 8a61b29ad7..8251ae48d2 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/tqdm
-md5	285af1f905f4c375f03a86a667047950  tqdm-4.40.1.tar.gz
-sha256	e405d16c98fcf30725d0c9d493ed07302a18846b5452de5253030ccd18996f87  tqdm-4.40.1.tar.gz
+md5  285af1f905f4c375f03a86a667047950  tqdm-4.40.1.tar.gz
+sha256  e405d16c98fcf30725d0c9d493ed07302a18846b5452de5253030ccd18996f87  tqdm-4.40.1.tar.gz
 # Locally computed sha256 checksums
-sha256	1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
+sha256  1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index af542c7f2e..220b5fb23e 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -2,4 +2,4 @@
 md5  dbb53821a3ce3e921e09c5de4f722fdb  txtorcon-21.1.0.tar.gz
 sha256  aebf0b9ec6c69a029f6b61fd534e785692e28fdcd2fd003ce3cc132b9393b7d6  txtorcon-21.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
+sha256  3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-vcversioner/python-vcversioner.hash b/package/python-vcversioner/python-vcversioner.hash
index 58573a18b3..1f982cd455 100644
--- a/package/python-vcversioner/python-vcversioner.hash
+++ b/package/python-vcversioner/python-vcversioner.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/vcversioner/json, sha256 locally computed
-md5	aab6ef5e0cf8614a1b1140ed5b7f107d  vcversioner-2.16.0.0.tar.gz
-sha256	dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b  vcversioner-2.16.0.0.tar.gz
+md5  aab6ef5e0cf8614a1b1140ed5b7f107d  vcversioner-2.16.0.0.tar.gz
+sha256  dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b  vcversioner-2.16.0.0.tar.gz
diff --git a/package/python-visitor/python-visitor.hash b/package/python-visitor/python-visitor.hash
index 6e0cffbd95..a6f0ec710e 100644
--- a/package/python-visitor/python-visitor.hash
+++ b/package/python-visitor/python-visitor.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/visitor/json, sha256 locally computed
-md5    94a024ed0ec1b02b4497c15267d319ca  visitor-0.1.3.tar.gz
-sha256 2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a  visitor-0.1.3.tar.gz
-sha256 184d1ebb65da97ada36447f3c028f2fd4890b874f17b18c023ce200dd96639af  LICENSE
+md5  94a024ed0ec1b02b4497c15267d319ca  visitor-0.1.3.tar.gz
+sha256  2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a  visitor-0.1.3.tar.gz
+sha256  184d1ebb65da97ada36447f3c028f2fd4890b874f17b18c023ce200dd96639af  LICENSE
diff --git a/package/python-webencodings/python-webencodings.hash b/package/python-webencodings/python-webencodings.hash
index 90f5e66264..47577a6d3e 100644
--- a/package/python-webencodings/python-webencodings.hash
+++ b/package/python-webencodings/python-webencodings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webencodings/json
-md5	32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
-sha256	b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
+md5  32f6e261d52e57bf7e1c4d41546d15b8  webencodings-0.5.1.tar.gz
+sha256  b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923  webencodings-0.5.1.tar.gz
 # Locally computed sha256 checksumms
-sha256	c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
+sha256  c27693b0174d6d04dafd0242857ae72763f5404b675972c777fd865bc3c0abe1  PKG-INFO
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 6af6abeff1..ed3da6b1ab 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/web.py/json
-md5	4e7ec89e7ae1e938d01fff01ba752606  web.py-0.40.tar.gz
-sha256	dc5e42ffbc42d77d07f75b7acca9975a3368ae609774e49ddebb497a784131f3  web.py-0.40.tar.gz
+md5  4e7ec89e7ae1e938d01fff01ba752606  web.py-0.40.tar.gz
+sha256  dc5e42ffbc42d77d07f75b7acca9975a3368ae609774e49ddebb497a784131f3  web.py-0.40.tar.gz
 # Locally computed sha256 checksums
-sha256	791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
+sha256  791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
diff --git a/package/python-whoosh/python-whoosh.hash b/package/python-whoosh/python-whoosh.hash
index c615beb9c3..a1eced0e39 100644
--- a/package/python-whoosh/python-whoosh.hash
+++ b/package/python-whoosh/python-whoosh.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/whoosh/json
-md5 c2710105f20b3e29936bd2357383c325 Whoosh-2.7.4.tar.gz
+md5  c2710105f20b3e29936bd2357383c325  Whoosh-2.7.4.tar.gz
 # Locally computed
 sha256  7ca5633dbfa9e0e0fa400d3151a8a0c4bec53bd2ecedc0a67705b17565c31a83  Whoosh-2.7.4.tar.gz
 sha256  464ef68037a0e5545e4716b4ff99f3f85ca89cf9e9a7ecfd7a02039ba1c34a90  LICENSE.txt
diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index 109768d28e..1e809fee0a 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ws4py/json
-md5	68e0cfae9659dd059ff7e7a8218af548  ws4py-0.5.1.tar.gz
-sha256	29d073d7f2e006373e6a848b1d00951a1107eb81f3742952be905429dc5a5483  ws4py-0.5.1.tar.gz
+md5  68e0cfae9659dd059ff7e7a8218af548  ws4py-0.5.1.tar.gz
+sha256  29d073d7f2e006373e6a848b1d00951a1107eb81f3742952be905429dc5a5483  ws4py-0.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3c98d9e820de01b1ae3be846419700ab9cefa22b09aa0ef441b3bfd5613c3ba1  LICENSE
+sha256  3c98d9e820de01b1ae3be846419700ab9cefa22b09aa0ef441b3bfd5613c3ba1  LICENSE
diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index c6a446b6bf..120541f998 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5 3a87f81bff4cb4f8a52881097ba51a49 python-xlib-0.27.tar.bz2
-sha256 a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348 python-xlib-0.27.tar.bz2
+md5  3a87f81bff4cb4f8a52881097ba51a49  python-xlib-0.27.tar.bz2
+sha256  a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348  python-xlib-0.27.tar.bz2
 # Locally computed sha256 checksums
-sha256 06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300 LICENSE
+sha256  06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300  LICENSE
diff --git a/package/python-xlutils/python-xlutils.hash b/package/python-xlutils/python-xlutils.hash
index aa507883a6..908aa4d680 100644
--- a/package/python-xlutils/python-xlutils.hash
+++ b/package/python-xlutils/python-xlutils.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/xlutils/json
-md5	7a6a339ddaacabce244341582ee61353  xlutils-2.0.0.tar.gz
+md5  7a6a339ddaacabce244341582ee61353  xlutils-2.0.0.tar.gz
 # sha256 calculated by scanpypi
-sha256	7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54  xlutils-2.0.0.tar.gz
+sha256  7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54  xlutils-2.0.0.tar.gz
 # Locally computed
 sha256  28907976ee86414cc720fafc966563b16eeb6a6aeb1da5f5ed40bac3a8808bcf  xlutils/license.txt
diff --git a/package/python-xlwt/python-xlwt.hash b/package/python-xlwt/python-xlwt.hash
index 8b0511fdae..826643d568 100644
--- a/package/python-xlwt/python-xlwt.hash
+++ b/package/python-xlwt/python-xlwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlwt/json
-md5	4b1ca8a3cef3261f4b4dc3f138e383a8  xlwt-1.3.0.tar.gz
-sha256	c59912717a9b28f1a3c2a98fd60741014b06b043936dcecbc113eaaada156c88  xlwt-1.3.0.tar.gz
+md5  4b1ca8a3cef3261f4b4dc3f138e383a8  xlwt-1.3.0.tar.gz
+sha256  c59912717a9b28f1a3c2a98fd60741014b06b043936dcecbc113eaaada156c88  xlwt-1.3.0.tar.gz
 # Locally computed
 sha256  7f7b66f23fdac4f68fe3b342dd16b329d511017a901784a5ceb83f505f2de7c6  docs/licenses.rst
diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
index 4a9c194885..181adda1bb 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.hash
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
-md5	3895445752278ddcc4578658c3c9a492  zc.lockfile-2.0.tar.gz
-sha256	307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b  zc.lockfile-2.0.tar.gz
+md5  3895445752278ddcc4578658c3c9a492  zc.lockfile-2.0.tar.gz
+sha256  307ad78227e48be260e64896ec8886edc7eae22d8ec53e4d528ab5537a83203b  zc.lockfile-2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
+sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 89aaf1d71b..d302d92783 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
-sha256 d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 8849620905..f1ad364ca3 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.tar.xz.mirrorlist
-sha256 d907060b355512ceb7a8c3f6980e3979c20d54320b6804303b6c5e8ed42d3912  qtenginio-opensource-src-1.6.3.tar.xz
+sha256  d907060b355512ceb7a8c3f6980e3979c20d54320b6804303b6c5e8ed42d3912  qtenginio-opensource-src-1.6.3.tar.xz
 
 # Hashes for license files:
 sha256  245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index 293cee4d59..d63908ad8f 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3	quagga-1.2.4.tar.gz
+sha256  e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3  quagga-1.2.4.tar.gz
 
 # Hash for license file
-sha256	b39c1bad4e51e2a3389cd25fc4addebe41a3ae7c11100795683f9330de1536e5	COPYING
+sha256  b39c1bad4e51e2a3389cd25fc4addebe41a3ae7c11100795683f9330de1536e5  COPYING
diff --git a/package/quotatool/quotatool.hash b/package/quotatool/quotatool.hash
index 45b477830e..d41fd4ed1b 100644
--- a/package/quotatool/quotatool.hash
+++ b/package/quotatool/quotatool.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 e53adc480d54ae873d160dc0e88d78095f95d9131e528749fd982245513ea090 quotatool-1.6.2.tar.gz
+sha256  e53adc480d54ae873d160dc0e88d78095f95d9131e528749fd982245513ea090  quotatool-1.6.2.tar.gz
 
 # Hash for license files:
-sha256 94686eeb98a40edc64106c6f8644068d8a08816a510a3cde75e50f1bf470564d COPYING
+sha256  94686eeb98a40edc64106c6f8644068d8a08816a510a3cde75e50f1bf470564d  COPYING
diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index e8b2c4d547..3c16abee60 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-1.1.0.tar.gz
-sha256 a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
+sha256  bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-1.1.0.tar.gz
+sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidxml/rapidxml.hash b/package/rapidxml/rapidxml.hash
index 398bc147c2..292901f4c2 100644
--- a/package/rapidxml/rapidxml.hash
+++ b/package/rapidxml/rapidxml.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/rapidxml/files/rapidxml/rapidxml%201.13/
-sha1 f5fd4fbc5ad7e96045313697811d65ea8089a950 rapidxml-1.13.zip
-md5 7b4b42c9331c90aded23bb55dc725d6a rapidxml-1.13.zip
+sha1  f5fd4fbc5ad7e96045313697811d65ea8089a950  rapidxml-1.13.zip
+md5  7b4b42c9331c90aded23bb55dc725d6a  rapidxml-1.13.zip
 
 # Locally calculated
 sha256  c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571  rapidxml-1.13.zip
diff --git a/package/raspi-gpio/raspi-gpio.hash b/package/raspi-gpio/raspi-gpio.hash
index 41d885f317..c3d9540f45 100644
--- a/package/raspi-gpio/raspi-gpio.hash
+++ b/package/raspi-gpio/raspi-gpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2526dcec1e5a171b13c44b1fb6f2faed5ec849f08021278e2be09bc18264a2fd  raspi-gpio-4edfde183ff3ac9ed66cdc015ae25e45f3a5502d.tar.gz
-sha256 6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
+sha256  2526dcec1e5a171b13c44b1fb6f2faed5ec849f08021278e2be09bc18264a2fd  raspi-gpio-4edfde183ff3ac9ed66cdc015ae25e45f3a5502d.tar.gz
+sha256  6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
diff --git a/package/rcw-smarc-sal28/rcw-smarc-sal28.hash b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
index 6ca5df77cd..17562137ba 100644
--- a/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
+++ b/package/rcw-smarc-sal28/rcw-smarc-sal28.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256	8c1c3e26407141ee8d8bd16a43c16c0459b01a60e6e25ca47e22c7499b3e4e65  rcw-smarc-sal28-11.tar.gz
-sha256	803c65088eed36a6697ca9f03f4379bbad24e276dc8da7fef5eb4dc4008415a1  COPYING
+sha256  8c1c3e26407141ee8d8bd16a43c16c0459b01a60e6e25ca47e22c7499b3e4e65  rcw-smarc-sal28-11.tar.gz
+sha256  803c65088eed36a6697ca9f03f4379bbad24e276dc8da7fef5eb4dc4008415a1  COPYING
diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
index 780e6ac86d..cb01e52099 100644
--- a/package/reaver/reaver.hash
+++ b/package/reaver/reaver.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 73189782b208d12b8dddc4f29d32e1f72b1f3609e573c9ea9510deebec394583  reaver-1.6.6.tar.gz
-sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a  docs/LICENSE
+sha256  73189782b208d12b8dddc4f29d32e1f72b1f3609e573c9ea9510deebec394583  reaver-1.6.6.tar.gz
+sha256  bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a  docs/LICENSE
diff --git a/package/rings/rings.hash b/package/rings/rings.hash
index c9a758b54d..f1377d5a9f 100644
--- a/package/rings/rings.hash
+++ b/package/rings/rings.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
-sha256 f582a0c43737391070827ef273df0145b594b095ad2f49595701368b729e024f  rings-v_1_3_0/doc/us/license.html
+sha256  627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
+sha256  f582a0c43737391070827ef273df0145b594b095ad2f49595701368b729e024f  rings-v_1_3_0/doc/us/license.html
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index cd2dbedfb4..71e74e1bcf 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
-sha256 0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
+sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
+sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rockchip-mali/rockchip-mali.hash b/package/rockchip-mali/rockchip-mali.hash
index 38efcb3077..446bf9ac65 100644
--- a/package/rockchip-mali/rockchip-mali.hash
+++ b/package/rockchip-mali/rockchip-mali.hash
@@ -1,2 +1,2 @@
-sha256 ee440d859e9d7dfdf29b9a00c7a633337913c407be567d3651c29c12eb75fd9c  rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427.tar.gz
-sha256 a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285  END_USER_LICENCE_AGREEMENT.txt
+sha256  ee440d859e9d7dfdf29b9a00c7a633337913c407be567d3651c29c12eb75fd9c  rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427.tar.gz
+sha256  a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 6ab7d89265..b5f117db54 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
-sha256 2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
+sha256  5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
+sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 6418c25a5c..5266e5b7a1 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db rrdtool-1.7.2.tar.gz
-sha256 ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320 COPYRIGHT
-sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388 LICENSE
+sha256  a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db  rrdtool-1.7.2.tar.gz
+sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rs485conf/rs485conf.hash b/package/rs485conf/rs485conf.hash
index 315f90a375..d2fc191673 100644
--- a/package/rs485conf/rs485conf.hash
+++ b/package/rs485conf/rs485conf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f163f81cd50aae6fa39cbb4f6408a3699da7a87a56649c4b96d6f168c9be6a7d rs485conf-5c8d00cf70950fab3454549b81dea843d844492a.tar.gz
-sha256 3e5c80d50879a9572ac9e463215a942490a67b56dfd8a3e27004d7c62e0493c8 LICENSE
+sha256  f163f81cd50aae6fa39cbb4f6408a3699da7a87a56649c4b96d6f168c9be6a7d  rs485conf-5c8d00cf70950fab3454549b81dea843d844492a.tar.gz
+sha256  3e5c80d50879a9572ac9e463215a942490a67b56dfd8a3e27004d7c62e0493c8  LICENSE
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 4f84e0d0ca..3adda60f42 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 b5e7959bcb5c703b2743030751af975ea4e04962e29fc1118f4b605987585735  rt-tests-2.3.tar.xz
+sha256  b5e7959bcb5c703b2743030751af975ea4e04962e29fc1118f4b605987585735  rt-tests-2.3.tar.xz
 # locally computed hash
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index a20e63782b..0403664639 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9edf0304bf142215d3bc85a0771446b6a72d0ad8218efbe184b41e4c9c7542af  rtorrent-0.9.8.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  9edf0304bf142215d3bc85a0771446b6a72d0ad8218efbe184b41e4c9c7542af  rtorrent-0.9.8.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtptools/rtptools.hash b/package/rtptools/rtptools.hash
index 11c8c2ab4b..6988483b81 100644
--- a/package/rtptools/rtptools.hash
+++ b/package/rtptools/rtptools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28	rtptools-1.22.tar.gz
-sha256	f864592065e232c0b444ae9682a7a1a2c6aafe96712999f794bec24d4441a6a9	LICENSE
+sha256  2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28  rtptools-1.22.tar.gz
+sha256  f864592065e232c0b444ae9682a7a1a2c6aafe96712999f794bec24d4441a6a9  LICENSE
diff --git a/package/rubix/rubix.hash b/package/rubix/rubix.hash
index 3992110c32..8ff5431824 100644
--- a/package/rubix/rubix.hash
+++ b/package/rubix/rubix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87  rubix-1.0.6.tar.bz2
-sha256 429d04118c02bc92d834c430601f8c0c8df1ab27e3617ec73ad3f66c5953475d  LICENCE
+sha256  ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87  rubix-1.0.6.tar.bz2
+sha256  429d04118c02bc92d834c430601f8c0c8df1ab27e3617ec73ad3f66c5953475d  LICENCE
diff --git a/package/sdl/sdl.hash b/package/sdl/sdl.hash
index 2c46975dc3..6154541a49 100644
--- a/package/sdl/sdl.hash
+++ b/package/sdl/sdl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00	SDL-1.2.15.tar.gz
+sha256  d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00  SDL-1.2.15.tar.gz
 # Locally computed
-sha256	bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0	COPYING
+sha256  bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 621a920219..6572ee8d54 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0  SDL2_image-2.0.5.tar.gz
-sha256 45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25  COPYING.txt
+sha256  bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0  SDL2_image-2.0.5.tar.gz
+sha256  45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25  COPYING.txt
diff --git a/package/sdl_gfx/sdl_gfx.hash b/package/sdl_gfx/sdl_gfx.hash
index afd4653667..6e94b238da 100644
--- a/package/sdl_gfx/sdl_gfx.hash
+++ b/package/sdl_gfx/sdl_gfx.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/sdlgfx/files/
-md5	fcc3c4f2d1b4943409bf7e67dd65d03a	SDL_gfx-2.0.23.tar.gz
-sha1	aae60e7fed539f3f8a0a0bd6da3bbcf625642596	SDL_gfx-2.0.23.tar.gz
+md5  fcc3c4f2d1b4943409bf7e67dd65d03a  SDL_gfx-2.0.23.tar.gz
+sha1  aae60e7fed539f3f8a0a0bd6da3bbcf625642596  SDL_gfx-2.0.23.tar.gz
 # Locally computed
 sha256  4f5df842266c59b2d7e6ef35b53d7f37b13795d93baf3ed211f502c216f7bc89  COPYING
 sha256  5f3bc98e0bd2de83279bd62868d4bc0c2b4f811ab828b036d36a4a6d1cd5672d  LICENSE
diff --git a/package/sedutil/sedutil.hash b/package/sedutil/sedutil.hash
index 9db1011379..26643ef684 100644
--- a/package/sedutil/sedutil.hash
+++ b/package/sedutil/sedutil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9259466b4f73af276153c5245834a56f48f8721ea7263611b5d5e8326bc43d9e  sedutil-1.15.1.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  Common/LICENSE.txt
+sha256  9259466b4f73af276153c5245834a56f48f8721ea7263611b5d5e8326bc43d9e  sedutil-1.15.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  Common/LICENSE.txt
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
index 74428a177c..fdb0919f11 100644
--- a/package/setools/setools.hash
+++ b/package/setools/setools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	202eac5f857475937bee8136cff278aa2b4a4b94a0dec63fbbbe18c9eb644a4e setools-4.4.0.tar.gz
-sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624 COPYING
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING.GPL
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL
+sha256  202eac5f857475937bee8136cff278aa2b4a4b94a0dec63fbbbe18c9eb644a4e  setools-4.4.0.tar.gz
+sha256  2f7547e10f76a382c24c053595f38a5cc6dda9347f508f254ca490e0046a9624  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index d1f6fa9777..b016fef5cf 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  shapelib-1.5.0.tar.gz
-sha256 7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
-sha256 a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
+sha256  1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  shapelib-1.5.0.tar.gz
+sha256  7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
+sha256  a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index b86499cd58..062d76da3c 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	18b2f0fe07ed0d6f81951a5fd5ece44de9c8aeb4dc5bb20d4f595f6cc6bd403e	shared-mime-info-1.12.tar.xz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  18b2f0fe07ed0d6f81951a5fd5ece44de9c8aeb4dc5bb20d4f595f6cc6bd403e  shared-mime-info-1.12.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
index 634aa73454..6bbaf73c16 100644
--- a/package/shellinabox/shellinabox.hash
+++ b/package/shellinabox/shellinabox.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-2.20.tar.gz
-sha256 04ef60ab9b83cde6f0862ea18474454477efb34c52ebce1f8d8260a398a39362  COPYING
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL-2
+sha256  27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-2.20.tar.gz
+sha256  04ef60ab9b83cde6f0862ea18474454477efb34c52ebce1f8d8260a398a39362  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL-2
diff --git a/package/slang/slang.hash b/package/slang/slang.hash
index faa34c8207..3e211ab548 100644
--- a/package/slang/slang.hash
+++ b/package/slang/slang.hash
@@ -1,6 +1,6 @@
 # sha1 from http://www.jedsoft.org/releases/slang/, sha256 locally computed
-sha1 bbf7f2dcc14e7c7fca40868fd4b411a2bd9e2655 slang-2.3.2.tar.bz2
-sha256 fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a slang-2.3.2.tar.bz2
+sha1  bbf7f2dcc14e7c7fca40868fd4b411a2bd9e2655  slang-2.3.2.tar.bz2
+sha256  fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a  slang-2.3.2.tar.bz2
 
 # License file, locally computed
-sha256 ff05a90962e7773f8bdc47b2a9585130526039102759b524c1dffbd57cfe469b  COPYING
+sha256  ff05a90962e7773f8bdc47b2a9585130526039102759b524c1dffbd57cfe469b  COPYING
diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index ea4c449c42..642a1f62fe 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256	2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
+sha256  2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
 
 # Locally generated
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smstools3/smstools3.hash b/package/smstools3/smstools3.hash
index 27eda2af96..83831160e6 100644
--- a/package/smstools3/smstools3.hash
+++ b/package/smstools3/smstools3.hash
@@ -1,5 +1,5 @@
 # From http://smstools3.kekekasvi.com/packages/
-md5  6a9f038fb38a49cc3a4f8f14a88fb8af smstools-3.1.21.tar.gz
+md5  6a9f038fb38a49cc3a4f8f14a88fb8af  smstools-3.1.21.tar.gz
 sha256  a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084  smstools3-3.1.21.tar.gz
 
 # Hash for license files
diff --git a/package/snmpclitools/snmpclitools.hash b/package/snmpclitools/snmpclitools.hash
index 4dcbdcb6e0..575bfbced8 100644
--- a/package/snmpclitools/snmpclitools.hash
+++ b/package/snmpclitools/snmpclitools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/snmpclitools/json
-md5	132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
-sha256	820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+md5  132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
+sha256  820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
 # Locally computed sha256 checksums
-sha256	ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
+sha256  ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 01bdc629f0..41bd845372 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f579fa938f6d5d0622f23b3c163b3de5dc171e30175e44511bf269b3bb9fb1fc softether-4.30-9700-beta.tar.gz
-sha256 5da6241ddb987c4543bf1cbba6b40a3cd3ecb624dbd4a63daf04440911656bde LICENSE
+sha256  f579fa938f6d5d0622f23b3c163b3de5dc171e30175e44511bf269b3bb9fb1fc  softether-4.30-9700-beta.tar.gz
+sha256  5da6241ddb987c4543bf1cbba6b40a3cd3ecb624dbd4a63daf04440911656bde  LICENSE
diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
index 7a4d3e1313..575cf31c8c 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.hash
+++ b/package/sound-theme-borealis/sound-theme-borealis.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727	Borealis_sound_theme_ogg-0.9a.tar.bz2
+sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.hash b/package/sound-theme-freedesktop/sound-theme-freedesktop.hash
index cde02ca3e6..55b6993e6d 100644
--- a/package/sound-theme-freedesktop/sound-theme-freedesktop.hash
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e6595afb02b76099ef6df42c2ac7c4f9680c21c3f26b2a7ca0943d1fdbbd9aef	sound-theme-freedesktop-0.7.tar.bz2
+sha256  e6595afb02b76099ef6df42c2ac7c4f9680c21c3f26b2a7ca0943d1fdbbd9aef  sound-theme-freedesktop-0.7.tar.bz2
diff --git a/package/squeezelite/squeezelite.hash b/package/squeezelite/squeezelite.hash
index 0b21d861b9..67ed4c8797 100644
--- a/package/squeezelite/squeezelite.hash
+++ b/package/squeezelite/squeezelite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7f0342f4943d3c3498d930060f5a1e8d63ccb7282b9c21f964926e310449d592 squeezelite-71c012ad9ba102feb95823b7b9dc17e5305689c7.tar.gz
-sha256 dc01c3da33fea11ed918f9e437b88baa59c70401aab0dad747e33dd9e8035706 LICENSE.txt
+sha256  7f0342f4943d3c3498d930060f5a1e8d63ccb7282b9c21f964926e310449d592  squeezelite-71c012ad9ba102feb95823b7b9dc17e5305689c7.tar.gz
+sha256  dc01c3da33fea11ed918f9e437b88baa59c70401aab0dad747e33dd9e8035706  LICENSE.txt
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 306634d28e..6ae3fae82b 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	eeabeb0d9801688a218f6f0a76ea3546a46a322ccaca9a258148ecacfe083ffd  SuperTuxKart-1.3-src.tar.xz
-sha256	d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
+sha256  eeabeb0d9801688a218f6f0a76ea3546a46a322ccaca9a258148ecacfe083ffd  SuperTuxKart-1.3-src.tar.xz
+sha256  d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 08b2b5a1ef..64fe4f979e 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc	swig-4.0.2.tar.gz
-sha256	f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e	LICENSE
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE-GPL
-sha256	7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2	LICENSE-UNIVERSITIES
+sha256  d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc  swig-4.0.2.tar.gz
+sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
+sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
index 08a5d0a221..39fa76612d 100644
--- a/package/sylpheed/sylpheed.hash
+++ b/package/sylpheed/sylpheed.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 0d6bc5eb46f5d0a463757c62bc80b00d219b294b3c3662840e4540f6db2e3e49  sylpheed-3.7.0.tar.xz
-sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  0d6bc5eb46f5d0a463757c62bc80b00d219b294b3c3662840e4540f6db2e3e49  sylpheed-3.7.0.tar.xz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index 8a053cf941..248fd9dce7 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-2.0.12-beta.tar.gz
-sha256 4921009cd76e7d38a8e873c362b25dbaf032c320bbb36a40dec775ddbdcbe1d8  LICENSE
+sha256  06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-2.0.12-beta.tar.gz
+sha256  4921009cd76e7d38a8e873c362b25dbaf032c320bbb36a40dec775ddbdcbe1d8  LICENSE
diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index 5b3c7837e2..f81e55fc44 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757  sysvinit-2.99.tar.xz
+sha256  b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757  sysvinit-2.99.tar.xz
 
 # Hash for license files:
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/szip/szip.hash b/package/szip/szip.hash
index 3b582d901d..5d3ee042f9 100644
--- a/package/szip/szip.hash
+++ b/package/szip/szip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412 szip-2.1.1.tar.gz
-sha256 98cc66747133b26563fefc4630ad4c8c7848c722c7b8a60ecd4afbc4c7d7eb01 COPYING
+sha256  21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412  szip-2.1.1.tar.gz
+sha256  98cc66747133b26563fefc4630ad4c8c7848c722c7b8a60ecd4afbc4c7d7eb01  COPYING
diff --git a/package/taskd/taskd.hash b/package/taskd/taskd.hash
index 63bb87c1b6..d3f8bb250e 100644
--- a/package/taskd/taskd.hash
+++ b/package/taskd/taskd.hash
@@ -1,5 +1,5 @@
 # From http://taskwarrior.org/download/
-sha1 ded339deeee65277e4712f71a9159502f8b20b52 taskd-1.1.0.tar.gz
+sha1  ded339deeee65277e4712f71a9159502f8b20b52  taskd-1.1.0.tar.gz
 # Locally calculated
 sha256  7b8488e687971ae56729ff4e2e5209ff8806cf8cd57718bfd7e521be130621b4  taskd-1.1.0.tar.gz
 sha256  84d1a8c2e6e306864ff350857a36b6c74756e61e2eae6822cf2fa88212720f68  COPYING
diff --git a/package/tcping/tcping.hash b/package/tcping/tcping.hash
index 49f6e5ba0b..c97c0fa2a4 100644
--- a/package/tcping/tcping.hash
+++ b/package/tcping/tcping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a731f0e48ff931d7b2a0e896e4db40867043740fe901dd225780f2164fdbdcf3	tcping-1.3.6.tar.gz
-sha256	4a35620e27ddb8de27898e4206c8f93633d877c1e128e98e95a035f760d94428	LICENSE
+sha256  a731f0e48ff931d7b2a0e896e4db40867043740fe901dd225780f2164fdbdcf3  tcping-1.3.6.tar.gz
+sha256  4a35620e27ddb8de27898e4206c8f93633d877c1e128e98e95a035f760d94428  LICENSE
diff --git a/package/thttpd/thttpd.hash b/package/thttpd/thttpd.hash
index 4bdd7fe74b..a29b9b2dcb 100644
--- a/package/thttpd/thttpd.hash
+++ b/package/thttpd/thttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397	thttpd-2.29.tar.gz
-sha256	be059e6b8219d5bb5480fa6a2864bbb34892f56951d03d08b356bc1fa8c81a01	thttpd.c
+sha256  99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397  thttpd-2.29.tar.gz
+sha256  be059e6b8219d5bb5480fa6a2864bbb34892f56951d03d08b356bc1fa8c81a01  thttpd.c
diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 4dee321838..f71ae0cfe7 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc90db9ace3490d426215	ti_cgt_pru_2.3.3_linux_installer_x86.bin
-sha256	913cb4ab564f874b7c9a11726a16c4ccdc7ecc60be2738201281a1e28dc93641	PRU_Code_Generation_Tools_2.3.x_manifest.html
-sha256	5e198df9782c63cedc8363f0e298b241a9a8084398a925f6e1003dbcb60801cb	pru_rts_2_3_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
+sha256  1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc90db9ace3490d426215  ti_cgt_pru_2.3.3_linux_installer_x86.bin
+sha256  913cb4ab564f874b7c9a11726a16c4ccdc7ecc60be2738201281a1e28dc93641  PRU_Code_Generation_Tools_2.3.x_manifest.html
+sha256  5e198df9782c63cedc8363f0e298b241a9a8084398a925f6e1003dbcb60801cb  pru_rts_2_3_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
diff --git a/package/time/time.hash b/package/time/time.hash
index cea57dc254..3afa036321 100644
--- a/package/time/time.hash
+++ b/package/time/time.hash
@@ -1,5 +1,5 @@
 # From https://lists.gnu.org/archive/html/info-gnu/2018-03/msg00004.html
-sha1	75068c26abbed3ad3980685bae21d7202d288317				time-1.9.tar.gz
-sha256	fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e	time-1.9.tar.gz
+sha1  75068c26abbed3ad3980685bae21d7202d288317  time-1.9.tar.gz
+sha256  fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e  time-1.9.tar.gz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 5bd7aa2b1f..4e12a29040 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108 tinc-1.0.36.tar.gz
-sha256  3b37ffbf3459f2aceeef169aa65ee8b111ac1f8ba24a2a1b90b079678a9c7faa COPYING
-sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
+sha256  40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108  tinc-1.0.36.tar.gz
+sha256  3b37ffbf3459f2aceeef169aa65ee8b111ac1f8ba24a2a1b90b079678a9c7faa  COPYING
+sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b  COPYING.README
diff --git a/package/tinymembench/tinymembench.hash b/package/tinymembench/tinymembench.hash
index c0b767e939..04dbd30f81 100644
--- a/package/tinymembench/tinymembench.hash
+++ b/package/tinymembench/tinymembench.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-0.4.tar.gz
-sha256 8ba473aced4630aee2808efe17b53e904a9d68a9b3361de491717f9a4e75da39  LICENSE
+sha256  e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-0.4.tar.gz
+sha256  8ba473aced4630aee2808efe17b53e904a9d68a9b3361de491717f9a4e75da39  LICENSE
diff --git a/package/tinyxml/tinyxml.hash b/package/tinyxml/tinyxml.hash
index 650a3b227e..9e9a4f7220 100644
--- a/package/tinyxml/tinyxml.hash
+++ b/package/tinyxml/tinyxml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8164c9ad48b9028667768a584d62f7760cfbfb90d0dd6214ad174403058da10c	tinyxml-2.6.2_2.tar.gz
-sha256	a65b8363834ccbe31ab7b49dcba723ed204622df30326793e0121435624c1a8d	README
+sha256  8164c9ad48b9028667768a584d62f7760cfbfb90d0dd6214ad174403058da10c  tinyxml-2.6.2_2.tar.gz
+sha256  a65b8363834ccbe31ab7b49dcba723ed204622df30326793e0121435624c1a8d  README
diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
index 89d0461a98..430ea52c1b 100644
--- a/package/tovid/tovid.hash
+++ b/package/tovid/tovid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c03a746a3592a656bab0be4045da114a4231eb0f858d6c18503dac64049fbe48  tovid-87c676f4aadb7303d2cd921380b054bafa4b85bb.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  c03a746a3592a656bab0be4045da114a4231eb0f858d6c18503dac64049fbe48  tovid-87c676f4aadb7303d2cd921380b054bafa4b85bb.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
index a2da230a7e..bfbdfb8355 100644
--- a/package/tpm-tools/tpm-tools.hash
+++ b/package/tpm-tools/tpm-tools.hash
@@ -1,7 +1,7 @@
 # http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.9.1/
-sha1 c35cb031c6b5220dd1c8a03995654fdd12aa3031 tpm-tools-1.3.9.1.tar.gz
-md5  1532293aa632a0eaa7e60df87c779855         tpm-tools-1.3.9.1.tar.gz
+sha1  c35cb031c6b5220dd1c8a03995654fdd12aa3031  tpm-tools-1.3.9.1.tar.gz
+md5  1532293aa632a0eaa7e60df87c779855  tpm-tools-1.3.9.1.tar.gz
 
 # Locally calculated
-sha256 9cb714e2650826e2e932f65bc0ba9d61b927dc5fea47f2c2a2b64f0fdfcbfa68 tpm-tools-1.3.9.1.tar.gz
-sha256 7b47225a5b77cb7825efc6a4d7e0ac57864c790542cf92f5080ec2bf310c00e5 LICENSE
+sha256  9cb714e2650826e2e932f65bc0ba9d61b927dc5fea47f2c2a2b64f0fdfcbfa68  tpm-tools-1.3.9.1.tar.gz
+sha256  7b47225a5b77cb7825efc6a4d7e0ac57864c790542cf92f5080ec2bf310c00e5  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index a3fcb394cf..f7cf06162c 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
-sha256 67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
+sha256  0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
+sha256  67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
index b952548741..83791c18a4 100644
--- a/package/traceroute/traceroute.hash
+++ b/package/traceroute/traceroute.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6  traceroute-2.1.0.tar.gz
+sha256  3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6  traceroute-2.1.0.tar.gz
 
 # Hash for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
index f7522514e1..24da8ea684 100644
--- a/package/trinity/trinity.hash
+++ b/package/trinity/trinity.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7e0da953c2cc6fb3907d1f37d35f61836433fb50e97117a72eef113abb783dc6  trinity-1.9.tar.xz
-sha256 35e3fc68c89fd7b8f72fd910b521cb3292f859e9181f3c26bd0df84d144bc1d4  COPYING
+sha256  7e0da953c2cc6fb3907d1f37d35f61836433fb50e97117a72eef113abb783dc6  trinity-1.9.tar.xz
+sha256  35e3fc68c89fd7b8f72fd910b521cb3292f859e9181f3c26bd0df84d144bc1d4  COPYING
diff --git a/package/tstools/tstools.hash b/package/tstools/tstools.hash
index 9b0f1c7cea..54f4ecc89d 100644
--- a/package/tstools/tstools.hash
+++ b/package/tstools/tstools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3d2b2375e2874933f9aa59d4f25bb6b334747219eb0d7a076974e61222d59bf6  tstools-08f6be304040e7b84760ac3920bcff4a563b6cd2.tar.gz
+sha256  3d2b2375e2874933f9aa59d4f25bb6b334747219eb0d7a076974e61222d59bf6  tstools-08f6be304040e7b84760ac3920bcff4a563b6cd2.tar.gz
diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index b095f5aaa9..12c41c6e5c 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3 turbolua-2.1.3.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3  turbolua-2.1.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/udev-gentoo-scripts/udev-gentoo-scripts.hash b/package/udev-gentoo-scripts/udev-gentoo-scripts.hash
index 60563baae0..99e6a9fe22 100644
--- a/package/udev-gentoo-scripts/udev-gentoo-scripts.hash
+++ b/package/udev-gentoo-scripts/udev-gentoo-scripts.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b206f72c93cd2e51ed59061931918a9c23c3c1f7e6caffacc9d4f8915a42c30a  udev-gentoo-scripts-33.tar.bz2
-sha256 329f95829088b95650b9012ae688f09baa1637985425a7964d33683363f48702  init.d/udev-settle
+sha256  b206f72c93cd2e51ed59061931918a9c23c3c1f7e6caffacc9d4f8915a42c30a  udev-gentoo-scripts-33.tar.bz2
+sha256  329f95829088b95650b9012ae688f09baa1637985425a7964d33683363f48702  init.d/udev-settle
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index 43831d72a7..b2a3ddc5a9 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
index aef69262f7..0e07a714ee 100644
--- a/package/ulogd/ulogd.hash
+++ b/package/ulogd/ulogd.hash
@@ -1,7 +1,7 @@
 # From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.7.tar.bz2.{md5sum,sha1sum}
-md5	2bb2868cf51acbb90c35763c9f995f31	ulogd-2.0.7.tar.bz2
-sha1	f2d90469e2842e2bfbe19c55cf6d56ac107aa4b9	ulogd-2.0.7.tar.bz2
+md5  2bb2868cf51acbb90c35763c9f995f31  ulogd-2.0.7.tar.bz2
+sha1  f2d90469e2842e2bfbe19c55cf6d56ac107aa4b9  ulogd-2.0.7.tar.bz2
 
 # Locally calculated
-sha256	990a05494d9c16029ba0a83f3b7294fc05c756546b8d60d1c1572dc25249a92b	ulogd-2.0.7.tar.bz2
-sha256	b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf	COPYING
+sha256  990a05494d9c16029ba0a83f3b7294fc05c756546b8d60d1c1572dc25249a92b  ulogd-2.0.7.tar.bz2
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/urg/urg.hash b/package/urg/urg.hash
index f2c5f14304..363504d2ef 100644
--- a/package/urg/urg.hash
+++ b/package/urg/urg.hash
@@ -1,6 +1,6 @@
 # from http://pkgs.fedoraproject.org/repo/pkgs/urg/urg-0.8.18.zip/
-md5		93f90d2ccc36e784407c5282ef6bd2cb	urg-0.8.18.zip
+md5  93f90d2ccc36e784407c5282ef6bd2cb  urg-0.8.18.zip
 # Locally calculated
-sha256	b2cab7e539c90c60fc99a2350a42b5d5390ff952b694b196c3cbb54623cfee7f	urg-0.8.18.zip
+sha256  b2cab7e539c90c60fc99a2350a42b5d5390ff952b694b196c3cbb54623cfee7f  urg-0.8.18.zip
 # License files, locally calculated
-sha256	9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1	COPYING
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 922913b27d..9071a72490 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,5 +1,5 @@
 # From http://www.draisberghof.de/usb_modeswitch/
-md5	e8fce7eb949cbe16c61fb71bade4cc17  usb-modeswitch-data-20191128.tar.bz2
+md5  e8fce7eb949cbe16c61fb71bade4cc17  usb-modeswitch-data-20191128.tar.bz2
 # Locally calculated
-sha256	3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9  usb-modeswitch-data-20191128.tar.bz2
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9  usb-modeswitch-data-20191128.tar.bz2
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/ussp-push/ussp-push.hash b/package/ussp-push/ussp-push.hash
index 36c79cfa5d..58874ab181 100644
--- a/package/ussp-push/ussp-push.hash
+++ b/package/ussp-push/ussp-push.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd	ussp-push-0.11.tar.gz
+sha256  bb2748eaed6164812555b4a1e186c4f2820c5ef9ce30f12d7aac28a452719bbd  ussp-push-0.11.tar.gz
 # License files, locally calculated
-sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/utp_com/utp_com.hash b/package/utp_com/utp_com.hash
index bc25be209f..9a680f2753 100644
--- a/package/utp_com/utp_com.hash
+++ b/package/utp_com/utp_com.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8b5ba0058a78de69faf6822bb10b457fff2f9e55dc112ccb81c35214b061c6e6 utp_com-dee512ced1e9367d223d22f10797fbf9aeacfab6.tar.gz
-sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
+sha256  8b5ba0058a78de69faf6822bb10b457fff2f9e55dc112ccb81c35214b061c6e6  utp_com-dee512ced1e9367d223d22f10797fbf9aeacfab6.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
index 21c62fae1d..b31ba70ad9 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5989461541a91fe4de4ca9c396d4e7b2f4a8663fc9d6155d0830d2b143fce4d  vdr-plugin-vnsiserver-1.8.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  d5989461541a91fe4de4ca9c396d4e7b2f4a8663fc9d6155d0830d2b143fce4d  vdr-plugin-vnsiserver-1.8.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vmtouch/vmtouch.hash b/package/vmtouch/vmtouch.hash
index 451bf56868..197794f4f6 100644
--- a/package/vmtouch/vmtouch.hash
+++ b/package/vmtouch/vmtouch.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 d57b7b3ae1146c4516429ab7d6db6f2122401db814ddd9cdaad10980e9c8428c  vmtouch-1.3.1.tar.gz
+sha256  d57b7b3ae1146c4516429ab7d6db6f2122401db814ddd9cdaad10980e9c8428c  vmtouch-1.3.1.tar.gz
 
 # Hash for license files:
-sha256 13258709ed29c17394e0a3ba8c8b9360af35b85231db514f11a0ba385cecd08e  LICENSE
+sha256  13258709ed29c17394e0a3ba8c8b9360af35b85231db514f11a0ba385cecd08e  LICENSE
diff --git a/package/vtun/vtun.hash b/package/vtun/vtun.hash
index 363c980987..b69b987bec 100644
--- a/package/vtun/vtun.hash
+++ b/package/vtun/vtun.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/vtun/files/vtun/3.0.4/
-md5 f952c5895ae8f40235aaad9a8f41a4bd  vtun-3.0.4.tar.gz
-sha1 2335c21b56fadf9ce851dd7f342fb0ed4f522c47  vtun-3.0.4.tar.gz
+md5  f952c5895ae8f40235aaad9a8f41a4bd  vtun-3.0.4.tar.gz
+sha1  2335c21b56fadf9ce851dd7f342fb0ed4f522c47  vtun-3.0.4.tar.gz
 # Locally computed:
-sha256 abf8df6b15e3febeaaeae2ce24ead7105eb1537ad4ec0d830c83cbb684fd98b9  vtun-3.0.4.tar.gz
-sha256 5692a9a69dc5abc1aa9cbc54899d114b65c4cefbd9d7fcecc304316a2f26ced3  README.OpenSSL
+sha256  abf8df6b15e3febeaaeae2ce24ead7105eb1537ad4ec0d830c83cbb684fd98b9  vtun-3.0.4.tar.gz
+sha256  5692a9a69dc5abc1aa9cbc54899d114b65c4cefbd9d7fcecc304316a2f26ced3  README.OpenSSL
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 09a34d6b47..4ff1a3485b 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256 33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
+sha256  33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
 
 # Locally calculated
-sha256 fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
+sha256  fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.hash b/package/webrtc-audio-processing/webrtc-audio-processing.hash
index 1376054f20..18b8ea6410 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.hash
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf  webrtc-audio-processing-0.3.1.tar.xz
-sha256	9b79539028e216e813e152d45f5c1ed5fdd0554426ad50270fb03134e7082dac  COPYING
+sha256  a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf  webrtc-audio-processing-0.3.1.tar.xz
+sha256  9b79539028e216e813e152d45f5c1ed5fdd0554426ad50270fb03134e7082dac  COPYING
diff --git a/package/wf111/wf111.hash b/package/wf111/wf111.hash
index e3a5c484f7..604ce79ef0 100644
--- a/package/wf111/wf111.hash
+++ b/package/wf111/wf111.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	33de265d28702ce32bb292f29a43e9e946382a1e31f1e4feae0f4753cf18b4f4	wf111-linux-driver_5.2.2-r4_armv7-a.tar.gz
-sha256	fbe86a30e4025b9f510feb4cb8f846aca82f8f3e8f6c8a28a74baf45c87f6e96	wf111-linux-driver_5.2.2-r4_armv5te.tar.gz
-sha256	37983d73f60bab9768eb02a89695448f27cd1964e23cf462e76657344a9c67ac	wf111-linux-driver-5-2-2-r3-x86.tar.gz
+sha256  33de265d28702ce32bb292f29a43e9e946382a1e31f1e4feae0f4753cf18b4f4  wf111-linux-driver_5.2.2-r4_armv7-a.tar.gz
+sha256  fbe86a30e4025b9f510feb4cb8f846aca82f8f3e8f6c8a28a74baf45c87f6e96  wf111-linux-driver_5.2.2-r4_armv5te.tar.gz
+sha256  37983d73f60bab9768eb02a89695448f27cd1964e23cf462e76657344a9c67ac  wf111-linux-driver-5-2-2-r3-x86.tar.gz
diff --git a/package/whetstone/whetstone.hash b/package/whetstone/whetstone.hash
index db9bbb4548..3f1dc63f30 100644
--- a/package/whetstone/whetstone.hash
+++ b/package/whetstone/whetstone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf  whetstone.c
+sha256  333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf  whetstone.c
diff --git a/package/wireless_tools/wireless_tools.hash b/package/wireless_tools/wireless_tools.hash
index 50a3f62b84..8ca73ef2d1 100644
--- a/package/wireless_tools/wireless_tools.hash
+++ b/package/wireless_tools/wireless_tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63 wireless_tools.30.pre9.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
+sha256  abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63  wireless_tools.30.pre9.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/wpan-tools/wpan-tools.hash b/package/wpan-tools/wpan-tools.hash
index c9f0df2c1b..814e3b0f7a 100644
--- a/package/wpan-tools/wpan-tools.hash
+++ b/package/wpan-tools/wpan-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3e509d9ed838df1247cc9a0c6ca483cb356ae778851817bd7410044687b655e2	wpan-tools-0.9.tar.gz
-sha256	fe8e595c24d821a60885eb259619df5e5e3976c48465fde0be29fcd78530798f	COPYING
+sha256  3e509d9ed838df1247cc9a0c6ca483cb356ae778851817bd7410044687b655e2  wpan-tools-0.9.tar.gz
+sha256  fe8e595c24d821a60885eb259619df5e5e3976c48465fde0be29fcd78530798f  COPYING
diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
index 0e3e5933ca..591a76a96d 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.hash
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 14b77861638a5e863fd10d60ad460a961dc108ea5b915f71461a18d5e6be8e4e  wsapi-fcgi-1.7-1.src.rock
-sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
-sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
+sha256  14b77861638a5e863fd10d60ad460a961dc108ea5b915f71461a18d5e6be8e4e  wsapi-fcgi-1.7-1.src.rock
+sha256  6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
+sha256  c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
index 6045117b9b..aa089f7cd1 100644
--- a/package/wsapi-xavante/wsapi-xavante.hash
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 01211bb80dab92f87cece6e31854d73ae4a2ce06af7c48423a54313d72adf9fb  wsapi-xavante-1.7-1.src.rock
-sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
-sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
+sha256  01211bb80dab92f87cece6e31854d73ae4a2ce06af7c48423a54313d72adf9fb  wsapi-xavante-1.7-1.src.rock
+sha256  6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
+sha256  c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
diff --git a/package/wsapi/wsapi.hash b/package/wsapi/wsapi.hash
index a89853de2e..81895c713b 100644
--- a/package/wsapi/wsapi.hash
+++ b/package/wsapi/wsapi.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256 1a0829dffd6bdbf99f5c4278d504cda5ede9344d5089bdcf5216c9eb2999ae22  wsapi-1.7-1.src.rock
-sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
-sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
+sha256  1a0829dffd6bdbf99f5c4278d504cda5ede9344d5089bdcf5216c9eb2999ae22  wsapi-1.7-1.src.rock
+sha256  6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi/doc/us/license.html
+sha256  c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi/doc/us/license.md
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
index 614d54382b..bf806ab0d7 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
@@ -1,8 +1,8 @@
 # From https://lists.x.org/archives/xorg-announce/2017-November/002821.html
-md5 2a455d3c02390597feb9cefb3fe97a45  bdftopcf-1.1.tar.bz2
-sha1 48a783337a5aa49ebc102c9788ff0f43ea35c5c4  bdftopcf-1.1.tar.bz2
-sha256 4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2  bdftopcf-1.1.tar.bz2
-sha512 7b790e8d512ca2812ac889c156ef91c48798b4744a6857e5b17e0128764b5afa8c5426fe5de05a9819d64745116718db4221b3e657e3c2633465e87179c44bec  bdftopcf-1.1.tar.bz2
+md5  2a455d3c02390597feb9cefb3fe97a45  bdftopcf-1.1.tar.bz2
+sha1  48a783337a5aa49ebc102c9788ff0f43ea35c5c4  bdftopcf-1.1.tar.bz2
+sha256  4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2  bdftopcf-1.1.tar.bz2
+sha512  7b790e8d512ca2812ac889c156ef91c48798b4744a6857e5b17e0128764b5afa8c5426fe5de05a9819d64745116718db4221b3e657e3c2633465e87179c44bec  bdftopcf-1.1.tar.bz2
 
 # Locally calculated
-sha256 a437fb5272ba507c2977b2ef623bb391270f521b2a20271ed044785f4eaa5dbc  COPYING
+sha256  a437fb5272ba507c2977b2ef623bb391270f521b2a20271ed044785f4eaa5dbc  COPYING
diff --git a/package/x11r7/xapp_ico/xapp_ico.hash b/package/x11r7/xapp_ico/xapp_ico.hash
index 693aff65f7..a0970cd507 100644
--- a/package/x11r7/xapp_ico/xapp_ico.hash
+++ b/package/x11r7/xapp_ico/xapp_ico.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002880.html
-md5 7895f2d109f4206b6d2db37257e07d12  ico-1.0.5.tar.bz2
-sha1 8759ec954375f3a1b37dc920a12790bfbfb0cad3  ico-1.0.5.tar.bz2
-sha256 d73b62f29eb98d850f16b76d759395180b860b613fbe1686b18eee99a6e3773f  ico-1.0.5.tar.bz2
-sha512 93a94a66d4a41b39d4b3657050e58f8269d352dae5d5916c9ecdda1cb14f23b9d159d67c50fdfa654b4b1c2ad11434bed140ace70703c82b05d3fe8686aab8f6  ico-1.0.5.tar.bz2
+md5  7895f2d109f4206b6d2db37257e07d12  ico-1.0.5.tar.bz2
+sha1  8759ec954375f3a1b37dc920a12790bfbfb0cad3  ico-1.0.5.tar.bz2
+sha256  d73b62f29eb98d850f16b76d759395180b860b613fbe1686b18eee99a6e3773f  ico-1.0.5.tar.bz2
+sha512  93a94a66d4a41b39d4b3657050e58f8269d352dae5d5916c9ecdda1cb14f23b9d159d67c50fdfa654b4b1c2ad11434bed140ace70703c82b05d3fe8686aab8f6  ico-1.0.5.tar.bz2
 # Locally computed
-sha256 97ef3a622f2f385cabfc8ab7aff13dc46468c10a5520670b5edfa33f2c3999eb COPYING
+sha256  97ef3a622f2f385cabfc8ab7aff13dc46468c10a5520670b5edfa33f2c3999eb  COPYING
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
index b345b448f9..c8893f88b3 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.hash
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002856.html
-md5 973f6d25a6f0990720b98a15c9436b92  oclock-1.0.4.tar.bz2
-sha1 0bc8f3f44290950f60af894e20e0ceb0c5e8e862  oclock-1.0.4.tar.bz2
-sha256 cc20cfc1c0d5128d89e1eecd9ba52e58f111075be163e0aeda5690dbaafbaefe  oclock-1.0.4.tar.bz2
-sha512 6e0d36a84572a153226b2929f2253cb7adc3c9e5e3af168aeaf8c487ade2e43517b271a8e9cdb2a2c4a67ca56ed0b99c194ca63a4a822b68bfc72ca6518335e7  oclock-1.0.4.tar.bz2
+md5  973f6d25a6f0990720b98a15c9436b92  oclock-1.0.4.tar.bz2
+sha1  0bc8f3f44290950f60af894e20e0ceb0c5e8e862  oclock-1.0.4.tar.bz2
+sha256  cc20cfc1c0d5128d89e1eecd9ba52e58f111075be163e0aeda5690dbaafbaefe  oclock-1.0.4.tar.bz2
+sha512  6e0d36a84572a153226b2929f2253cb7adc3c9e5e3af168aeaf8c487ade2e43517b271a8e9cdb2a2c4a67ca56ed0b99c194ca63a4a822b68bfc72ca6518335e7  oclock-1.0.4.tar.bz2
 # Locally computed
-sha256 f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
+sha256  f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index 12a7d3689a..b8f55b50c5 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-June/002994.html
-md5 92be564d4be7d8aa7b5024057b715210  sessreg-1.1.2.tar.bz2
-sha1 169c1ff9fb152b4b4ca0cfbd3e1aee33af042016  sessreg-1.1.2.tar.bz2
-sha256 dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33  sessreg-1.1.2.tar.bz2
-sha512 7e3c2bdcadb7133aace463b58d8c6108d315ec95d2a42509073eeddc7f02644092a4b3168bd3b426c041736a016291092e0bf8368acd620dbeff96d53d12f98c  sessreg-1.1.2.tar.bz2
+md5  92be564d4be7d8aa7b5024057b715210  sessreg-1.1.2.tar.bz2
+sha1  169c1ff9fb152b4b4ca0cfbd3e1aee33af042016  sessreg-1.1.2.tar.bz2
+sha256  dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33  sessreg-1.1.2.tar.bz2
+sha512  7e3c2bdcadb7133aace463b58d8c6108d315ec95d2a42509073eeddc7f02644092a4b3168bd3b426c041736a016291092e0bf8368acd620dbeff96d53d12f98c  sessreg-1.1.2.tar.bz2
 # Locally computed
-sha256 ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
+sha256  ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index 9b40c0a533..3e2928dc4e 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-August/003020.html
-md5 38e6568271d8098327706c5cf855dbc7  viewres-1.0.6.tar.bz2
-sha1 f1d12e5b4e1180916edb44234599a486b025b480  viewres-1.0.6.tar.bz2
-sha256 11c15db02066c1d5fc3febf9b185d16c1112f87e37c4b101a484dcefffb80934  viewres-1.0.6.tar.bz2
-sha512 3f4cfc61608bc6c9b35ef66ceb473661ca01946d3306d54040d32803e8e0eec506a0ce37ea22bfe514544a6ba9645fd30f39b20c063aff696b3c0fda3fe95dff  viewres-1.0.6.tar.bz2
+md5  38e6568271d8098327706c5cf855dbc7  viewres-1.0.6.tar.bz2
+sha1  f1d12e5b4e1180916edb44234599a486b025b480  viewres-1.0.6.tar.bz2
+sha256  11c15db02066c1d5fc3febf9b185d16c1112f87e37c4b101a484dcefffb80934  viewres-1.0.6.tar.bz2
+sha512  3f4cfc61608bc6c9b35ef66ceb473661ca01946d3306d54040d32803e8e0eec506a0ce37ea22bfe514544a6ba9645fd30f39b20c063aff696b3c0fda3fe95dff  viewres-1.0.6.tar.bz2
 # Locally computed
-sha256 aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
+sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index b472c21b1f..673d3602ba 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002983.html
-md5 e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
-sha1 c54ebef80b6cb565397fe2e3069e0d7470027e5a  x11perf-1.6.1.tar.bz2
-sha256 1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34  x11perf-1.6.1.tar.bz2
-sha512 b386151bfe3d7c04ab9953ae1882f3c5b627d6d1afb9a8cfe87c58236a88883fc11bbadb2226b9aa61df84b4fce625a1c9e3d146a124ac17e8d7d605b35d9c0b  x11perf-1.6.1.tar.bz2
+md5  e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
+sha1  c54ebef80b6cb565397fe2e3069e0d7470027e5a  x11perf-1.6.1.tar.bz2
+sha256  1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34  x11perf-1.6.1.tar.bz2
+sha512  b386151bfe3d7c04ab9953ae1882f3c5b627d6d1afb9a8cfe87c58236a88883fc11bbadb2226b9aa61df84b4fce625a1c9e3d146a124ac17e8d7d605b35d9c0b  x11perf-1.6.1.tar.bz2
 # Locally computed
-sha256 f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
+sha256  f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index e66c1a67b1..966c3ba028 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -2,4 +2,4 @@
 sha256  78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200  xauth-1.1.2.tar.xz
 sha512  ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8  xauth-1.1.2.tar.xz
 # Locally computed
-sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
+sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
index 12d20525c2..bda5c32cde 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003008.html
-md5 5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
-sha1 f0a6163738143ec23542b459aef567309a119e0c  xbacklight-1.2.3.tar.bz2
-sha256 3a27f324777ae99fee476cfb2f064576fb8cba4eb77f97cda37adda1c1d39ade  xbacklight-1.2.3.tar.bz2
-sha512 717c87ce24634892fc4ac54fc59dcc0a5bc8f206aaf1d13410f95f7e4fe6e3dbc7ff8d951bcd8ea8c5e955357a00fea6ceadd4559e60b1a632e40f71290e12c7  xbacklight-1.2.3.tar.bz2
+md5  5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
+sha1  f0a6163738143ec23542b459aef567309a119e0c  xbacklight-1.2.3.tar.bz2
+sha256  3a27f324777ae99fee476cfb2f064576fb8cba4eb77f97cda37adda1c1d39ade  xbacklight-1.2.3.tar.bz2
+sha512  717c87ce24634892fc4ac54fc59dcc0a5bc8f206aaf1d13410f95f7e4fe6e3dbc7ff8d951bcd8ea8c5e955357a00fea6ceadd4559e60b1a632e40f71290e12c7  xbacklight-1.2.3.tar.bz2
 # Locally computed
-sha256 c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04 COPYING
+sha256  c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04  COPYING
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.hash b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
index 9c646785d4..690c932e37 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.hash
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003009.html
-md5 66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
-sha1 193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
-sha256 e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
-sha512 0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
+md5  66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
+sha1  193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
+sha256  e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
+sha512  0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
 # Locally computed
-sha256 9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
+sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index b893d01802..6f0d755261 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002989.html
-md5 ef8c7d4140c11efb8de4141b3968208c  xcompmgr-1.1.8.tar.bz2
-sha1 7bb28329b4bb687763df2d2c1723cb6ecb20945a  xcompmgr-1.1.8.tar.bz2
-sha256 0b89daf4f060fa3fa83cca862c45d531fef7121b5d06552c1d73d396ad9a7243  xcompmgr-1.1.8.tar.bz2
-sha512 ccf29426ffb0797a53653d1ce152de5eee0cec284811fed4b8e634ea0d948180531e4619d96f47e4f9594432c57322624fe0fdaee2c9200efac427fc0904953d  xcompmgr-1.1.8.tar.bz2
+md5  ef8c7d4140c11efb8de4141b3968208c  xcompmgr-1.1.8.tar.bz2
+sha1  7bb28329b4bb687763df2d2c1723cb6ecb20945a  xcompmgr-1.1.8.tar.bz2
+sha256  0b89daf4f060fa3fa83cca862c45d531fef7121b5d06552c1d73d396ad9a7243  xcompmgr-1.1.8.tar.bz2
+sha512  ccf29426ffb0797a53653d1ce152de5eee0cec284811fed4b8e634ea0d948180531e4619d96f47e4f9594432c57322624fe0fdaee2c9200efac427fc0904953d  xcompmgr-1.1.8.tar.bz2
 # Locally computed
-sha256 c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
+sha256  c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index 3966cef5e2..59d4a67194 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,5 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2022-July/003173.html
-sha256 7b4a6af068e40e2e6a4521d6f35c9253ec152c287d025fff9cc4c99f2586bba4  xconsole-1.0.8.tar.xz
-sha512 93fd8527abed4faaf0f6a3804ab08dbcb926b0aaf67fd814c003b6b1102e2f643be5362a020c7028ae928925ffd423df6eb456d4ed48cf30a4c5f00a7ce648fa  xconsole-1.0.8.tar.xz
+sha256  7b4a6af068e40e2e6a4521d6f35c9253ec152c287d025fff9cc4c99f2586bba4  xconsole-1.0.8.tar.xz
+sha512  93fd8527abed4faaf0f6a3804ab08dbcb926b0aaf67fd814c003b6b1102e2f643be5362a020c7028ae928925ffd423df6eb456d4ed48cf30a4c5f00a7ce648fa  xconsole-1.0.8.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 51031d62bc..2f64671434 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-January/002936.html
-md5 25cc7ca1ce5dcbb61c2b471c55e686b5  xcursorgen-1.0.7.tar.bz2
-sha1 109367eb23b0ad52cf5de15f50c02ebe872698ae  xcursorgen-1.0.7.tar.bz2
-sha256 35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d  xcursorgen-1.0.7.tar.bz2
-sha512 bd13ad23691d3daa2d5dcdc5902cf62e3dcb97a0289aff362e6cd85866a1d8cafb64f98800a75bfb4cf1f3c76244ca20201847dff594543d136d0abaec7011d2  xcursorgen-1.0.7.tar.bz2
+md5  25cc7ca1ce5dcbb61c2b471c55e686b5  xcursorgen-1.0.7.tar.bz2
+sha1  109367eb23b0ad52cf5de15f50c02ebe872698ae  xcursorgen-1.0.7.tar.bz2
+sha256  35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d  xcursorgen-1.0.7.tar.bz2
+sha512  bd13ad23691d3daa2d5dcdc5902cf62e3dcb97a0289aff362e6cd85866a1d8cafb64f98800a75bfb4cf1f3c76244ca20201847dff594543d136d0abaec7011d2  xcursorgen-1.0.7.tar.bz2
 # Locally computed
-sha256 8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
+sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
index 88b8438218..ad862c6e3a 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-October/001514.html
-sha1	281bee72116311e2d8393ae53ea832e9d267eded	xdbedizzy-1.1.0.tar.bz2
+sha1  281bee72116311e2d8393ae53ea832e9d267eded  xdbedizzy-1.1.0.tar.bz2
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index 0eb3a13ff7..4586c0b5a4 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,7 +1,7 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002570.html
-md5 3a909116a3b2abe3845215cf49e09fa5  xditview-1.0.5.tar.bz2
-sha1 f06f65bca31168c86bcebd7f92dbbda08817a5cc  xditview-1.0.5.tar.bz2
-sha256 eecb1ed51ab4edc7f454476d1248cfb7799a17c5679b3dd834e8b4658331c04b  xditview-1.0.5.tar.bz2
-sha512 e20c903f38394b496111267e142d84d11e69a3b89f91869652d1f2ee5c997a13f90bfa2966651b42cd3979a330b348a6e397cc6a74c45b1f3f91643e7c06765d  xditview-1.0.5.tar.bz2
+md5  3a909116a3b2abe3845215cf49e09fa5  xditview-1.0.5.tar.bz2
+sha1  f06f65bca31168c86bcebd7f92dbbda08817a5cc  xditview-1.0.5.tar.bz2
+sha256  eecb1ed51ab4edc7f454476d1248cfb7799a17c5679b3dd834e8b4658331c04b  xditview-1.0.5.tar.bz2
+sha512  e20c903f38394b496111267e142d84d11e69a3b89f91869652d1f2ee5c997a13f90bfa2966651b42cd3979a330b348a6e397cc6a74c45b1f3f91643e7c06765d  xditview-1.0.5.tar.bz2
 # Locally computed
-sha256 023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
+sha256  023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index 80a4ac48f4..21c50184c7 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002858.html
-md5 480e63cd365f03eb2515a6527d5f4ca6  xdriinfo-1.0.6.tar.bz2
-sha1 11682ae1f04a311b832651d78bbf4c6ac77f0ed9  xdriinfo-1.0.6.tar.bz2
-sha256 d9ccd2c3e87899417acc9ea1f3e319a4198112babe1dc711273584f607449d51  xdriinfo-1.0.6.tar.bz2
-sha512 7ddd9e19abaef93e4d85004293528ec3814ef84c470d496dbb8dc8313d804bb7520406de8d33d2bc2b3af942bd0a5d5032a109b2726438a966af63ea680a102f  xdriinfo-1.0.6.tar.bz2
+md5  480e63cd365f03eb2515a6527d5f4ca6  xdriinfo-1.0.6.tar.bz2
+sha1  11682ae1f04a311b832651d78bbf4c6ac77f0ed9  xdriinfo-1.0.6.tar.bz2
+sha256  d9ccd2c3e87899417acc9ea1f3e319a4198112babe1dc711273584f607449d51  xdriinfo-1.0.6.tar.bz2
+sha512  7ddd9e19abaef93e4d85004293528ec3814ef84c470d496dbb8dc8313d804bb7520406de8d33d2bc2b3af942bd0a5d5032a109b2726438a966af63ea680a102f  xdriinfo-1.0.6.tar.bz2
 # Locally computed
-sha256 de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
+sha256  de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
index 1a82db9ffe..1f898b8b21 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-October/001515.html
-sha1	030659e3728f5f7142e1cf727f147aceeabe4b9e	xf86dga-1.0.3.tar.bz2
+sha1  030659e3728f5f7142e1cf727f147aceeabe4b9e  xf86dga-1.0.3.tar.bz2
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.hash b/package/x11r7/xapp_xfd/xapp_xfd.hash
index d1f5c45432..ec85170180 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.hash
+++ b/package/x11r7/xapp_xfd/xapp_xfd.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002968.html
-md5 f9c9f2b101a96d4b50c2a4ab9b5ab5b1  xfd-1.1.3.tar.bz2
-sha1 ca6dbe2027b205992a52c6bb717a43508f12a8c4  xfd-1.1.3.tar.bz2
-sha256 192f938ba5830e84cc807d8ead2ad9655b43eaed6500c830f3e083aad10ed958  xfd-1.1.3.tar.bz2
-sha512 68e2d4ce5e24215353b6f3231191d69639c4dd90a703e03ccf152bbfe4012da071c387ba289f918fb0336a3be9ee49dc05cbec7273fa85f5e476ead7e10795f0  xfd-1.1.3.tar.bz2
+md5  f9c9f2b101a96d4b50c2a4ab9b5ab5b1  xfd-1.1.3.tar.bz2
+sha1  ca6dbe2027b205992a52c6bb717a43508f12a8c4  xfd-1.1.3.tar.bz2
+sha256  192f938ba5830e84cc807d8ead2ad9655b43eaed6500c830f3e083aad10ed958  xfd-1.1.3.tar.bz2
+sha512  68e2d4ce5e24215353b6f3231191d69639c4dd90a703e03ccf152bbfe4012da071c387ba289f918fb0336a3be9ee49dc05cbec7273fa85f5e476ead7e10795f0  xfd-1.1.3.tar.bz2
 # Locally computed
-sha256 57ae10f24fc110dafb3b8d7735cf26b1905ff74e716745b2520e4ccd7751095c  COPYING
+sha256  57ae10f24fc110dafb3b8d7735cf26b1905ff74e716745b2520e4ccd7751095c  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index 67480a51aa..dbdf8e0eda 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002949.html
-md5 0060d6151427d9e570e54fc52a88e7d7  xfsinfo-1.0.6.tar.bz2
-sha1 cbfe7470179f1ab5eecf992226dc1b28902c6b4c  xfsinfo-1.0.6.tar.bz2
-sha256 8a3e8b9b9ae6ed571989d04e1846d39b9043e28f7623b500ebe1d47762c9b1d6  xfsinfo-1.0.6.tar.bz2
-sha512 901fc3817d7c95f2ba75ed0c51de91abd8efa67bbb93ad6b7d66e56a2f721af9db364e92f9ef2e719835fd48e934a5ea7402e5565c0ccd9b6b82633e869dc57b  xfsinfo-1.0.6.tar.bz2
+md5  0060d6151427d9e570e54fc52a88e7d7  xfsinfo-1.0.6.tar.bz2
+sha1  cbfe7470179f1ab5eecf992226dc1b28902c6b4c  xfsinfo-1.0.6.tar.bz2
+sha256  8a3e8b9b9ae6ed571989d04e1846d39b9043e28f7623b500ebe1d47762c9b1d6  xfsinfo-1.0.6.tar.bz2
+sha512  901fc3817d7c95f2ba75ed0c51de91abd8efa67bbb93ad6b7d66e56a2f721af9db364e92f9ef2e719835fd48e934a5ea7402e5565c0ccd9b6b82633e869dc57b  xfsinfo-1.0.6.tar.bz2
 # Locally computed
-sha256 bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
+sha256  bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
index 0c3879441b..71eabccc44 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.hash
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002950.html
-md5 a48c72954ae6665e0616f6653636da8c  xhost-1.0.8.tar.bz2
-sha1 971670858a464d4f8eeb6f4e182f9fcd94149790  xhost-1.0.8.tar.bz2
-sha256 a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396  xhost-1.0.8.tar.bz2
-sha512 55581f9bc45a70a73b13fe718ca83c4cb0a6116d26addc0f07659ebeb5bf7d2379e84cab5a1702ae77a298a66f42ae03f41ddc7d5acd61c6f18448e58ad7cb6b  xhost-1.0.8.tar.bz2
+md5  a48c72954ae6665e0616f6653636da8c  xhost-1.0.8.tar.bz2
+sha1  971670858a464d4f8eeb6f4e182f9fcd94149790  xhost-1.0.8.tar.bz2
+sha256  a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396  xhost-1.0.8.tar.bz2
+sha512  55581f9bc45a70a73b13fe718ca83c4cb0a6116d26addc0f07659ebeb5bf7d2379e84cab5a1702ae77a298a66f42ae03f41ddc7d5acd61c6f18448e58ad7cb6b  xhost-1.0.8.tar.bz2
 # Locally computed
-sha256 7e69bed6fcfff05ecf454d7e4b29cd265172385833f1978f04b638f92f2cfecf  COPYING
+sha256  7e69bed6fcfff05ecf454d7e4b29cd265172385833f1978f04b638f92f2cfecf  COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 076bd64758..49c8099467 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002962.html
-md5 6d506ab2efc17a08e87778654e099d37  xinit-1.4.1.tar.bz2
-sha1 d874a2eecf2c30291e327851b151fdab8183260c  xinit-1.4.1.tar.bz2
-sha256 de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9  xinit-1.4.1.tar.bz2
-sha512 6cbc5d025a891c419f3f4493381b2fca57a67d78df866d2f16a83426f86bad6eca7f240fac12b25cbcc63df0fec41f625407184e044898602d66483715315340  xinit-1.4.1.tar.bz2
+md5  6d506ab2efc17a08e87778654e099d37  xinit-1.4.1.tar.bz2
+sha1  d874a2eecf2c30291e327851b151fdab8183260c  xinit-1.4.1.tar.bz2
+sha256  de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9  xinit-1.4.1.tar.bz2
+sha512  6cbc5d025a891c419f3f4493381b2fca57a67d78df866d2f16a83426f86bad6eca7f240fac12b25cbcc63df0fec41f625407184e044898602d66483715315340  xinit-1.4.1.tar.bz2
 # Locally computed
-sha256 c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7 COPYING
+sha256  c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7  COPYING
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
index 456a58c702..0961879637 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.hash
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003013.html
-md5 ac6b7432726008b2f50eba82b0e2dbe4  xinput-1.6.3.tar.bz2
-sha1 92ea7dfb3d8465921b0dca85da7d5b01cedae6c8  xinput-1.6.3.tar.bz2
-sha256 35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed  xinput-1.6.3.tar.bz2
-sha512 cb2fef866ac5a71dbca3e23b4ecadaca38e65dc1b30f8bb024bad92486554fafc472706619a1af04c746a4f53ce6aea827d694b9f4f0c7d0d46bb1da81984076  xinput-1.6.3.tar.bz2
+md5  ac6b7432726008b2f50eba82b0e2dbe4  xinput-1.6.3.tar.bz2
+sha1  92ea7dfb3d8465921b0dca85da7d5b01cedae6c8  xinput-1.6.3.tar.bz2
+sha256  35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed  xinput-1.6.3.tar.bz2
+sha512  cb2fef866ac5a71dbca3e23b4ecadaca38e65dc1b30f8bb024bad92486554fafc472706619a1af04c746a4f53ce6aea827d694b9f4f0c7d0d46bb1da81984076  xinput-1.6.3.tar.bz2
 # Locally computed
-sha256 bbd35c7a8e8c5cb073935e84b29b0c53f7131a4ef1ce737dc2be5616941e07e1  COPYING
+sha256  bbd35c7a8e8c5cb073935e84b29b0c53f7131a4ef1ce737dc2be5616941e07e1  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index c7e0747f06..69a80576c4 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-November/003030.html
-md5 9c34da77363dc3d0f616980da87244bf  xkbprint-1.0.5.tar.bz2
-sha1 e707caffb3c680b3a869a776aa3f80caeac9e9c3  xkbprint-1.0.5.tar.bz2
-sha256 5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa  xkbprint-1.0.5.tar.bz2
-sha512 ac3870352f3a595b5b8a8cb64f39e9bea81b17572c73cfbf72482477a2f576d0ffcdcf735cb3c66b8a88a7fe0f7aece6738cbac87df5641e44fae1ab9b97111f  xkbprint-1.0.5.tar.bz2
+md5  9c34da77363dc3d0f616980da87244bf  xkbprint-1.0.5.tar.bz2
+sha1  e707caffb3c680b3a869a776aa3f80caeac9e9c3  xkbprint-1.0.5.tar.bz2
+sha256  5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa  xkbprint-1.0.5.tar.bz2
+sha512  ac3870352f3a595b5b8a8cb64f39e9bea81b17572c73cfbf72482477a2f576d0ffcdcf735cb3c66b8a88a7fe0f7aece6738cbac87df5641e44fae1ab9b97111f  xkbprint-1.0.5.tar.bz2
 # Locally computed
-sha256 79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
+sha256  79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.hash b/package/x11r7/xapp_xkill/xapp_xkill.hash
index 0602971705..911a28d0b6 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.hash
+++ b/package/x11r7/xapp_xkill/xapp_xkill.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002864.html
-md5 938177e4472c346cf031c1aefd8934fc  xkill-1.0.5.tar.bz2
-sha1 c5ee06b33adb252a41e4f737be6bd47651ff582a  xkill-1.0.5.tar.bz2
-sha256 c5f0bb6a95e1ac7c4def8a657496d5d2f21ccd41eb47ef2c9ccb03fb6d6aff6b  xkill-1.0.5.tar.bz2
-sha512 4603a1794f114f5cea2c885020c9d073c8421d1e785c99ff6b936ae97139c8dac8020a187b5bbd0fa6d56ed6fab879441b42ba900cc5f2f5a534dafdc86b9249  xkill-1.0.5.tar.bz2
+md5  938177e4472c346cf031c1aefd8934fc  xkill-1.0.5.tar.bz2
+sha1  c5ee06b33adb252a41e4f737be6bd47651ff582a  xkill-1.0.5.tar.bz2
+sha256  c5f0bb6a95e1ac7c4def8a657496d5d2f21ccd41eb47ef2c9ccb03fb6d6aff6b  xkill-1.0.5.tar.bz2
+sha512  4603a1794f114f5cea2c885020c9d073c8421d1e785c99ff6b936ae97139c8dac8020a187b5bbd0fa6d56ed6fab879441b42ba900cc5f2f5a534dafdc86b9249  xkill-1.0.5.tar.bz2
 # Locally computed
-sha256 13306c3890e4c8710bc468dee0eba7f9677cd94c7a67d2d81fa932d4f635b21f COPYING
+sha256  13306c3890e4c8710bc468dee0eba7f9677cd94c7a67d2d81fa932d4f635b21f  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index a4aada48c8..c393e7dc33 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002963.html
-md5 e9d21de1dc8c8b9f854509a26a985cd7  xlogo-1.0.5.tar.bz2
-sha1 f025a0ad30c45cbec1c2f3b1610bff94fb4e9f33  xlogo-1.0.5.tar.bz2
-sha256 633d7a3aa5df61e4e643b740e5799664741ab1a0ba40593e54fcd15dc30f378e  xlogo-1.0.5.tar.bz2
-sha512 0d78e269b0be3c5de71de7f362b896bfd9934ecd9d0361b3302399b1269e029c4a9f35418d792121a1edc34405d753f9d69c996cc3a69ac717f2b0d1f736406b  xlogo-1.0.5.tar.bz2
+md5  e9d21de1dc8c8b9f854509a26a985cd7  xlogo-1.0.5.tar.bz2
+sha1  f025a0ad30c45cbec1c2f3b1610bff94fb4e9f33  xlogo-1.0.5.tar.bz2
+sha256  633d7a3aa5df61e4e643b740e5799664741ab1a0ba40593e54fcd15dc30f378e  xlogo-1.0.5.tar.bz2
+sha512  0d78e269b0be3c5de71de7f362b896bfd9934ecd9d0361b3302399b1269e029c4a9f35418d792121a1edc34405d753f9d69c996cc3a69ac717f2b0d1f736406b  xlogo-1.0.5.tar.bz2
 # Locally computed
-sha256 972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
+sha256  972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
index de7eabe3be..21484fdcdf 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002951.html
-md5 61671fee12535347db24ec3a715032a7  xlsatoms-1.1.3.tar.bz2
-sha1 9fdb1e8df6bb08529a812ac90f63d500bf5174cc  xlsatoms-1.1.3.tar.bz2
-sha256 57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382  xlsatoms-1.1.3.tar.bz2
-sha512 c267ccfdc5a83e834bfb5c3b144e22642badcadef4eb146eeec2df6fe6f85e9379500ae4219912c70fa2e535036a1a96cf496381f5d814e79af075e03c975f30  xlsatoms-1.1.3.tar.bz2
+md5  61671fee12535347db24ec3a715032a7  xlsatoms-1.1.3.tar.bz2
+sha1  9fdb1e8df6bb08529a812ac90f63d500bf5174cc  xlsatoms-1.1.3.tar.bz2
+sha256  57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382  xlsatoms-1.1.3.tar.bz2
+sha512  c267ccfdc5a83e834bfb5c3b144e22642badcadef4eb146eeec2df6fe6f85e9379500ae4219912c70fa2e535036a1a96cf496381f5d814e79af075e03c975f30  xlsatoms-1.1.3.tar.bz2
 # Locally computed
-sha256 f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
+sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
index a465c3cee3..b73917cb4a 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002866.html
-md5 4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
-sha1 175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
-sha256 773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
-sha512 42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
+md5  4fa92377e0ddc137cd226a7a87b6b29a  xlsclients-1.1.4.tar.bz2
+sha1  175af1c216a1db3de5023ecd6cce186e7693c6e4  xlsclients-1.1.4.tar.bz2
+sha256  773f2af49c7ea2c44fba4213bee64325875c1b3c9bc4bbcd8dac9261751809c1  xlsclients-1.1.4.tar.bz2
+sha512  42fd848d88d3cf31168a37fed63f9f5b60ddc4f36be2956b354e574c93129d75f29e005d6631784380bcef27860b54c64f419ca18ad77f092f4520dec47b10f4  xlsclients-1.1.4.tar.bz2
 # Locally computed
-sha256 716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648 COPYING
+sha256  716d6f1d18cb97cdd4a2ef7b101d944a250ca9de57578a490c038b9aaf950648  COPYING
diff --git a/package/x11r7/xapp_xman/xapp_xman.hash b/package/x11r7/xapp_xman/xapp_xman.hash
index e4a93d170c..4436ca3111 100644
--- a/package/x11r7/xapp_xman/xapp_xman.hash
+++ b/package/x11r7/xapp_xman/xapp_xman.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003011.html
-md5 629436867b202098967636b17c8d303c  xman-1.1.5.tar.bz2
-sha1 ec76dbd010f68974e05dfe8bc4b91731a3b7285b  xman-1.1.5.tar.bz2
-sha256 4e3c2c7497e9734a6d3c8e1b6a364612892bb31e9f33076c9fdae7177ab60978  xman-1.1.5.tar.bz2
-sha512 f6b2be424a79f298bf1a81edce4172572195c9efc9454e5b7b7046f344ed08154c77ccaa763ccdf3f1a30b64aa4802783bf813ee637437ccb1fba434fc5d4400  xman-1.1.5.tar.bz2
+md5  629436867b202098967636b17c8d303c  xman-1.1.5.tar.bz2
+sha1  ec76dbd010f68974e05dfe8bc4b91731a3b7285b  xman-1.1.5.tar.bz2
+sha256  4e3c2c7497e9734a6d3c8e1b6a364612892bb31e9f33076c9fdae7177ab60978  xman-1.1.5.tar.bz2
+sha512  f6b2be424a79f298bf1a81edce4172572195c9efc9454e5b7b7046f344ed08154c77ccaa763ccdf3f1a30b64aa4802783bf813ee637437ccb1fba434fc5d4400  xman-1.1.5.tar.bz2
 # Locally computed
-sha256 4c3d6d6fc5661c64285931a0871728f3745d962d877477235dc66e4043db3d36  COPYING
+sha256  4c3d6d6fc5661c64285931a0871728f3745d962d877477235dc66e4043db3d36  COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index 350739284f..07952220d0 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -2,4 +2,4 @@
 sha256  d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12  xmessage-1.0.6.tar.xz
 sha512  89deb7a81bd047027f99cb92cd16a47f94479c61a6f9fbac4638e6d642037b3e9bbac2313db59ac8c5544175947c693f6a210537c6df2b88dc3de1c67498cba8  xmessage-1.0.6.tar.xz
 # Locally computed
-sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
+sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd  COPYING
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
index cd777831fa..960a1e5f92 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.hash
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002964.html
-md5 8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
-sha1 b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
-sha256 644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
-sha512 e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
+md5  8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
+sha1  b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
+sha256  644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
+sha512  e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
 # Locally computed
-sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index 841fddd08b..28ebd77810 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -2,4 +2,4 @@
 sha256  a0bbb11475366622632440b1c6f16d19964b4516483232fe5f46c169528557c5  xpr-1.1.0.tar.xz
 sha512  53eb896cf1844036a13b1018ffcecbc6a0a56eebe0d7cb6331dbe691207498d2c41f3791655b7fc081acfef2ed9904987f363b710bf0eeff6c8d33f819a951cb  xpr-1.1.0.tar.xz
 # Locally computed
-sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
+sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069  COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 43eed80ba4..95e7c4eeed 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -2,4 +2,4 @@
 sha256  9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1  xprop-1.2.5.tar.bz2
 sha512  93cfa621fa76ca6e8e780a252c508380b6dc9db39b67bfca16bb9800f0d39110f5d18189409a8577ef79e98bf5eece17f5e23f2218ca72ae8bb04ee7b429d559  xprop-1.2.5.tar.bz2
 # Locally computed
-sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415 COPYING
+sha256  f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415  COPYING
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index 408b070dd9..4c68dcbb71 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-August/003018.html
-md5 fe40f7a4fd39dd3a02248d3e0b1972e4  xrandr-1.5.1.tar.xz
-sha1 9f72957e0d2a26ece509336ea7e1529cc9ea881e  xrandr-1.5.1.tar.xz
-sha256 7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762  xrandr-1.5.1.tar.xz
-sha512 3d0d37e974b9dffb996276ee7fd676327fd0956e5f5f572dd142a651a35d3cdfa2f6dd415cf27bf87f306981957aba4cc014c12baebefcabaa5d66b78a114922  xrandr-1.5.1.tar.xz
+md5  fe40f7a4fd39dd3a02248d3e0b1972e4  xrandr-1.5.1.tar.xz
+sha1  9f72957e0d2a26ece509336ea7e1529cc9ea881e  xrandr-1.5.1.tar.xz
+sha256  7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762  xrandr-1.5.1.tar.xz
+sha512  3d0d37e974b9dffb996276ee7fd676327fd0956e5f5f572dd142a651a35d3cdfa2f6dd415cf27bf87f306981957aba4cc014c12baebefcabaa5d66b78a114922  xrandr-1.5.1.tar.xz
 # Locally computed
-sha256 0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
+sha256  0dd9a3d62c48dd7b87790029e39fb5e11756d33fded3bc1644e11585c87b2038  COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index adb9a3b521..a83bc84940 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -2,4 +2,4 @@
 sha256  a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e  xrefresh-1.0.7.tar.xz
 sha512  8fcbb01aa368944ca536f050ab194b21bbd6b2a56265a7ed5807882e5c2f9660105283cdba0ea35b3e4a17a015586aeb82906e081da030332dfc49169a191c31  xrefresh-1.0.7.tar.xz
 # Locally computed
-sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663 COPYING
+sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663  COPYING
diff --git a/package/x11r7/xapp_xset/xapp_xset.hash b/package/x11r7/xapp_xset/xapp_xset.hash
index 62f951ba70..a4f19d0273 100644
--- a/package/x11r7/xapp_xset/xapp_xset.hash
+++ b/package/x11r7/xapp_xset/xapp_xset.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002873.html
-md5 70ea7bc7bacf1a124b1692605883f620  xset-1.2.4.tar.bz2
-sha1 41a857f30ff5bb0dfbda1549bb703984344ea228  xset-1.2.4.tar.bz2
-sha256 e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957  xset-1.2.4.tar.bz2
-sha512 f24714c9a82081a09d3054bbad98553de9366992f22eaf3e2bcadbb58fad1d3dad2547fef6fa9898d8a9df064573c29df9d82a5c801fa92248604c95f65dc83d  xset-1.2.4.tar.bz2
+md5  70ea7bc7bacf1a124b1692605883f620  xset-1.2.4.tar.bz2
+sha1  41a857f30ff5bb0dfbda1549bb703984344ea228  xset-1.2.4.tar.bz2
+sha256  e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957  xset-1.2.4.tar.bz2
+sha512  f24714c9a82081a09d3054bbad98553de9366992f22eaf3e2bcadbb58fad1d3dad2547fef6fa9898d8a9df064573c29df9d82a5c801fa92248604c95f65dc83d  xset-1.2.4.tar.bz2
 # Locally computed
-sha256 6bfc619b6d37dd0e6ca575edcb3a05194136e04d1d9989b8e14e6f7850587382 COPYING
+sha256  6bfc619b6d37dd0e6ca575edcb3a05194136e04d1d9989b8e14e6f7850587382  COPYING
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
index 8167f3d17a..c7550eae55 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
@@ -1,6 +1,6 @@
 # From https://lists.freedesktop.org/archives/xorg-announce/2006-November/000150.html
-md5 9e5bcbeda4aaf02bfa095e41d30baee4  xsetpointer-1.0.1.tar.bz2
-sha1 a8b01c6f27625a6f6943f9be17b1e5511f69d710  xsetpointer-1.0.1.tar.bz2
+md5  9e5bcbeda4aaf02bfa095e41d30baee4  xsetpointer-1.0.1.tar.bz2
+sha1  a8b01c6f27625a6f6943f9be17b1e5511f69d710  xsetpointer-1.0.1.tar.bz2
 # locally computed
-sha256 495d88871eb5081e98bbae55f813f73cb3ce4145d6ca3e8f2826800166c04571  xsetpointer-1.0.1.tar.bz2
-sha256 8f22998f14924220f0f530660811d24e5371a8d7672287c9d22f1eafb7256863  COPYING
+sha256  495d88871eb5081e98bbae55f813f73cb3ce4145d6ca3e8f2826800166c04571  xsetpointer-1.0.1.tar.bz2
+sha256  8f22998f14924220f0f530660811d24e5371a8d7672287c9d22f1eafb7256863  COPYING
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
index 7cbabb5cef..32294c1f3d 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002874.html
-md5 5fe769c8777a6e873ed1305e4ce2c353  xsetroot-1.1.2.tar.bz2
-sha1 42ab81761823b44974feab86477007c49dbace50  xsetroot-1.1.2.tar.bz2
-sha256 10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c  xsetroot-1.1.2.tar.bz2
-sha512 0b9df1b72305e5c24f1e1664578aa4411a5ffcdc5d318458117594e641f01c34700205b0d16c08abf4a8106d36128ccdbe1ea1f1035fce9018d6b52801a8b72b  xsetroot-1.1.2.tar.bz2
+md5  5fe769c8777a6e873ed1305e4ce2c353  xsetroot-1.1.2.tar.bz2
+sha1  42ab81761823b44974feab86477007c49dbace50  xsetroot-1.1.2.tar.bz2
+sha256  10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c  xsetroot-1.1.2.tar.bz2
+sha512  0b9df1b72305e5c24f1e1664578aa4411a5ffcdc5d318458117594e641f01c34700205b0d16c08abf4a8106d36128ccdbe1ea1f1035fce9018d6b52801a8b72b  xsetroot-1.1.2.tar.bz2
 # Locally computed
-sha256 48e9c9572e0dc1c14b93b753542f780e7751dd7f035816374d8a8be0211a4520 COPYING
+sha256  48e9c9572e0dc1c14b93b753542f780e7751dd7f035816374d8a8be0211a4520  COPYING
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
index fc067850b0..3f601c7249 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002954.html
 md5  da67142c128d18386ff145882e0afc66  xstdcmap-1.0.4.tar.bz2
-sha1 a5eff72ba31625e5b11506add800140019a39636  xstdcmap-1.0.4.tar.bz2
-sha256 06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b  xstdcmap-1.0.4.tar.bz2
-sha512 2adbb0aec1766341e04090efa962241ff6c9e32c612851b7221cec0ee16852107d406a08ec5251070f39df882c13e3c8c9edcd88f278187a9f373e1727643a8f  xstdcmap-1.0.4.tar.bz2
+sha1  a5eff72ba31625e5b11506add800140019a39636  xstdcmap-1.0.4.tar.bz2
+sha256  06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b  xstdcmap-1.0.4.tar.bz2
+sha512  2adbb0aec1766341e04090efa962241ff6c9e32c612851b7221cec0ee16852107d406a08ec5251070f39df882c13e3c8c9edcd88f278187a9f373e1727643a8f  xstdcmap-1.0.4.tar.bz2
 # Locally computed
-sha256 f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
+sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
index 405fc36ea6..3d8ace9ae5 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002955.html
-md5 b13afec137b9b331814a9824ab03ec80  xvinfo-1.1.4.tar.bz2
-sha1 136a70a72b23c81f4fe8f4c8cb7073316be16b44  xvinfo-1.1.4.tar.bz2
-sha256 0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f  xvinfo-1.1.4.tar.bz2
-sha512 85e1f936c5c826f0fdde3670bd77d5cde8641c6e8e7849e42142e91b5aa01d7e0e60d2b064eb6fef4f5666321813ca2dc9f9656756ccbe6dcda37b119ee8a63e  xvinfo-1.1.4.tar.bz2
+md5  b13afec137b9b331814a9824ab03ec80  xvinfo-1.1.4.tar.bz2
+sha1  136a70a72b23c81f4fe8f4c8cb7073316be16b44  xvinfo-1.1.4.tar.bz2
+sha256  0353220d6606077ba42363db65f50410759f9815352f77adc799e2adfa76e73f  xvinfo-1.1.4.tar.bz2
+sha512  85e1f936c5c826f0fdde3670bd77d5cde8641c6e8e7849e42142e91b5aa01d7e0e60d2b064eb6fef4f5666321813ca2dc9f9656756ccbe6dcda37b119ee8a63e  xvinfo-1.1.4.tar.bz2
 # Locally computed
-sha256 7725b0484faa1832534814ecb577f5a86acc74f1bcce25f92c55dfc1b693717d  COPYING
+sha256  7725b0484faa1832534814ecb577f5a86acc74f1bcce25f92c55dfc1b693717d  COPYING
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
index 163d5cc404..fbc7f7be00 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003012.html
-md5 26d46f7ef0588d3392da3ad5802be420  xwininfo-1.1.5.tar.bz2
-sha1 9f67b1eb07c5824d437bf577cf6198962af1aeb7  xwininfo-1.1.5.tar.bz2
-sha256 7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e  xwininfo-1.1.5.tar.bz2
-sha512 a3268bbeeeeafac94e589fdd47554a965910d40df7cc3d9c36c7c24fa4f5dd49615484d5916ccb41efca9cd4cf9d8981a4c60953b921220b3f4f57f9cce0e1a6  xwininfo-1.1.5.tar.bz2
+md5  26d46f7ef0588d3392da3ad5802be420  xwininfo-1.1.5.tar.bz2
+sha1  9f67b1eb07c5824d437bf577cf6198962af1aeb7  xwininfo-1.1.5.tar.bz2
+sha256  7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e  xwininfo-1.1.5.tar.bz2
+sha512  a3268bbeeeeafac94e589fdd47554a965910d40df7cc3d9c36c7c24fa4f5dd49615484d5916ccb41efca9cd4cf9d8981a4c60953b921220b3f4f57f9cce0e1a6  xwininfo-1.1.5.tar.bz2
 # Locally computed
-sha256 443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af COPYING
+sha256  443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af  COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index c895b98b23..c47d6d881e 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -2,4 +2,4 @@
 sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
 sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
 # Locally computed
-sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
+sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e  COPYING
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index 1964624dc5..14cea17138 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,4 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
-sha1	26562eb6d4151307f7b6a53453d360ecfc0563ac	xcb-util-cursor-0.1.3.tar.bz2
+sha1  26562eb6d4151307f7b6a53453d360ecfc0563ac  xcb-util-cursor-0.1.3.tar.bz2
 # Locally computed
 sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
index a9a2eaab50..b2c42d6899 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.hash
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
-sha256	2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc	xcb-util-image-0.4.0.tar.bz2
+sha256  2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc  xcb-util-image-0.4.0.tar.bz2
 # License file, locally calculated
-sha256	19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b	COPYING
+sha256  19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b  COPYING
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
index a25a263d22..6437d070f4 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
@@ -1,2 +1,2 @@
 # From http://lists.x.org/archives/xorg-announce/2014-October/002485.html
-sha256	0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9	xcb-util-keysyms-0.4.0.tar.bz2
+sha256  0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9  xcb-util-keysyms-0.4.0.tar.bz2
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.hash b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
index e31228fce0..444212accf 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.hash
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-February/002401.html
-sha256	28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f	xcb-util-wm-0.4.1.tar.bz2
+sha256  28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f  xcb-util-wm-0.4.1.tar.bz2
 # License file, locally calculated
-sha256	12ab3559977a4b22ae3030b90c64a386e6ec51ab0e4eab1ff530f81a2639400a	COPYING
+sha256  12ab3559977a4b22ae3030b90c64a386e6ec51ab0e4eab1ff530f81a2639400a  COPYING
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
index 05d37288ad..7ebc88a0be 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-March/002881.html
-md5 cedeef095918aca86da79a2934e03daf  xbitmaps-1.1.2.tar.bz2
-sha1 1cb0e485a66280e9a64b48426140b8a0de9cf169  xbitmaps-1.1.2.tar.bz2
-sha256 b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee  xbitmaps-1.1.2.tar.bz2
-sha512 eed5e2fce9fc6c532984e6ed1262e440591e311ca6c61a7fe7a5c877df84bfc2d7aff388fb9c894fc098785b8e5352f0bd7c918252247a040cf123874847450d  xbitmaps-1.1.2.tar.bz2
+md5  cedeef095918aca86da79a2934e03daf  xbitmaps-1.1.2.tar.bz2
+sha1  1cb0e485a66280e9a64b48426140b8a0de9cf169  xbitmaps-1.1.2.tar.bz2
+sha256  b9f0c71563125937776c8f1f25174ae9685314cbd130fb4c2efce811981e07ee  xbitmaps-1.1.2.tar.bz2
+sha512  eed5e2fce9fc6c532984e6ed1262e440591e311ca6c61a7fe7a5c877df84bfc2d7aff388fb9c894fc098785b8e5352f0bd7c918252247a040cf123874847450d  xbitmaps-1.1.2.tar.bz2
 # Locally computed
-sha256 e121ec6605558ee021674d33b1ab9306e16b9ea7d30453df42286556247be17a COPYING
+sha256  e121ec6605558ee021674d33b1ab9306e16b9ea7d30453df42286556247be17a  COPYING
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
index dd8d2ad26d..2b88f567a0 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002945.html
-md5 aea14eabf40528ec4db18f1cfcf5c458  xcursor-themes-1.0.6.tar.bz2
-sha1 b56fd5bf5b1ada0532a85c27db0d296e392168c5  xcursor-themes-1.0.6.tar.bz2
-sha256 ee1ec574741293abcf66ac14ce7e74add7ac6be7deb8b38179ef010d22354999  xcursor-themes-1.0.6.tar.bz2
-sha512 2ad3586a5571a5ddc0001187362b54b839644916164834213af98e58698044aec4392dd6e1e42f1794fda85c8fedf259b09214a9636bd0e71a1629c710f198d3  xcursor-themes-1.0.6.tar.bz2
+md5  aea14eabf40528ec4db18f1cfcf5c458  xcursor-themes-1.0.6.tar.bz2
+sha1  b56fd5bf5b1ada0532a85c27db0d296e392168c5  xcursor-themes-1.0.6.tar.bz2
+sha256  ee1ec574741293abcf66ac14ce7e74add7ac6be7deb8b38179ef010d22354999  xcursor-themes-1.0.6.tar.bz2
+sha512  2ad3586a5571a5ddc0001187362b54b839644916164834213af98e58698044aec4392dd6e1e42f1794fda85c8fedf259b09214a9636bd0e71a1629c710f198d3  xcursor-themes-1.0.6.tar.bz2
 # Locally computed
-sha256 e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6 COPYING
+sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index eb4cb6599c..c80eaeb9fa 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-May/002898.html
-md5 e8bd1edc6751f92e425cae7eba3c61eb  xf86-input-evdev-2.10.6.tar.bz2
-sha1 660de292d5a40e2b8f385965c6a4e149c981ba59  xf86-input-evdev-2.10.6.tar.bz2
-sha256 8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0  xf86-input-evdev-2.10.6.tar.bz2
-sha512 560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1  xf86-input-evdev-2.10.6.tar.bz2
+md5  e8bd1edc6751f92e425cae7eba3c61eb  xf86-input-evdev-2.10.6.tar.bz2
+sha1  660de292d5a40e2b8f385965c6a4e149c981ba59  xf86-input-evdev-2.10.6.tar.bz2
+sha256  8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0  xf86-input-evdev-2.10.6.tar.bz2
+sha512  560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1  xf86-input-evdev-2.10.6.tar.bz2
 # Locally computed
-sha256 f6b9b4732932434cad03b29cb3151d20edcf7d6e5681f40ee3c47f03dbd92dc9  COPYING
+sha256  f6b9b4732932434cad03b29cb3151d20edcf7d6e5681f40ee3c47f03dbd92dc9  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index 551ff9d844..fe83f6920f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-June/002903.html
-md5 a2104693bbcfe1413397f7905eecd3dc  xf86-input-mouse-1.9.3.tar.bz2
-sha1 b3982998808ba43117fc066c4ecc94ce67c5818e  xf86-input-mouse-1.9.3.tar.bz2
-sha256 93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5  xf86-input-mouse-1.9.3.tar.bz2
-sha512 d99f5b4b1ef1aa4cbf1a92549e412f54f121bc804e4d6643248ad7ea18081b38b958bd289dc8476ebc0f6ef5f7424c2f2a8abcfaa30cae5378829549af6b148f  xf86-input-mouse-1.9.3.tar.bz2
+md5  a2104693bbcfe1413397f7905eecd3dc  xf86-input-mouse-1.9.3.tar.bz2
+sha1  b3982998808ba43117fc066c4ecc94ce67c5818e  xf86-input-mouse-1.9.3.tar.bz2
+sha256  93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5  xf86-input-mouse-1.9.3.tar.bz2
+sha512  d99f5b4b1ef1aa4cbf1a92549e412f54f121bc804e4d6643248ad7ea18081b38b958bd289dc8476ebc0f6ef5f7424c2f2a8abcfaa30cae5378829549af6b148f  xf86-input-mouse-1.9.3.tar.bz2
 # Locally computed
-sha256 472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
+sha256  472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index d2c1d8ed6d..dca54571e0 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,5 +1,5 @@
 # https://github.com/merge/xf86-input-tslib/releases/download/1.1.1/xf86-input-tslib-1.1.1.tar.bz2.sha256
-sha256 8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
+sha256  8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec  xf86-input-tslib-1.1.1.tar.bz2
 
 # Locally computed
 sha256  edfc46c9b91499699fc54d39e986756a2dcce8a919c6066be177123441532856  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index c6f8c53ef9..1e7376cbfc 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-October/003027.html
-md5 6e49d3c2839582af415ceded76e626e6  xf86-video-ati-19.1.0.tar.bz2
-sha1 aea1d11c05531b03f2eb67c6785cddf6d7f30e5f  xf86-video-ati-19.1.0.tar.bz2
-sha256 659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49  xf86-video-ati-19.1.0.tar.bz2
-sha512 73a81f6c492daf2e89067fb52b3033dc0fe6841f109627ddca1aee54a45a738c8c134443753a2a2aaa2c131e1d560057ebc76351ff2304c16407df3ff568fcd6  xf86-video-ati-19.1.0.tar.bz2
+md5  6e49d3c2839582af415ceded76e626e6  xf86-video-ati-19.1.0.tar.bz2
+sha1  aea1d11c05531b03f2eb67c6785cddf6d7f30e5f  xf86-video-ati-19.1.0.tar.bz2
+sha256  659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49  xf86-video-ati-19.1.0.tar.bz2
+sha512  73a81f6c492daf2e89067fb52b3033dc0fe6841f109627ddca1aee54a45a738c8c134443753a2a2aaa2c131e1d560057ebc76351ff2304c16407df3ff568fcd6  xf86-video-ati-19.1.0.tar.bz2
 # Locally computed
-sha256 58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
+sha256  58847c8e97190c401afa84b3f0b8b147379c876a184e99af2cb51bfd40ac8936  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index dd3a9c3895..0b38a9b41b 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256	dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699	xf86-video-fbdev-0.5.0.tar.bz2
+sha256  dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699  xf86-video-fbdev-0.5.0.tar.bz2
 # Locally calculated
 sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
index 325e754fb3..96bd42ac36 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-December/002932.html
 md5  a980f1b8532ccfe81932580bc4e0f2a0  xf86-video-i128-1.4.0.tar.bz2
-sha1 56d5b897b2695222c13e59d2ade74620a99e1011  xf86-video-i128-1.4.0.tar.bz2
-sha256 8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea  xf86-video-i128-1.4.0.tar.bz2
-sha512 d58baee3f20b3ad2ece6853da0ff20a6d54b984c6e3289bad2715cc003b277a0b44d20ded25cfc116400468df552390bdb5d80fbd3fb60861488ee5d027664b2  xf86-video-i128-1.4.0.tar.bz2
+sha1  56d5b897b2695222c13e59d2ade74620a99e1011  xf86-video-i128-1.4.0.tar.bz2
+sha256  8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea  xf86-video-i128-1.4.0.tar.bz2
+sha512  d58baee3f20b3ad2ece6853da0ff20a6d54b984c6e3289bad2715cc003b277a0b44d20ded25cfc116400468df552390bdb5d80fbd3fb60861488ee5d027664b2  xf86-video-i128-1.4.0.tar.bz2
 # Locally computed
-sha256 7677424d79633dbf255a81bd4e05dd621931b89997af33c31522269ec2ed391e  COPYING
+sha256  7677424d79633dbf255a81bd4e05dd621931b89997af33c31522269ec2ed391e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
index 55996f5b0d..acc65348f7 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-December/002934.html
-md5 349d5254d09eb46f2a1f151cd423b89a  xf86-video-neomagic-1.3.0.tar.bz2
-sha1 6bccfa15ea05d5264120cd96ccf13687642e8f6d  xf86-video-neomagic-1.3.0.tar.bz2
-sha256 93833950fae7757088eb6abb125e15e8c245e5e25681c19c3ad4213ec7319064  xf86-video-neomagic-1.3.0.tar.bz2
-sha512 25d019a2556e52aeb4e25942f444437a921e76d527c10ddd420f16aa7d85bf2b8a51612c382a2a7e3e407bb1e8d610d063101184eea0889c3e1a69bfb3b37735  xf86-video-neomagic-1.3.0.tar.bz2
+md5  349d5254d09eb46f2a1f151cd423b89a  xf86-video-neomagic-1.3.0.tar.bz2
+sha1  6bccfa15ea05d5264120cd96ccf13687642e8f6d  xf86-video-neomagic-1.3.0.tar.bz2
+sha256  93833950fae7757088eb6abb125e15e8c245e5e25681c19c3ad4213ec7319064  xf86-video-neomagic-1.3.0.tar.bz2
+sha512  25d019a2556e52aeb4e25942f444437a921e76d527c10ddd420f16aa7d85bf2b8a51612c382a2a7e3e407bb1e8d610d063101184eea0889c3e1a69bfb3b37735  xf86-video-neomagic-1.3.0.tar.bz2
 # Locally computed
-sha256 95063ce9aa09850025dd317549ce688519079a8d3cf66ceb3d882cb2bafcced9  COPYING
+sha256  95063ce9aa09850025dd317549ce688519079a8d3cf66ceb3d882cb2bafcced9  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index eee2865094..455c3d4439 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-October/002926.html
-md5 105ebcfe1bac06fe84645ac3def91184  xf86-video-r128-6.12.0.tar.bz2
-sha1 7cfa41d386fa43b5d30299203e4845d8afba4899  xf86-video-r128-6.12.0.tar.bz2
-sha256 801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057  xf86-video-r128-6.12.0.tar.bz2
-sha512 0e667e2cfa8a87a00846361d86528c93754c403c812b66798953fa4c857b2143b2c4c44885da467e7f910d8cb910b69492cdcb6f25e2197bae6617364d152e38  xf86-video-r128-6.12.0.tar.bz2
+md5  105ebcfe1bac06fe84645ac3def91184  xf86-video-r128-6.12.0.tar.bz2
+sha1  7cfa41d386fa43b5d30299203e4845d8afba4899  xf86-video-r128-6.12.0.tar.bz2
+sha256  801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057  xf86-video-r128-6.12.0.tar.bz2
+sha512  0e667e2cfa8a87a00846361d86528c93754c403c812b66798953fa4c857b2143b2c4c44885da467e7f910d8cb910b69492cdcb6f25e2197bae6617364d152e38  xf86-video-r128-6.12.0.tar.bz2
 # Locally computed
-sha256 69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
+sha256  69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index dc9a350360..eeff39fed1 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,4 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
-sha256 d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
+sha256  d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
 # Locally calculated
-sha256 e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
+sha256  e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
index f670952702..b2215383d6 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-December/003033.html
 md5  b8ec9c21758043b1480f11baec296f5d  xf86-video-sis-0.12.0.tar.bz2
-sha1 d22f0d0081e222a62f9e788f5e73246c6d339f80  xf86-video-sis-0.12.0.tar.bz2
-sha256 119d3f17d53c862ec4bf891ed696a6f1d32cdf8bd11d944a9f0ad24625333a5b  xf86-video-sis-0.12.0.tar.bz2
-sha512 5aa101e5217f15667f2c94f7a76f4afcf47717b61f5d206ce65efe35dc3f674ca294f98ca8586971c6467f31decdd94d8255ebfc7dc220fac0179afc61995952  xf86-video-sis-0.12.0.tar.bz2
+sha1  d22f0d0081e222a62f9e788f5e73246c6d339f80  xf86-video-sis-0.12.0.tar.bz2
+sha256  119d3f17d53c862ec4bf891ed696a6f1d32cdf8bd11d944a9f0ad24625333a5b  xf86-video-sis-0.12.0.tar.bz2
+sha512  5aa101e5217f15667f2c94f7a76f4afcf47717b61f5d206ce65efe35dc3f674ca294f98ca8586971c6467f31decdd94d8255ebfc7dc220fac0179afc61995952  xf86-video-sis-0.12.0.tar.bz2
 # Locally computed
-sha256 e7958f9497a4daa3ae5aeaf885e4565520af2c540b6e4e04b52bf95d41d56c39  COPYING
+sha256  e7958f9497a4daa3ae5aeaf885e4565520af2c540b6e4e04b52bf95d41d56c39  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
index 5e9a88fbde..9602cb2c7e 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002944.html
-md5 4697f0cc69ff1ff90bc770863c158d29  xf86-video-tdfx-1.5.0.tar.bz2
-sha1 8042dd0c2bc5a396b2cfeb5418b03059a089be25  xf86-video-tdfx-1.5.0.tar.bz2
-sha256 2f4580e1f66901dd578d6e1f73df8150fd4b8480eb0c9653d4c5d8e0f8e78561  xf86-video-tdfx-1.5.0.tar.bz2
-sha512 eca3359c7db56183a1cfcce7295e41ccc349005ee1cbcf75209f1e4e8e04e887ba511712ef35efc11c940713c8327b0b8ab8b6c86facf02062b3e84c0b1af5ff  xf86-video-tdfx-1.5.0.tar.bz2
+md5  4697f0cc69ff1ff90bc770863c158d29  xf86-video-tdfx-1.5.0.tar.bz2
+sha1  8042dd0c2bc5a396b2cfeb5418b03059a089be25  xf86-video-tdfx-1.5.0.tar.bz2
+sha256  2f4580e1f66901dd578d6e1f73df8150fd4b8480eb0c9653d4c5d8e0f8e78561  xf86-video-tdfx-1.5.0.tar.bz2
+sha512  eca3359c7db56183a1cfcce7295e41ccc349005ee1cbcf75209f1e4e8e04e887ba511712ef35efc11c940713c8327b0b8ab8b6c86facf02062b3e84c0b1af5ff  xf86-video-tdfx-1.5.0.tar.bz2
 # Locally computed
-sha256 5bb3d3baff0b7bbef885215ca9c12a5be1a42c848c96601b699637557fbb41ec  COPYING
+sha256  5bb3d3baff0b7bbef885215ca9c12a5be1a42c848c96601b699637557fbb41ec  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
index 8f47bac204..321f35d4f0 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
@@ -1,4 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002762.html
-sha256 9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f  xf86-video-trident-1.3.8.tar.bz2
+sha256  9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f  xf86-video-trident-1.3.8.tar.bz2
 # Locally calculated
-sha256 4f065198c49eac1513b915bc4478152c21119f31a97919a6ea8f3e1d10133d15  COPYING
+sha256  4f065198c49eac1513b915bc4478152c21119f31a97919a6ea8f3e1d10133d15  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
index f07e061478..fc69e01ffe 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-May/002895.html
-md5 08d66d062055080ff699ab4869726ea2  xf86-video-vmware-13.3.0.tar.bz2
-sha1 f01335fe6bdb507e749571bfcd69163aed97312a  xf86-video-vmware-13.3.0.tar.bz2
-sha256 47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c  xf86-video-vmware-13.3.0.tar.bz2
-sha512 c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca  xf86-video-vmware-13.3.0.tar.bz2
+md5  08d66d062055080ff699ab4869726ea2  xf86-video-vmware-13.3.0.tar.bz2
+sha1  f01335fe6bdb507e749571bfcd69163aed97312a  xf86-video-vmware-13.3.0.tar.bz2
+sha256  47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c  xf86-video-vmware-13.3.0.tar.bz2
+sha512  c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca  xf86-video-vmware-13.3.0.tar.bz2
 # Locally computed
-sha256 7e59b8ca2a161855a60561f27ada8dfdbb678733eacdb23423fff6d21f9ad43b  COPYING
+sha256  7e59b8ca2a161855a60561f27ada8dfdbb678733eacdb23423fff6d21f9ad43b  COPYING
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
index 05063726ba..c9b01efc7a 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
@@ -1,4 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-November/001537.html
-sha1	f42ebd527096011040a312e0f9cdf78d64177419	font-bh-ttf-1.0.3.tar.bz2
+sha1  f42ebd527096011040a312e0f9cdf78d64177419  font-bh-ttf-1.0.3.tar.bz2
 # Locally computed
 sha256  27d47d50006773f1c0bd97661252ae27bb8cfd6951f253bd9d3ef81ed1243934  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index c6f168576a..50cb94dd3a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002970.html
-md5 4e1196275aa743d6ebd3d3d5ec1dff9c  libFS-1.0.8.tar.bz2
-sha1 70173cc15a7a55defb7b22b00a9387901acad634  libFS-1.0.8.tar.bz2
-sha256 c8e13727149b2ddfe40912027459b2522042e3844c5cd228c3300fe5eef6bd0f  libFS-1.0.8.tar.bz2
-sha512 466198ae5c0b83e3579713d86ddfd0b039f5c5b511cf6d5dc0e9664ee2d40aec9e8929445c8e97394d85faf76a7cf2f81bddb13d23de7ce19919e3b1e36ba56f  libFS-1.0.8.tar.bz2
+md5  4e1196275aa743d6ebd3d3d5ec1dff9c  libFS-1.0.8.tar.bz2
+sha1  70173cc15a7a55defb7b22b00a9387901acad634  libFS-1.0.8.tar.bz2
+sha256  c8e13727149b2ddfe40912027459b2522042e3844c5cd228c3300fe5eef6bd0f  libFS-1.0.8.tar.bz2
+sha512  466198ae5c0b83e3579713d86ddfd0b039f5c5b511cf6d5dc0e9664ee2d40aec9e8929445c8e97394d85faf76a7cf2f81bddb13d23de7ce19919e3b1e36ba56f  libFS-1.0.8.tar.bz2
 # Locally computed
-sha256 5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
+sha256  5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 426ada32a4..2bfbe54788 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-July/003006.html
-md5 76d77499ee7120a56566891ca2c0dbcf  libICE-1.0.10.tar.bz2
-sha1 5b5eb125d4f43a3ab8153b0f850963ee6c982c24  libICE-1.0.10.tar.bz2
-sha256 6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348  libICE-1.0.10.tar.bz2
-sha512 2f1ef2c32c833c71894a08fa7e7ed53f301f6c7bd22485d71c12884d8e8b36b99f362ec886349dcc84d08edc81c8b2cea035320831d64974edeba021b433c468  libICE-1.0.10.tar.bz2
+md5  76d77499ee7120a56566891ca2c0dbcf  libICE-1.0.10.tar.bz2
+sha1  5b5eb125d4f43a3ab8153b0f850963ee6c982c24  libICE-1.0.10.tar.bz2
+sha256  6f86dce12cf4bcaf5c37dddd8b1b64ed2ddf1ef7b218f22b9942595fb747c348  libICE-1.0.10.tar.bz2
+sha512  2f1ef2c32c833c71894a08fa7e7ed53f301f6c7bd22485d71c12884d8e8b36b99f362ec886349dcc84d08edc81c8b2cea035320831d64974edeba021b433c468  libICE-1.0.10.tar.bz2
 # Locally computed
-sha256 60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
+sha256  60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 1653dc6d76..7ac288ba4e 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-October/002922.html
 md5  87c7fad1c1813517979184c8ccd76628  libSM-1.2.3.tar.bz2
-sha1 437d7b13fa2eba325df3a106f177df46ccec6546  libSM-1.2.3.tar.bz2
-sha256 2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb  libSM-1.2.3.tar.bz2
-sha512 74c42e27029db78475e62025b4711dbac5e22d2f8e8a24be98a1c31b03c0fc4afe859928f851800ea0b76854f12147900dc4f27bbfd3d8ea45daaaf24b70a903  libSM-1.2.3.tar.bz2
+sha1  437d7b13fa2eba325df3a106f177df46ccec6546  libSM-1.2.3.tar.bz2
+sha256  2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb  libSM-1.2.3.tar.bz2
+sha512  74c42e27029db78475e62025b4711dbac5e22d2f8e8a24be98a1c31b03c0fc4afe859928f851800ea0b76854f12147900dc4f27bbfd3d8ea45daaaf24b70a903  libSM-1.2.3.tar.bz2
 # Locally computed
-sha256 af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
+sha256  af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index 266840114f..01f468b77a 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-July/002906.html
-md5 eeea9d5af3e6c143d0ea1721d27a5e49  libXScrnSaver-1.2.3.tar.bz2
-sha1 70c791c5755a298ecf1a0823e239a24fa4b2b42f  libXScrnSaver-1.2.3.tar.bz2
-sha256 f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8  libXScrnSaver-1.2.3.tar.bz2
-sha512 7ea628324a11b25ee82c7b11c6bf98f37de219354de51c1e29467b5de422669ba1ab121f3b9dc674093c8f3960e93c5d5428122f5539092f79bc8451c768354a  libXScrnSaver-1.2.3.tar.bz2
+md5  eeea9d5af3e6c143d0ea1721d27a5e49  libXScrnSaver-1.2.3.tar.bz2
+sha1  70c791c5755a298ecf1a0823e239a24fa4b2b42f  libXScrnSaver-1.2.3.tar.bz2
+sha256  f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8  libXScrnSaver-1.2.3.tar.bz2
+sha512  7ea628324a11b25ee82c7b11c6bf98f37de219354de51c1e29467b5de422669ba1ab121f3b9dc674093c8f3960e93c5d5428122f5539092f79bc8451c768354a  libXScrnSaver-1.2.3.tar.bz2
 # Locally computed
-sha256 5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
+sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index a78d7f0fea..65ae54ec32 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002942.html
-md5 c5f16288f2da9f071b29111d68797480  libXau-1.0.9.tar.bz2
-sha1 ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733  libXau-1.0.9.tar.bz2
-sha256 ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec  libXau-1.0.9.tar.bz2
-sha512 3ca454ba466a807ea28b0f715066d73dc76ad312697b121d43e4d5766215052e9b7ffb8fe3ed3e496fa3f2a13f164ac692ff85cc428e26731b679f0f06a1d562  libXau-1.0.9.tar.bz2
+md5  c5f16288f2da9f071b29111d68797480  libXau-1.0.9.tar.bz2
+sha1  ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733  libXau-1.0.9.tar.bz2
+sha256  ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec  libXau-1.0.9.tar.bz2
+sha512  3ca454ba466a807ea28b0f715066d73dc76ad312697b121d43e4d5766215052e9b7ffb8fe3ed3e496fa3f2a13f164ac692ff85cc428e26731b679f0f06a1d562  libXau-1.0.9.tar.bz2
 # Locally computed
-sha256 56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
+sha256  56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
index 37e9c72117..5d4575b5ab 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002971.html
-md5 3fa0841ea89024719b20cd702a9b54e0  libXcomposite-0.4.5.tar.bz2
-sha1 902631efb55a798c81086e5ff90b60349839db40  libXcomposite-0.4.5.tar.bz2
-sha256 b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f  libXcomposite-0.4.5.tar.bz2
-sha512 502fd51fd9097bb3ca72174ac5b25b9d3b1ff240d32c4765199df03d89337d94b4ddea49e90b177b370862430089d966ce9c38988337156352cfeae911c2d3d5  libXcomposite-0.4.5.tar.bz2
+md5  3fa0841ea89024719b20cd702a9b54e0  libXcomposite-0.4.5.tar.bz2
+sha1  902631efb55a798c81086e5ff90b60349839db40  libXcomposite-0.4.5.tar.bz2
+sha256  b3218a2c15bab8035d16810df5b8251ffc7132ff3aa70651a1fba0bfe9634e8f  libXcomposite-0.4.5.tar.bz2
+sha512  502fd51fd9097bb3ca72174ac5b25b9d3b1ff240d32c4765199df03d89337d94b4ddea49e90b177b370862430089d966ce9c38988337156352cfeae911c2d3d5  libXcomposite-0.4.5.tar.bz2
 # Locally computed
-sha256 efa0219ed8485ac555c1a3fb82daf34539b2e0dcf4dadc99c01f1e39c69a4a68  COPYING
+sha256  efa0219ed8485ac555c1a3fb82daf34539b2e0dcf4dadc99c01f1e39c69a4a68  COPYING
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
index 120d3e026a..9e7cf566a7 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002973.html
-md5 e3f554267a7a04b042dc1f6352bd6d99  libXdamage-1.1.5.tar.bz2
-sha1 719ae6ab8c1b972c6386b654976c479255af5572  libXdamage-1.1.5.tar.bz2
-sha256 b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45  libXdamage-1.1.5.tar.bz2
-sha512 a3ca6cc33b1727f717a3e2aa5593f660508a81a47918a0aa949e9e8fba105e303fe5071983b48caac92feea0fe6e8e01620805e4d19b41f21f20d837b191c124  libXdamage-1.1.5.tar.bz2
+md5  e3f554267a7a04b042dc1f6352bd6d99  libXdamage-1.1.5.tar.bz2
+sha1  719ae6ab8c1b972c6386b654976c479255af5572  libXdamage-1.1.5.tar.bz2
+sha256  b734068643cac3b5f3d2c8279dd366b5bf28c7219d9e9d8717e1383995e0ea45  libXdamage-1.1.5.tar.bz2
+sha512  a3ca6cc33b1727f717a3e2aa5593f660508a81a47918a0aa949e9e8fba105e303fe5071983b48caac92feea0fe6e8e01620805e4d19b41f21f20d837b191c124  libXdamage-1.1.5.tar.bz2
 # Locally computed
-sha256 33effe928634be12e668465c3935c5570ff2787b970b15d9243d69df42302c57  COPYING
+sha256  33effe928634be12e668465c3935c5570ff2787b970b15d9243d69df42302c57  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 0dbea635f2..9f7f968350 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002974.html
-md5 115c5c12ecce0e749cd91d999a5fd160  libXdmcp-1.1.3.tar.bz2
-sha1 0a8f8a274f829331efb1e8e2027c38631b204dd0  libXdmcp-1.1.3.tar.bz2
-sha256 20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529  libXdmcp-1.1.3.tar.bz2
-sha512 cb1d4650f97d66e73acd2465ec7d757b9b797cce2f85e301860a44997a461837eea845ec9bd5b639ec5ca34c804f8bdd870697a5ce3f4e270b687c9ef74f25ec  libXdmcp-1.1.3.tar.bz2
+md5  115c5c12ecce0e749cd91d999a5fd160  libXdmcp-1.1.3.tar.bz2
+sha1  0a8f8a274f829331efb1e8e2027c38631b204dd0  libXdmcp-1.1.3.tar.bz2
+sha256  20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529  libXdmcp-1.1.3.tar.bz2
+sha512  cb1d4650f97d66e73acd2465ec7d757b9b797cce2f85e301860a44997a461837eea845ec9bd5b639ec5ca34c804f8bdd870697a5ce3f4e270b687c9ef74f25ec  libXdmcp-1.1.3.tar.bz2
 # Locally computed
-sha256 8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
+sha256  8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index 45810d5d14..e6b41a3dba 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002975.html
-md5 f5b48bb76ba327cd2a8dc7a383532a95  libXext-1.3.4.tar.bz2
-sha1 14e2451162e8766173b5b14c73e94a22b1fcab55  libXext-1.3.4.tar.bz2
-sha256 59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b  libXext-1.3.4.tar.bz2
-sha512 09146397d95f80c04701be1cc0a9c580ab5a085842ac31d17dfb6d4c2e42b4253b89cba695e54444e520be359883a76ffd02f42484c9e2ba2c33a5a40c29df4a  libXext-1.3.4.tar.bz2
+md5  f5b48bb76ba327cd2a8dc7a383532a95  libXext-1.3.4.tar.bz2
+sha1  14e2451162e8766173b5b14c73e94a22b1fcab55  libXext-1.3.4.tar.bz2
+sha256  59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b  libXext-1.3.4.tar.bz2
+sha512  09146397d95f80c04701be1cc0a9c580ab5a085842ac31d17dfb6d4c2e42b4253b89cba695e54444e520be359883a76ffd02f42484c9e2ba2c33a5a40c29df4a  libXext-1.3.4.tar.bz2
 # Locally computed
-sha256 80767ac915f2f0f94de9efb15f0197a59b6f1e609cae85059f8703272dc3e146  COPYING
+sha256  80767ac915f2f0f94de9efb15f0197a59b6f1e609cae85059f8703272dc3e146  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index f40c522903..5dfe496052 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -3,4 +3,4 @@ sha256  a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c  libXfi
 sha512  1985ef156f382e9a7e1cc7e044e0f626de1e4c82557a511cbcf6431994c0ac25b1f8b3a0293bd3089331593db8ce01d3a71ddec68f19b5fe6029d5082fb6885d  libXfixes-6.0.0.tar.bz2
 
 # Locally calculated
-sha256 d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
+sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.hash b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
index 455d99ff3f..72a58e4d7a 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.hash
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
@@ -1,8 +1,8 @@
 # From https://lists.x.org/archives/xorg-announce/2017-November/002825.html
 md5  16eaf156edd79b68038b6a7c44aa9e9b  libXfont-1.5.4.tar.bz2
-sha1 9db050f63b9c4cb19e0dbb40575558ccb95719ca  libXfont-1.5.4.tar.bz2
-sha256 1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242  libXfont-1.5.4.tar.bz2
-sha512 864edbaff45c44bd92bc4b06275c73fdf584a9b88bc523a297d4c75c01ca253f438463e929af70d753ddecfa648bb0b9bcf0ec72267db9f2b1704f7afa906cb3  libXfont-1.5.4.tar.bz2
+sha1  9db050f63b9c4cb19e0dbb40575558ccb95719ca  libXfont-1.5.4.tar.bz2
+sha256  1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242  libXfont-1.5.4.tar.bz2
+sha512  864edbaff45c44bd92bc4b06275c73fdf584a9b88bc523a297d4c75c01ca253f438463e929af70d753ddecfa648bb0b9bcf0ec72267db9f2b1704f7afa906cb3  libXfont-1.5.4.tar.bz2
 
 # Locally calculated
-sha256 97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
+sha256  97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
index 995181dd16..ca4081d375 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-July/002905.html
-md5 0d5f826a197dae74da67af4a9ef35885  libXinerama-1.1.4.tar.bz2
-sha1 34a1d9908ffbd46805d2357c6b05f5e341a8dc7c  libXinerama-1.1.4.tar.bz2
-sha256 0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720  libXinerama-1.1.4.tar.bz2
-sha512 cff777ad942614fbf6bc6d8529f399e62debf3ecbf6cc0694a94e38c022bf929ffd5636fb59f55533c394d89b23af3ea51fa5128927f12a85787e16239330f14  libXinerama-1.1.4.tar.bz2
+md5  0d5f826a197dae74da67af4a9ef35885  libXinerama-1.1.4.tar.bz2
+sha1  34a1d9908ffbd46805d2357c6b05f5e341a8dc7c  libXinerama-1.1.4.tar.bz2
+sha256  0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720  libXinerama-1.1.4.tar.bz2
+sha512  cff777ad942614fbf6bc6d8529f399e62debf3ecbf6cc0694a94e38c022bf929ffd5636fb59f55533c394d89b23af3ea51fa5128927f12a85787e16239330f14  libXinerama-1.1.4.tar.bz2
 # Locally computed
-sha256 f661fd883b6e980b3b118e0fbe230fbf10eef8d4d4a35931355f29ed647ddbe3  COPYING
+sha256  f661fd883b6e980b3b118e0fbe230fbf10eef8d4d4a35931355f29ed647ddbe3  COPYING
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
index 8cad2389bc..b443419285 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.hash
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002978.html
-md5 ac774cff8b493f566088a255dbf91201  libXmu-1.1.3.tar.bz2
-sha1 7ff54ce38379fb795aebed38f6be404ee0dfeec6  libXmu-1.1.3.tar.bz2
-sha256 9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731  libXmu-1.1.3.tar.bz2
-sha512 8c6cc65b22aa031ad870dd92736681a068a0878a425a53dbed909943da1136c4a24034d467cfd3785c3a8d78f66850b69f1ebe1eb24aaf9bc176b1d171a5c762  libXmu-1.1.3.tar.bz2
+md5  ac774cff8b493f566088a255dbf91201  libXmu-1.1.3.tar.bz2
+sha1  7ff54ce38379fb795aebed38f6be404ee0dfeec6  libXmu-1.1.3.tar.bz2
+sha256  9c343225e7c3dc0904f2122b562278da5fed639b1b5e880d25111561bac5b731  libXmu-1.1.3.tar.bz2
+sha512  8c6cc65b22aa031ad870dd92736681a068a0878a425a53dbed909943da1136c4a24034d467cfd3785c3a8d78f66850b69f1ebe1eb24aaf9bc176b1d171a5c762  libXmu-1.1.3.tar.bz2
 # Locally computed
-sha256 e65a4a8bbf8b0dfd2439d6bc6d86df03e2b8e693b757593b25149e099aeb8ec4  COPYING
+sha256  e65a4a8bbf8b0dfd2439d6bc6d86df03e2b8e693b757593b25149e099aeb8ec4  COPYING
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index c3aa695c56..edfdaab335 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,8 +1,8 @@
 # From https://lists.x.org/archives/xorg-announce/2019-December/003034.html
-md5 6f0ecf8d103d528cfc803aa475137afa  libXpm-3.5.13.tar.bz2
-sha1 38b1a2728adb49f4e255aba1530f51789815ffc4  libXpm-3.5.13.tar.bz2
-sha256 9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25  libXpm-3.5.13.tar.bz2
-sha512 3b8f6e926272f39b1d95135c2274c00f5aaee1f9fb2ef79f71628df5edeb7ba20158819ef6a778101cc4092493a3b5b613c53634fdccadcc0fc85f0605e5e9a5  libXpm-3.5.13.tar.bz2
+md5  6f0ecf8d103d528cfc803aa475137afa  libXpm-3.5.13.tar.bz2
+sha1  38b1a2728adb49f4e255aba1530f51789815ffc4  libXpm-3.5.13.tar.bz2
+sha256  9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25  libXpm-3.5.13.tar.bz2
+sha512  3b8f6e926272f39b1d95135c2274c00f5aaee1f9fb2ef79f71628df5edeb7ba20158819ef6a778101cc4092493a3b5b613c53634fdccadcc0fc85f0605e5e9a5  libXpm-3.5.13.tar.bz2
 # Locally calculated
-sha256 ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e COPYING
-sha256 cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71 COPYRIGHT
+sha256  ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e  COPYING
+sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index ed53669537..4b12328df0 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002979.html
-md5 18f3b20d522f45e4dadd34afb5bea048  libXrandr-1.5.2.tar.bz2
-sha1 7a1f6df239341b76fd59ebbe101d6f180adb43bb  libXrandr-1.5.2.tar.bz2
-sha256 8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023  libXrandr-1.5.2.tar.bz2
-sha512 fcd005f9839e7ef980607128a5d76d7b671cc2f5755949e03c569c500d7e987cb3f6932750ab8bf6e2c1086ec69dde09d5831f0c2098b9f9ad46be4f56db0d87  libXrandr-1.5.2.tar.bz2
+md5  18f3b20d522f45e4dadd34afb5bea048  libXrandr-1.5.2.tar.bz2
+sha1  7a1f6df239341b76fd59ebbe101d6f180adb43bb  libXrandr-1.5.2.tar.bz2
+sha256  8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023  libXrandr-1.5.2.tar.bz2
+sha512  fcd005f9839e7ef980607128a5d76d7b671cc2f5755949e03c569c500d7e987cb3f6932750ab8bf6e2c1086ec69dde09d5831f0c2098b9f9ad46be4f56db0d87  libXrandr-1.5.2.tar.bz2
 # Locally computed
-sha256 73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
+sha256  73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index 96981ad502..680c765237 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,5 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002725.html
-sha256 c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949  libXrender-0.9.10.tar.bz2
+sha256  c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949  libXrender-0.9.10.tar.bz2
 
 # Locally calculated
-sha256 bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
+sha256  bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index dcd4853d76..40512f3540 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -2,4 +2,4 @@
 sha256  679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60  libXt-1.2.1.tar.bz2
 sha512  6877af61ba91eeed6b6f80471b84f354ad0ec0827249c7ee0a00c13508063fe8d2696dd400a4bdbc6ca2ff67cbe1317ad5ac24522fd96099dc56535e33ca052c  libXt-1.2.1.tar.bz2
 # Locally calculated
-sha256  a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81 COPYING
+sha256  a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81  COPYING
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index ccc6727017..a6f7e3d55c 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,5 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-October/002727.html
-sha256 d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088  libXv-1.0.11.tar.bz2
+sha256  d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088  libXv-1.0.11.tar.bz2
 
 # Locally calculated
-sha256 4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
+sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
index f0172c346c..1b05624783 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002982.html
-md5 0ddeafc13b33086357cfa96fae41ee8e  libXxf86dga-1.1.5.tar.bz2
-sha1 332ba80d1b3d06473f7bbfe1612e7c5b58fbdf69  libXxf86dga-1.1.5.tar.bz2
-sha256 2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203  libXxf86dga-1.1.5.tar.bz2
-sha512 0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89  libXxf86dga-1.1.5.tar.bz2
+md5  0ddeafc13b33086357cfa96fae41ee8e  libXxf86dga-1.1.5.tar.bz2
+sha1  332ba80d1b3d06473f7bbfe1612e7c5b58fbdf69  libXxf86dga-1.1.5.tar.bz2
+sha256  2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203  libXxf86dga-1.1.5.tar.bz2
+sha512  0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89  libXxf86dga-1.1.5.tar.bz2
 # Locally computed
-sha256 dd27933ebc5c063128b158b085e4c442a36b0e6f704cf753116da119610191da  COPYING
+sha256  dd27933ebc5c063128b158b085e4c442a36b0e6f704cf753116da119610191da  COPYING
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
index b55c55c84d..0601360c0e 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2015-February/002539.html
-sha1	78ef18ca2be157131899e01c62679e247409a13f				libXxf86vm-1.1.4.tar.bz2
-sha256	afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57	libXxf86vm-1.1.4.tar.bz2
+sha1  78ef18ca2be157131899e01c62679e247409a13f  libXxf86vm-1.1.4.tar.bz2
+sha256  afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57  libXxf86vm-1.1.4.tar.bz2
 
 # Locally calculated
-sha256	f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689	COPYING
+sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.hash b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
index 1090e3c2d5..e9d8616ba4 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.hash
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-May/002894.html
-md5 d2f1f0ec68ac3932dd7f1d9aa0a7a11c  libdmx-1.1.4.tar.bz2
-sha1 499e2540ca0e94ca858037865243c3c60908fd94  libdmx-1.1.4.tar.bz2
-sha256 253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243  libdmx-1.1.4.tar.bz2
-sha512 77aba6cadfd17db0cc7e1bc26f14d908223a0fdb135d46f86c3be34e3bc7e2f843f08d4d0ef773357e83b17122bffe56a0442d12908378c05a22177b10ae10e9  libdmx-1.1.4.tar.bz2
+md5  d2f1f0ec68ac3932dd7f1d9aa0a7a11c  libdmx-1.1.4.tar.bz2
+sha1  499e2540ca0e94ca858037865243c3c60908fd94  libdmx-1.1.4.tar.bz2
+sha256  253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243  libdmx-1.1.4.tar.bz2
+sha512  77aba6cadfd17db0cc7e1bc26f14d908223a0fdb135d46f86c3be34e3bc7e2f843f08d4d0ef773357e83b17122bffe56a0442d12908378c05a22177b10ae10e9  libdmx-1.1.4.tar.bz2
 # Locally computed
-sha256 819e8dcd3dd2a44850c350331aa492230f86bccb0983dd739dec5ba36d7d2b8e  COPYING
+sha256  819e8dcd3dd2a44850c350331aa492230f86bccb0983dd739dec5ba36d7d2b8e  COPYING
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index de05fd27dd..cf09f61c3e 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-February/002956.html
-md5 6447db6a689fb530c218f0f8328c3abc  libfontenc-1.1.4.tar.bz2
-sha1 d4f232b0b07487b984e13422ce4130b61a8b9edb  libfontenc-1.1.4.tar.bz2
-sha256 2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079  libfontenc-1.1.4.tar.bz2
-sha512 76fa851d00113241f15fdd5b5bb7e927b8d8b9a82ce3fcb0678b8c7e32cb5e8d898c4bda1d60dafb7748145049d3240627ac34a2360c64e98a7a912ea7c30582  libfontenc-1.1.4.tar.bz2
+md5  6447db6a689fb530c218f0f8328c3abc  libfontenc-1.1.4.tar.bz2
+sha1  d4f232b0b07487b984e13422ce4130b61a8b9edb  libfontenc-1.1.4.tar.bz2
+sha256  2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079  libfontenc-1.1.4.tar.bz2
+sha512  76fa851d00113241f15fdd5b5bb7e927b8d8b9a82ce3fcb0678b8c7e32cb5e8d898c4bda1d60dafb7748145049d3240627ac34a2360c64e98a7a912ea7c30582  libfontenc-1.1.4.tar.bz2
 # Locally computed
-sha256 a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
+sha256  a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 03e61bdc5e..3f2ffdf09a 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002977.html
-md5 dd7e1e946def674e78c0efbc5c7d5b3b  libxkbfile-1.1.0.tar.bz2
-sha1 487f314b6dbc17e93d0fe1e3741392156a9ca895  libxkbfile-1.1.0.tar.bz2
-sha256 758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7  libxkbfile-1.1.0.tar.bz2
-sha512 1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826  libxkbfile-1.1.0.tar.bz2
+md5  dd7e1e946def674e78c0efbc5c7d5b3b  libxkbfile-1.1.0.tar.bz2
+sha1  487f314b6dbc17e93d0fe1e3741392156a9ca895  libxkbfile-1.1.0.tar.bz2
+sha256  758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7  libxkbfile-1.1.0.tar.bz2
+sha512  1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826  libxkbfile-1.1.0.tar.bz2
 # Locally computed
-sha256 e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
+sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index afdffb827f..3ec055a792 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2018-February/002840.html
-md5 42dda8016943dc12aff2c03a036e0937  libxshmfence-1.3.tar.bz2
-sha1 3472218fc0e8ee8183533d22dbcd4bbe90bf3ab8  libxshmfence-1.3.tar.bz2
-sha256 b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7  libxshmfence-1.3.tar.bz2
-sha512 c446e055f8fac62b9aa266132289a4cfc030282147974c45ce96d1768a98d1afb997470e58e4a68513174c404cbf373bdde2f0cd4b34abdbce1d89dd0b6fe2b7  libxshmfence-1.3.tar.bz2
+md5  42dda8016943dc12aff2c03a036e0937  libxshmfence-1.3.tar.bz2
+sha1  3472218fc0e8ee8183533d22dbcd4bbe90bf3ab8  libxshmfence-1.3.tar.bz2
+sha256  b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7  libxshmfence-1.3.tar.bz2
+sha512  c446e055f8fac62b9aa266132289a4cfc030282147974c45ce96d1768a98d1afb997470e58e4a68513174c404cbf373bdde2f0cd4b34abdbce1d89dd0b6fe2b7  libxshmfence-1.3.tar.bz2
 # Locally computed
-sha256 64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
+sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
index 4e212c0f98..1bab37244e 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002980.html
-md5 ce2fb8100c6647ee81451ebe388b17ad  xtrans-1.4.0.tar.bz2
-sha1 7c490026efb450798e02b040c05eba5212291c08  xtrans-1.4.0.tar.bz2
-sha256 377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773  xtrans-1.4.0.tar.bz2
-sha512 4fea89a3455c0e13321cbefa43340016dbb59bdd0dbdb5b796c1a6d2a6b1fd63cf1327b769ab426286b9c54b32ec764a50cd2b46228e4e43b841bda6b94de214  xtrans-1.4.0.tar.bz2
+md5  ce2fb8100c6647ee81451ebe388b17ad  xtrans-1.4.0.tar.bz2
+sha1  7c490026efb450798e02b040c05eba5212291c08  xtrans-1.4.0.tar.bz2
+sha256  377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773  xtrans-1.4.0.tar.bz2
+sha512  4fea89a3455c0e13321cbefa43340016dbb59bdd0dbdb5b796c1a6d2a6b1fd63cf1327b769ab426286b9c54b32ec764a50cd2b46228e4e43b841bda6b94de214  xtrans-1.4.0.tar.bz2
 # Locally computed
-sha256 a9c96c832e00774266b492d4d41556f12a64f039ba3ef645c4b8c6010fcb8f2a  COPYING
+sha256  a9c96c832e00774266b492d4d41556f12a64f039ba3ef645c4b8c6010fcb8f2a  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 1798606163..079fa9ef8f 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,7 +1,7 @@
 # From https://lists.x.org/archives/xorg-announce/2019-March/002985.html
-md5 b2ca7f2f21f1c04a88b6a254c19c9b68  makedepend-1.0.6.tar.bz2
-sha1 3f321f7b570ec98f1fabc441267d29347a2e1456  makedepend-1.0.6.tar.bz2
-sha256 d558a52e8017d984ee59596a9582c8d699a1962391b632bec3bb6804bf4d501c  makedepend-1.0.6.tar.bz2
-sha512 eb0e8ee8ab7515806d7d98a060cdcd392ec38e4225e5e05db26daa6651f185d0b764aab403edeea904d4d23211b1f7db20daeee6eafce8abe65225784ed0aa42  makedepend-1.0.6.tar.bz2
+md5  b2ca7f2f21f1c04a88b6a254c19c9b68  makedepend-1.0.6.tar.bz2
+sha1  3f321f7b570ec98f1fabc441267d29347a2e1456  makedepend-1.0.6.tar.bz2
+sha256  d558a52e8017d984ee59596a9582c8d699a1962391b632bec3bb6804bf4d501c  makedepend-1.0.6.tar.bz2
+sha512  eb0e8ee8ab7515806d7d98a060cdcd392ec38e4225e5e05db26daa6651f185d0b764aab403edeea904d4d23211b1f7db20daeee6eafce8abe65225784ed0aa42  makedepend-1.0.6.tar.bz2
 # Locally computed
-sha256 0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
+sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/xavante/xavante.hash b/package/xavante/xavante.hash
index b2e8633bc6..842e2e32ea 100644
--- a/package/xavante/xavante.hash
+++ b/package/xavante/xavante.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 67c738f981e7d65d18c717f3acac59a37f95d5139c00fb0de5d3167262025273  xavante-2.4.0-1.src.rock
-sha256 57b2c50f08bf500c969fe13500f217adb36582e4d8e75c9e2ed04191cb4a045c  xavante-2.4.0/doc/us/license.html
+sha256  67c738f981e7d65d18c717f3acac59a37f95d5139c00fb0de5d3167262025273  xavante-2.4.0-1.src.rock
+sha256  57b2c50f08bf500c969fe13500f217adb36582e4d8e75c9e2ed04191cb4a045c  xavante-2.4.0/doc/us/license.html
diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
index 7191150957..4b696bb2a4 100644
--- a/package/xmlstarlet/xmlstarlet.hash
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/xmlstar/files/xmlstarlet/1.6.1/
-sha1	87bb104f546caca71b9540807c5b2738944cb219	xmlstarlet-1.6.1.tar.gz
-md5	f3c5dfa3b1a2ee06cd57c255cc8b70a0		xmlstarlet-1.6.1.tar.gz
+sha1  87bb104f546caca71b9540807c5b2738944cb219  xmlstarlet-1.6.1.tar.gz
+md5  f3c5dfa3b1a2ee06cd57c255cc8b70a0  xmlstarlet-1.6.1.tar.gz
 # Locally computed
 sha256  6641cc5b00c1651fa22175f34efd01695e64a348b1ba07048538276f44866862  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 3f28743e64..30c9916dca 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -2,4 +2,4 @@
 sha256  0f812e6e9d2786ba8f54b960ee563c0663ddbe2434bf24ff193f5feab1f31971  util-macros-1.19.3.tar.bz2
 sha512  b9c7398a912c688a782eab5b1e0f6da2df11a430775c5c98fc3269f73a665de6eeb60d300a849e38d345714a6e51f74e9334cb6039767304cca4b93d823a53a2  util-macros-1.19.3.tar.bz2
 # Locally computed
-sha256 489b630a75e3255485732eae3d50ff4d29d3feb66760bb3acb04f897e4d9e375  COPYING
+sha256  489b630a75e3255485732eae3d50ff4d29d3feb66760bb3acb04f897e4d9e375  COPYING
diff --git a/package/yad/yad.hash b/package/yad/yad.hash
index 1eee499c73..ec0edc522d 100644
--- a/package/yad/yad.hash
+++ b/package/yad/yad.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/yad-dialog/files/
-md5	82d458a2e1695dd0709f71ad26109812	yad-0.40.0.tar.xz
-sha1	4376eb42f8e38972124dc81e534cbdc9088109fb	yad-0.40.0.tar.xz
+md5  82d458a2e1695dd0709f71ad26109812  yad-0.40.0.tar.xz
+sha1  4376eb42f8e38972124dc81e534cbdc9088109fb  yad-0.40.0.tar.xz
 
 # Hash for license file
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/zip/zip.hash b/package/zip/zip.hash
index 5e1b3353a7..eb4bbf3b03 100644
--- a/package/zip/zip.hash
+++ b/package/zip/zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256	f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369	zip30.tgz
-sha256	8ecd6c1bab449127eb665cef1561e73a8bce52e217375f6f466939e137b1e110	LICENSE
+sha256  f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369  zip30.tgz
+sha256  8ecd6c1bab449127eb665cef1561e73a8bce52e217375f6f466939e137b1e110  LICENSE
diff --git a/package/zmqpp/zmqpp.hash b/package/zmqpp/zmqpp.hash
index c440b2aca2..af5acd53c0 100644
--- a/package/zmqpp/zmqpp.hash
+++ b/package/zmqpp/zmqpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c1d4587df3562f73849d9e5f8c932ca7dcfc7d8bec31f62d7f35073ef81f4d29  zmqpp-4.2.0.tar.gz
-sha256 fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
+sha256  c1d4587df3562f73849d9e5f8c932ca7dcfc7d8bec31f62d7f35073ef81f4d29  zmqpp-4.2.0.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index f12349bbd9..cabe3e70d4 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 4c2b8601d0e3377143c1a0bbab220146af9fa5a5e29e8fbef42862fe3d38f8e6 zxing-cpp-e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10.tar.gz
+sha256  4c2b8601d0e3377143c1a0bbab220146af9fa5a5e29e8fbef42862fe3d38f8e6  zxing-cpp-e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10.tar.gz
 
 # License files
-sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 COPYING
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/support/legal-info/buildroot.hash b/support/legal-info/buildroot.hash
index 1b62dbeef7..9d9f4c9dc9 100644
--- a/support/legal-info/buildroot.hash
+++ b/support/legal-info/buildroot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
+sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
index 7031d1b34a..e4dfb6eb0a 100644
--- a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
index b540164a29..65e1861f12 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
@@ -1,4 +1,4 @@
 # Codescape toolchains from MIPS Tech LLC
 # From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
-sha256 ac035f3b6a8767522977963d8e1490520d58bccca7956f4503a1eefff6492b71  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
-sha256 09280f4fcbb993607905bf9a43bf5f3db2beed85726f0675b8453e19a9ddc429  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
+sha256  ac035f3b6a8767522977963d8e1490520d58bccca7956f4503a1eefff6492b71  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
+sha256  09280f4fcbb993607905bf9a43bf5f3db2beed85726f0675b8453e19a9ddc429  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
index 8e70af501f..b07281de48 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
@@ -1,4 +1,4 @@
 # Codescape toolchains from MIPS Tech LLC
 # From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
-sha256 c883a404fd7ea5718e2249a530802e223381f2be52265f88e9b1ce7035c232f3  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
-sha256 d6310a970b0a8a19ad8e0a2b3ead8c38ee90d0e284a9b2511200ce447f460d2c  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
+sha256  c883a404fd7ea5718e2249a530802e223381f2be52265f88e9b1ce7035c232f3  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
+sha256  d6310a970b0a8a19ad8e0a2b3ead8c38ee90d0e284a9b2511200ce447f460d2c  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
index f7d3f29fdc..8f8fca0d0c 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
+sha256  405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256  3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
index 535f4aaf99..c01a7b17c5 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
+sha256  39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+sha256  e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
index 2d80338e7b..c2429d85de 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
+sha256  d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256  2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
index 518e677f31..47893ab7e2 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -1,6 +1,6 @@
 # From https://sourcery.mentor.com/GNUToolchain/release3374
-md5 4f536b3b9b4e00f483e82e304c0a27ae sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-md5 be42ab83da2e8db7b73dc890c2549570 sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
+md5  4f536b3b9b4e00f483e82e304c0a27ae  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+md5  be42ab83da2e8db7b73dc890c2549570  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
 # Locally calculated
-sha256 c19afb432b5b23f8d5d639831d3a423a3ea3c9cc62e0015020d20ea2eb36dd1b  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 d73a6364106dd62352711f932d3be8e97fdaaa548995678b5d38d9f21e22437a  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
+sha256  c19afb432b5b23f8d5d639831d3a423a3ea3c9cc62e0015020d20ea2eb36dd1b  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256  d73a6364106dd62352711f932d3be8e97fdaaa548995678b5d38d9f21e22437a  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
index f93642ecaa..53b6966e7b 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
-sha256 277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
+sha256  412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
+sha256  277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 938e37c779..70841a4fa2 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 466b801a60491ae1e2ce9952e0615cf04cf611596c6ffd5bfe8a89ef5be47e03  gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu.tar.xz
-sha256 73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345  gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
+sha256  466b801a60491ae1e2ce9952e0615cf04cf611596c6ffd5bfe8a89ef5be47e03  gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu.tar.xz
+sha256  73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345  gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
index bd09cb5a89..7169e0b936 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
-sha256 7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
+sha256  0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
+sha256  7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
index a3b6b88b7e..2b80f396d1 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
-sha256 c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
+sha256  60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
+sha256  c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index 3ce6bbcb12..3c22723833 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,5 @@
 # From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.09-release
-sha256 f7cbf68ef251943db7baf63535e0ec98dafbdf5d925017b4e1d4fc64d9b38a26  arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 ac09f0a21f9d50146a5e542f4a6abc93e5a1dcb0a1372cb5c3ba86bbefaaec7d  arc_gnu_2019.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 245ca49fe8ea2456617541b18bb96e52e6c0dc619f00e293fcaad519fc436c35  arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 6f039a0158c03af398ada31fae96009e47f0d7b7f7d52e12eb419492fc3f27e7  arc_gnu_2019.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
+sha256  f7cbf68ef251943db7baf63535e0ec98dafbdf5d925017b4e1d4fc64d9b38a26  arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256  ac09f0a21f9d50146a5e542f4a6abc93e5a1dcb0a1372cb5c3ba86bbefaaec7d  arc_gnu_2019.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256  245ca49fe8ea2456617541b18bb96e52e6c0dc619f00e293fcaad519fc436c35  arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256  6f039a0158c03af398ada31fae96009e47f0d7b7f7d52e12eb419492fc3f27e7  arc_gnu_2019.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
