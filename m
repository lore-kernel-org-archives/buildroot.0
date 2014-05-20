From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 16:38:19 +0200
Subject: [Buildroot] [PATCH] oprofile: bump to version 0.9.9
In-Reply-To: <1400592658-14517-1-git-send-email-abrodkin@synopsys.com>
References: <1400592658-14517-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140520163819.0e16582d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 20 May 2014 17:30:58 +0400, Alexey Brodkin wrote:
> Relese notes for 0.9.9 release are avaialble here:
> http://oprofile.sourceforge.net/release-notes/oprofile-0.9.9
> 
> This release adds support for ARC architecture.
> 
> Also introduces new "ocount" program for collection of raw event counts.
> 
> With release of 0.9.9 we may drop back-ported patches:
> oprofile-002-no-query-modules.patch - liblegacy was removed since 2.4 kernels
> are no longer supported
> http://sourceforge.net/p/oprofile/oprofile/ci/fcb818623bf1a638ef4f93dca9e90f8651899bf3/
> 
> oprofile-003-oprofile-ppc32-build-fix.patch
> http://sourceforge.net/p/oprofile/oprofile/ci/fa889ea74b6b931e241a8cd57e90edc23cd7ab03/
> 
> oprofile-004-fix-ppc64-specific-libpfm-usage.patch
> http://sourceforge.net/p/oprofile/oprofile/ci/79a183ed0d9611955714bfa1d6edb361d6bf5c2c/
> 
> oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch
> http://sourceforge.net/p/oprofile/oprofile/ci/ca6d916a6f8f0f8abbb4c9b6a97dd1a1615bb124/
> 
> But in 0.9.9 was introduced build breakage which was fixed later so adding
> another back-ported patch
> oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
> http://sourceforge.net/p/oprofile/oprofile/ci/08241f1b2c5a4d48020c82b509dc1076f51bf0bd/

I just wanted to say I really appreciate the fact that you made the
effort of justifying to each patch why it gets removed/added as part of
the version bump. This is very useful, and give a lot more confidence
about the version bump patch.

Thanks a lot for doing this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
