From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 May 2012 22:16:34 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: bump version to
	1.15.2, update config files
In-Reply-To: <201205091816.45043.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 9 May 2012 18:16:44 +0200")
References: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
 <87y5p1ww2h.fsf@macbook.be.48ers.dk>
 <201205091816.45043.yann.morin.1998@free.fr>
Message-ID: <87ipg5kt3x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Committed, thanks. I had to fixup our ctng handling for changes in the
 >> copy_toolchain_lib_root_api by Thomas, but that's unrelated to this
 >> version bump.

 Yann> Was that related to the new sysroot-layout handling to cope with the
 Yann> Linaro toolchains?

That was one of the changes, yes. The other change was from back in
December (!)

 >> I've also adjusted the default uClibc version/mode to match what we're
 >> using for the internal toolchain (0.9.33.1 / NPTL).

 Yann> I pushed the new crosstool-NG version out so you could cut -rc1,
 Yann> and then I was about to upgrade the default versions set in the
 Yann> .configs.

 Yann> You beat me to it! ;-)

;)

-- 
Bye, Peter Korsgaard
