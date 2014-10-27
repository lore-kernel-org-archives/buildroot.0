From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Oct 2014 01:26:09 +0100
Subject: [Buildroot] [PATCH 0/3] Patch renaming
Message-ID: <1414369572-15695-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Short series applying the latest policy WRT the patch naming convention:
Patch 1/3: manually handle conditional patches
Patch 2/3: add a script automating the renaming job
Patch 3/3: run this script

Regards,

Samuel

Samuel Martin (3):
  package/gcc: rename the conditional patch according to the new policy
  support/scripts: add rename-patch.py script
  package/*: rename patches according to the new policy

 ...atch => 0001-support-static-installation.patch} |   0
 ...isfdtype.patch => 0001-dont-use-isfdtype.patch} |   0
 ...efines.patch => 0002-add-missing-defines.patch} |   0
 ...es.patch => 0001-gnutls-and-uclibc-fixes.patch} |   0
 ...> 0002-makefile-reorder-linked-libraries.patch} |   0
 ....patch => 0003-clock-suite-functions-fix.patch} |   0
 ...VE-2010-1159.patch => 0001-CVE-2010-1159.patch} |   0
 ...ad-inline.patch => 0001-avr32-bad-inline.patch} |   0
 ...lsa-lib-0002-no-mmu.patch => 0002-no-mmu.patch} |   0
 ...lsa-lib-0003-dlmisc.patch => 0003-dlmisc.patch} |   0
 ...0004-conditional-enabling-of-libdl-in-m4.patch} |   0
 ...ui_0.9.0rc2-1-7.patch => 0001-misc-fixes.patch} |   0
 ...-fix-makefile.patch => 0001-fix-makefile.patch} |   0
 ...e-checkapr.patch => 0001-remove-checkapr.patch} |   0
 ...n-funcdef.patch => 0001-throw-in-funcdef.patch} |   0
 ...-remove-manual-compiler-check-with-AC_TR.patch} |   0
 ...-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} |   0
 ...Makefile.in-add-LDFLAGS-to-linking-stage.patch} |   0
 ...004-Makefile.in-replace-IROOT-by-DESTDIR.patch} |   0
 ...tch => 0005-Makefile.in-make-install-fix.patch} |   0
 ...avg.c-fix.patch => 0006-getloadavg.c-fix.patch} |   0
 ...tch => 0007-parsetime.l-include-config-h.patch} |   0
 ...atch => 0001-support-static-installation.patch} |   0
 ....patch => 0001-fix-incorrect-makefile-am.patch} |   0
 ....patch => 0001-dont-add-dirty-to-version.patch} |   0
 ...{automake-0001-noman.patch => 0001-noman.patch} |   0
 ...utoipd-perms.patch => 0001-autoipd-perms.patch} |   0
 ...rt.patch => 0002-disable-systemd-support.patch} |   0
 .../{avahi-ipv6only.patch => 0003-ipv6only.patch}  |   0
 ...ptional-ipv6.patch => 0004-optional-ipv6.patch} |   0
 ...ins-cross.patch => 0001-mkbuiltins-cross.patch} |   0
 ...chlevel1-27.patch => 0002-patchlevel1-27.patch} |   0
 ...-patchlevel28.patch => 0003-patchlevel28.patch} |   0
 ...-patchlevel29.patch => 0004-patchlevel29.patch} |   0
 ...-patchlevel30.patch => 0005-patchlevel30.patch} |   0
 ...patch => 0001-cppglue.cxx-cplusplus-only.patch} |   0
 ...le.patch => 0002-icu-check-cross-compile.patch} |   0
 ...-build-system.patch => 0003-build-system.patch} |   0
 ...crypt-0004-gcc-4.7.patch => 0004-gcc-4.7.patch} |   0
 ....3-drop-werror.patch => 0001-drop-werror.patch} |   0
 ...king.patch => 0002-dynamicloader-linking.patch} |   0
 ...allel-build.patch => 0003-parallel-build.patch} |   0
 ... 0004-segfault-on-removeFromWaitResource.patch} |   0
 ...isable-tests.patch => 0001-disable-tests.patch} |   0
 .../bind/{bind-02-cross.patch => 0002-cross.patch} |   0
 ...o-docs-regen.patch => 0001-no-docs-regen.patch} |   0
 ...figure-ac.patch => 0001-Fix-configure-ac.patch} |   0
 .../{blackbox-002-gcc43.patch => 0002-gcc43.patch} |   0
 ...patch => 0003-gcc46-textpropertytostring.patch} |   0
 ...h => 0001-enable_cg2900_on_upstream_4.91.patch} |   0
 ...ix-ambiguous-format-call-on-64bit-builds.patch} |   0
 ...-build-system.patch => 0001-build-system.patch} |   0
 ...atch => 0002-fix-for-kernel-headers-3.8+.patch} |   0
 ...ibiproute-use-linux-if_packet.h-instead-.patch} |   0
 ...2.1-ash.patch => 0002-busybox-1.22.1-ash.patch} |   0
 ...1-date.patch => 0003-busybox-1.22.1-date.patch} |   0
 ...link.patch => 0004-busybox-1.22.1-iplink.patch} |   0
 ....22.1-nc.patch => 0005-busybox-1.22.1-nc.patch} |   0
 ...ck.patch => 0006-lzop-add-overflow-check.patch} |   0
 ...-twice.patch => 0001-build-objects-twice.patch} |   0
 ...ystem.patch => 0002-improve-build-system.patch} |   0
 ...01-use_check_build_instead_of_check_user.patch} |   0
 ...h => 0001-Fix-conflicting-round-function.patch} |   0
 ...ild-fix.patch => 0001-blackfin-build-fix.patch} |   0
 ...build-fix.patch => 0002-openvg-build-fix.patch} |   0
 ...ork-build.patch => 0003-fix-nofork-build.patch} |   0
 ...any2ppm.patch => 0004-fix-nofork-any2ppm.patch} |   0
 ...-49-build.patch => 0005-fix-gcc-49-build.patch} |   0
 ...install-pkgconfig-module-for-canfestival.patch} |   0
 ... => 0002-allow-to-set-python-interpreter.patch} |   0
 ...kit-1.1.11-no-rcmd.patch => 0001-no-rcmd.patch} |   0
 ...{cegui06-stddef.h.patch => 0001-stddef.h.patch} |   0
 ...e-libf2c-to-be-built-as-a-static-library.patch} |   0
 ...ke-test-build-sensitive-to-BUILD_TESTING.patch} |   0
 ...-try-to-run-arithchk-when-cross-compilin.patch} |   0
 ...las-add-library-and-header-install-rules.patch} |   0
 ...ack-add-library-and-header-install-rules.patch} |   0
 ...mp-include.patch => 0001-fix-gmp-include.patch} |   0
 ...fig-rpath.patch => 0002-add-config-rpath.patch} |   0
 ...ng-files.patch => 0001-add-missing-files.patch} |   0
 ...loop-2.634-1-cflags.patch => 0001-cflags.patch} |   0
 ...backtrace.patch => 0001-uclibc-backtrace.patch} |   0
 ...ge.patch => 0001-fix-for-dummy-man-usage.patch} |   0
 ...uffix.patch => 0001-mysql-library-suffix.patch} |   0
 .../{cramfs-01-endian.patch => 0001-endian.patch}  |   0
 ...mfs-02-cygwin_IO.patch => 0002-cygwin_IO.patch} |   0
 ...ile-allow-to-override-python-interpreter.patch} |   0
 ...-DESTDIR-support-in-install-libreg-rules.patch} |   0
 ...e_INIT_COMPLETION_with_reinit_completion.patch} |   0
 ... 0001-link-against-lrt-for-clock_gettime.patch} |   0
 ...ryptsetup-0002-mkdir.patch => 0002-mkdir.patch} |   0
 ...0001-fix-static.patch => 0001-fix-static.patch} |   0
 ....patch => 0002-fix-stack-protector-check.patch} |   0
 ...s-0003-mantohtml.patch => 0003-mantohtml.patch} |   0
 ...IZE.patch => 0001-fix-CURLOPT_INFILESIZE.patch} |   0
 ...atch => 0002-free_ftpfs_file-memleak-fix.patch} |   0
 ...ak-fix.patch => 0003-nocache-memleak-fix.patch} |   0
 ...> 0001-fix-link-options-for-as-needed-90.patch} |   0
 ...s.patch => 0002-Update-for-BlueZ-changes.patch} |   0
 ...inking-by-adding-the-missing-lbluetooth-.patch} |   0
 ...0004-configure-make-wmgui-build-optional.patch} |   0
 ...e-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch} |   0
 ...rs.patch => 0001-no-config.h-for-helpers.patch} |   0
 ...bus-cpp-0001-gcc4.7.patch => 0001-gcc4.7.patch} |   0
 ...patch => 0002-cxxflags-ldflags-for-build.patch} |   0
 ...patch => 0001-fix-python-configure-check.patch} |   0
 ....patch => 0001-be-coherent-in-type-usage.patch} |   0
 ...res.patch => 0001-use-non-bsd-structures.patch} |   0
 ...st.patch => 0002-fix-strsep-feature-test.patch} |   0
 ...mdline-nruns.patch => 0001-cmdline-nruns.patch} |   0
 .../{dhrystone-2-HZ.patch => 0002-HZ.patch}        |   0
 .../{dhrystone-2-exit.patch => 0003-exit.patch}    |   0
 ...hrystone-2-headers.patch => 0004-headers.patch} |   0
 ...ne-2-prototypes.patch => 0005-prototypes.patch} |   0
 ...-change-fltk-config-test-to-be-more-cros.patch} |   0
 ...-remove-bzero.patch => 0001-remove-bzero.patch} |   0
 ...> 0001-fix-missing-davinci-voodoo-header.patch} |   0
 ...mlib2-config.patch => 0002-imlib2-config.patch} |   0
 ...> 0003-remove-redefinition-of-__typeof__.patch} |   0
 ...region-lock.patch => 0004-setregion-lock.patch} |   0
 ...-use-gcc-link.patch => 0005-use-gcc-link.patch} |   0
 ...oc-5.4.3-add-fpic.patch => 0001-add-fpic.patch} |   0
 .../{dmalloc-mips.patch => 0002-mips.patch}        |   0
 ...m-fixes.patch => 0001-build-system-fixes.patch} |   0
 .../{dropwatch-01-build.patch => 0001-build.patch} |   0
 ...ils-2.23.1.patch => 0002-binutils-2.23.1.patch} |   0
 ...emove-werror.patch => 0003-remove-werror.patch} |   0
 ...-extra_cflags.patch => 0001-extra_cflags.patch} |   0
 ...stall.patch => 0002-separate-lib-install.patch} |   0
 ...tion.patch => 0001-fix-cross-compilation.patch} |   0
 ...ames.patch => 0001-Fix-generate-keynames.patch} |   0
 ...patch => 0002-Fix-compiler-warning-flags.patch} |   0
 ....patch => 0003-support-static-only-build.patch} |   0
 ...em-init-libs.patch => 0001-sem-init-libs.patch} |   0
 ...es-includes.patch => 0001-fixes-includes.patch} |   0
 ...ompiler.patch => 0002-force-cxx-compiler.patch} |   0
 ...isable-progs.patch => 0001-disable-progs.patch} |   0
 ...-argp-support.patch => 0002-argp-support.patch} |   0
 ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |   0
 .../{elfutils-04-fts.patch => 0004-fts.patch}      |   0
 ...s-05-disable-po.patch => 0005-disable-po.patch} |   0
 ...ct-LDFLAGS.patch => 0001-respect-LDFLAGS.patch} |   0
 ...erlang-build-fix.patch => 0001-build-fix.patch} |   0
 ...-use-pragma-for-ignoring-diagnostics-if-.patch} |   0
 ...evemu-0001-SYN_MAX.patch => 0001-SYN_MAX.patch} |   0
 ...02-configure.ac-add-disable-tests-option.patch} |   0
 ...ames-use-input.h-from-sysroot-instead-of.patch} |   0
 ...re.ac-add-disable-python-bindings-option.patch} |   0
 ...h => 0001-Build-buildconfig-for-the-host.patch} |   0
 ...-t-make-backup-copies-of-installed-files.patch} |   0
 ...p-version-check-and-symlink-installation.patch} |   0
 ...n.patch => 0001-enable-cross-compilation.patch} |   0
 ....patch => 0002-allow-tcl-build-directory.patch} |   0
 ...de.patch => 0001-allow-compiler-override.patch} |   0
 ...ide-cflags.patch => 0001-override-cflags.patch} |   0
 ...tic-build.patch => 0001-fix-static-build.patch} |   0
 ...1.0b-arch.patch.avr32 => 0001-arch.patch.avr32} |   0
 .../fbv/{fbv-1.0b-cross.patch => 0002-cross.patch} |   0
 ... => 0003-fix-24bpp-support-on-big-endian.patch} |   0
 ...1.0b-fix-bgr555.patch => 0004-fix-bgr555.patch} |   0
 .../{fbv-1.0b-include.patch => 0005-include.patch} |   0
 ...fbv-1.0b-libpng15.patch => 0006-libpng15.patch} |   0
 ...nk.patch => 0001-fix-openssl-static-link.patch} |   0
 .../{ffmpeg-0001-fminf.patch => 0001-fminf.patch}  |   0
 ...{fis-001-checksum.patch => 0001-checksum.patch} |   0
 ...03-list_output.patch => 0003-list_output.patch} |   0
 ...04-sorted_list.patch => 0004-sorted_list.patch} |   0
 ...ec-logic.patch => 0001-fix-altivec-logic.patch} |   0
 .../{flex-prog-ar.patch => 0001-prog-ar.patch}     |   0
 ...tps-for-all-service-endpoints.-HTTP-EOL-.patch} |   0
 ...uth-services-are-on-https-www.flickr.com.patch} |   0
 ...patch => 0001-now-honor-DESTDIR-env.-var.patch} |   0
 ...lsa-static.patch => 0002-fix-alsa-static.patch} |   0
 ...isable-tests.patch => 0001-disable-tests.patch} |   0
 .../{fltk-02-jpeg-9.patch => 0002-jpeg-9.patch}    |   0
 ...ibc.patch => 0001-add-support-for-uclibc.patch} |   0
 ...nclude.patch => 0001-correct-HAL-include.patch} |   0
 ... => 0001-vpu-io-fix-IOSystemInit-failure.patch} |   0
 ...lib-fix-IOGetVirtMem-return-value-checks.patch} |   0
 ...top-0001-overflow.patch => 0001-overflow.patch} |   0
 ...nclude.patch => 0001-fix-usb-ch9-include.patch} |   0
 ...2-rename-include-usb_gadgetfs-to-usb-dir.patch} |   0
 ...ockets.patch => 0001-no-abstract-sockets.patch} |   0
 ...nst-return.patch => 0002-no-const-return.patch} |   0
 ...-no-versioned.patch => 0001-no-versioned.patch} |   0
 .../{gcc-44-pr39429.patch => 0044-pr39429.patch}   |   0
 ...0-powerpc-link-with-math-lib.patch.conditional} |   0
 ...0-powerpc-link-with-math-lib.patch.conditional} |   0
 ...0-powerpc-link-with-math-lib.patch.conditional} |   0
 ...0-powerpc-link-with-math-lib.patch.conditional} |   0
 ...0-powerpc-link-with-math-lib.patch.conditional} |   0
 package/gcc/gcc.mk                                 |   2 +-
 ...-gdlib-config.patch => 0001-gdlib-config.patch} |   0
 .../gd/{gd-02-no-zlib.patch => 0002-no-zlib.patch} |   0
 ...tch => 0003-gd_bmp-fix-build-with-uClibc.patch} |   0
 ...VE-2014-2497.patch => 0004-CVE-2014-2497.patch} |   0
 ... => 0001-update-genext2fs.c-to-rev-1.118.patch} |   0
 ...eturn-code.patch => 0001-fix-return-code.patch} |   0
 ...-build-system.patch => 0001-build-system.patch} |   0
 ...gname.patch => 0001-error_print_progname.patch} |   0
 ...ction.patch => 0001-fix-imlib2-detection.patch} |   0
 ...-accept-make4.patch => 0001-accept-make4.patch} |   0
 ...> 0001-arm-asm-conditional-on-no-thumb-1.patch} |   0
 ...> 0002-arm-asm-conditional-on-no-thumb-2.patch} |   0
 ...-provide-default-bmod-to-mod-threshold-1.patch} |   0
 ...cflags.patch => 0001-use-override-cflags.patch} |   0
 ...ves.patch => 0002-parallel-make-archives.patch} |   0
 ...arallel-make.patch => 0003-parallel-make.patch} |   0
 ...onflicts.patch => 0001-getline-conflicts.patch} |   0
 .../{gnuchess-5.07.patch => 0002-misc-fixes.patch} |   0
 ...usage.patch => 0001-fix-pth-config-usage.patch} |   0
 ...> 0001-configure-add-without-demo-option.patch} |   0
 ....patch => 0002-use-gdlib-config-properly.patch} |   0
 ...x.patch => 0001-dont-include-from-prefix.patch} |   0
 ...001-Fix-build-error-when-ntpshm-is-false.patch} |   0
 ...h.patch => 0002-sconstruct-disable-rpath.patch} |   0
 ...pping-of-ntpshm_latch-function-in-ifdef-.patch} |   0
 ...patch => 0001-configurable-utf16-support.patch} |   0
 .../{gqview-2.1.5-make.patch => 0001-make.patch}   |   0
 ...ror.patch => 0001-fix-lphread-link-error.patch} |   0
 ...st-ffmpeg-0001-gcc47.patch => 0001-gcc47.patch} |   0
 ...002-arm-avoid-using-the-movw-instruction.patch} |   0
 ....patch => 0001-gplay-add-missing-include.patch} |   0
 ... => 0002-Fix-bashism-in-configure-script.patch} |   0
 ...objdump.patch => 0003-Use-proper-objdump.patch} |   0
 ...l-linkage-add-lrt-for-shared-memory-func.patch} |   0
 ...-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch} |   0
 ...rect-CFLAGS.patch => 0001-correct-CFLAGS.patch} |   0
 ...-opus-jpegformat-unbreak-non-debug-build.patch} |   0
 ...fb-example.patch => 0002-fix-dfb-example.patch} |   0
 ...plugins-base-tremor.patch => 0001-tremor.patch} |   0
 ...ugins-good-linux36.patch => 0001-linux36.patch} |   0
 ...compilation-against-newer-kernel-headers.patch} |   0
 ...gstreamer-01-bison3.patch => 0001-bison3.patch} |   0
 ...text-0.18.patch => 0001-use-gettext-0.18.patch} |   0
 ....patch => 0001-use-pregen-xmli18n-header.patch} |   0
 ...-replaces-static-with-static-libtool-lib.patch} |   0
 ...haserl-0.8.0-legacy.patch => 0001-legacy.patch} |   0
 ....inc.patch => 0001-add-haserl_lualib.inc.patch} |   0
 ...rocess.patch => 0001-add-roken-h-process.patch} |   0
 ...-Getopt-Std.patch => 0002-use-Getopt-Std.patch} |   0
 ...heimdal-0003-vendor.patch => 0003-vendor.patch} |   0
 ...0004-compile_et.patch => 0004-compile_et.patch} |   0
 .../{hplip-fix-make.patch => 0001-fix-make.patch}  |   0
 ...e-affinity.patch => 0001-native-affinity.patch} |   0
 ...g.patch => 0001-fix-math-library-linking.patch} |   0
 ... => 0001-dont-build-static-dynamic-twice.patch} |   0
 ....patch => 0002-workaround-toolchain-bugs.patch} |   0
 ...ch => 0003-detect-compiler-symbol-prefix.patch} |   0
 ....patch => 0004-link-icudata-as-data-only.patch} |   0
 .../{ifplugd-cross.patch => 0001-cross.patch}      |   0
 ...gd-fix-headers.patch => 0002-fix-headers.patch} |   0
 .../{ifplugd-no-cxx.patch => 0003-no-cxx.patch}    |   0
 ...mpproxy-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...ml2-config.patch => 0001-use-xml2-config.patch} |   0
 ....patch => 0001-configure-fix-cross-build.patch} |   0
 ...t-tools-20051019-rint.patch => 0001-rint.patch} |   0
 .../{iostat-cpunum.patch => 0001-cpunum.patch}     |   0
 ...{iozone-01-targets.patch => 0001-targets.patch} |   0
 ...tl-support.patch => 0002-no-nptl-support.patch} |   0
 ...ptional-ipv6.patch => 0001-optional-ipv6.patch} |   0
 ...l-ipv6.patch => 0002-vxlan-optional-ipv6.patch} |   0
 ...-gettext.patch => 0001-Don-t-use-gettext.patch} |   0
 ...ow-CFLAGS-to-be-extended-from-the-enviro.patch} |   0
 ...-static-build-by-passing-the-libraries-i.patch} |   0
 ...-susv3-legacy.patch => 0001-susv3-legacy.patch} |   0
 ...tatic-link.patch => 0001-fix-static-link.patch} |   0
 ...p-6-tables-save.c-remove-dlfcn.h-include.patch} |   0
 ...utils-0.9.18-daemon.patch => 0001-daemon.patch} |   0
 ...a-utils-0.9.18-nommu.patch => 0002-nommu.patch} |   0
 ...utils-0.9.18-subdir.patch => 0003-subdir.patch} |   0
 ...ad-use-ldflags.patch => 0001-use-ldflags.patch} |   0
 ... 0001-disable-bessel-functions-on-uclibc.patch} |   0
 ...h => 0001-libm.h-comment-j0-j1-y0-and-y1.patch} |   0
 ...-no-reentrant.patch => 0001-no-reentrant.patch} |   0
 ...bintl.patch => 0001-link-against-libintl.patch} |   0
 ...lean-restart.patch => 0001-clean-restart.patch} |   0
 ...c-0001-largefile.patch => 0001-largefile.patch} |   0
 ...g-of-the-shared-library-to-be-suppressed.patch} |   0
 ...tall-rule.patch => 0002-fix-install-rule.patch} |   0
 .../{keyutils-03-cifs.patch => 0003-cifs.patch}    |   0
 ...oot.patch => 0004-Makefile-for-buildroot.patch} |   0
 .../{kismet-ncurses.patch => 0001-ncurses.patch}   |   0
 .../{kismet-nobsd.patch => 0002-nobsd.patch}       |   0
 ...ix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch} |   0
 ...002-add-backup-implementation-of-be32toh.patch} |   0
 ...td-defines.patch => 0001-fix-mtd-defines.patch} |   0
 ...tencytop-makefile.patch => 0001-makefile.patch} |   0
 ...001-Remove-installation-of-docs-examples.patch} |   0
 ...cdproc-LCDd.conf.patch => 0001-LCDd.conf.patch} |   0
 ...ss_makefile.patch => 0001-cross_makefile.patch} |   0
 ...baio-0.3.109-arches.patch => 0001-arches.patch} |   0
 ...vr32-support.patch => 0002-avr32-support.patch} |   0
 ...io-0.3.109-destdir.patch => 0003-destdir.patch} |   0
 ...fig-cross.patch => 0001-art-config-cross.patch} |   0
 ...-flags.patch => 0001-strpool-cross-flags.patch} |   0
 ...-build-system.patch => 0001-build-system.patch} |   0
 ...atch => 0002-split-static-shared-install.patch} |   0
 ...istering-a-callback-that-wasn-t-register.patch} |   0
 ...i-warning.patch => 0002-no-psabi-warning.patch} |   0
 .../libcgi/{libcgi.patch => 0001-misc-fixes.patch} |   0
 ...tch => 0001-disable-documentation-option.patch} |   0
 ...figure-ac.patch => 0001-fix-configure-ac.patch} |   0
 ...0-__unused-fix.patch => 0001-_unused-fix.patch} |   0
 ...tatic-link.patch => 0001-fix-static-link.patch} |   0
 ...0001-fixtimeout.patch => 0001-fixtimeout.patch} |   0
 ...std-use-unistd-h-instead-of-sys-unistd-h.patch} |   0
 ...-001-python-gcc.patch => 0001-python-gcc.patch} |   0
 ...n-makefile.patch => 0002-python-makefile.patch} |   0
 ...s2-support.patch => 0001-fix-os2-support.patch} |   0
 ...s2-support.patch => 0001-fix-os2-support.patch} |   0
 ...6-build.patch => 0001-fix-non-ipv6-build.patch} |   0
 ...=> 0002-use-pkg-config-to-detect-openssl.patch} |   0
 ...ch => 0001-check-bsd-functions-in-libbsd.patch} |   0
 ...ror.patch => 0001-fix-installation-error.patch} |   0
 ... => 0002-remove-prefix-hack-in-configure.patch} |   0
 .../{libenca-003-iconv.patch => 0003-iconv.patch}  |   0
 .../{libfcgi-0000-eof.patch => 0001-eof.patch}     |   0
 ...la.patch => 0002-link-against-libfcgi-la.patch} |   0
 ...nst-math.patch => 0003-link-against-math.patch} |   0
 ...nfable.patch => 0004-make-autoreconfable.patch} |   0
 ...-examples.patch => 0005-disable-examples.patch} |   0
 ...0001-Fix-installation-location-of-libffi.patch} |   0
 ...002-Fix-use-of-compact-eh-frames-on-MIPS.patch} |   0
 ...bffi-003-fix-typo.patch => 0003-fix-typo.patch} |   0
 ...dd-missing-GNU-stack-markings-in-win32.S.patch} |   0
 ....patch => 0005-Fix-paths-in-libffi.pc.in.patch} |   0
 ...fix-tests-of-return-value-from-IOGetVirt.patch} |   0
 ...ig_libusb.patch => 0001-pkgconfig_libusb.patch} |   0
 ...64-build.patch => 0001-fix-aarch64-build.patch} |   0
 ...ies.patch => 0001-Relax-X11-dependencies.patch} |   0
 ...1-Fix-build-on-Linux-x86_64-under-uClibc.patch} |   0
 ...atch => 0001-ac_cv_sys_symbol_underscore.patch} |   0
 ...01-reconfigure.patch => 0002-reconfigure.patch} |   0
 ...-pkg-config.patch => 0001-use-pkg-config.patch} |   0
 ...ptional-ipv6.patch => 0001-optional-ipv6.patch} |   0
 .../0002-no-gtk-doc.patch}                         |   0
 ... 0003-implement-GMutex-natively-on-Linux.patch} |   0
 ...encies.patch => 0001-reduce-dependencies.patch} |   0
 ...0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} |   0
 ...ck.patch => 0002-fix-introspection-check.patch} |   0
 ...-bridge.patch => 0003-disable-atk-bridge.patch} |   0
 ...tch => 0001-dont-fiddle-with-debug-flags.patch} |   0
 ...lags.patch => 0002-no-newline-in-ldflags.patch} |   0
 ...ibhid-0003-uclinux.patch => 0003-uclinux.patch} |   0
 ... 0001-rename-log_msg-to-libinput_log_msg.patch} |   0
 ...-static-library-and-find-required-thread.patch} |   0
 ...nguage.patch => 0002-use-only-c-language.patch} |   0
 ...1-Fix-warnings-related-to-subdir-objects.patch} |   0
 ...ool-AM_PROG_AR-warning-during-autoreconf.patch} |   0
 ...003-Fix-CUnit-test-for-cross-compilation.patch} |   0
 ...-examples-fix-uint64_t-formatting-issues.patch} |   0
 ...05-ld_iscsi-fix-largefile-related-issues.patch} |   0
 ...kefile.patch => 0001-fix-broken-makefile.patch} |   0
 ...iblockfile-install.patch => 0001-install.patch} |   0
 ...iblogging-01-stdarg.patch => 0001-stdarg.patch} |   0
 ....patch => 0001-mips-h-constraint-removal.patch} |   0
 ...n.patch.avr32 => 0002-optimization.patch.avr32} |   0
 ...s.patch => 0003-remove-deprecated-cflags.patch} |   0
 ...fixed-arm.patch => 0004-thumb2-fixed-arm.patch} |   0
 ...imdct-arm.patch => 0005-thumb2-imdct-arm.patch} |   0
 .../{libmcrypt-nocxx.patch => 0001-nocxx.patch}    |   0
 ...isable-tests.patch => 0001-disable-tests.patch} |   0
 ...{libmnl-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...0001-musl-fixes.patch => 0001-musl-fixes.patch} |   0
 ...peg2-0.5.1-altivec.patch => 0001-altivec.patch} |   0
 ...bmpeg2-0.5.1-armv4l.patch => 0002-armv4l.patch} |   0
 ...er_acct-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...nntrack-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...thelper-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...timeout-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...ter_log-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...r_queue-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...uild-systems-make-example-build-optional.patch} |   0
 ...netlink-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...-rename-xfree.patch => 0001-rename-xfree.patch} |   0
 ...tlink-h-use-poll-h-instead-of-sys-poll-h.patch} |   0
 .../{libnspr-0001-nios2.patch => 0001-nios2.patch} |   0
 ...0002-microblaze.patch => 0002-microblaze.patch} |   0
 ...ross-compile.patch => 0001-cross-compile.patch} |   0
 ...{libnss-0002-uclibc.patch => 0002-uclibc.patch} |   0
 ....patch => 0001-remove-libnl-include-path.patch} |   0
 ... 0002-configure.in-uclinux-is-also-linux.patch} |   0
 ...ibplayer-add-fpic.patch => 0001-add-fpic.patch} |   0
 ...flags.patch => 0002-fix-configure-cflags.patch} |   0
 ...isable-tools.patch => 0001-disable-tools.patch} |   0
 ...refix.patch => 0002-ignore-symbol-prefix.patch} |   0
 ...atch => 0001-fix-build-on-linux-3.x-host.patch} |   0
 ...1-disable_shared_library_target_in_build.patch} |   0
 ... => 0001-use-system-headers-from-sysroot.patch} |   0
 ...ch => 0002-Remove-the-dependency-on-proc.patch} |   0
 ...c-only.patch => 0001-support-static-only.patch} |   0
 ...gs.patch => 0001-disable-python-bindings.patch} |   0
 ...patch => 0002-add-missing-header-include.patch} |   0
 ...vr32-build.patch => 0001-fix-avr32-build.patch} |   0
 ...64-build.patch => 0002-fix-aarch64-build.patch} |   0
 ...build.patch => 0003-fix-microblaze-build.patch} |   0
 ...-bfin-build.patch => 0004-fix-bfin-build.patch} |   0
 ...libsndfile-srconly.patch => 0001-srconly.patch} |   0
 ...01-python3-fix.patch => 0001-python3-fix.patch} |   0
 ...nfable.patch => 0001-make-autoreconfable.patch} |   0
 ...configure.ac-fix-misdetection-of-libxml2.patch} |   0
 ...tch => 0001-fix-expat-static-declaration.patch} |   0
 ...ntfs.patch => 0001-disable-debug-printfs.patch} |   0
 ...e-builddir.patch => 0002-create-builddir.patch} |   0
 ...ble-parts-of-TIRPC-requiring-NIS-support.patch} |   0
 ...ut-RPC-support-does-not-install-rpcent.h.patch} |   0
 ...patch => 0004-Make-IPv6-support-optional.patch} |   0
 ...dd-rpcgen-program-from-nfs-utils-sources.patch} |   0
 ...y-generate-XDR-header-files-from-.x-sour.patch} |   0
 ...-files-needed-to-build-rpcbind-on-top-of.patch} |   0
 ...linking.patch => 0001-mips64-n64-linking.patch} |   0
 ...ross_compile.patch => 0001-cross_compile.patch} |   0
 ...-json-c.patch => 0001-drop-legacy-json-c.patch} |   0
 ...isable-tests.patch => 0001-disable-tests.patch} |   0
 ...dd-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} |   0
 ...1-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch} |   0
 ...-fixup-lfs-mismatch-in-preload-libraries.patch} |   0
 ...river-0001-wayland.patch => 0001-wayland.patch} |   0
 ...test_decode.patch => 0001-no_test_decode.patch} |   0
 ...libva-0002-wayland.patch => 0002-wayland.patch} |   0
 ...51-6052.patch => 0001-CVE-2014-6051-6052.patch} |   0
 ...VE-2014-6053.patch => 0002-CVE-2014-6053.patch} |   0
 ...VE-2014-6054.patch => 0003-CVE-2014-6054.patch} |   0
 ...VE-2014-6055.patch => 0004-CVE-2014-6055.patch} |   0
 ...h => 0001-cmake-set-the-project-language.patch} |   0
 ...e-shared-library-build-when-BUILD_SHARED.patch} |   0
 ...b-build.patch => 0001-fix-gennmtab-build.patch} |   0
 ...ld.patch => 0002-fix-non-cplusplus-build.patch} |   0
 ...char-build.patch => 0003-non-wchar-build.patch} |   0
 ...ig.patch => 0004-use-correct-curl-config.patch} |   0
 ...le.patch => 0001-Fix-default-config-file.patch} |   0
 ...-no-largefile.patch => 0001-no-largefile.patch} |   0
 ...VE-2013-6050.patch => 0002-CVE-2013-6050.patch} |   0
 ...all-fix-__packed-in-exported-kernel-head.patch} |   0
 ...pam-01-configure.patch => 0001-configure.patch} |   0
 ...akefile-am.patch => 0002-doc-makefile-am.patch} |   0
 .../{linux-pam-03-group.patch => 0003-group.patch} |   0
 .../{linux-pam-04-mkdir.patch => 0004-mkdir.patch} |   0
 ...nux-pam-05-succeed.patch => 0005-succeed.patch} |   0
 .../{linux-pam-06-time.patch => 0006-time.patch}   |   0
 ...linux-pam-07-rhosts.patch => 0007-rhosts.patch} |   0
 ...h => 0001-test-serial-Remove-test-serial.patch} |   0
 ...te-dfbspy-stat.patch => 0001-dfbspy-stat.patch} |   0
 .../{lite-no-tests.patch => 0002-no-tests.patch}   |   0
 ...lite-pkg-config.patch => 0003-pkg-config.patch} |   0
 ...-static-build.patch => 0001-static-build.patch} |   0
 ...-ldconfig.patch => 0002-no-host-ldconfig.patch} |   0
 ...-sus3v-legacy.patch => 0001-sus3v-legacy.patch} |   0
 ...harset-fixes.patch => 0001-charset-fixes.patch} |   0
 ...-includes.patch => 0002-missing-includes.patch} |   0
 ...-includes.patch => 0003-missing-includes.patch} |   0
 .../{lshw-add-LIBS.patch => 0001-add-LIBS.patch}   |   0
 ...sof-0001-makefile.patch => 0001-makefile.patch} |   0
 ...f-0002-noportmap.patch => 0002-noportmap.patch} |   0
 ...ide-cflags.patch => 0003-override-cflags.patch} |   0
 ...cs.patch => 0004-remove-susvlegacy-funcs.patch} |   0
 ....patch => 0001-fix-build-on-uClibc-exp10.patch} |   0
 .../{ltrace-01-events.patch => 0001-events.patch}  |   0
 ...{ltrace-02-arm-plt.patch => 0002-arm-plt.patch} |   0
 ...-build.patch => 0003-PPC-fix-PPC32-build.patch} |   0
 ...tch => 0001-no-posix-fallocate-in-uclibc.patch} |   0
 ...lua-01-root-path.patch => 0001-root-path.patch} |   0
 ...or-lua.patch => 0002-shared-libs-for-lua.patch} |   0
 ...lua-11-linenoise.patch => 0011-linenoise.patch} |   0
 ...r-at-eoz.patch => 0012-fix-reader-at-eoz.patch} |   0
 ...lua-01-root-path.patch => 0001-root-path.patch} |   0
 ...or-lua.patch => 0002-shared-libs-for-lua.patch} |   0
 .../{lua-04-lua-pc.patch => 0004-lua-pc.patch}     |   0
 ...lua-11-linenoise.patch => 0011-linenoise.patch} |   0
 ...ge_file.patch => 0001-without_large_file.patch} |   0
 ...bin-symlink.patch => 0004-no-bin-symlink.patch} |   0
 ...05-install-inc.patch => 0005-install-inc.patch} |   0
 ...t-06-install-so.patch => 0006-install-so.patch} |   0
 ...01-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} |   0
 ...01-drop-werror.patch => 0001-drop-werror.patch} |   0
 ...api.patch => 0001-switch-to-new-alsa-api.patch} |   0
 ...-is-legacy.patch => 0001-index-is-legacy.patch} |   0
 ...lib-0002-libpng15.patch => 0002-libpng15.patch} |   0
 ...-setjmp-h.patch => 0003-include-setjmp-h.patch} |   0
 ...-is-legacy.patch => 0001-index-is-legacy.patch} |   0
 ...-0.1-true-false.patch => 0001-true-false.patch} |   0
 ...-defaulttheme.patch => 0001-defaulttheme.patch} |   0
 ...VE-2012-4409.patch => 0001-CVE-2012-4409.patch} |   0
 ...VE-2012-4426.patch => 0002-CVE-2012-4426.patch} |   0
 ...VE-2012-4527.patch => 0003-CVE-2012-4527.patch} |   0
 .../{mcrypt-no-rpath.patch => 0004-no-rpath.patch} |   0
 ...-add-install-targets-for-mdadm-and-mdmon.patch} |   0
 ...atch => 0020-uclibc-dont-force-largefile.patch} |   0
 ...edefine-off64_t-as-off_t-if-no-largefile.patch} |   0
 ...rs-for-compatibility-with-old-toolchains.patch} |   0
 ...iastreamer-0001.patch => 0001-misc-fixes.patch} |   0
 ...tat-0001-PATH_MAX.patch => 0001-PATH_MAX.patch} |   0
 ...-makefile-fix.patch => 0001-makefile-fix.patch} |   0
 ...tform.h-not-installed-if-EGL-is-disabled.patch} |   0
 ...0002-execinfo_h.patch => 0002-execinfo_h.patch} |   0
 ...ference.patch => 0001-add-libm-reference.patch} |   0
 .../{metacity-gconf.patch => 0002-gconf.patch}     |   0
 ...nce.patch => 0003-mag-add-libm-reference.patch} |   0
 .../{mii-diag-strchr.patch => 0001-strchr.patch}   |   0
 ...ncludes.patch => 0001-fix-mmc-h-includes.patch} |   0
 ...tch => 0001-largefile-conditional-define.patch} |   0
 ...> 0001-use-CC-variable-to-compile-procer.patch} |   0
 ...run-tests.patch => 0002-Do-not-run-tests.patch} |   0
 ...0003-Fix-Makefiles-for-cross-compilation.patch} |   0
 ...rce-static.patch => 0001-no-force-static.patch} |   0
 ...c-fix-uclibc.patch => 0001-gc-fix-uclibc.patch} |   0
 ...c-musl.patch => 0002-support-uclibc-musl.patch} |   0
 ...trip.patch => 0001-disable-install-strip.patch} |   0
 ...-cc-parsing.patch => 0002-fix-cc-parsing.patch} |   0
 ... => 0003-mpdemux-live555-async-interface.patch} |   0
 ...rc-support.patch => 0004-add-arc-support.patch} |   0
 .../{mrouted-bcopy.patch => 0001-bcopy.patch}      |   0
 ...ch => 0001-Fix-rpmatch-call-under-uClibc.patch} |   0
 ...usepack-0001-shared.patch => 0001-shared.patch} |   0
 ...e-standard-CMake-flag-to-drive-the-share.patch} |   0
 .../mutt/{mutt-01-nodoc.patch => 0001-nodoc.patch} |   0
 ...ch => 0001-fix-cross-target-installation.patch} |   0
 ...cache_check.patch => 0001-ac_cache_check.patch} |   0
 ...k.patch => 0002-configure-ps-cache-check.patch} |   0
 ...ace.patch => 0003-use-new-readline-iface.patch} |   0
 ...atch => 0004-ac_stack_direction-is-unset.patch} |   0
 ...patch => 0005-Fix-gen_lex_hash-execution.patch} |   0
 ...> 0006-bison_3_breaks_mysql_server_build.patch} |   0
 ....patch => 0001-fixup-pkg-config-handling.patch} |   0
 ...x.patch => 0001-trace-tcp-upd-uClibc-fix.patch} |   0
 ...ts-don-t-hard-code-thumb-code-generation.patch} |   0
 ...etting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} |   0
 ...unting.patch => 0001-signed-bit-counting.patch} |   0
 ...efile-flags.patch => 0001-makefile-flags.patch} |   0
 ...VE-2014-2285.patch => 0001-CVE-2014-2285.patch} |   0
 ...erUtils-fix-build-with-toolchains-not-ex.patch} |   0
 ...-fix-makefile.patch => 0001-fix-makefile.patch} |   0
 ...{nfacct-01-uclinux.patch => 0001-uclinux.patch} |   0
 ...-AM_CONDITIONAL-in-conditional-execution.patch} |   0
 ...oo.patch => 0002-Patch-taken-from-Gentoo.patch} |   0
 ...-Switch-legacy-index-in-favour-of-strchr.patch} |   0
 ...libc.patch => 0004-fix-build-with-uClibc.patch} |   0
 ...of-getrpcbynumber-when-getrpcbynumber_r-.patch} |   0
 ...igure-script-find-getrpcbynumber-in-libt.patch} |   0
 ... 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} |   0
 ...zeof-rework-autotest-to-be-cross-compila.patch} |   0
 ...-add-mechanism-allowing-to-force-feature.patch} |   0
 ..._feature_run_force_result-for-each-featu.patch} |   0
 ...xslt-conf-allow-to-override-ngx_feature_.patch} |   0
 ...ix-make-sys_nerr-guessing-cross-friendly.patch} |   0
 ...p-0001-make-objs.patch => 0001-make-objs.patch} |   0
 ...02-pcre-header.patch => 0002-pcre-header.patch} |   0
 ...tatic-link.patch => 0003-fix-static-link.patch} |   0
 ...tch => 0001-remove-python-bz2-dependency.patch} |   0
 ...> 0002-gyp-force-link-command-to-use-CXX.patch} |   0
 ...riable.patch => 0003-use-python-variable.patch} |   0
 ...{ntp-001-adjtimex.patch => 0001-adjtimex.patch} |   0
 .../ntp/{ntp-002-nano.patch => 0002-nano.patch}    |   0
 ...0001-foo-config.patch => 0001-foo-config.patch} |   0
 ...allel-build.patch => 0002-parallel-build.patch} |   0
 ...-susv3-legacy.patch => 0001-susv3-legacy.patch} |   0
 ...odules-cross.patch => 0001-modules-cross.patch} |   0
 ...backtrace.patch => 0001-uclibc-backtrace.patch} |   0
 ...-warning.patch => 0001-fix-build-warning.patch} |   0
 ...02-move-python-sub-check-to-configure.ac.patch} |   0
 ...-for-python-module-for-cross-compilation.patch} |   0
 ...nfig.patch => 0001-configurable-ldconfig.patch} |   0
 ...-fix-makefile.patch => 0001-fix-makefile.patch} |   0
 ...> 0001-core-fix-x86-PIC-code-compilation.patch} |   0
 ...> 0001-libusb_check_when_cross-compiling.patch} |   0
 ...tch => 0002-replace_deprecated_functions.patch} |   0
 ...-compilation-host-libsub-was-used-before.patch} |   0
 ...02-fix-xscale-uninitialise-breakpoint_pc.patch} |   0
 ...03-force-gnu99.patch => 0003-force-gnu99.patch} |   0
 ...static.patch => 0004-force_jimtcl_static.patch} |   0
 ...ldflags.patch => 0005-dont-force-ldflags.patch} |   0
 ...ake-compat.patch => 0006-automake-compat.patch} |   0
 ...n_generator.py-make-it-python3-compliant.patch} |   0
 ...ross-compile.patch => 0002-cross-compile.patch} |   0
 ...Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} |   0
 ...ch => 0001-fix-pam-uclibc-pthreads-clash.patch} |   0
 ...nclude.patch => 0002-fix-howmany-include.patch} |   0
 ...ild-docs.patch => 0001-do-not-build-docs.patch} |   0
 ...file.patch => 0002-dont-force-large-file.patch} |   0
 ...odev-Fix-issue-with-signature-generation.patch} |   0
 ...-musl-termios.patch => 0004-musl-termios.patch} |   0
 ..._bsd_printf.patch => 0001-has_bsd_printf.patch} |   0
 ...work_script.patch => 0002-network_script.patch} |   0
 ...atch => 0003-conditionally-define-g_info.patch} |   0
 ...gs_werror.patch => 0004-no_cflags_werror.patch} |   0
 ...pflags.patch => 0005-dont-force-cppflags.patch} |   0
 ...atch => 0001-avr32-enable-lookup_dcookie.patch} |   0
 ...error-on-ppc-uClibc-platform-AT_BASE_PLA.patch} |   0
 ...-fix-test-for-synth-check-with-GCC-4.9.0.patch} |   0
 ...-tools-largefile.patch => 0001-largefile.patch} |   0
 ...fix-bashism-in-ARM-optimization-handling.patch} |   0
 ...0001-fix-CROSS_COMPILE-usage-in-Makefile.patch} |   0
 ...-3.3.x.patch => 0002-fix-for-linux-3.3.x.patch} |   0
 ...d-against-older-pthreads-implementations.patch} |   0
 ...ngo-0001-no-tests.patch => 0001-no-tests.patch} |   0
 .../0002-no-gtk-doc.patch}                         |   0
 ...ecated.patch => 0001-readline-deprecated.patch} |   0
 ... 0002-configure.ac-uclinux-is-also-linux.patch} |   0
 ...libx11.patch => 0001-link-against-libx11.patch} |   0
 ...cre-01-no-compat.patch => 0001-no-compat.patch} |   0
 ...-no-cpp-tests.patch => 0002-no-cpp-tests.patch} |   0
 ....patch => 0001-pthread-needed-for-libusb.patch} |   0
 ...d-01-getoptions.patch => 0001-getoptions.patch} |   0
 .../{perl-gd-02-lgd.patch => 0002-lgd.patch}       |   0
 .../{perl-gd-03-force.patch => 0003-force.patch}   |   0
 ...ld-system.patch => 0001-fix-build-system.patch} |   0
 ...01-Makefile-PL.patch => 0001-Makefile-PL.patch} |   0
 ...rl-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} |   0
 ...onv-search.patch => 0001-no-iconv-search.patch} |   0
 .../php/{php-02-dlopen.patch => 0002-dlopen.patch} |   0
 ...le-pharcmd.patch => 0003-disable-pharcmd.patch} |   0
 ... => 0001-Makefile-cross-compile-friendly.patch} |   0
 ...FLAGS.patch => 0002-Makefile-use-LDFLAGS.patch} |   0
 ...-fix-variable.patch => 0001-fix-variable.patch} |   0
 ...sysroot.patch => 0002-fix-double-sysroot.patch} |   0
 .../{poco-aarch64.patch => 0001-aarch64.patch}     |   0
 ...fig.patch => 0002-add-cross-build-config.patch} |   0
 ...th.patch => 0003-add-staging-search-path.patch} |   0
 ...libs.patch => 0004-dont-build-debug-libs.patch} |   0
 ...o-test-suite.patch => 0001-no-test-suite.patch} |   0
 ...asm.patch => 0002-disable-microblaze-asm.patch} |   0
 ...e-standard-CMake-flag-to-drive-the-share.patch} |   0
 ...{popt-01-no-wchar.patch => 0001-no-wchar.patch} |   0
 ...-autoreconf.patch => 0002-fix-autoreconf.patch} |   0
 ...b-detection.patch => 0003-glob-detection.patch} |   0
 ... 0001-README-fix-typo-in-tcp-wrapper-doc.patch} |   0
 ...002-NO_PIE-make-PIE-support-controllable.patch} |   0
 ...-control-usage-of-fork-for-nommu-systems.patch} |   0
 ...RROR-control-overriding-of-perror-symbol.patch} |   0
 .../{portmap-6.0-tcpd.patch => 0005-tcpd.patch}    |   0
 ...-susv3-legacy.patch => 0001-susv3-legacy.patch} |   0
 ...l-build.patch => 0002-fix-parallel-build.patch} |   0
 ....5.0-libpng-1.4.patch => 0001-libpng-1.4.patch} |   0
 ...-remove-index.patch => 0001-remove-index.patch} |   0
 ...001-fix-kernel-header-capability-version.patch} |   0
 ...d-0002-__mempcpy.patch => 0002-__mempcpy.patch} |   0
 ...bintl.patch => 0001-link-against-libintl.patch} |   0
 ...o-__progname.patch => 0002-no-__progname.patch} |   0
 ...pure-ftpd-0001-cross.patch => 0001-cross.patch} |   0
 ... 0001-set-correct-python-executable-path.patch} |   0
 ...ddrs-uclibc.patch => 0001-ifaddrs-uclibc.patch} |   0
 ...-add-setup-py.patch => 0001-add-setup-py.patch} |   0
 ...n-uclibc.patch => 0001-no-fenv-on-uclibc.patch} |   0
 ...tch => 0001-remove-incorrect-header-path.patch} |   0
 ...-buildroot-zmq-version-instead-of-detect.patch} |   0
 ...-executable.patch => 0001-add-executable.patch} |   0
 ...th.patch => 0001-remove-host-header-path.patch} |   0
 ...hon-inc.patch => 0002-fix-get-python-inc.patch} |   0
 ... => 0003-properly-detect-if-python-build.patch} |   0
 ...h => 0004-sysconfigdata-install-location.patch} |   0
 ...tional.patch => 0005-pyc-pyo-conditional.patch} |   0
 ....patch => 0006-cross-compile-getaddrinfo.patch} |   0
 ...ensions.patch => 0007-disable-extensions.patch} |   0
 ...tch => 0008-distutils-use-python-sysroot.patch} |   0
 ...-path.patch => 0009-no-termcap-host-path.patch} |   0
 ...n-config.patch => 0010-fix-python-config.patch} |   0
 ...link.patch => 0011-remove-python-symlink.patch} |   0
 ... 0012-support-library-path-old-compilers.patch} |   0
 ...th.patch => 0013-dont-add-multiarch-path.patch} |   0
 ...es.patch => 0014-abort-on-failed-modules.patch} |   0
 ...patch => 0015-fix-sqlite-without-threads.patch} |   0
 ...nd.patch => 0016-serial-ioctl-workaround.patch} |   0
 ...17-distutils-scripts-dont-adjust-shebang.patch} |   0
 ...ules.patch => 0100-optional-test-modules.patch} |   0
 ...ional-pydoc.patch => 0101-optional-pydoc.patch} |   0
 ...ptional-2to3.patch => 0102-optional-2to3.patch} |   0
 ...nal-sqlite.patch => 0103-optional-sqlite.patch} |   0
 ...04-optional-tk.patch => 0104-optional-tk.patch} |   0
 ...nal-curses.patch => 0105-optional-curses.patch} |   0
 ...ional-expat.patch => 0106-optional-expat.patch} |   0
 ...cs-cjk.patch => 0107-optional-codecs-cjk.patch} |   0
 ...-optional-nis.patch => 0108-optional-nis.patch} |   0
 ...edata.patch => 0109-optional-unicodedata.patch} |   0
 ...10-optional-db.patch => 0110-optional-db.patch} |   0
 ...-optional-ssl.patch => 0111-optional-ssl.patch} |   0
 ...ional-bzip2.patch => 0112-optional-bzip2.patch} |   0
 ...ptional-zlib.patch => 0113-optional-zlib.patch} |   0
 ...-editor.patch => 0114-remove-idle-editor.patch} |   0
 ...th.patch => 0001-remove-host-header-path.patch} |   0
 ... => 0002-properly-detect-if-python-build.patch} |   0
 ...h => 0003-sysconfigdata-install-location.patch} |   0
 ...lib-cache.patch => 0004-old-stdlib-cache.patch} |   0
 ...tional.patch => 0005-pyc-pyo-conditional.patch} |   0
 ....patch => 0006-cross-compile-getaddrinfo.patch} |   0
 ...ensions.patch => 0007-disable-extensions.patch} |   0
 ...08-distutils-sysconfig-use-sysconfigdata.patch} |   0
 ...tch => 0009-distutils-use-python-sysroot.patch} |   0
 ...-path.patch => 0010-no-termcap-host-path.patch} |   0
 ... 0011-support-library-path-old-compilers.patch} |   0
 ...th.patch => 0012-dont-add-multiarch-path.patch} |   0
 ...es.patch => 0013-abort-on-failed-modules.patch} |   0
 ...nd.patch => 0014-serial-ioctl-workaround.patch} |   0
 ...15-distutils-scripts-dont-adjust-shebang.patch} |   0
 ...p3147.patch => 0016-distutils-no-pep3147.patch} |   0
 ...ules.patch => 0100-optional-test-modules.patch} |   0
 ...ional-pydoc.patch => 0101-optional-pydoc.patch} |   0
 ...ptional-2to3.patch => 0102-optional-2to3.patch} |   0
 ...nal-sqlite.patch => 0103-optional-sqlite.patch} |   0
 ...04-optional-tk.patch => 0104-optional-tk.patch} |   0
 ...nal-curses.patch => 0105-optional-curses.patch} |   0
 ...ional-expat.patch => 0106-optional-expat.patch} |   0
 ...cs-cjk.patch => 0107-optional-codecs-cjk.patch} |   0
 ...-optional-nis.patch => 0108-optional-nis.patch} |   0
 ...edata.patch => 0109-optional-unicodedata.patch} |   0
 ...ptional-idle.patch => 0110-optional-idle.patch} |   0
 ...l-decimal.patch => 0111-optional-decimal.patch} |   0
 ...e-install.patch => 0001-fix-make-install.patch} |   0
 ...> 0002-configure.ac-drop-hardcoded-paths.patch} |   0
 ...{qdecoder-0003-errno.patch => 0003-errno.patch} |   0
 .../{qextserialport-gui.patch => 0001-gui.patch}   |   0
 ...-main-include.patch => 0002-main-include.patch} |   0
 ...alport-pkgconfig.patch => 0003-pkgconfig.patch} |   0
 ...0001-fix-qt4-package-error-in-cmakelists.patch} |   0
 ...aths.patch => 0001-remove-absolute-paths.patch} |   0
 ...-obey-destdir.patch => 0002-obey-destdir.patch} |   0
 ...s.patch => 0003-fix-openssl-mysql-checks.patch} |   0
 .../{qt-configure.patch => 0001-configure.patch}   |   0
 ...system.patch => 0002-eglwsegl-use-system.patch} |   0
 ...-atomics.patch => 0003-fix-const-atomics.patch} |   0
 ...attr_np.patch => 0004-pthread_getattr_np.patch} |   0
 ...o-gui.patch => 0005-script-qtdbus-no-gui.patch} |   0
 ...ibc-lfs-fix.patch => 0006-uClibc-lfs-fix.patch} |   0
 ...kspecs-files.patch => 0002-mkspecs-files.patch} |   0
 ...clibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} |   0
 ...-examples-0001-build.patch => 0001-build.patch} |   0
 ...ncludepath.patch => 0001-egl-includepath.patch} |   0
 ...1-Remove-dependency-on-unused-sql-module.patch} |   0
 ... 0001-TuioServer.cpp-add-missing-include.patch} |   0
 ...g.patch => 0002-dont-append-_d-for-debug.patch} |   0
 ...rding.patch => 0001-fix-ipctl-forwarding.patch} |   0
 ...umber.patch => 0001-tools-getrpcbynumber.patch} |   0
 ...eck.patch => 0001-remove-installed-check.patch} |   0
 ...d-01-drop-check.patch => 0001-drop-check.patch} |   0
 ...ector.patch => 0002-drop-stack-protector.patch} |   0
 ...01-8bit-colors.patch => 0001-8bit-colors.patch} |   0
 ...01-curses-link.patch => 0001-curses-link.patch} |   0
 .../{redis-001-uclibc.patch => 0001-uclibc.patch}  |   0
 .../{redis-002-lua-AR.patch => 0002-lua-AR.patch}  |   0
 ...tch => 0003-largefile-conditional-define.patch} |   0
 ...-002-krn-plugin.patch => 0002-krn-plugin.patch} |   0
 ...atch => 0001-Remove-yellow-pages-support.patch} |   0
 ...ble.patch => 0003-Make-IPv6-configurable.patch} |   0
 ...-files.patch => 0001-add-pkgconfig-files.patch} |   0
 ...ake-vmcs.cmake-allow-to-override-VMCS_IN.patch} |   0
 ...ssert.patch => 0003-remove-faulty-assert.patch} |   0
 ...l-compile.patch => 0004-fix-musl-compile.patch} |   0
 ...-lfs-fix.patch => 0001-uclibc-no-lfs-fix.patch} |   0
 ....0_depends-fix.patch => 0002-depends-fix.patch} |   0
 ...e-tools.patch => 0003-exclude-some-tools.patch} |   0
 ...exes.patch => 0004-ignore-shared-mutexes.patch} |   0
 ...o-parentdirs.patch => 0005-no-parentdirs.patch} |   0
 ..._ordering-fix.patch => 0006-ordering-fix.patch} |   0
 ...ires.patch => 0007-parentdir-vs-requires.patch} |   0
 ...cuit-c99.patch => 0008-short-circuit-c99.patch} |   0
 ...ake-compat.patch => 0001-automake-compat.patch} |   0
 ...002-configure-dont-hardcode-include-dirs.patch} |   0
 ...ld-system.patch => 0001-fix-build-system.patch} |   0
 .../{rt-tests-uclibc.patch => 0002-uclibc.patch}   |   0
 ...ross_compile.patch => 0001-cross_compile.patch} |   0
 ...c.patch => 0001-host2ip-no-nis-on-uClibc.patch} |   0
 ....patch => 0001-dont-use-legacy-functions.patch} |   0
 .../{rubix-1.0.5.patch => 0002-misc-fixes.patch}   |   0
 ...-avahi.patch => 0001-fix-smbd-libs-avahi.patch} |   0
 ...02-getaddrinfo.patch => 0002-getaddrinfo.patch} |   0
 ...03-build-find-FILE_OFFSET_BITS-via-array.patch} |   0
 ...ild-allow-some-python-variable-overrides.patch} |   0
 ... 0005-build-find-blkcnt_t-size-via-array.patch} |   0
 ...=> 0006-build-unify-and-fix-endian-tests.patch} |   0
 ...samba-CHECK_SIZEOF-cross-compile-friendl.patch} |   0
 ... => 0008-build-tweak-SIZEOF-utmp-ut_line.patch} |   0
 ...able-libbsd.patch => 0009-disable-libbsd.patch} |   0
 ...s-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch} |   0
 ...ne-backends-1.0.22-v4l.patch => 0002-v4l.patch} |   0
 ...tch => 0001-link-using-gcc-instead-of-ld.patch} |   0
 ...cks.patch => 0001-compiler-sanity-checks.patch} |   0
 ...allback.patch => 0002-no-memcpy-fallback.patch} |   0
 ...tch => 0003-cross-compilation-AC_TRY_RUN.patch} |   0
 ...=> 0004-cross-compilation-ignore-host-fs.patch} |   0
 ....patch => 0005-avoid-identifying-as-SVR4.patch} |   0
 ...y.patch => 0006-install-no-backup-binary.patch} |   0
 ...chmod.patch => 0007-install-always-chmod.patch} |   0
 ...atch => 0008-install-nonversioned-binary.patch} |   0
 ...ncy.patch => 0009-install-dir-dependency.patch} |   0
 ...ame-sched_h.patch => 0010-rename-sched_h.patch} |   0
 ...atch => 0001-use-correct-directfb-config.patch} |   0
 ...atch => 0002-fix-compilation-with-libx11.patch} |   0
 ... => 0001-Fix-TIOCSRS485-undeclared-error.patch} |   0
 ...ystem-fix.patch => 0001-build-system-fix.patch} |   0
 ...ix.patch => 0002-tiocghayesesp-build-fix.patch} |   0
 ...=> 0001-configure-add-pkg-config-support.patch} |   0
 ...ang-01-slsh-libs.patch => 0001-slsh-libs.patch} |   0
 ...-fix-Makefile.patch => 0001-fix-Makefile.patch} |   0
 ...ludes.patch => 0001-Add-missing-includes.patch} |   0
 ...mentation.patch => 0001-no-documentation.patch} |   0
 .../{sox-0001-uclibc.patch => 0001-uclibc.patch}   |   0
 ...mb2-support.patch => 0001-thumb2-support.patch} |   0
 ...001-fix-missing-monitor_latency-argument.patch} |   0
 ....patch => 0001-assume-get-certificate-ok.patch} |   0
 ...e_h.patch => 0002-missing-include-time_h.patch} |   0
 ...-ncurses-link.patch => 0001-ncurses-link.patch} |   0
 ...ap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch} |   0
 ...largefile.patch => 0001-Remove-largefile.patch} |   0
 ...01-no-netgroup.patch => 0001-no-netgroup.patch} |   0
 ...> 0002-drop-sspcflags-piecflags-for-host.patch} |   0
 ...h => 0001-Add-missing-GLchar-definitions.patch} |   0
 ...gy-1.3.1-includes.patch => 0001-includes.patch} |   0
 ...emove-werror.patch => 0002-remove-werror.patch} |   0
 ..._ID.patch => 0001-define-NT_GNU_BUILD_ID.patch} |   0
 ...-getty-unit.patch => 0001-fix-getty-unit.patch} |   0
 ...ild-sys-revert-use-of-ln-relative-option.patch} |   0
 ...h => 0003-fix-am-path-libgcrypt-no-found.patch} |   0
 ...e-standard-CMake-flag-to-drive-the-share.patch} |   0
 ...-failure.patch => 0001-fix-build-failure.patch} |   0
 ...d-compat.patch => 0001-dont-build-compat.patch} |   0
 ...event-cross.patch => 0001-libevent-cross.patch} |   0
 ...t-02-autoreconf.patch => 0002-autoreconf.patch} |   0
 ...t-03-zlib-cross.patch => 0003-zlib-cross.patch} |   0
 ...h => 0004-failed-to-build-on-OSX-10.9-GM.patch} |   0
 ...05-stdlib-and-boost-both-define-uint64_t.patch} |   0
 ...ttpd-2.25b-getline.patch => 0001-getline.patch} |   0
 ...x-0000-newclkapi.patch => 0001-newclkapi.patch} |   0
 ...ux.patch => 0002-fix-build-omaplfb-linux.patch} |   0
 ...modules.patch => 0003-km_install_modules.patch} |   0
 .../{tinyhttpd.patch => 0001-misc-fixes.patch}     |   0
 .../{tn5250-01-ssldir.patch => 0001-ssldir.patch}  |   0
 ...ction.patch => 0001-Fix-ptrace-detection.patch} |   0
 ...n-01-fix-utypes.patch => 0001-fix-utypes.patch} |   0
 ...w_module.patch => 0001-enable_raw_module.patch} |   0
 ...> 0002-add_finddef_and_inputattach_utils.patch} |   0
 ...h => 0001-build-get-along-with-buildroot.patch} |   0
 ...=> 0002-build-fix-parallel-build-failure.patch} |   0
 ...eck_config.patch => 0002-no-check_config.patch} |   0
 ...emove-werror.patch => 0003-remove-werror.patch} |   0
 ...ls.patch => 0001-drop-configh-from-tools.patch} |   0
 ...t-tools-02-nostrip.patch => 0002-nostrip.patch} |   0
 ...{udpcast-select-h.patch => 0001-select-h.patch} |   0
 ...{uemacs-4.0.15-lt.01.patch => 0001-lt.01.patch} |   0
 ...{uemacs-4.0.15-lt.02.patch => 0002-lt.02.patch} |   0
 ...0.15-lt.03.ixon.patch => 0003-lt.03.ixon.patch} |   0
 ...-needed.patch => 0001-fuse-no-cxx-needed.patch} |   0
 .../{urg-select-h.patch => 0001-select-h.patch}    |   0
 ...tch_data-makefile.patch => 0001-makefile.patch} |   0
 ...bmount-rules-fix.patch => 0001-rules-fix.patch} |   0
 ...02-use-udev-environment-instead-of-blkid.patch} |   0
 ...ompile-fixes.patch => 0001-compile-fixes.patch} |   0
 ....patch => 0001-fix-build-against-bluez-4.patch} |   0
 ...f-no-ms-as.patch => 0001-sscanf-no-ms-as.patch} |   0
 ...ch => 0002-program-invocation-short-name.patch} |   0
 ...ine-mkostemp-for-older-version-of-uClibc.patch} |   0
 ... => 0001-dont-add-dirty-to-valac-version.patch} |   0
 ....patch => 0001-workaround-SIGSEGV-on-PPC.patch} |   0
 ...-largefile-support-unconditionally-on-uC.patch} |   0
 ...add-missing-ptrace-getsiginfo-on-powerpc.patch} |   0
 .../vde2/{vde2-no-cxx.patch => 0001-no-cxx.patch}  |   0
 ...0001-vlc-static.patch => 0001-vlc-static.patch} |   0
 ...c-add-check-for-libgcrypt-config-program.patch} |   0
 ... 0003-automake-add-subdir-objects-option.patch} |   0
 .../vlc/{vlc-0004-libav.patch => 0004-libav.patch} |   0
 ...-0.5.3-fix-build.patch => 0001-fix-build.patch} |   0
 ...nc-0.5.3-nomanual.patch => 0002-nomanual.patch} |   0
 ...-susv3-legacy.patch => 0003-susv3-legacy.patch} |   0
 ...px-builddef.patch => 0001-utmpx-builddef.patch} |   0
 ...efile.patch => 0002-dont-force-largefile.patch} |   0
 ...tallation.patch => 0001-fix-installation.patch} |   0
 ...cks.patch => 0002-fix-ssl-headers-checks.patch} |   0
 ...gure.in.patch => 0003-fixup-configure.in.patch} |   0
 ...h => 0001-build-fix-for-32-bit-autotools.patch} |   0
 ....patch => 0002-build-fix-for-gtklauncher.patch} |   0
 ...zz-icu.patch => 0003-detect-harfbuzz-icu.patch} |   0
 ...ocrebase.patch => 0004-disable-docrebase.patch} |   0
 ...isable-tests.patch => 0005-disable-tests.patch} |   0
 ...0006-execinfo_h.patch => 0006-execinfo_h.patch} |   0
 ...kit-0007-mips-dfg.patch => 0007-mips-dfg.patch} |   0
 ...ison-3.0.patch => 0008-support-bison-3.0.patch} |   0
 ...h => 0001-spawn-fix-link-error-on-uclibc.patch} |   0
 ...t-force-lfs.patch => 0001-dont-force-lfs.patch} |   0
 ...-remove-bzero.patch => 0001-remove-bzero.patch} |   0
 ...01-fix-wrong-cflags-for-build-assumption.patch} |   0
 ...ibc-scandir.patch => 0001-uClibc-scandir.patch} |   0
 ...ch => 0001-fix-uClibc-compile-getcontext.patch} |   0
 ...02-fix-uClibc-compile-execinfo-backtrace.patch} |   0
 ...sc.patch => 0003-fix-uClibc-compile-misc.patch} |   0
 ...04-build-fixes.patch => 0004-build-fixes.patch} |   0
 ...streams-0005-getuid.patch => 0005-getuid.patch} |   0
 ...-posix-openpt.patch => 0001-posix-openpt.patch} |   0
 ...01-fix-symlink.patch => 0001-fix-symlink.patch} |   0
 ...-fix-segfault.patch => 0001-fix-segfault.patch} |   0
 ...02-port-abi-12.patch => 0002-port-abi-12.patch} |   0
 ...ark-0001-mibstore.patch => 0001-mibstore.patch} |   0
 ...video-ati-0001-noxaa.patch => 0001-noxaa.patch} |   0
 ...ati-0002-mibstore.patch => 0002-mibstore.patch} |   0
 ...nregister.patch => 0003-DamageUnregister.patch} |   0
 ...geode-0001-include.patch => 0001-include.patch} |   0
 ...int-0001-mbstring.patch => 0001-mbstring.patch} |   0
 ...128-0001-mbstring.patch => 0001-mbstring.patch} |   0
 .../0001-cross-compile.patch}                      |   0
 ...video-mga-1.4.9.patch => 0001-misc-fixes.patch} |   0
 ...-nv-0001-mibstore.patch => 0001-mibstore.patch} |   0
 .../0001-cross-compile.patch}                      |   0
 ...ross-compile.patch => 0001-cross-compile.patch} |   0
 ...0001-smi_driver.patch => 0001-smi_driver.patch} |   0
 ...video-sis-0001-cross.patch => 0001-cross.patch} |   0
 ...sis-0002-mibstore.patch => 0002-mibstore.patch} |   0
 ...nMapVidMem.patch => 0003-xf86UnMapVidMem.patch} |   0
 ...sis-0004-xf86Priv.patch => 0004-xf86Priv.patch} |   0
 ...s-0005-hvdisplay.patch => 0005-hvdisplay.patch} |   0
 ...06-fixwarnings.patch => 0006-fixwarnings.patch} |   0
 ..._xf86-video-sis-0007-xi.patch => 0007-xi.patch} |   0
 ...ideo-tdfx-0001-cross.patch => 0001-cross.patch} |   0
 ...dfx-0002-mibstore.patch => 0002-mibstore.patch} |   0
 ...tga-0001-mibstore.patch => 0001-mibstore.patch} |   0
 ...ent-0001-mibstore.patch => 0001-mibstore.patch} |   0
 ...video-trident-0002-xaa.patch => 0002-xaa.patch} |   0
 ...m-01-fork-check.patch => 0001-fork-check.patch} |   0
 ...l-don-t-link-makestrs-with-target-cflags.patch} |   0
 ...adjust-gcc-version-conditions-for-pragma.patch} |   0
 ...lyphpadbytes.patch => 0002-glyphpadbytes.patch} |   0
 ...0003-microblaze.patch => 0003-microblaze.patch} |   0
 .../x11vnc/{x11vnc-ipv6.patch => 0001-ipv6.patch}  |   0
 ...de-path.patch => 0001-Fixup-include-path.patch} |   0
 ...bmc-0002-mathutil.patch => 0002-mathutil.patch} |   0
 .../xbmc/{xbmc-0003-dbus.patch => 0003-dbus.patch} |   0
 .../xinetd/{xinetd-001-ar.patch => 0001-ar.patch}  |   0
 ...xinetd-002-destdir.patch => 0002-destdir.patch} |   0
 ...xinetd-003-rpc-fix.patch => 0003-rpc-fix.patch} |   0
 ...re-rlim_t.patch => 0004-configure-rlim_t.patch} |   0
 .../{xl2tp-legacy.patch => 0001-legacy.patch}      |   0
 ...=> 0001-fix-cross-compile-ansi-c-bailout.patch} |   0
 ....patch => 0002-fix-minixpm-build-problem.patch} |   0
 ...ch => 0003-driver-fix-linking-with-lintl.patch} |   0
 .../{xvkbd-makefile.patch => 0001-makefile.patch}  |   0
 ...l-0001-math-link.patch => 0001-math-link.patch} |   0
 ...e-shared-library-build-when-BUILD_SHARED.patch} |   0
 ...patch => 0001-CMake-cross-compile-mkdata.patch} |   0
 ...c-language.patch => 0002-only-c-language.patch} |   0
 ...sable-test_fork-if-fork-is-not-available.patch} |   0
 ...endencies.patch => 0001-fix-dependencies.patch} |   0
 ...patch => 0001-fix-compiling-on-Buildroot.patch} |   0
 ...ve-Werror-and-avoid-build-failures-becau.patch} |   0
 package/znc/{znc-01-time.patch => 0001-time.patch} |   0
 .../{zxing-makefile.patch => 0001-makefile.patch}  |   0
 support/scripts/rename-patch.py                    | 426 +++++++++++++++++++++
 943 files changed, 427 insertions(+), 1 deletion(-)
 rename package/acl/{acl-01-support-static-installation.patch => 0001-support-static-installation.patch} (100%)
 rename package/acpid/{acpid-01-dont-use-isfdtype.patch => 0001-dont-use-isfdtype.patch} (100%)
 rename package/acpid/{acpid-02-add-missing-defines.patch => 0002-add-missing-defines.patch} (100%)
 rename package/aiccu/{aiccu-0001-gnutls-and-uclibc-fixes.patch => 0001-gnutls-and-uclibc-fixes.patch} (100%)
 rename package/aiccu/{aiccu-0002-makefile-reorder-linked-libraries.patch => 0002-makefile-reorder-linked-libraries.patch} (100%)
 rename package/aiccu/{aiccu-0003-clock-suite-functions-fix.patch => 0003-clock-suite-functions-fix.patch} (100%)
 rename package/aircrack-ng/{aircrack-ng-01-CVE-2010-1159.patch => 0001-CVE-2010-1159.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0001-avr32-bad-inline.patch => 0001-avr32-bad-inline.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0002-no-mmu.patch => 0002-no-mmu.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0003-dlmisc.patch => 0003-dlmisc.patch} (100%)
 rename package/alsa-lib/{alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch => 0004-conditional-enabling-of-libdl-in-m4.patch} (100%)
 rename package/alsamixergui/{alsamixergui_0.9.0rc2-1-7.patch => 0001-misc-fixes.patch} (100%)
 rename package/am33x-cm3/{am33x-cm3-0001-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/apr-util/{apr-util-01-remove-checkapr.patch => 0001-remove-checkapr.patch} (100%)
 rename package/argp-standalone/{argp-standalone-throw-in-funcdef.patch => 0001-throw-in-funcdef.patch} (100%)
 rename package/at/{at-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch => 0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch} (100%)
 rename package/at/{at-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch => 0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} (100%)
 rename package/at/{at-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch => 0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch} (100%)
 rename package/at/{at-0004-Makefile.in-replace-IROOT-by-DESTDIR.patch => 0004-Makefile.in-replace-IROOT-by-DESTDIR.patch} (100%)
 rename package/at/{at-0005-Makefile.in-make-install-fix.patch => 0005-Makefile.in-make-install-fix.patch} (100%)
 rename package/at/{at-0006-getloadavg.c-fix.patch => 0006-getloadavg.c-fix.patch} (100%)
 rename package/at/{at-0007-parsetime.l-include-config-h.patch => 0007-parsetime.l-include-config-h.patch} (100%)
 rename package/attr/{attr-01-support-static-installation.patch => 0001-support-static-installation.patch} (100%)
 rename package/aumix/{aumix-2.8-fix-incorrect-makefile-am.patch => 0001-fix-incorrect-makefile-am.patch} (100%)
 rename package/autoconf/{autoconf-dont-add-dirty-to-version.patch => 0001-dont-add-dirty-to-version.patch} (100%)
 rename package/automake/{automake-0001-noman.patch => 0001-noman.patch} (100%)
 rename package/avahi/{avahi-autoipd-perms.patch => 0001-autoipd-perms.patch} (100%)
 rename package/avahi/{avahi-disable-systemd-support.patch => 0002-disable-systemd-support.patch} (100%)
 rename package/avahi/{avahi-ipv6only.patch => 0003-ipv6only.patch} (100%)
 rename package/avahi/{avahi-optional-ipv6.patch => 0004-optional-ipv6.patch} (100%)
 rename package/bash/{bash-000-mkbuiltins-cross.patch => 0001-mkbuiltins-cross.patch} (100%)
 rename package/bash/{bash-001-patchlevel1-27.patch => 0002-patchlevel1-27.patch} (100%)
 rename package/bash/{bash-002-patchlevel28.patch => 0003-patchlevel28.patch} (100%)
 rename package/bash/{bash-003-patchlevel29.patch => 0004-patchlevel29.patch} (100%)
 rename package/bash/{bash-004-patchlevel30.patch => 0005-patchlevel30.patch} (100%)
 rename package/beecrypt/{beecrypt-0001-cppglue.cxx-cplusplus-only.patch => 0001-cppglue.cxx-cplusplus-only.patch} (100%)
 rename package/beecrypt/{beecrypt-0002-icu-check-cross-compile.patch => 0002-icu-check-cross-compile.patch} (100%)
 rename package/beecrypt/{beecrypt-0003-build-system.patch => 0003-build-system.patch} (100%)
 rename package/beecrypt/{beecrypt-0004-gcc-4.7.patch => 0004-gcc-4.7.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-drop-werror.patch => 0001-drop-werror.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-dynamicloader-linking.patch => 0002-dynamicloader-linking.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-parallel-build.patch => 0003-parallel-build.patch} (100%)
 rename package/bellagio/{bellagio-0.9.3-segfault-on-removeFromWaitResource.patch => 0004-segfault-on-removeFromWaitResource.patch} (100%)
 rename package/bind/{bind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/bind/{bind-02-cross.patch => 0002-cross.patch} (100%)
 rename package/bison/{bison-01-no-docs-regen.patch => 0001-no-docs-regen.patch} (100%)
 rename package/blackbox/{blackbox-001-Fix-configure-ac.patch => 0001-Fix-configure-ac.patch} (100%)
 rename package/blackbox/{blackbox-002-gcc43.patch => 0002-gcc43.patch} (100%)
 rename package/blackbox/{blackbox-003-gcc46-textpropertytostring.patch => 0003-gcc46-textpropertytostring.patch} (100%)
 rename package/bluez_utils/{bluez_utils-4.101-enable_cg2900_on_upstream_4.91.patch => 0001-enable_cg2900_on_upstream_4.91.patch} (100%)
 rename package/boost/{boost-0001-fix-ambiguous-format-call-on-64bit-builds.patch => 0001-fix-ambiguous-format-call-on-64bit-builds.patch} (100%)
 rename package/bridge-utils/{bridge-utils-000-build-system.patch => 0001-build-system.patch} (100%)
 rename package/bridge-utils/{bridge-utils-001-fix-for-kernel-headers-3.8+.patch => 0002-fix-for-kernel-headers-3.8+.patch} (100%)
 rename package/busybox/{busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch => 0001-networking-libiproute-use-linux-if_packet.h-instead-.patch} (100%)
 rename package/busybox/{busybox-0002-busybox-1.22.1-ash.patch => 0002-busybox-1.22.1-ash.patch} (100%)
 rename package/busybox/{busybox-0003-busybox-1.22.1-date.patch => 0003-busybox-1.22.1-date.patch} (100%)
 rename package/busybox/{busybox-0004-busybox-1.22.1-iplink.patch => 0004-busybox-1.22.1-iplink.patch} (100%)
 rename package/busybox/{busybox-0005-busybox-1.22.1-nc.patch => 0005-busybox-1.22.1-nc.patch} (100%)
 rename package/busybox/{busybox-0006-lzop-add-overflow-check.patch => 0006-lzop-add-overflow-check.patch} (100%)
 rename package/bzip2/{bzip2-build-objects-twice.patch => 0001-build-objects-twice.patch} (100%)
 rename package/bzip2/{bzip2-improve-build-system.patch => 0002-improve-build-system.patch} (100%)
 rename package/c-ares/{c-ares-01-use_check_build_instead_of_check_user.patch => 0001-use_check_build_instead_of_check_user.patch} (100%)
 rename package/cache-calibrator/{cache-calibrator-Fix-conflicting-round-function.patch => 0001-Fix-conflicting-round-function.patch} (100%)
 rename package/cairo/{cairo-001-blackfin-build-fix.patch => 0001-blackfin-build-fix.patch} (100%)
 rename package/cairo/{cairo-002-openvg-build-fix.patch => 0002-openvg-build-fix.patch} (100%)
 rename package/cairo/{cairo-003-fix-nofork-build.patch => 0003-fix-nofork-build.patch} (100%)
 rename package/cairo/{cairo-004-fix-nofork-any2ppm.patch => 0004-fix-nofork-any2ppm.patch} (100%)
 rename package/cairo/{cairo-005-fix-gcc-49-build.patch => 0005-fix-gcc-49-build.patch} (100%)
 rename package/canfestival/{canfestival-0001-install-pkgconfig-module-for-canfestival.patch => 0001-install-pkgconfig-module-for-canfestival.patch} (100%)
 rename package/canfestival/{canfestival-0002-allow-to-set-python-interpreter.patch => 0002-allow-to-set-python-interpreter.patch} (100%)
 rename package/cdrkit/{cdrkit-1.1.11-no-rcmd.patch => 0001-no-rcmd.patch} (100%)
 rename package/cegui06/{cegui06-stddef.h.patch => 0001-stddef.h.patch} (100%)
 rename package/clapack/{clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch => 0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch} (100%)
 rename package/clapack/{clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch => 0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch} (100%)
 rename package/clapack/{clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch => 0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch} (100%)
 rename package/clapack/{clapack-0004-cmake-blas-add-library-and-header-install-rules.patch => 0004-cmake-blas-add-library-and-header-install-rules.patch} (100%)
 rename package/clapack/{clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch => 0005-cmake-lapack-add-library-and-header-install-rules.patch} (100%)
 rename package/classpath/{classpath-01-fix-gmp-include.patch => 0001-fix-gmp-include.patch} (100%)
 rename package/classpath/{classpath-02-add-config-rpath.patch => 0002-add-config-rpath.patch} (100%)
 rename package/cloog/{cloog-0001-add-missing-files.patch => 0001-add-missing-files.patch} (100%)
 rename package/cloop/{cloop-2.634-1-cflags.patch => 0001-cflags.patch} (100%)
 rename package/connman/{connman-000-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch} (100%)
 rename package/coreutils/{coreutils-01-fix-for-dummy-man-usage.patch => 0001-fix-for-dummy-man-usage.patch} (100%)
 rename package/cppdb/{cppdb-0001-mysql-library-suffix.patch => 0001-mysql-library-suffix.patch} (100%)
 rename package/cramfs/{cramfs-01-endian.patch => 0001-endian.patch} (100%)
 rename package/cramfs/{cramfs-02-cygwin_IO.patch => 0002-cygwin_IO.patch} (100%)
 rename package/crda/{crda-0001-Makefile-allow-to-override-python-interpreter.patch => 0001-Makefile-allow-to-override-python-interpreter.patch} (100%)
 rename package/crda/{crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch => 0002-Add-DESTDIR-support-in-install-libreg-rules.patch} (100%)
 rename package/cryptodev-linux/{cryptodev-linux-01-Replace_INIT_COMPLETION_with_reinit_completion.patch => 0001-Replace_INIT_COMPLETION_with_reinit_completion.patch} (100%)
 rename package/cryptsetup/{cryptsetup-0001-link-against-lrt-for-clock_gettime.patch => 0001-link-against-lrt-for-clock_gettime.patch} (100%)
 rename package/cryptsetup/{cryptsetup-0002-mkdir.patch => 0002-mkdir.patch} (100%)
 rename package/cups/{cups-0001-fix-static.patch => 0001-fix-static.patch} (100%)
 rename package/cups/{cups-0002-fix-stack-protector-check.patch => 0002-fix-stack-protector-check.patch} (100%)
 rename package/cups/{cups-0003-mantohtml.patch => 0003-mantohtml.patch} (100%)
 rename package/curlftpfs/{curlftpfs-000-fix-CURLOPT_INFILESIZE.patch => 0001-fix-CURLOPT_INFILESIZE.patch} (100%)
 rename package/curlftpfs/{curlftpfs-001-free_ftpfs_file-memleak-fix.patch => 0002-free_ftpfs_file-memleak-fix.patch} (100%)
 rename package/curlftpfs/{curlftpfs-002-nocache-memleak-fix.patch => 0003-nocache-memleak-fix.patch} (100%)
 rename package/cwiid/{cwiid-0001-fix-link-options-for-as-needed-90.patch => 0001-fix-link-options-for-as-needed-90.patch} (100%)
 rename package/cwiid/{cwiid-0002-Update-for-BlueZ-changes.patch => 0002-Update-for-BlueZ-changes.patch} (100%)
 rename package/cwiid/{cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch => 0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch} (100%)
 rename package/cwiid/{cwiid-0004-configure-make-wmgui-build-optional.patch => 0004-configure-make-wmgui-build-optional.patch} (100%)
 rename package/czmq/{czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch => 0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch} (100%)
 rename package/dash/{dash-0001-no-config.h-for-helpers.patch => 0001-no-config.h-for-helpers.patch} (100%)
 rename package/dbus-cpp/{dbus-cpp-0001-gcc4.7.patch => 0001-gcc4.7.patch} (100%)
 rename package/dbus-cpp/{dbus-cpp-0002-cxxflags-ldflags-for-build.patch => 0002-cxxflags-ldflags-for-build.patch} (100%)
 rename package/dbus-python/{dbus-python-0001-fix-python-configure-check.patch => 0001-fix-python-configure-check.patch} (100%)
 rename package/devmem2/{devmem2-0001-be-coherent-in-type-usage.patch => 0001-be-coherent-in-type-usage.patch} (100%)
 rename package/dhcpdump/{dhcpdump-0001-use-non-bsd-structures.patch => 0001-use-non-bsd-structures.patch} (100%)
 rename package/dhcpdump/{dhcpdump-0002-fix-strsep-feature-test.patch => 0002-fix-strsep-feature-test.patch} (100%)
 rename package/dhrystone/{dhrystone-2-cmdline-nruns.patch => 0001-cmdline-nruns.patch} (100%)
 rename package/dhrystone/{dhrystone-2-HZ.patch => 0002-HZ.patch} (100%)
 rename package/dhrystone/{dhrystone-2-exit.patch => 0003-exit.patch} (100%)
 rename package/dhrystone/{dhrystone-2-headers.patch => 0004-headers.patch} (100%)
 rename package/dhrystone/{dhrystone-2-prototypes.patch => 0005-prototypes.patch} (100%)
 rename package/dillo/{dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch => 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch} (100%)
 rename package/directfb-examples/{directfb-examples-remove-bzero.patch => 0001-remove-bzero.patch} (100%)
 rename package/directfb/{directfb-fix-missing-davinci-voodoo-header.patch => 0001-fix-missing-davinci-voodoo-header.patch} (100%)
 rename package/directfb/{directfb-imlib2-config.patch => 0002-imlib2-config.patch} (100%)
 rename package/directfb/{directfb-remove-redefinition-of-__typeof__.patch => 0003-remove-redefinition-of-__typeof__.patch} (100%)
 rename package/directfb/{directfb-setregion-lock.patch => 0004-setregion-lock.patch} (100%)
 rename package/directfb/{directfb-use-gcc-link.patch => 0005-use-gcc-link.patch} (100%)
 rename package/dmalloc/{dmalloc-5.4.3-add-fpic.patch => 0001-add-fpic.patch} (100%)
 rename package/dmalloc/{dmalloc-mips.patch => 0002-mips.patch} (100%)
 rename package/dmidecode/{dmidecode-build-system-fixes.patch => 0001-build-system-fixes.patch} (100%)
 rename package/dropwatch/{dropwatch-01-build.patch => 0001-build.patch} (100%)
 rename package/dropwatch/{dropwatch-02-binutils-2.23.1.patch => 0002-binutils-2.23.1.patch} (100%)
 rename package/dropwatch/{dropwatch-03-remove-werror.patch => 0003-remove-werror.patch} (100%)
 rename package/dtc/{dtc-extra_cflags.patch => 0001-extra_cflags.patch} (100%)
 rename package/dtc/{dtc-separate-lib-install.patch => 0002-separate-lib-install.patch} (100%)
 rename package/duma/{duma-01-fix-cross-compilation.patch => 0001-fix-cross-compilation.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0001-Fix-generate-keynames.patch => 0001-Fix-generate-keynames.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0002-Fix-compiler-warning-flags.patch => 0002-Fix-compiler-warning-flags.patch} (100%)
 rename package/dvb-apps/{dvb-apps-0003-support-static-only-build.patch => 0003-support-static-only-build.patch} (100%)
 rename package/e2fsprogs/{e2fsprogs-0001-sem-init-libs.patch => 0001-sem-init-libs.patch} (100%)
 rename package/elftosb/{elftosb-fixes-includes.patch => 0001-fixes-includes.patch} (100%)
 rename package/elftosb/{elftosb-force-cxx-compiler.patch => 0002-force-cxx-compiler.patch} (100%)
 rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (100%)
 rename package/elfutils/{elfutils-02-argp-support.patch => 0002-argp-support.patch} (100%)
 rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (100%)
 rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (100%)
 rename package/elfutils/{elfutils-05-disable-po.patch => 0005-disable-po.patch} (100%)
 rename package/empty/{empty-0001-respect-LDFLAGS.patch => 0001-respect-LDFLAGS.patch} (100%)
 rename package/erlang/{erlang-build-fix.patch => 0001-build-fix.patch} (100%)
 rename package/eudev/{eudev-0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch => 0003-libudev-Only-use-pragma-for-ignoring-diagnostics-if-.patch} (100%)
 rename package/evemu/{evemu-0001-SYN_MAX.patch => 0001-SYN_MAX.patch} (100%)
 rename package/evemu/{evemu-0002-configure.ac-add-disable-tests-option.patch => 0002-configure.ac-add-disable-tests-option.patch} (100%)
 rename package/evemu/{evemu-0003-make-event-names-use-input.h-from-sysroot-instead-of.patch => 0003-make-event-names-use-input.h-from-sysroot-instead-of.patch} (100%)
 rename package/evemu/{evemu-0005-configure.ac-add-disable-python-bindings-option.patch => 0005-configure.ac-add-disable-python-bindings-option.patch} (100%)
 rename package/exim/{exim-0001-Build-buildconfig-for-the-host.patch => 0001-Build-buildconfig-for-the-host.patch} (100%)
 rename package/exim/{exim-0002-Don-t-make-backup-copies-of-installed-files.patch => 0002-Don-t-make-backup-copies-of-installed-files.patch} (100%)
 rename package/exim/{exim-0003-Skip-version-check-and-symlink-installation.patch => 0003-Skip-version-check-and-symlink-installation.patch} (100%)
 rename package/expect/{expect-0001-enable-cross-compilation.patch => 0001-enable-cross-compilation.patch} (100%)
 rename package/expect/{expect-0002-allow-tcl-build-directory.patch => 0002-allow-tcl-build-directory.patch} (100%)
 rename package/ezxml/{ezxml-0.8.6-allow-compiler-override.patch => 0001-allow-compiler-override.patch} (100%)
 rename package/fb-test-app/{fb-test-app-override-cflags.patch => 0001-override-cflags.patch} (100%)
 rename package/fbgrab/{fbgrab-01-fix-static-build.patch => 0001-fix-static-build.patch} (100%)
 rename package/fbv/{fbv-1.0b-arch.patch.avr32 => 0001-arch.patch.avr32} (100%)
 rename package/fbv/{fbv-1.0b-cross.patch => 0002-cross.patch} (100%)
 rename package/fbv/{fbv-1.0b-fix-24bpp-support-on-big-endian.patch => 0003-fix-24bpp-support-on-big-endian.patch} (100%)
 rename package/fbv/{fbv-1.0b-fix-bgr555.patch => 0004-fix-bgr555.patch} (100%)
 rename package/fbv/{fbv-1.0b-include.patch => 0005-include.patch} (100%)
 rename package/fbv/{fbv-1.0b-libpng15.patch => 0006-libpng15.patch} (100%)
 rename package/fetchmail/{fetchmail-0001-fix-openssl-static-link.patch => 0001-fix-openssl-static-link.patch} (100%)
 rename package/ffmpeg/{ffmpeg-0001-fminf.patch => 0001-fminf.patch} (100%)
 rename package/fis/{fis-001-checksum.patch => 0001-checksum.patch} (100%)
 rename package/fis/{fis-003-list_output.patch => 0003-list_output.patch} (100%)
 rename package/fis/{fis-004-sorted_list.patch => 0004-sorted_list.patch} (100%)
 rename package/flac/{flac-01-fix-altivec-logic.patch => 0001-fix-altivec-logic.patch} (100%)
 rename package/flex/{flex-prog-ar.patch => 0001-prog-ar.patch} (100%)
 rename package/flickcurl/{flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch => 0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch} (100%)
 rename package/flickcurl/{flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch => 0002-Oauth-services-are-on-https-www.flickr.com.patch} (100%)
 rename package/flite/{flite-0001-now-honor-DESTDIR-env.-var.patch => 0001-now-honor-DESTDIR-env.-var.patch} (100%)
 rename package/flite/{flite-0002-fix-alsa-static.patch => 0002-fix-alsa-static.patch} (100%)
 rename package/fltk/{fltk-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/fltk/{fltk-02-jpeg-9.patch => 0002-jpeg-9.patch} (100%)
 rename package/freerdp/{freerdp-0001-add-support-for-uclibc.patch => 0001-add-support-for-uclibc.patch} (100%)
 rename package/freescale-imx/gpu-viv-bin-mx6q/{gpu-viv-bin-mx6q-0001-correct-HAL-include.patch => 0001-correct-HAL-include.patch} (100%)
 rename package/freescale-imx/imx-vpu/{imx-vpu-0001-vpu-io-fix-IOSystemInit-failure.patch => 0001-vpu-io-fix-IOSystemInit-failure.patch} (100%)
 rename package/freescale-imx/imx-vpu/{imx-vpu-0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch => 0002-vpu-lib-fix-IOGetVirtMem-return-value-checks.patch} (100%)
 rename package/ftop/{ftop-0001-overflow.patch => 0001-overflow.patch} (100%)
 rename package/gadgetfs-test/{gadgetfs-test-fix-usb-ch9-include.patch => 0001-fix-usb-ch9-include.patch} (100%)
 rename package/gadgetfs-test/{gadgetfs-test-rename-include-usb_gadgetfs-to-usb-dir.patch => 0002-rename-include-usb_gadgetfs-to-usb-dir.patch} (100%)
 rename package/gamin/{gamin-0.1.10-no-abstract-sockets.patch => 0001-no-abstract-sockets.patch} (100%)
 rename package/gamin/{gamin-0.1.10-no-const-return.patch => 0002-no-const-return.patch} (100%)
 rename package/gawk/{gawk-01-no-versioned.patch => 0001-no-versioned.patch} (100%)
 rename package/gcc/4.4.7/{gcc-44-pr39429.patch => 0044-pr39429.patch} (100%)
 rename package/gcc/4.4.7/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/4.5.4/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/4.7.4/{powerpc-link-with-math-lib.patch.conditional => 1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/{4.9.1/powerpc-link-with-math-lib.patch.conditional => 4.8.3/1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gcc/{4.8.3/powerpc-link-with-math-lib.patch.conditional => 4.9.1/1000-powerpc-link-with-math-lib.patch.conditional} (100%)
 rename package/gd/{gd-01-gdlib-config.patch => 0001-gdlib-config.patch} (100%)
 rename package/gd/{gd-02-no-zlib.patch => 0002-no-zlib.patch} (100%)
 rename package/gd/{gd-03-gd_bmp-fix-build-with-uClibc.patch => 0003-gd_bmp-fix-build-with-uClibc.patch} (100%)
 rename package/gd/{gd-04-CVE-2014-2497.patch => 0004-CVE-2014-2497.patch} (100%)
 rename package/genext2fs/{genext2fs-update-genext2fs.c-to-rev-1.118.patch => 0001-update-genext2fs.c-to-rev-1.118.patch} (100%)
 rename package/genpart/{genpart-fix-return-code.patch => 0001-fix-return-code.patch} (100%)
 rename package/genromfs/{genromfs-0.5.2-build-system.patch => 0001-build-system.patch} (100%)
 rename package/gettext/{gettext-01-error_print_progname.patch => 0001-error_print_progname.patch} (100%)
 rename package/giblib/{giblib-fix-imlib2-detection.patch => 0001-fix-imlib2-detection.patch} (100%)
 rename package/glibc/2.18-svnr23787/{glibc-0001-accept-make4.patch => 0001-accept-make4.patch} (100%)
 rename package/gmp/{gmp-01-arm-asm-conditional-on-no-thumb-1.patch => 0001-arm-asm-conditional-on-no-thumb-1.patch} (100%)
 rename package/gmp/{gmp-02-arm-asm-conditional-on-no-thumb-2.patch => 0002-arm-asm-conditional-on-no-thumb-2.patch} (100%)
 rename package/gmp/{gmp-03-powerpc-provide-default-bmod-to-mod-threshold-1.patch => 0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch} (100%)
 rename package/gnu-efi/{gnu-efi-01-use-override-cflags.patch => 0001-use-override-cflags.patch} (100%)
 rename package/gnu-efi/{gnu-efi-02-parallel-make-archives.patch => 0002-parallel-make-archives.patch} (100%)
 rename package/gnu-efi/{gnu-efi-03-parallel-make.patch => 0003-parallel-make.patch} (100%)
 rename package/gnuchess/{gnuchess-5.07-getline-conflicts.patch => 0001-getline-conflicts.patch} (100%)
 rename package/gnuchess/{gnuchess-5.07.patch => 0002-misc-fixes.patch} (100%)
 rename package/gnupg2/{gnupg2-0001-fix-pth-config-usage.patch => 0001-fix-pth-config-usage.patch} (100%)
 rename package/gnuplot/{gnuplot-0001-configure-add-without-demo-option.patch => 0001-configure-add-without-demo-option.patch} (100%)
 rename package/gnuplot/{gnuplot-0002-use-gdlib-config-properly.patch => 0002-use-gdlib-config-properly.patch} (100%)
 rename package/gob2/{gob2-01-dont-include-from-prefix.patch => 0001-dont-include-from-prefix.patch} (100%)
 rename package/gpsd/{gpsd-01-Fix-build-error-when-ntpshm-is-false.patch => 0001-Fix-build-error-when-ntpshm-is-false.patch} (100%)
 rename package/gpsd/{gpsd-02-sconstruct-disable-rpath.patch => 0002-sconstruct-disable-rpath.patch} (100%)
 rename package/gpsd/{gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch => 0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch} (100%)
 rename package/gptfdisk/{gptfdisk-001-configurable-utf16-support.patch => 0001-configurable-utf16-support.patch} (100%)
 rename package/gqview/{gqview-2.1.5-make.patch => 0001-make.patch} (100%)
 rename package/grantlee/{grantlee-0.2.0-fix-lphread-link-error.patch => 0001-fix-lphread-link-error.patch} (100%)
 rename package/gstreamer/gst-ffmpeg/{gst-ffmpeg-0001-gcc47.patch => 0001-gcc47.patch} (100%)
 rename package/gstreamer/gst-ffmpeg/{gst-ffmpeg-0002-arm-avoid-using-the-movw-instruction.patch => 0002-arm-avoid-using-the-movw-instruction.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0001-gplay-add-missing-include.patch => 0001-gplay-add-missing-include.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0002-Fix-bashism-in-configure-script.patch => 0002-Fix-bashism-in-configure-script.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0003-Use-proper-objdump.patch => 0003-Use-proper-objdump.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch => 0004-Fix-libgstfsl-linkage-add-lrt-for-shared-memory-func.patch} (100%)
 rename package/gstreamer/gst-fsl-plugins/{gst-fsl-plugins-0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch => 0005-Remove-use-of-obsolete-VIDIOC_DBG_G_CHIP_IDENT.patch} (100%)
 rename package/gstreamer/gst-plugin-x170/{gst-plugin-x170-01-correct-CFLAGS.patch => 0001-correct-CFLAGS.patch} (100%)
 rename package/gstreamer/gst-plugins-bad/{gst-plugins-bad-opus-jpegformat-unbreak-non-debug-build.patch => 0001-opus-jpegformat-unbreak-non-debug-build.patch} (100%)
 rename package/gstreamer/gst-plugins-bad/{gst-plugins-bad-0002-fix-dfb-example.patch => 0002-fix-dfb-example.patch} (100%)
 rename package/gstreamer/gst-plugins-base/{gst-plugins-base-tremor.patch => 0001-tremor.patch} (100%)
 rename package/gstreamer/gst-plugins-good/{gst-plugins-good-linux36.patch => 0001-linux36.patch} (100%)
 rename package/gstreamer/gst-plugins-good/{gst-plugins-good-v4l2-fix-compilation-against-newer-kernel-headers.patch => 0002-v4l2-fix-compilation-against-newer-kernel-headers.patch} (100%)
 rename package/gstreamer/gstreamer/{gstreamer-01-bison3.patch => 0001-bison3.patch} (100%)
 rename package/gstreamer1/gst1-plugins-bad/{gst1-plugins-bad-use-gettext-0.18.patch => 0001-use-gettext-0.18.patch} (100%)
 rename package/gutenprint/{gutenprint-000-use-pregen-xmli18n-header.patch => 0001-use-pregen-xmli18n-header.patch} (100%)
 rename package/gutenprint/{gutenprint-001-cups-support-replaces-static-with-static-libtool-lib.patch => 0002-cups-support-replaces-static-with-static-libtool-lib.patch} (100%)
 rename package/haserl/0.8.0/{haserl-0.8.0-legacy.patch => 0001-legacy.patch} (100%)
 rename package/haserl/0.9.33/{haserl-001-add-haserl_lualib.inc.patch => 0001-add-haserl_lualib.inc.patch} (100%)
 rename package/heimdal/{heimdal-0001-add-roken-h-process.patch => 0001-add-roken-h-process.patch} (100%)
 rename package/heimdal/{heimdal-0002-use-Getopt-Std.patch => 0002-use-Getopt-Std.patch} (100%)
 rename package/heimdal/{heimdal-0003-vendor.patch => 0003-vendor.patch} (100%)
 rename package/heimdal/{heimdal-0004-compile_et.patch => 0004-compile_et.patch} (100%)
 rename package/hplip/{hplip-fix-make.patch => 0001-fix-make.patch} (100%)
 rename package/htop/{htop-01-native-affinity.patch => 0001-native-affinity.patch} (100%)
 rename package/httping/{httping-0001-fix-math-library-linking.patch => 0001-fix-math-library-linking.patch} (100%)
 rename package/icu/{icu-001-dont-build-static-dynamic-twice.patch => 0001-dont-build-static-dynamic-twice.patch} (100%)
 rename package/icu/{icu-002-workaround-toolchain-bugs.patch => 0002-workaround-toolchain-bugs.patch} (100%)
 rename package/icu/{icu-003-detect-compiler-symbol-prefix.patch => 0003-detect-compiler-symbol-prefix.patch} (100%)
 rename package/icu/{icu-004-link-icudata-as-data-only.patch => 0004-link-icudata-as-data-only.patch} (100%)
 rename package/ifplugd/{ifplugd-cross.patch => 0001-cross.patch} (100%)
 rename package/ifplugd/{ifplugd-fix-headers.patch => 0002-fix-headers.patch} (100%)
 rename package/ifplugd/{ifplugd-no-cxx.patch => 0003-no-cxx.patch} (100%)
 rename package/igmpproxy/{igmpproxy-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/imagemagick/{imagemagick-01-use-xml2-config.patch => 0001-use-xml2-config.patch} (100%)
 rename package/infozip/{infozip-0001-configure-fix-cross-build.patch => 0001-configure-fix-cross-build.patch} (100%)
 rename package/input-tools/{input-tools-20051019-rint.patch => 0001-rint.patch} (100%)
 rename package/iostat/{iostat-cpunum.patch => 0001-cpunum.patch} (100%)
 rename package/iozone/{iozone-01-targets.patch => 0001-targets.patch} (100%)
 rename package/iozone/{iozone-02-no-nptl-support.patch => 0002-no-nptl-support.patch} (100%)
 rename package/iproute2/{iproute2-01-optional-ipv6.patch => 0001-optional-ipv6.patch} (100%)
 rename package/iproute2/{iproute2-02-vxlan-optional-ipv6.patch => 0002-vxlan-optional-ipv6.patch} (100%)
 rename package/iprutils/{iprutils-0001-Don-t-use-gettext.patch => 0001-Don-t-use-gettext.patch} (100%)
 rename package/iprutils/{iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch => 0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch} (100%)
 rename package/iprutils/{iprutils-0003-Fix-static-build-by-passing-the-libraries-i.patch => 0003-Fix-static-build-by-passing-the-libraries-i.patch} (100%)
 rename package/ipsec-tools/{ipsec-tools-001-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/iptables/{iptables-01-fix-static-link.patch => 0001-fix-static-link.patch} (100%)
 rename package/iptables/{iptables-02-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch => 0002-iptables-ip-6-tables-save.c-remove-dlfcn.h-include.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-daemon.patch => 0001-daemon.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-nommu.patch => 0002-nommu.patch} (100%)
 rename package/irda-utils/{irda-utils-0.9.18-subdir.patch => 0003-subdir.patch} (100%)
 rename package/jhead/{jhead-use-ldflags.patch => 0001-use-ldflags.patch} (100%)
 rename package/joe/{joe-0001-disable-bessel-functions-on-uclibc.patch => 0001-disable-bessel-functions-on-uclibc.patch} (100%)
 rename package/jq/{jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch => 0001-libm.h-comment-j0-j1-y0-and-y1.patch} (100%)
 rename package/json-c/{json-c-no-reentrant.patch => 0001-no-reentrant.patch} (100%)
 rename package/kbd/{kbd-link-against-libintl.patch => 0001-link-against-libintl.patch} (100%)
 rename package/kexec-lite/{kexec-lite-01-clean-restart.patch => 0001-clean-restart.patch} (100%)
 rename package/kexec/{kexec-0001-largefile.patch => 0001-largefile.patch} (100%)
 rename package/keyutils/{keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch => 0001-allow-building-of-the-shared-library-to-be-suppressed.patch} (100%)
 rename package/keyutils/{keyutils-02-fix-install-rule.patch => 0002-fix-install-rule.patch} (100%)
 rename package/keyutils/{keyutils-03-cifs.patch => 0003-cifs.patch} (100%)
 rename package/keyutils/{keyutils-04-Makefile-for-buildroot.patch => 0004-Makefile-for-buildroot.patch} (100%)
 rename package/kismet/{kismet-ncurses.patch => 0001-ncurses.patch} (100%)
 rename package/kismet/{kismet-nobsd.patch => 0002-nobsd.patch} (100%)
 rename package/kmod/{kmod-0001-fix-O_CLOEXEC.patch => 0001-fix-O_CLOEXEC.patch} (100%)
 rename package/kmod/{kmod-0002-add-backup-implementation-of-be32toh.patch => 0002-add-backup-implementation-of-be32toh.patch} (100%)
 rename package/kobs-ng/{kobs-ng-0001-fix-mtd-defines.patch => 0001-fix-mtd-defines.patch} (100%)
 rename package/latencytop/{latencytop-makefile.patch => 0001-makefile.patch} (100%)
 rename package/lcdapi/{lcdapi-0001-Remove-installation-of-docs-examples.patch => 0001-Remove-installation-of-docs-examples.patch} (100%)
 rename package/lcdproc/{lcdproc-LCDd.conf.patch => 0001-LCDd.conf.patch} (100%)
 rename package/leafnode2/{leafnode2-0001-cross_makefile.patch => 0001-cross_makefile.patch} (100%)
 rename package/libaio/{libaio-0.3.109-arches.patch => 0001-arches.patch} (100%)
 rename package/libaio/{libaio-0.3.109-avr32-support.patch => 0002-avr32-support.patch} (100%)
 rename package/libaio/{libaio-0.3.109-destdir.patch => 0003-destdir.patch} (100%)
 rename package/libart/{libart-art-config-cross.patch => 0001-art-config-cross.patch} (100%)
 rename package/libatasmart/{libatasmart-strpool-cross-flags.patch => 0001-strpool-cross-flags.patch} (100%)
 rename package/libcap/{libcap-01-build-system.patch => 0001-build-system.patch} (100%)
 rename package/libcap/{libcap-02-split-static-shared-install.patch => 0002-split-static-shared-install.patch} (100%)
 rename package/libcec/{libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch => 0001-Fix-unregistering-a-callback-that-wasn-t-register.patch} (100%)
 rename package/libcec/{libcec-0002-no-psabi-warning.patch => 0002-no-psabi-warning.patch} (100%)
 rename package/libcgi/{libcgi.patch => 0001-misc-fixes.patch} (100%)
 rename package/libcgicc/{libcgicc-01-disable-documentation-option.patch => 0001-disable-documentation-option.patch} (100%)
 rename package/libconfuse/{libconfuse-0000-fix-configure-ac.patch => 0001-fix-configure-ac.patch} (100%)
 rename package/libcue/{libcue-1.4.0-__unused-fix.patch => 0001-_unused-fix.patch} (100%)
 rename package/libcuefile/{libcuefile-0001-fix-static-link.patch => 0001-fix-static-link.patch} (100%)
 rename package/libcurl/{libcurl-0001-fixtimeout.patch => 0001-fixtimeout.patch} (100%)
 rename package/libdaemon/{libdaemon-0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch => 0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch} (100%)
 rename package/libdnet/{libdnet-001-python-gcc.patch => 0001-python-gcc.patch} (100%)
 rename package/libdnet/{libdnet-002-python-makefile.patch => 0002-python-makefile.patch} (100%)
 rename package/libdvdnav/{libdvdnav-01-fix-os2-support.patch => 0001-fix-os2-support.patch} (100%)
 rename package/libdvdread/{libdvdread-01-fix-os2-support.patch => 0001-fix-os2-support.patch} (100%)
 rename package/libeXosip2/{libeXosip2-0000-fix-non-ipv6-build.patch => 0001-fix-non-ipv6-build.patch} (100%)
 rename package/libeXosip2/{libeXosip2-0001-use-pkg-config-to-detect-openssl.patch => 0002-use-pkg-config-to-detect-openssl.patch} (100%)
 rename package/libedit/{libedit-000-check-bsd-functions-in-libbsd.patch => 0001-check-bsd-functions-in-libbsd.patch} (100%)
 rename package/libenca/{libenca-001-fix-installation-error.patch => 0001-fix-installation-error.patch} (100%)
 rename package/libenca/{libenca-002-remove-prefix-hack-in-configure.patch => 0002-remove-prefix-hack-in-configure.patch} (100%)
 rename package/libenca/{libenca-003-iconv.patch => 0003-iconv.patch} (100%)
 rename package/libfcgi/{libfcgi-0000-eof.patch => 0001-eof.patch} (100%)
 rename package/libfcgi/{libfcgi-0001-link-against-libfcgi-la.patch => 0002-link-against-libfcgi-la.patch} (100%)
 rename package/libfcgi/{libfcgi-0002-link-against-math.patch => 0003-link-against-math.patch} (100%)
 rename package/libfcgi/{libfcgi-0003-make-autoreconfable.patch => 0004-make-autoreconfable.patch} (100%)
 rename package/libfcgi/{libfcgi-0004-disable-examples.patch => 0005-disable-examples.patch} (100%)
 rename package/libffi/{libffi-001-Fix-installation-location-of-libffi.patch => 0001-Fix-installation-location-of-libffi.patch} (100%)
 rename package/libffi/{libffi-002-Fix-use-of-compact-eh-frames-on-MIPS.patch => 0002-Fix-use-of-compact-eh-frames-on-MIPS.patch} (100%)
 rename package/libffi/{libffi-003-fix-typo.patch => 0003-fix-typo.patch} (100%)
 rename package/libffi/{libffi-004-Add-missing-GNU-stack-markings-in-win32.S.patch => 0004-Add-missing-GNU-stack-markings-in-win32.S.patch} (100%)
 rename package/libffi/{libffi-005-Fix-paths-in-libffi.pc.in.patch => 0005-Fix-paths-in-libffi.pc.in.patch} (100%)
 rename package/libfslvpuwrap/{libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch => 0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch} (100%)
 rename package/libftdi/{libftdi-0.19-01_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch} (100%)
 rename package/libfuse/{libfuse-fix-aarch64-build.patch => 0001-fix-aarch64-build.patch} (100%)
 rename package/libgail/{libgail-1.22.3-Relax-X11-dependencies.patch => 0001-Relax-X11-dependencies.patch} (100%)
 rename package/libgc/{libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch => 0001-Fix-build-on-Linux-x86_64-under-uClibc.patch} (100%)
 rename package/libgcrypt/{libgcrypt-00-ac_cv_sys_symbol_underscore.patch => 0001-ac_cv_sys_symbol_underscore.patch} (100%)
 rename package/libgcrypt/{libgcrypt-01-reconfigure.patch => 0002-reconfigure.patch} (100%)
 rename package/libgeotiff/{libgeotiff-0001-use-pkg-config.patch => 0001-use-pkg-config.patch} (100%)
 rename package/libglib2/{libglib2-0001-optional-ipv6.patch => 0001-optional-ipv6.patch} (100%)
 rename package/{pango/pango-0002-no-gtk-doc.patch => libglib2/0002-no-gtk-doc.patch} (100%)
 rename package/libglib2/{libglib2-0003-implement-GMutex-natively-on-Linux.patch => 0003-implement-GMutex-natively-on-Linux.patch} (100%)
 rename package/libgtk2/{libgtk2-reduce-dependencies.patch => 0001-reduce-dependencies.patch} (100%)
 rename package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} (100%)
 rename package/libgtk3/{libgtk3-0002-fix-introspection-check.patch => 0002-fix-introspection-check.patch} (100%)
 rename package/libgtk3/{libgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} (100%)
 rename package/libhid/{libhid-0001-dont-fiddle-with-debug-flags.patch => 0001-dont-fiddle-with-debug-flags.patch} (100%)
 rename package/libhid/{libhid-0002-no-newline-in-ldflags.patch => 0002-no-newline-in-ldflags.patch} (100%)
 rename package/libhid/{libhid-0003-uclinux.patch => 0003-uclinux.patch} (100%)
 rename package/libinput/{libinput-01-rename-log_msg-to-libinput_log_msg.patch => 0001-rename-log_msg-to-libinput_log_msg.patch} (100%)
 rename package/libiqrf/{libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch => 0001-cmake-handle-static-library-and-find-required-thread.patch} (100%)
 rename package/libiqrf/{libiqrf-use-only-c-language.patch => 0002-use-only-c-language.patch} (100%)
 rename package/libiscsi/{libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch => 0001-Fix-warnings-related-to-subdir-objects.patch} (100%)
 rename package/libiscsi/{libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch => 0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch} (100%)
 rename package/libiscsi/{libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch => 0003-Fix-CUnit-test-for-cross-compilation.patch} (100%)
 rename package/libiscsi/{libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch => 0004-examples-fix-uint64_t-formatting-issues.patch} (100%)
 rename package/libiscsi/{libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch => 0005-ld_iscsi-fix-largefile-related-issues.patch} (100%)
 rename package/libjson/{libjson-0001-fix-broken-makefile.patch => 0001-fix-broken-makefile.patch} (100%)
 rename package/liblockfile/{liblockfile-install.patch => 0001-install.patch} (100%)
 rename package/liblogging/{liblogging-01-stdarg.patch => 0001-stdarg.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-mips-h-constraint-removal.patch => 0001-mips-h-constraint-removal.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-optimization.patch.avr32 => 0002-optimization.patch.avr32} (100%)
 rename package/libmad/{libmad-0.15.1b-remove-deprecated-cflags.patch => 0003-remove-deprecated-cflags.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-thumb2-fixed-arm.patch => 0004-thumb2-fixed-arm.patch} (100%)
 rename package/libmad/{libmad-0.15.1b-thumb2-imdct-arm.patch => 0005-thumb2-imdct-arm.patch} (100%)
 rename package/libmcrypt/{libmcrypt-nocxx.patch => 0001-nocxx.patch} (100%)
 rename package/libmemcached/{libmemcached-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/libmnl/{libmnl-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libmpdclient/{libmpdclient-0001-musl-fixes.patch => 0001-musl-fixes.patch} (100%)
 rename package/libmpeg2/{libmpeg2-0.5.1-altivec.patch => 0001-altivec.patch} (100%)
 rename package/libmpeg2/{libmpeg2-0.5.1-armv4l.patch => 0002-armv4l.patch} (100%)
 rename package/libnetfilter_acct/{libnetfilter_acct-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_conntrack/{libnetfilter_conntrack-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_cthelper/{libnetfilter_cthelper-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_cttimeout/{libnetfilter_cttimeout-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_log/{libnetfilter_log-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnetfilter_queue/{libnetfilter_queue-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnfc/{libnfc-build-systems-make-example-build-optional.patch => 0001-build-systems-make-example-build-optional.patch} (100%)
 rename package/libnfnetlink/{libnfnetlink-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/libnftnl/{libnftnl-0001-rename-xfree.patch => 0001-rename-xfree.patch} (100%)
 rename package/libnl/{libnl-0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch => 0001-netlink-netlink-h-use-poll-h-instead-of-sys-poll-h.patch} (100%)
 rename package/libnspr/{libnspr-0001-nios2.patch => 0001-nios2.patch} (100%)
 rename package/libnspr/{libnspr-0002-microblaze.patch => 0002-microblaze.patch} (100%)
 rename package/libnss/{libnss-0001-cross-compile.patch => 0001-cross-compile.patch} (100%)
 rename package/libnss/{libnss-0002-uclibc.patch => 0002-uclibc.patch} (100%)
 rename package/libpcap/{libpcap-0001-remove-libnl-include-path.patch => 0001-remove-libnl-include-path.patch} (100%)
 rename package/libpcap/{libpcap-0002-configure.in-uclinux-is-also-linux.patch => 0002-configure.in-uclinux-is-also-linux.patch} (100%)
 rename package/libplayer/{libplayer-add-fpic.patch => 0001-add-fpic.patch} (100%)
 rename package/libplayer/{libplayer-fix-configure-cflags.patch => 0002-fix-configure-cflags.patch} (100%)
 rename package/libpng/{libpng-01-disable-tools.patch => 0001-disable-tools.patch} (100%)
 rename package/libpng/{libpng-02-ignore-symbol-prefix.patch => 0002-ignore-symbol-prefix.patch} (100%)
 rename package/libpthsem/{libpthsem-2.0.8-fix-build-on-linux-3.x-host.patch => 0001-fix-build-on-linux-3.x-host.patch} (100%)
 rename package/librtlsdr/{librtlsdr_001_disable_shared_library_target_in_build.patch => 0001-disable_shared_library_target_in_build.patch} (100%)
 rename package/libseccomp/{libseccomp-0001-use-system-headers-from-sysroot.patch => 0001-use-system-headers-from-sysroot.patch} (100%)
 rename package/libseccomp/{libseccomp-0002-Remove-the-dependency-on-proc.patch => 0002-Remove-the-dependency-on-proc.patch} (100%)
 rename package/libsepol/{libsepol-01-support-static-only.patch => 0001-support-static-only.patch} (100%)
 rename package/libserial/{libserial-0001-disable-python-bindings.patch => 0001-disable-python-bindings.patch} (100%)
 rename package/libserial/{libserial-0002-add-missing-header-include.patch => 0002-add-missing-header-include.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0001-fix-avr32-build.patch => 0001-fix-avr32-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0002-fix-aarch64-build.patch => 0002-fix-aarch64-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0003-fix-microblaze-build.patch => 0003-fix-microblaze-build.patch} (100%)
 rename package/libsigsegv/{libsigsegv-0004-fix-bfin-build.patch => 0004-fix-bfin-build.patch} (100%)
 rename package/libsndfile/{libsndfile-srconly.patch => 0001-srconly.patch} (100%)
 rename package/libsoup/{libsoup-01-python3-fix.patch => 0001-python3-fix.patch} (100%)
 rename package/libstrophe/{libstrophe-01-make-autoreconfable.patch => 0001-make-autoreconfable.patch} (100%)
 rename package/libstrophe/{libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch => 0002-configure.ac-fix-misdetection-of-libxml2.patch} (100%)
 rename package/libsvg/{libsvg-fix-expat-static-declaration.patch => 0001-fix-expat-static-declaration.patch} (100%)
 rename package/libsvgtiny/{libsvgtiny-01-disable-debug-printfs.patch => 0001-disable-debug-printfs.patch} (100%)
 rename package/libsvgtiny/{libsvgtiny-02-create-builddir.patch => 0002-create-builddir.patch} (100%)
 rename package/libtirpc/{libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch => 0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch} (100%)
 rename package/libtirpc/{libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch => 0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch} (100%)
 rename package/libtirpc/{libtirpc-0004-Make-IPv6-support-optional.patch => 0004-Make-IPv6-support-optional.patch} (100%)
 rename package/libtirpc/{libtirpc-0008-Add-rpcgen-program-from-nfs-utils-sources.patch => 0008-Add-rpcgen-program-from-nfs-utils-sources.patch} (100%)
 rename package/libtirpc/{libtirpc-0009-Automatically-generate-XDR-header-files-from-.x-sour.patch => 0009-Automatically-generate-XDR-header-files-from-.x-sour.patch} (100%)
 rename package/libtirpc/{libtirpc-0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch => 0010-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch} (100%)
 rename package/libtool/{libtool-01-mips64-n64-linking.patch => 0001-mips64-n64-linking.patch} (100%)
 rename package/libtorrent/{libtorrent-cross_compile.patch => 0001-cross_compile.patch} (100%)
 rename package/libubox/{libubox-01-drop-legacy-json-c.patch => 0001-drop-legacy-json-c.patch} (100%)
 rename package/libunwind/{libunwind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/libunwind/{libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (100%)
 rename package/liburcu/{liburcu-0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch => 0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch} (100%)
 rename package/libv4l/{libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch => 0001-fixup-lfs-mismatch-in-preload-libraries.patch} (100%)
 rename package/libva-intel-driver/{libva-intel-driver-0001-wayland.patch => 0001-wayland.patch} (100%)
 rename package/libva/{libva-0001-no_test_decode.patch => 0001-no_test_decode.patch} (100%)
 rename package/libva/{libva-0002-wayland.patch => 0002-wayland.patch} (100%)
 rename package/libvncserver/{libvncserver-0001-CVE-2014-6051-6052.patch => 0001-CVE-2014-6051-6052.patch} (100%)
 rename package/libvncserver/{libvncserver-0002-CVE-2014-6053.patch => 0002-CVE-2014-6053.patch} (100%)
 rename package/libvncserver/{libvncserver-0003-CVE-2014-6054.patch => 0003-CVE-2014-6054.patch} (100%)
 rename package/libvncserver/{libvncserver-0004-CVE-2014-6055.patch => 0004-CVE-2014-6055.patch} (100%)
 rename package/libwebsockets/{libwebsockets-0001-cmake-set-the-project-language.patch => 0001-cmake-set-the-project-language.patch} (100%)
 rename package/libwebsockets/{libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0002-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch} (100%)
 rename package/libxmlrpc/{libxmlrpc-0004-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} (100%)
 rename package/lighttpd/{lighttpd-01-Fix-default-config-file.patch => 0001-Fix-default-config-file.patch} (100%)
 rename package/links/{links-0001-no-largefile.patch => 0001-no-largefile.patch} (100%)
 rename package/links/{links-0002-CVE-2013-6050.patch => 0002-CVE-2013-6050.patch} (100%)
 rename package/linux-headers/3.0.101/{linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch => 0001-headers_install-fix-__packed-in-exported-kernel-head.patch} (100%)
 rename package/linux-pam/{linux-pam-01-configure.patch => 0001-configure.patch} (100%)
 rename package/linux-pam/{linux-pam-02-doc-makefile-am.patch => 0002-doc-makefile-am.patch} (100%)
 rename package/linux-pam/{linux-pam-03-group.patch => 0003-group.patch} (100%)
 rename package/linux-pam/{linux-pam-04-mkdir.patch => 0004-mkdir.patch} (100%)
 rename package/linux-pam/{linux-pam-05-succeed.patch => 0005-succeed.patch} (100%)
 rename package/linux-pam/{linux-pam-06-time.patch => 0006-time.patch} (100%)
 rename package/linux-pam/{linux-pam-07-rhosts.patch => 0007-rhosts.patch} (100%)
 rename package/linux-zigbee/{linux-zigbee-0001-test-serial-Remove-test-serial.patch => 0001-test-serial-Remove-test-serial.patch} (100%)
 rename package/lite/{lite-dfbspy-stat.patch => 0001-dfbspy-stat.patch} (100%)
 rename package/lite/{lite-no-tests.patch => 0002-no-tests.patch} (100%)
 rename package/lite/{lite-pkg-config.patch => 0003-pkg-config.patch} (100%)
 rename package/lm-sensors/{lm-sensors-0001-static-build.patch => 0001-static-build.patch} (100%)
 rename package/lm-sensors/{lm-sensors-0002-no-host-ldconfig.patch => 0002-no-host-ldconfig.patch} (100%)
 rename package/lockfile-progs/{lockfile-progs-01-sus3v-legacy.patch => 0001-sus3v-legacy.patch} (100%)
 rename package/log4cxx/{log4cxx-0001-charset-fixes.patch => 0001-charset-fixes.patch} (100%)
 rename package/log4cxx/{log4cxx-0002-missing-includes.patch => 0002-missing-includes.patch} (100%)
 rename package/log4cxx/{log4cxx-0003-missing-includes.patch => 0003-missing-includes.patch} (100%)
 rename package/lshw/{lshw-add-LIBS.patch => 0001-add-LIBS.patch} (100%)
 rename package/lsof/{lsof-0001-makefile.patch => 0001-makefile.patch} (100%)
 rename package/lsof/{lsof-0002-noportmap.patch => 0002-noportmap.patch} (100%)
 rename package/lsof/{lsof-0003-override-cflags.patch => 0003-override-cflags.patch} (100%)
 rename package/lsof/{lsof-0004-remove-susvlegacy-funcs.patch => 0004-remove-susvlegacy-funcs.patch} (100%)
 rename package/ltp-testsuite/{ltp-testsuite-fix-build-on-uClibc-exp10.patch => 0001-fix-build-on-uClibc-exp10.patch} (100%)
 rename package/ltrace/{ltrace-01-events.patch => 0001-events.patch} (100%)
 rename package/ltrace/{ltrace-02-arm-plt.patch => 0002-arm-plt.patch} (100%)
 rename package/ltrace/{ltrace-03-PPC-fix-PPC32-build.patch => 0003-PPC-fix-PPC32-build.patch} (100%)
 rename package/lttng-babeltrace/{lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch => 0001-no-posix-fallocate-in-uclibc.patch} (100%)
 rename package/lua/5.1.5/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.1.5/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.1.5/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)
 rename package/lua/5.1.5/{lua-12-fix-reader-at-eoz.patch => 0012-fix-reader-at-eoz.patch} (100%)
 rename package/lua/5.2.3/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.2.3/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.2.3/{lua-04-lua-pc.patch => 0004-lua-pc.patch} (100%)
 rename package/lua/5.2.3/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)
 rename package/luafilesystem/{luafilesystem-without_large_file.patch => 0001-without_large_file.patch} (100%)
 rename package/luajit/{luajit-04-no-bin-symlink.patch => 0004-no-bin-symlink.patch} (100%)
 rename package/luajit/{luajit-05-install-inc.patch => 0005-install-inc.patch} (100%)
 rename package/luajit/{luajit-06-install-so.patch => 0006-install-so.patch} (100%)
 rename package/luasocket/{luasocket-01-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} (100%)
 rename package/lxc/{lxc-01-drop-werror.patch => 0001-drop-werror.patch} (100%)
 rename package/madplay/{madplay-0.15.2b-switch-to-new-alsa-api.patch => 0001-switch-to-new-alsa-api.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0001-index-is-legacy.patch => 0001-index-is-legacy.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0002-libpng15.patch => 0002-libpng15.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-0003-include-setjmp-h.patch => 0003-include-setjmp-h.patch} (100%)
 rename package/matchbox/matchbox-panel/{matchbox-panel-0.9.3-index-is-legacy.patch => 0001-index-is-legacy.patch} (100%)
 rename package/matchbox/matchbox-startup-monitor/{matchbox-startup-monitor-0.1-true-false.patch => 0001-true-false.patch} (100%)
 rename package/matchbox/matchbox-wm/{matchbox-wm-defaulttheme.patch => 0001-defaulttheme.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4409.patch => 0001-CVE-2012-4409.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4426.patch => 0002-CVE-2012-4426.patch} (100%)
 rename package/mcrypt/{mcrypt-CVE-2012-4527.patch => 0003-CVE-2012-4527.patch} (100%)
 rename package/mcrypt/{mcrypt-no-rpath.patch => 0004-no-rpath.patch} (100%)
 rename package/mdadm/{mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch => 0010-add-install-targets-for-mdadm-and-mdmon.patch} (100%)
 rename package/mdadm/{mdadm-020-uclibc-dont-force-largefile.patch => 0020-uclibc-dont-force-largefile.patch} (100%)
 rename package/mdadm/{mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch => 0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch} (100%)
 rename package/media-ctl/{media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch => 0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch} (100%)
 rename package/mediastreamer/{mediastreamer-0001.patch => 0001-misc-fixes.patch} (100%)
 rename package/memstat/{memstat-0001-PATH_MAX.patch => 0001-PATH_MAX.patch} (100%)
 rename package/memtester/{memtester-makefile-fix.patch => 0001-makefile-fix.patch} (100%)
 rename package/mesa3d/{mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch => 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch} (100%)
 rename package/mesa3d/{mesa3d-0002-execinfo_h.patch => 0002-execinfo_h.patch} (100%)
 rename package/metacity/{metacity-add-libm-reference.patch => 0001-add-libm-reference.patch} (100%)
 rename package/metacity/{metacity-gconf.patch => 0002-gconf.patch} (100%)
 rename package/metacity/{metacity-mag-add-libm-reference.patch => 0003-mag-add-libm-reference.patch} (100%)
 rename package/mii-diag/{mii-diag-strchr.patch => 0001-strchr.patch} (100%)
 rename package/mmc-utils/{mmc-utils-001-fix-mmc-h-includes.patch => 0001-fix-mmc-h-includes.patch} (100%)
 rename package/mongoose/{mongoose-0001-largefile-conditional-define.patch => 0001-largefile-conditional-define.patch} (100%)
 rename package/mongrel2/{mongrel2-0001-use-CC-variable-to-compile-procer.patch => 0001-use-CC-variable-to-compile-procer.patch} (100%)
 rename package/mongrel2/{mongrel2-0002-Do-not-run-tests.patch => 0002-Do-not-run-tests.patch} (100%)
 rename package/mongrel2/{mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch => 0003-Fix-Makefiles-for-cross-compilation.patch} (100%)
 rename package/monit/{monit-0001-no-force-static.patch => 0001-no-force-static.patch} (100%)
 rename package/mono/{mono-001-gc-fix-uclibc.patch => 0001-gc-fix-uclibc.patch} (100%)
 rename package/mono/{mono-002-support-uclibc-musl.patch => 0002-support-uclibc-musl.patch} (100%)
 rename package/mplayer/{mplayer-0001-disable-install-strip.patch => 0001-disable-install-strip.patch} (100%)
 rename package/mplayer/{mplayer-0002-fix-cc-parsing.patch => 0002-fix-cc-parsing.patch} (100%)
 rename package/mplayer/{mplayer-0003-mpdemux-live555-async-interface.patch => 0003-mpdemux-live555-async-interface.patch} (100%)
 rename package/mplayer/{mplayer-0004-add-arc-support.patch => 0004-add-arc-support.patch} (100%)
 rename package/mrouted/{mrouted-bcopy.patch => 0001-bcopy.patch} (100%)
 rename package/mtd/{mtd-01-Fix-rpmatch-call-under-uClibc.patch => 0001-Fix-rpmatch-call-under-uClibc.patch} (100%)
 rename package/musepack/{musepack-0001-shared.patch => 0001-shared.patch} (100%)
 rename package/musepack/{musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/mutt/{mutt-01-nodoc.patch => 0001-nodoc.patch} (100%)
 rename package/mxml/{mxml-fix-cross-target-installation.patch => 0001-fix-cross-target-installation.patch} (100%)
 rename package/mysql/{mysql-0000-ac_cache_check.patch => 0001-ac_cache_check.patch} (100%)
 rename package/mysql/{mysql-0001-configure-ps-cache-check.patch => 0002-configure-ps-cache-check.patch} (100%)
 rename package/mysql/{mysql-0002-use-new-readline-iface.patch => 0003-use-new-readline-iface.patch} (100%)
 rename package/mysql/{mysql-0003-ac_stack_direction-is-unset.patch => 0004-ac_stack_direction-is-unset.patch} (100%)
 rename package/mysql/{mysql-0004-Fix-gen_lex_hash-execution.patch => 0005-Fix-gen_lex_hash-execution.patch} (100%)
 rename package/mysql/{mysql-0005-bison_3_breaks_mysql_server_build.patch => 0006-bison_3_breaks_mysql_server_build.patch} (100%)
 rename package/ncurses/{ncurses-01-fixup-pkg-config-handling.patch => 0001-fixup-pkg-config-handling.patch} (100%)
 rename package/ndisc6/{ndisc6-trace-tcp-upd-uClibc-fix.patch => 0001-trace-tcp-upd-uClibc-fix.patch} (100%)
 rename package/ne10/{ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch => 0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch} (100%)
 rename package/netatalk/{netatalk-0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch => 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch} (100%)
 rename package/netcat/{netcat-0.7.1-signed-bit-counting.patch => 0001-signed-bit-counting.patch} (100%)
 rename package/netplug/{netplug-1.2.9.2-makefile-flags.patch => 0001-makefile-flags.patch} (100%)
 rename package/netsnmp/{netsnmp-001-CVE-2014-2285.patch => 0001-CVE-2014-2285.patch} (100%)
 rename package/network-manager/{network-manager-0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch => 0001-NetworkManagerUtils-fix-build-with-toolchains-not-ex.patch} (100%)
 rename package/newt/{newt-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/nfacct/{nfacct-01-uclinux.patch => 0001-uclinux.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch => 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0002-Patch-taken-from-Gentoo.patch => 0002-Patch-taken-from-Gentoo.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch => 0003-Switch-legacy-index-in-favour-of-strchr.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0004-fix-build-with-uClibc.patch => 0004-fix-build-with-uClibc.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch => 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch => 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch} (100%)
 rename package/nfs-utils/{nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch => 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} (100%)
 rename package/nginx/{nginx-0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch => 0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch} (100%)
 rename package/nginx/{nginx-0002-auto-feature-add-mechanism-allowing-to-force-feature.patch => 0002-auto-feature-add-mechanism-allowing-to-force-feature.patch} (100%)
 rename package/nginx/{nginx-0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch => 0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch} (100%)
 rename package/nginx/{nginx-0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch => 0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch} (100%)
 rename package/nginx/{nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch => 0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch} (100%)
 rename package/ngrep/{ngrep-0001-make-objs.patch => 0001-make-objs.patch} (100%)
 rename package/ngrep/{ngrep-0002-pcre-header.patch => 0002-pcre-header.patch} (100%)
 rename package/ngrep/{ngrep-0003-fix-static-link.patch => 0003-fix-static-link.patch} (100%)
 rename package/nodejs/{nodejs-0001-remove-python-bz2-dependency.patch => 0001-remove-python-bz2-dependency.patch} (100%)
 rename package/nodejs/{nodejs-0002-gyp-force-link-command-to-use-CXX.patch => 0002-gyp-force-link-command-to-use-CXX.patch} (100%)
 rename package/nodejs/{nodejs-0003-use-python-variable.patch => 0003-use-python-variable.patch} (100%)
 rename package/ntp/{ntp-001-adjtimex.patch => 0001-adjtimex.patch} (100%)
 rename package/ntp/{ntp-002-nano.patch => 0002-nano.patch} (100%)
 rename package/nut/{nut-0001-foo-config.patch => 0001-foo-config.patch} (100%)
 rename package/nut/{nut-0002-parallel-build.patch => 0002-parallel-build.patch} (100%)
 rename package/nuttcp/{nuttcp-6.1.2-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/ocf-linux/{ocf-linux-01-modules-cross.patch => 0001-modules-cross.patch} (100%)
 rename package/ofono/{ofono-uclibc-backtrace.patch => 0001-uclibc-backtrace.patch} (100%)
 rename package/ola/{ola-0001-fix-build-warning.patch => 0001-fix-build-warning.patch} (100%)
 rename package/ola/{ola-0002-move-python-sub-check-to-configure.ac.patch => 0002-move-python-sub-check-to-configure.ac.patch} (100%)
 rename package/ola/{ola-0003-fix-check-for-python-module-for-cross-compilation.patch => 0003-fix-check-for-python-module-for-cross-compilation.patch} (100%)
 rename package/olsr/{olsr-configurable-ldconfig.patch => 0001-configurable-ldconfig.patch} (100%)
 rename package/open2300/{open2300-0001-fix-makefile.patch => 0001-fix-makefile.patch} (100%)
 rename package/opencv/{opencv-0001-core-fix-x86-PIC-code-compilation.patch => 0001-core-fix-x86-PIC-code-compilation.patch} (100%)
 rename package/openobex/{openobex-libusb_check_when_cross-compiling.patch => 0001-libusb_check_when_cross-compiling.patch} (100%)
 rename package/openobex/{openobex-replace_deprecated_functions.patch => 0002-replace_deprecated_functions.patch} (100%)
 rename package/openocd/{openocd-0001-fix-cross-compilation-host-libsub-was-used-before.patch => 0001-fix-cross-compilation-host-libsub-was-used-before.patch} (100%)
 rename package/openocd/{openocd-0002-fix-xscale-uninitialise-breakpoint_pc.patch => 0002-fix-xscale-uninitialise-breakpoint_pc.patch} (100%)
 rename package/openocd/{openocd-0003-force-gnu99.patch => 0003-force-gnu99.patch} (100%)
 rename package/openocd/{openocd-0004-force_jimtcl_static.patch => 0004-force_jimtcl_static.patch} (100%)
 rename package/openocd/{openocd-0005-dont-force-ldflags.patch => 0005-dont-force-ldflags.patch} (100%)
 rename package/openocd/{openocd-0006-automake-compat.patch => 0006-automake-compat.patch} (100%)
 rename package/openpgm/{openpgm-0001-version_generator.py-make-it-python3-compliant.patch => 0001-version_generator.py-make-it-python3-compliant.patch} (100%)
 rename package/openpgm/{openpgm-cross-compile.patch => 0002-cross-compile.patch} (100%)
 rename package/openpowerlink/{openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch => 0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch} (100%)
 rename package/openssh/{openssh-01-fix-pam-uclibc-pthreads-clash.patch => 0001-fix-pam-uclibc-pthreads-clash.patch} (100%)
 rename package/openssh/{openssh-02-fix-howmany-include.patch => 0002-fix-howmany-include.patch} (100%)
 rename package/openssl/{openssl-001-do-not-build-docs.patch => 0001-do-not-build-docs.patch} (100%)
 rename package/openssl/{openssl-002-dont-force-large-file.patch => 0002-dont-force-large-file.patch} (100%)
 rename package/openssl/{openssl-003-cryptodev-Fix-issue-with-signature-generation.patch => 0003-cryptodev-Fix-issue-with-signature-generation.patch} (100%)
 rename package/openssl/{openssl-004-musl-termios.patch => 0004-musl-termios.patch} (100%)
 rename package/openvmtools/{openvmtools-01-has_bsd_printf.patch => 0001-has_bsd_printf.patch} (100%)
 rename package/openvmtools/{openvmtools-02-network_script.patch => 0002-network_script.patch} (100%)
 rename package/openvmtools/{openvmtools-03-conditionally-define-g_info.patch => 0003-conditionally-define-g_info.patch} (100%)
 rename package/openvmtools/{openvmtools-04-no_cflags_werror.patch => 0004-no_cflags_werror.patch} (100%)
 rename package/openvmtools/{openvmtools-05-dont-force-cppflags.patch => 0005-dont-force-cppflags.patch} (100%)
 rename package/oprofile/{oprofile-001-avr32-enable-lookup_dcookie.patch => 0001-avr32-enable-lookup_dcookie.patch} (100%)
 rename package/oprofile/{oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch => 0002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch} (100%)
 rename package/oprofile/{oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch => 0003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch} (100%)
 rename package/opus-tools/{opus-tools-largefile.patch => 0001-largefile.patch} (100%)
 rename package/opus/{opus-01-configure.ac-fix-bashism-in-ARM-optimization-handling.patch => 0001-configure.ac-fix-bashism-in-ARM-optimization-handling.patch} (100%)
 rename package/owl-linux/{owl-linux-fix-CROSS_COMPILE-usage-in-Makefile.patch => 0001-fix-CROSS_COMPILE-usage-in-Makefile.patch} (100%)
 rename package/owl-linux/{owl-linux-fix-for-linux-3.3.x.patch => 0002-fix-for-linux-3.3.x.patch} (100%)
 rename package/p11-kit/{p11-kit-01-Fix-build-against-older-pthreads-implementations.patch => 0001-Fix-build-against-older-pthreads-implementations.patch} (100%)
 rename package/pango/{pango-0001-no-tests.patch => 0001-no-tests.patch} (100%)
 rename package/{libglib2/libglib2-0002-no-gtk-doc.patch => pango/0002-no-gtk-doc.patch} (100%)
 rename package/parted/{parted-001-readline-deprecated.patch => 0001-readline-deprecated.patch} (100%)
 rename package/parted/{parted-002-configure.ac-uclinux-is-also-linux.patch => 0002-configure.ac-uclinux-is-also-linux.patch} (100%)
 rename package/pcmanfm/{pcmanfm-link-against-libx11.patch => 0001-link-against-libx11.patch} (100%)
 rename package/pcre/{pcre-01-no-compat.patch => 0001-no-compat.patch} (100%)
 rename package/pcre/{pcre-02-no-cpp-tests.patch => 0002-no-cpp-tests.patch} (100%)
 rename package/pcsc-lite/{pcsc-lite-0001-pthread-needed-for-libusb.patch => 0001-pthread-needed-for-libusb.patch} (100%)
 rename package/perl-gd/{perl-gd-01-getoptions.patch => 0001-getoptions.patch} (100%)
 rename package/perl-gd/{perl-gd-02-lgd.patch => 0002-lgd.patch} (100%)
 rename package/perl-gd/{perl-gd-03-force.patch => 0003-force.patch} (100%)
 rename package/perl-net-ssleay/{perl-net-ssleay-0000-fix-build-system.patch => 0001-fix-build-system.patch} (100%)
 rename package/perl-xml-libxml/{perl-xml-libxml-01-Makefile-PL.patch => 0001-Makefile-PL.patch} (100%)
 rename package/perl/{perl-uClibc-IPv6.patch => 0001-uClibc-IPv6.patch} (100%)
 rename package/php/{php-01-no-iconv-search.patch => 0001-no-iconv-search.patch} (100%)
 rename package/php/{php-02-dlopen.patch => 0002-dlopen.patch} (100%)
 rename package/php/{php-03-disable-pharcmd.patch => 0003-disable-pharcmd.patch} (100%)
 rename package/pifmrds/{pifmrds-0001-Makefile-cross-compile-friendly.patch => 0001-Makefile-cross-compile-friendly.patch} (100%)
 rename package/pifmrds/{pifmrds-0002-Makefile-use-LDFLAGS.patch => 0002-Makefile-use-LDFLAGS.patch} (100%)
 rename package/pkgconf/{pkgconf-01-fix-variable.patch => 0001-fix-variable.patch} (100%)
 rename package/pkgconf/{pkgconf-02-fix-double-sysroot.patch => 0002-fix-double-sysroot.patch} (100%)
 rename package/poco/{poco-aarch64.patch => 0001-aarch64.patch} (100%)
 rename package/poco/{poco-add-cross-build-config.patch => 0002-add-cross-build-config.patch} (100%)
 rename package/poco/{poco-add-staging-search-path.patch => 0003-add-staging-search-path.patch} (100%)
 rename package/poco/{poco-dont-build-debug-libs.patch => 0004-dont-build-debug-libs.patch} (100%)
 rename package/polarssl/{polarssl-01-no-test-suite.patch => 0001-no-test-suite.patch} (100%)
 rename package/polarssl/{polarssl-02-disable-microblaze-asm.patch => 0002-disable-microblaze-asm.patch} (100%)
 rename package/polarssl/{polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/popt/{popt-01-no-wchar.patch => 0001-no-wchar.patch} (100%)
 rename package/popt/{popt-02-fix-autoreconf.patch => 0002-fix-autoreconf.patch} (100%)
 rename package/popt/{popt-03-glob-detection.patch => 0003-glob-detection.patch} (100%)
 rename package/portmap/{portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch => 0001-README-fix-typo-in-tcp-wrapper-doc.patch} (100%)
 rename package/portmap/{portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch => 0002-NO_PIE-make-PIE-support-controllable.patch} (100%)
 rename package/portmap/{portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch => 0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch} (100%)
 rename package/portmap/{portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch => 0004-NO_PERROR-control-overriding-of-perror-symbol.patch} (100%)
 rename package/portmap/{portmap-6.0-tcpd.patch => 0005-tcpd.patch} (100%)
 rename package/pptp-linux/{pptp-linux-001-susv3-legacy.patch => 0001-susv3-legacy.patch} (100%)
 rename package/pptp-linux/{pptp-linux-002-fix-parallel-build.patch => 0002-fix-parallel-build.patch} (100%)
 rename package/prboom/{prboom-2.5.0-libpng-1.4.patch => 0001-libpng-1.4.patch} (100%)
 rename package/procps-ng/{procps-ng-0000-remove-index.patch => 0001-remove-index.patch} (100%)
 rename package/proftpd/{proftpd-0001-fix-kernel-header-capability-version.patch => 0001-fix-kernel-header-capability-version.patch} (100%)
 rename package/proftpd/{proftpd-0002-__mempcpy.patch => 0002-__mempcpy.patch} (100%)
 rename package/psmisc/{psmisc-link-against-libintl.patch => 0001-link-against-libintl.patch} (100%)
 rename package/psmisc/{psmisc-no-__progname.patch => 0002-no-__progname.patch} (100%)
 rename package/pure-ftpd/{pure-ftpd-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/python-ipython/{python-ipython-001-set-correct-python-executable-path.patch => 0001-set-correct-python-executable-path.patch} (100%)
 rename package/python-netifaces/{python-netifaces-ifaddrs-uclibc.patch => 0001-ifaddrs-uclibc.patch} (100%)
 rename package/python-nfc/{python-nfc-add-setup-py.patch => 0001-add-setup-py.patch} (100%)
 rename package/python-numpy/{python-numpy-0001-no-fenv-on-uclibc.patch => 0001-no-fenv-on-uclibc.patch} (100%)
 rename package/python-pycrypto/{python-pycrypto-0001-remove-incorrect-header-path.patch => 0001-remove-incorrect-header-path.patch} (100%)
 rename package/python-pyzmq/{python-pyzmq-0001-use-buildroot-zmq-version-instead-of-detect.patch => 0001-use-buildroot-zmq-version-instead-of-detect.patch} (100%)
 rename package/python-setuptools/{python-setuptools-0001-add-executable.patch => 0001-add-executable.patch} (100%)
 rename package/python/{python-001-remove-host-header-path.patch => 0001-remove-host-header-path.patch} (100%)
 rename package/python/{python-002-fix-get-python-inc.patch => 0002-fix-get-python-inc.patch} (100%)
 rename package/python/{python-003-properly-detect-if-python-build.patch => 0003-properly-detect-if-python-build.patch} (100%)
 rename package/python/{python-004-sysconfigdata-install-location.patch => 0004-sysconfigdata-install-location.patch} (100%)
 rename package/python/{python-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} (100%)
 rename package/python/{python-006-cross-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} (100%)
 rename package/python/{python-007-disable-extensions.patch => 0007-disable-extensions.patch} (100%)
 rename package/python/{python-008-distutils-use-python-sysroot.patch => 0008-distutils-use-python-sysroot.patch} (100%)
 rename package/python/{python-009-no-termcap-host-path.patch => 0009-no-termcap-host-path.patch} (100%)
 rename package/python/{python-010-fix-python-config.patch => 0010-fix-python-config.patch} (100%)
 rename package/python/{python-011-remove-python-symlink.patch => 0011-remove-python-symlink.patch} (100%)
 rename package/python/{python-012-support-library-path-old-compilers.patch => 0012-support-library-path-old-compilers.patch} (100%)
 rename package/python/{python-013-dont-add-multiarch-path.patch => 0013-dont-add-multiarch-path.patch} (100%)
 rename package/python/{python-014-abort-on-failed-modules.patch => 0014-abort-on-failed-modules.patch} (100%)
 rename package/python/{python-015-fix-sqlite-without-threads.patch => 0015-fix-sqlite-without-threads.patch} (100%)
 rename package/python/{python-016-serial-ioctl-workaround.patch => 0016-serial-ioctl-workaround.patch} (100%)
 rename package/python/{python-017-distutils-scripts-dont-adjust-shebang.patch => 0017-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python/{python-100-optional-test-modules.patch => 0100-optional-test-modules.patch} (100%)
 rename package/python/{python-101-optional-pydoc.patch => 0101-optional-pydoc.patch} (100%)
 rename package/python/{python-102-optional-2to3.patch => 0102-optional-2to3.patch} (100%)
 rename package/python/{python-103-optional-sqlite.patch => 0103-optional-sqlite.patch} (100%)
 rename package/python/{python-104-optional-tk.patch => 0104-optional-tk.patch} (100%)
 rename package/python/{python-105-optional-curses.patch => 0105-optional-curses.patch} (100%)
 rename package/python/{python-106-optional-expat.patch => 0106-optional-expat.patch} (100%)
 rename package/python/{python-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} (100%)
 rename package/python/{python-108-optional-nis.patch => 0108-optional-nis.patch} (100%)
 rename package/python/{python-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} (100%)
 rename package/python/{python-110-optional-db.patch => 0110-optional-db.patch} (100%)
 rename package/python/{python-111-optional-ssl.patch => 0111-optional-ssl.patch} (100%)
 rename package/python/{python-112-optional-bzip2.patch => 0112-optional-bzip2.patch} (100%)
 rename package/python/{python-113-optional-zlib.patch => 0113-optional-zlib.patch} (100%)
 rename package/python/{python-114-remove-idle-editor.patch => 0114-remove-idle-editor.patch} (100%)
 rename package/python3/{python3-001-remove-host-header-path.patch => 0001-remove-host-header-path.patch} (100%)
 rename package/python3/{python3-002-properly-detect-if-python-build.patch => 0002-properly-detect-if-python-build.patch} (100%)
 rename package/python3/{python3-003-sysconfigdata-install-location.patch => 0003-sysconfigdata-install-location.patch} (100%)
 rename package/python3/{python3-004-old-stdlib-cache.patch => 0004-old-stdlib-cache.patch} (100%)
 rename package/python3/{python3-005-pyc-pyo-conditional.patch => 0005-pyc-pyo-conditional.patch} (100%)
 rename package/python3/{python3-006-cross-compile-getaddrinfo.patch => 0006-cross-compile-getaddrinfo.patch} (100%)
 rename package/python3/{python3-007-disable-extensions.patch => 0007-disable-extensions.patch} (100%)
 rename package/python3/{python3-008-distutils-sysconfig-use-sysconfigdata.patch => 0008-distutils-sysconfig-use-sysconfigdata.patch} (100%)
 rename package/python3/{python3-009-distutils-use-python-sysroot.patch => 0009-distutils-use-python-sysroot.patch} (100%)
 rename package/python3/{python3-010-no-termcap-host-path.patch => 0010-no-termcap-host-path.patch} (100%)
 rename package/python3/{python3-011-support-library-path-old-compilers.patch => 0011-support-library-path-old-compilers.patch} (100%)
 rename package/python3/{python3-012-dont-add-multiarch-path.patch => 0012-dont-add-multiarch-path.patch} (100%)
 rename package/python3/{python3-013-abort-on-failed-modules.patch => 0013-abort-on-failed-modules.patch} (100%)
 rename package/python3/{python3-014-serial-ioctl-workaround.patch => 0014-serial-ioctl-workaround.patch} (100%)
 rename package/python3/{python3-015-distutils-scripts-dont-adjust-shebang.patch => 0015-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python3/{python3-016-distutils-no-pep3147.patch => 0016-distutils-no-pep3147.patch} (100%)
 rename package/python3/{python3-100-optional-test-modules.patch => 0100-optional-test-modules.patch} (100%)
 rename package/python3/{python3-101-optional-pydoc.patch => 0101-optional-pydoc.patch} (100%)
 rename package/python3/{python3-102-optional-2to3.patch => 0102-optional-2to3.patch} (100%)
 rename package/python3/{python3-103-optional-sqlite.patch => 0103-optional-sqlite.patch} (100%)
 rename package/python3/{python3-104-optional-tk.patch => 0104-optional-tk.patch} (100%)
 rename package/python3/{python3-105-optional-curses.patch => 0105-optional-curses.patch} (100%)
 rename package/python3/{python3-106-optional-expat.patch => 0106-optional-expat.patch} (100%)
 rename package/python3/{python3-107-optional-codecs-cjk.patch => 0107-optional-codecs-cjk.patch} (100%)
 rename package/python3/{python3-108-optional-nis.patch => 0108-optional-nis.patch} (100%)
 rename package/python3/{python3-109-optional-unicodedata.patch => 0109-optional-unicodedata.patch} (100%)
 rename package/python3/{python3-110-optional-idle.patch => 0110-optional-idle.patch} (100%)
 rename package/python3/{python3-111-optional-decimal.patch => 0111-optional-decimal.patch} (100%)
 rename package/qdecoder/{qdecoder-0001-fix-make-install.patch => 0001-fix-make-install.patch} (100%)
 rename package/qdecoder/{qdecoder-0002-configure.ac-drop-hardcoded-paths.patch => 0002-configure.ac-drop-hardcoded-paths.patch} (100%)
 rename package/qdecoder/{qdecoder-0003-errno.patch => 0003-errno.patch} (100%)
 rename package/qextserialport/{qextserialport-gui.patch => 0001-gui.patch} (100%)
 rename package/qextserialport/{qextserialport-main-include.patch => 0002-main-include.patch} (100%)
 rename package/qextserialport/{qextserialport-pkgconfig.patch => 0003-pkgconfig.patch} (100%)
 rename package/qjson/{qjson-fix-qt4-package-error-in-cmakelists.patch => 0001-fix-qt4-package-error-in-cmakelists.patch} (100%)
 rename package/qlibc/{qlibc-0001-remove-absolute-paths.patch => 0001-remove-absolute-paths.patch} (100%)
 rename package/qlibc/{qlibc-0002-obey-destdir.patch => 0002-obey-destdir.patch} (100%)
 rename package/qlibc/{qlibc-0003-fix-openssl-mysql-checks.patch => 0003-fix-openssl-mysql-checks.patch} (100%)
 rename package/qt/{qt-configure.patch => 0001-configure.patch} (100%)
 rename package/qt/{qt-eglwsegl-use-system.patch => 0002-eglwsegl-use-system.patch} (100%)
 rename package/qt/{qt-fix-const-atomics.patch => 0003-fix-const-atomics.patch} (100%)
 rename package/qt/{qt-pthread_getattr_np.patch => 0004-pthread_getattr_np.patch} (100%)
 rename package/qt/{qt-script-qtdbus-no-gui.patch => 0005-script-qtdbus-no-gui.patch} (100%)
 rename package/qt/{qt-uClibc-lfs-fix.patch => 0006-uClibc-lfs-fix.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
 rename package/qt5/qt5base/{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} (100%)
 rename package/qt5/qt5webkit-examples/{qt5webkit-examples-0001-build.patch => 0001-build.patch} (100%)
 rename package/qt5/qt5webkit/{qt5webkit-0001-egl-includepath.patch => 0001-egl-includepath.patch} (100%)
 rename package/qt5/qt5websockets/{qt5websockets-0001-Remove-dependency-on-unused-sql-module.patch => 0001-Remove-dependency-on-unused-sql-module.patch} (100%)
 rename package/qtuio/{qtuio-TuioServer.cpp-add-missing-include.patch => 0001-TuioServer.cpp-add-missing-include.patch} (100%)
 rename package/qtuio/{qtuio-dont-append-_d-for-debug.patch => 0002-dont-append-_d-for-debug.patch} (100%)
 rename package/quagga/{quagga-fix-ipctl-forwarding.patch => 0001-fix-ipctl-forwarding.patch} (100%)
 rename package/quota/{quota-01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch} (100%)
 rename package/qwt/{qwt-remove-installed-check.patch => 0001-remove-installed-check.patch} (100%)
 rename package/radvd/{radvd-01-drop-check.patch => 0001-drop-check.patch} (100%)
 rename package/radvd/{radvd-02-drop-stack-protector.patch => 0002-drop-stack-protector.patch} (100%)
 rename package/rdesktop/{rdesktop-01-8bit-colors.patch => 0001-8bit-colors.patch} (100%)
 rename package/readline/{readline-001-curses-link.patch => 0001-curses-link.patch} (100%)
 rename package/redis/{redis-001-uclibc.patch => 0001-uclibc.patch} (100%)
 rename package/redis/{redis-002-lua-AR.patch => 0002-lua-AR.patch} (100%)
 rename package/redis/{redis-003-largefile-conditional-define.patch => 0003-largefile-conditional-define.patch} (100%)
 rename package/rp-pppoe/{rp-pppoe-3.10-002-krn-plugin.patch => 0002-krn-plugin.patch} (100%)
 rename package/rpcbind/{rpcbind-0001-Remove-yellow-pages-support.patch => 0001-Remove-yellow-pages-support.patch} (100%)
 rename package/rpcbind/{rpcbind-0003-Make-IPv6-configurable.patch => 0003-Make-IPv6-configurable.patch} (100%)
 rename package/rpi-userland/{rpi-userland-000-add-pkgconfig-files.patch => 0001-add-pkgconfig-files.patch} (100%)
 rename package/rpi-userland/{rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch => 0002-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} (100%)
 rename package/rpi-userland/{rpi-userland-002-remove-faulty-assert.patch => 0003-remove-faulty-assert.patch} (100%)
 rename package/rpi-userland/{rpi-userland-003-fix-musl-compile.patch => 0004-fix-musl-compile.patch} (100%)
 rename package/rpm/{rpm-5.2.0-uclibc-no-lfs-fix.patch => 0001-uclibc-no-lfs-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_depends-fix.patch => 0002-depends-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_exclude-some-tools.patch => 0003-exclude-some-tools.patch} (100%)
 rename package/rpm/{rpm-5.2.0_ignore-shared-mutexes.patch => 0004-ignore-shared-mutexes.patch} (100%)
 rename package/rpm/{rpm-5.2.0_no-parentdirs.patch => 0005-no-parentdirs.patch} (100%)
 rename package/rpm/{rpm-5.2.0_ordering-fix.patch => 0006-ordering-fix.patch} (100%)
 rename package/rpm/{rpm-5.2.0_parentdir-vs-requires.patch => 0007-parentdir-vs-requires.patch} (100%)
 rename package/rpm/{rpm-5.2.0_short-circuit-c99.patch => 0008-short-circuit-c99.patch} (100%)
 rename package/rrdtool/{rrdtool-automake-compat.patch => 0001-automake-compat.patch} (100%)
 rename package/rrdtool/{rrdtool-configure-dont-hardcode-include-dirs.patch => 0002-configure-dont-hardcode-include-dirs.patch} (100%)
 rename package/rt-tests/{rt-tests-fix-build-system.patch => 0001-fix-build-system.patch} (100%)
 rename package/rt-tests/{rt-tests-uclibc.patch => 0002-uclibc.patch} (100%)
 rename package/rtorrent/{rtorrent-cross_compile.patch => 0001-cross_compile.patch} (100%)
 rename package/rtptools/{rtptools-01-host2ip-no-nis-on-uClibc.patch => 0001-host2ip-no-nis-on-uClibc.patch} (100%)
 rename package/rubix/{rubix-1.0.5-dont-use-legacy-functions.patch => 0001-dont-use-legacy-functions.patch} (100%)
 rename package/rubix/{rubix-1.0.5.patch => 0002-misc-fixes.patch} (100%)
 rename package/samba/{samba-0001-fix-smbd-libs-avahi.patch => 0001-fix-smbd-libs-avahi.patch} (100%)
 rename package/samba/{samba-0002-getaddrinfo.patch => 0002-getaddrinfo.patch} (100%)
 rename package/samba4/{samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch => 0003-build-find-FILE_OFFSET_BITS-via-array.patch} (100%)
 rename package/samba4/{samba4-0004-build-allow-some-python-variable-overrides.patch => 0004-build-allow-some-python-variable-overrides.patch} (100%)
 rename package/samba4/{samba4-0005-build-find-blkcnt_t-size-via-array.patch => 0005-build-find-blkcnt_t-size-via-array.patch} (100%)
 rename package/samba4/{samba4-0006-build-unify-and-fix-endian-tests.patch => 0006-build-unify-and-fix-endian-tests.patch} (100%)
 rename package/samba4/{samba4-0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch => 0007-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch} (100%)
 rename package/samba4/{samba4-0008-build-tweak-SIZEOF-utmp-ut_line.patch => 0008-build-tweak-SIZEOF-utmp-ut_line.patch} (100%)
 rename package/samba4/{samba4-0009-disable-libbsd.patch => 0009-disable-libbsd.patch} (100%)
 rename package/sane-backends/{sane-backends-1.0.22-qcam-x86.patch => 0001-qcam-x86.patch} (100%)
 rename package/sane-backends/{sane-backends-1.0.22-v4l.patch => 0002-v4l.patch} (100%)
 rename package/sawman/{sawman-001-link-using-gcc-instead-of-ld.patch => 0001-link-using-gcc-instead-of-ld.patch} (100%)
 rename package/screen/{screen-0001-compiler-sanity-checks.patch => 0001-compiler-sanity-checks.patch} (100%)
 rename package/screen/{screen-0002-no-memcpy-fallback.patch => 0002-no-memcpy-fallback.patch} (100%)
 rename package/screen/{screen-0003-cross-compilation-AC_TRY_RUN.patch => 0003-cross-compilation-AC_TRY_RUN.patch} (100%)
 rename package/screen/{screen-0004-cross-compilation-ignore-host-fs.patch => 0004-cross-compilation-ignore-host-fs.patch} (100%)
 rename package/screen/{screen-0005-avoid-identifying-as-SVR4.patch => 0005-avoid-identifying-as-SVR4.patch} (100%)
 rename package/screen/{screen-0006-install-no-backup-binary.patch => 0006-install-no-backup-binary.patch} (100%)
 rename package/screen/{screen-0007-install-always-chmod.patch => 0007-install-always-chmod.patch} (100%)
 rename package/screen/{screen-0008-install-nonversioned-binary.patch => 0008-install-nonversioned-binary.patch} (100%)
 rename package/screen/{screen-0009-install-dir-dependency.patch => 0009-install-dir-dependency.patch} (100%)
 rename package/screen/{screen-0010-rename-sched_h.patch => 0010-rename-sched_h.patch} (100%)
 rename package/sdl/{sdl-0001-use-correct-directfb-config.patch => 0001-use-correct-directfb-config.patch} (100%)
 rename package/sdl/{sdl-0002-fix-compilation-with-libx11.patch => 0002-fix-compilation-with-libx11.patch} (100%)
 rename package/ser2net/{ser2net-0001-Fix-TIOCSRS485-undeclared-error.patch => 0001-Fix-TIOCSRS485-undeclared-error.patch} (100%)
 rename package/setserial/{setserial-0001-build-system-fix.patch => 0001-build-system-fix.patch} (100%)
 rename package/setserial/{setserial-0002-tiocghayesesp-build-fix.patch => 0002-tiocghayesesp-build-fix.patch} (100%)
 rename package/sispmctl/{sispmctl-01-configure-add-pkg-config-support.patch => 0001-configure-add-pkg-config-support.patch} (100%)
 rename package/slang/{slang-01-slsh-libs.patch => 0001-slsh-libs.patch} (100%)
 rename package/smstools3/{smstools3-0000-fix-Makefile.patch => 0001-fix-Makefile.patch} (100%)
 rename package/snmppp/{snmppp-01-Add-missing-includes.patch => 0001-Add-missing-includes.patch} (100%)
 rename package/socat/{socat-001-no-documentation.patch => 0001-no-documentation.patch} (100%)
 rename package/sox/{sox-0001-uclibc.patch => 0001-uclibc.patch} (100%)
 rename package/speex/{speex-thumb2-support.patch => 0001-thumb2-support.patch} (100%)
 rename package/spice/{spice-0001-fix-missing-monitor_latency-argument.patch => 0001-fix-missing-monitor_latency-argument.patch} (100%)
 rename package/squid/{squid-01-assume-get-certificate-ok.patch => 0001-assume-get-certificate-ok.patch} (100%)
 rename package/squid/{squid-02-missing-include-time_h.patch => 0002-missing-include-time_h.patch} (100%)
 rename package/statserial/{statserial-01-ncurses-link.patch => 0001-ncurses-link.patch} (100%)
 rename package/strace/{strace-0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch => 0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch} (100%)
 rename package/stress/{stress-0001-Remove-largefile.patch => 0001-Remove-largefile.patch} (100%)
 rename package/sudo/{sudo-0001-no-netgroup.patch => 0001-no-netgroup.patch} (100%)
 rename package/sudo/{sudo-0002-drop-sspcflags-piecflags-for-host.patch => 0002-drop-sspcflags-piecflags-for-host.patch} (100%)
 rename package/sunxi-mali/{sunxi-mali-0001-Add-missing-GLchar-definitions.patch => 0001-Add-missing-GLchar-definitions.patch} (100%)
 rename package/synergy/{synergy-1.3.1-includes.patch => 0001-includes.patch} (100%)
 rename package/synergy/{synergy-1.3.1-remove-werror.patch => 0002-remove-werror.patch} (100%)
 rename package/sysprof/{sysprof-01-define-NT_GNU_BUILD_ID.patch => 0001-define-NT_GNU_BUILD_ID.patch} (100%)
 rename package/systemd/{systemd-01-fix-getty-unit.patch => 0001-fix-getty-unit.patch} (100%)
 rename package/systemd/{systemd-02-build-sys-revert-use-of-ln-relative-option.patch => 0002-build-sys-revert-use-of-ln-relative-option.patch} (100%)
 rename package/systemd/{systemd-03-fix-am-path-libgcrypt-no-found.patch => 0003-fix-am-path-libgcrypt-no-found.patch} (100%)
 rename package/taglib/{taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => 0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 rename package/tar/{tar-0001-fix-build-failure.patch => 0001-fix-build-failure.patch} (100%)
 rename package/tcl/{tcl-0001-dont-build-compat.patch => 0001-dont-build-compat.patch} (100%)
 rename package/thrift/{thrift-01-libevent-cross.patch => 0001-libevent-cross.patch} (100%)
 rename package/thrift/{thrift-02-autoreconf.patch => 0002-autoreconf.patch} (100%)
 rename package/thrift/{thrift-03-zlib-cross.patch => 0003-zlib-cross.patch} (100%)
 rename package/thrift/{thrift-04-failed-to-build-on-OSX-10.9-GM.patch => 0004-failed-to-build-on-OSX-10.9-GM.patch} (100%)
 rename package/thrift/{thrift-05-stdlib-and-boost-both-define-uint64_t.patch => 0005-stdlib-and-boost-both-define-uint64_t.patch} (100%)
 rename package/thttpd/{thttpd-2.25b-getline.patch => 0001-getline.patch} (100%)
 rename package/ti-gfx/{ti-gfx-0000-newclkapi.patch => 0001-newclkapi.patch} (100%)
 rename package/ti-gfx/{ti-gfx-0001-fix-build-omaplfb-linux.patch => 0002-fix-build-omaplfb-linux.patch} (100%)
 rename package/ti-gfx/{ti-gfx-km_install_modules.patch => 0003-km_install_modules.patch} (100%)
 rename package/tinyhttpd/{tinyhttpd.patch => 0001-misc-fixes.patch} (100%)
 rename package/tn5250/{tn5250-01-ssldir.patch => 0001-ssldir.patch} (100%)
 rename package/trace-cmd/{trace-cmd-0001-Fix-ptrace-detection.patch => 0001-Fix-ptrace-detection.patch} (100%)
 rename package/transmission/{transmission-01-fix-utypes.patch => 0001-fix-utypes.patch} (100%)
 rename package/tslib/{tslib-enable_raw_module.patch => 0001-enable_raw_module.patch} (100%)
 rename package/tslib/{tslib_add_finddef_and_inputattach_utils.patch => 0002-add_finddef_and_inputattach_utils.patch} (100%)
 rename package/tstools/{tstools-001-build-get-along-with-buildroot.patch => 0001-build-get-along-with-buildroot.patch} (100%)
 rename package/tstools/{tstools-002-build-fix-parallel-build-failure.patch => 0002-build-fix-parallel-build-failure.patch} (100%)
 rename package/tvheadend/{tvheadend-002-no-check_config.patch => 0002-no-check_config.patch} (100%)
 rename package/tvheadend/{tvheadend-003-remove-werror.patch => 0003-remove-werror.patch} (100%)
 rename package/uboot-tools/{uboot-tools-01-drop-configh-from-tools.patch => 0001-drop-configh-from-tools.patch} (100%)
 rename package/uboot-tools/{uboot-tools-02-nostrip.patch => 0002-nostrip.patch} (100%)
 rename package/udpcast/{udpcast-select-h.patch => 0001-select-h.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.01.patch => 0001-lt.01.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.02.patch => 0002-lt.02.patch} (100%)
 rename package/uemacs/{uemacs-4.0.15-lt.03.ixon.patch => 0003-lt.03.ixon.patch} (100%)
 rename package/unionfs/{unionfs-fuse-no-cxx-needed.patch => 0001-fuse-no-cxx-needed.patch} (100%)
 rename package/urg/{urg-select-h.patch => 0001-select-h.patch} (100%)
 rename package/usb_modeswitch_data/{usb_modeswitch_data-makefile.patch => 0001-makefile.patch} (100%)
 rename package/usbmount/{usbmount-rules-fix.patch => 0001-rules-fix.patch} (100%)
 rename package/usbmount/{usbmount-use-udev-environment-instead-of-blkid.patch => 0002-use-udev-environment-instead-of-blkid.patch} (100%)
 rename package/ushare/{ushare-compile-fixes.patch => 0001-compile-fixes.patch} (100%)
 rename package/ussp-push/{ussp-push-fix-build-against-bluez-4.patch => 0001-fix-build-against-bluez-4.patch} (100%)
 rename package/util-linux/{util-linux-001-sscanf-no-ms-as.patch => 0001-sscanf-no-ms-as.patch} (100%)
 rename package/util-linux/{util-linux-002-program-invocation-short-name.patch => 0002-program-invocation-short-name.patch} (100%)
 rename package/util-linux/{util-linux-003-c.h-define-mkostemp-for-older-version-of-uClibc.patch => 0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} (100%)
 rename package/vala/{vala-dont-add-dirty-to-valac-version.patch => 0001-dont-add-dirty-to-valac-version.patch} (100%)
 rename package/valgrind/{valgrind-0001-workaround-SIGSEGV-on-PPC.patch => 0001-workaround-SIGSEGV-on-PPC.patch} (100%)
 rename package/valgrind/{valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch => 0002-don-t-enable-largefile-support-unconditionally-on-uC.patch} (100%)
 rename package/valgrind/{valgrind-0003-add-missing-ptrace-getsiginfo-on-powerpc.patch => 0003-add-missing-ptrace-getsiginfo-on-powerpc.patch} (100%)
 rename package/vde2/{vde2-no-cxx.patch => 0001-no-cxx.patch} (100%)
 rename package/vlc/{vlc-0001-vlc-static.patch => 0001-vlc-static.patch} (100%)
 rename package/vlc/{vlc-0002-configure.ac-add-check-for-libgcrypt-config-program.patch => 0002-configure.ac-add-check-for-libgcrypt-config-program.patch} (100%)
 rename package/vlc/{vlc-0003-automake-add-subdir-objects-option.patch => 0003-automake-add-subdir-objects-option.patch} (100%)
 rename package/vlc/{vlc-0004-libav.patch => 0004-libav.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-fix-build.patch => 0001-fix-build.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-nomanual.patch => 0002-nomanual.patch} (100%)
 rename package/vpnc/{vpnc-0.5.3-susv3-legacy.patch => 0003-susv3-legacy.patch} (100%)
 rename package/vsftpd/{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} (100%)
 rename package/vsftpd/{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} (100%)
 rename package/vtun/{vtun-001-fix-installation.patch => 0001-fix-installation.patch} (100%)
 rename package/vtun/{vtun-002-fix-ssl-headers-checks.patch => 0002-fix-ssl-headers-checks.patch} (100%)
 rename package/vtun/{vtun-003-fixup-configure.in.patch => 0003-fixup-configure.in.patch} (100%)
 rename package/webkit/{webkit-0001-build-fix-for-32-bit-autotools.patch => 0001-build-fix-for-32-bit-autotools.patch} (100%)
 rename package/webkit/{webkit-0002-build-fix-for-gtklauncher.patch => 0002-build-fix-for-gtklauncher.patch} (100%)
 rename package/webkit/{webkit-0003-detect-harfbuzz-icu.patch => 0003-detect-harfbuzz-icu.patch} (100%)
 rename package/webkit/{webkit-0004-disable-docrebase.patch => 0004-disable-docrebase.patch} (100%)
 rename package/webkit/{webkit-0005-disable-tests.patch => 0005-disable-tests.patch} (100%)
 rename package/webkit/{webkit-0006-execinfo_h.patch => 0006-execinfo_h.patch} (100%)
 rename package/webkit/{webkit-0007-mips-dfg.patch => 0007-mips-dfg.patch} (100%)
 rename package/webkit/{webkit-0008-support-bison-3.0.patch => 0008-support-bison-3.0.patch} (100%)
 rename package/wget/{wget-0001-spawn-fix-link-error-on-uclibc.patch => 0001-spawn-fix-link-error-on-uclibc.patch} (100%)
 rename package/wipe/{wipe-dont-force-lfs.patch => 0001-dont-force-lfs.patch} (100%)
 rename package/wireless_tools/{wireless_tools-01-remove-bzero.patch => 0001-remove-bzero.patch} (100%)
 rename package/wireshark/{wireshark-0001-fix-wrong-cflags-for-build-assumption.patch => 0001-fix-wrong-cflags-for-build-assumption.patch} (100%)
 rename package/wvdial/{wvdial-0001-uClibc-scandir.patch => 0001-uClibc-scandir.patch} (100%)
 rename package/wvstreams/{wvstreams-0001-fix-uClibc-compile-getcontext.patch => 0001-fix-uClibc-compile-getcontext.patch} (100%)
 rename package/wvstreams/{wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch => 0002-fix-uClibc-compile-execinfo-backtrace.patch} (100%)
 rename package/wvstreams/{wvstreams-0003-fix-uClibc-compile-misc.patch => 0003-fix-uClibc-compile-misc.patch} (100%)
 rename package/wvstreams/{wvstreams-0004-build-fixes.patch => 0004-build-fixes.patch} (100%)
 rename package/wvstreams/{wvstreams-0005-getuid.patch => 0005-getuid.patch} (100%)
 rename package/x11r7/xapp_luit/{xapp_luit-posix-openpt.patch => 0001-posix-openpt.patch} (100%)
 rename package/x11r7/xcursor-transparent-theme/{xcursor-transparent-theme-0001-fix-symlink.patch => 0001-fix-symlink.patch} (100%)
 rename package/x11r7/xdriver_xf86-input-tslib/{xdriver_xf86-input-tslib-0001-fix-segfault.patch => 0001-fix-segfault.patch} (100%)
 rename package/x11r7/xdriver_xf86-input-tslib/{xdriver_xf86-input-tslib-0002-port-abi-12.patch => 0002-port-abi-12.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ark/{xdriver_xf86-video-ark-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0001-noxaa.patch => 0001-noxaa.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-ati/{xdriver_xf86-video-ati-0003-DamageUnregister.patch => 0003-DamageUnregister.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-geode/{xdriver_xf86-video-geode-0001-include.patch => 0001-include.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-glint/{xdriver_xf86-video-glint-0001-mbstring.patch => 0001-mbstring.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-i128/{xdriver_xf86-video-i128-0001-mbstring.patch => 0001-mbstring.patch} (100%)
 rename package/x11r7/{xdriver_xf86-video-r128/xdriver_xf86-video-r128-cross-compile.patch => xdriver_xf86-video-mach64/0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-mga/{xdriver_xf86-video-mga-1.4.9.patch => 0001-misc-fixes.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-nv/{xdriver_xf86-video-nv-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/{xdriver_xf86-video-mach64/xdriver_xf86-video-mach64-cross-compile.patch => xdriver_xf86-video-r128/0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-savage/{xdriver_xf86-video-savage-2.2.1-cross-compile.patch => 0001-cross-compile.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-siliconmotion/{xdriver_xf86-video-siliconmotion-0001-smi_driver.patch => 0001-smi_driver.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch => 0003-xf86UnMapVidMem.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0004-xf86Priv.patch => 0004-xf86Priv.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0005-hvdisplay.patch => 0005-hvdisplay.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0006-fixwarnings.patch => 0006-fixwarnings.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0007-xi.patch => 0007-xi.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tdfx/{xdriver_xf86-video-tdfx-0001-cross.patch => 0001-cross.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tdfx/{xdriver_xf86-video-tdfx-0002-mibstore.patch => 0002-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-tga/{xdriver_xf86-video-tga-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-trident/{xdriver_xf86-video-trident-0001-mibstore.patch => 0001-mibstore.patch} (100%)
 rename package/x11r7/xdriver_xf86-video-trident/{xdriver_xf86-video-trident-0002-xaa.patch => 0002-xaa.patch} (100%)
 rename package/x11r7/xlib_libXpm/{xlib_libXpm-01-fork-check.patch => 0001-fork-check.patch} (100%)
 rename package/x11r7/xlib_libXt/{xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch => 0001-util-don-t-link-makestrs-with-target-cflags.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch => 0001-os-log-adjust-gcc-version-conditions-for-pragma.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0002-glyphpadbytes.patch => 0002-glyphpadbytes.patch} (100%)
 rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-0003-microblaze.patch => 0003-microblaze.patch} (100%)
 rename package/x11vnc/{x11vnc-ipv6.patch => 0001-ipv6.patch} (100%)
 rename package/xbmc/{xbmc-0001-Fixup-include-path.patch => 0001-Fixup-include-path.patch} (100%)
 rename package/xbmc/{xbmc-0002-mathutil.patch => 0002-mathutil.patch} (100%)
 rename package/xbmc/{xbmc-0003-dbus.patch => 0003-dbus.patch} (100%)
 rename package/xinetd/{xinetd-001-ar.patch => 0001-ar.patch} (100%)
 rename package/xinetd/{xinetd-002-destdir.patch => 0002-destdir.patch} (100%)
 rename package/xinetd/{xinetd-003-rpc-fix.patch => 0003-rpc-fix.patch} (100%)
 rename package/xinetd/{xinetd-004-configure-rlim_t.patch => 0004-configure-rlim_t.patch} (100%)
 rename package/xl2tp/{xl2tp-legacy.patch => 0001-legacy.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0001-fix-cross-compile-ansi-c-bailout.patch => 0001-fix-cross-compile-ansi-c-bailout.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0002-fix-minixpm-build-problem.patch => 0002-fix-minixpm-build-problem.patch} (100%)
 rename package/xscreensaver/{xscreensaver-0003-driver-fix-linking-with-lintl.patch => 0003-driver-fix-linking-with-lintl.patch} (100%)
 rename package/xvkbd/{xvkbd-makefile.patch => 0001-makefile.patch} (100%)
 rename package/yajl/{yajl-0001-math-link.patch => 0001-math-link.patch} (100%)
 rename package/yajl/{yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch => 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch} (100%)
 rename package/ympd/{ympd-0001-CMake-cross-compile-mkdata.patch => 0001-CMake-cross-compile-mkdata.patch} (100%)
 rename package/ympd/{ympd-0002-only-c-language.patch => 0002-only-c-language.patch} (100%)
 rename package/zeromq/{zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch => 0001-tests-disable-test_fork-if-fork-is-not-available.patch} (100%)
 rename package/zic/{zic-fix-dependencies.patch => 0001-fix-dependencies.patch} (100%)
 rename package/zlog/{zlog-01-fix-compiling-on-Buildroot.patch => 0001-fix-compiling-on-Buildroot.patch} (100%)
 rename package/zlog/{zlog-02-compile-Remove-Werror-and-avoid-build-failures-becau.patch => 0002-compile-Remove-Werror-and-avoid-build-failures-becau.patch} (100%)
 rename package/znc/{znc-01-time.patch => 0001-time.patch} (100%)
 rename package/zxing/{zxing-makefile.patch => 0001-makefile.patch} (100%)
 create mode 100755 support/scripts/rename-patch.py

--
2.1.2
