From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Jun 2014 23:41:59 +0200
Subject: [Buildroot] [PATCH v2] oprofile: bump to version 0.9.9
In-Reply-To: <1400597676-7203-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Tue, 20 May 2014 18:54:36 +0400")
References: <1400597676-7203-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87fvjlr7q0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Relese notes for 0.9.9 release are avaialble here:
 > http://oprofile.sourceforge.net/release-notes/oprofile-0.9.9

 > This release adds support for ARC architecture.

 > Also introduces new "ocount" program for collection of raw event counts.

 > With release of 0.9.9 we may drop back-ported patches:
 > oprofile-002-no-query-modules.patch - liblegacy was removed since 2.4 kernels
 > are no longer supported
 > http://sourceforge.net/p/oprofile/oprofile/ci/fcb818623bf1a638ef4f93dca9e90f8651899bf3/

 > oprofile-003-oprofile-ppc32-build-fix.patch
 > http://sourceforge.net/p/oprofile/oprofile/ci/fa889ea74b6b931e241a8cd57e90edc23cd7ab03/

 > oprofile-004-fix-ppc64-specific-libpfm-usage.patch
 > http://sourceforge.net/p/oprofile/oprofile/ci/79a183ed0d9611955714bfa1d6edb361d6bf5c2c/

 > oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch
 > http://sourceforge.net/p/oprofile/oprofile/ci/ca6d916a6f8f0f8abbb4c9b6a97dd1a1615bb124/

 > But in 0.9.9 was introduced build breakage which was fixed later so adding
 > another back-ported patch
 > oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
 > http://sourceforge.net/p/oprofile/oprofile/ci/08241f1b2c5a4d48020c82b509dc1076f51bf0bd/

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Peter Korsgaard <jacmet@sunsite.dk>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Simon Dawson <spdawson@gmail.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > ---

 > In v2 only mispelling of OPR_O_FILE_BINARIES is fixed.

 > Just in case made sure "ocount" was copied to target folder in "/usr/bin/ocount"

Committed, thanks.

-- 
Bye, Peter Korsgaard
