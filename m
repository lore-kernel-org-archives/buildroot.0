From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 19:43:04 +0200
Subject: [Buildroot] [git commit] initramfs: fix boot with dynamic /dev
In-Reply-To: <201107201112.44209.minimod@morethan.org> (Michael S. Zick's
 message of "Wed, 20 Jul 2011 11:12:41 -0500")
References: <20110720150418.E95188B391@busybox.osuosl.org>
 <201107201112.44209.minimod@morethan.org>
Message-ID: <87pql426hj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:


 Michael> Will the various shell aps run a script without /dev/console
 Michael> and /dev/null?

 Michael> Once upon a time, some did not, but that may no longer be true.

The busybox ones do atleast (I've tested it). I haven't tried with
/bin/sh == bash though, but that's probably fairly unlikely for an
initramfs.

-- 
Bye, Peter Korsgaard
