From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Sep 2011 14:59:18 +0200
Subject: [Buildroot] The results of your email commands
In-Reply-To: <486791316091218@web155.yandex.ru> (=?utf-8?B?ItCQ0LvQtdC6?=
 =?utf-8?B?0YHQsNC90LTRgCIncw==?= message of
 "Thu, 15 Sep 2011 16:53:38 +0400")
References: <mailman.21.1316090890.6551.buildroot@busybox.net>
 <486791316091218@web155.yandex.ru>
Message-ID: <8739fyt109.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?????????" == ?????????  <sitesv@yandex.ru> writes:

 ?????????> Good day!
 ?????????> I cant start make core for buildroot distro.
 ?????????> I was download tar.bz2 archive, unpack his, and take command "make menuconfig"...
 ?????????> After that, i save new config file and print "make":
 
 ?????????> $ make

 ?????????> # make dependencies written to .auto.deps
 ?????????> # ATTENTION buildroot devels!
 ?????????> # See top of this file before playing with this auto-preprequisites!
 ?????????> #
 ?????????> make[1]: Leaving directory `/home/sitesv/soft/buildroot_distr/buildroot-2011.08'
 >>>> host-gmp 5.0.1 Downloading
 ?????????> /gmp/gmp-5.0.1.tar.bz2: Unsupported scheme.
 ?????????> make: *** [/home/sitesv/soft/buildroot_distr/buildroot-2011.08/output/build/host-gmp-5.0.1/.stamp_downloaded] Error 1
 
 ?????????> What i do wrong?

It seems like you have set BR2_GNU_MIRROR (Build options->Mirrors and
Download locations->GNU Software mirror) to the empty string.

-- 
Bye, Peter Korsgaard
