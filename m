From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:41:11 +0200
Subject: [Buildroot] [git commit] package/multimedia: move audio libraries
	out
Message-ID: <20120505214225.6454190B01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d6f32878f707f4c28fe09d02e960d851c76e3c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move audio libraries out of the Audio and Video category into the
Libraries/Audio one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |   20 ++++++++++++++++++++
 package/{multimedia => }/alsa-lib/Config.in        |    0
 .../alsa-lib/alsa-lib-avr32-bad-inline.patch       |    0
 package/{multimedia => }/alsa-lib/alsa-lib.mk      |    0
 package/{multimedia => }/audiofile/Config.in       |    0
 package/{multimedia => }/audiofile/audiofile.mk    |    0
 package/{multimedia => }/libao/Config.in           |    0
 package/{multimedia => }/libao/libao.mk            |    0
 package/{multimedia => }/libcdaudio/Config.in      |    0
 package/{multimedia => }/libcdaudio/libcdaudio.mk  |    0
 package/{multimedia => }/libcue/Config.in          |    0
 .../libcue/libcue-1.4.0-__unused-fix.patch         |    0
 package/{multimedia => }/libcue/libcue.mk          |    0
 package/{multimedia => }/libcuefile/Config.in      |    0
 package/{multimedia => }/libcuefile/libcuefile.mk  |    0
 package/{multimedia => }/libid3tag/Config.in       |    0
 package/{multimedia => }/libid3tag/libid3tag.mk    |    0
 package/{multimedia => }/libmad/Config.in          |    0
 .../libmad-0.15.1b-mips-h-constraint-removal.patch |    0
 .../libmad/libmad-0.15.1b-optimization.patch.avr32 |    0
 .../libmad-0.15.1b-remove-deprecated-cflags.patch  |    0
 package/{multimedia => }/libmad/libmad.mk          |    0
 package/{multimedia => }/libmad/mad.pc             |    0
 package/{multimedia => }/libmpd/Config.in          |    0
 package/{multimedia => }/libmpd/libmpd.mk          |    0
 package/{multimedia => }/libreplaygain/Config.in   |    0
 .../libreplaygain/libreplaygain.mk                 |    0
 package/{multimedia => }/libsamplerate/Config.in   |    0
 .../libsamplerate/libsamplerate.mk                 |    0
 package/{multimedia => }/libsndfile/Config.in      |    0
 .../libsndfile/libsndfile-srconly.patch            |    0
 package/{multimedia => }/libsndfile/libsndfile.mk  |    0
 package/{multimedia => }/libvorbis/Config.in       |    0
 package/{multimedia => }/libvorbis/libvorbis.mk    |    0
 package/multimedia/Config.in                       |   17 -----------------
 package/{multimedia => }/portaudio/Config.in       |    0
 package/{multimedia => }/portaudio/portaudio.mk    |    0
 package/{multimedia => }/speex/Config.in           |    0
 package/{multimedia => }/speex/speex.mk            |    0
 package/{multimedia => }/taglib/Config.in          |    0
 package/{multimedia => }/taglib/taglib.mk          |    0
 package/{multimedia => }/tremor/Config.in          |    0
 package/{multimedia => }/tremor/tremor.mk          |    0
 43 files changed, 20 insertions(+), 17 deletions(-)

Patch is too large, so refusing to show it
