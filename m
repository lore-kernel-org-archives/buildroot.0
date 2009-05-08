From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 09:20:50 +0200
Subject: [Buildroot] license info for buildroot
In-Reply-To: <BLU143-W181C7B250C892039D3235DCA640@phx.gbl> (Live Coder's
	message of "Thu\, 7 May 2009 21\:33\:29 -0700")
References: <BLU143-W181C7B250C892039D3235DCA640@phx.gbl>
Message-ID: <87tz3wawml.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Live" == Live Coder <livecoder@live.com> writes:

 Live> uClibc contains a link to GPLv3 whereas the downloaded tarball contains GPLv2
 Live> license http://git.uclibc.org/uClibc/tree/COPYING.LIB

It's afaik v2, but check with the uclibc developers on the uclibc
list.
 
 Live> Similarly, the buildroot webpage contains a ref to GPLv3 but the
 Live> download itself does not contain any license info. Can someone confirm the
 Live> actual license is v2 or v3?

It is both (gplv2 or later) - See Makefile. (notice though that we do
include Kconfig from the Linux kernel which is afaik GPLv2 only).

I'll fix the link on the website.

-- 
Bye, Peter Korsgaard
