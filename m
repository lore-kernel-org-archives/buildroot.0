From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Apr 2011 07:25:44 +0200
Subject: [Buildroot] devmem2
In-Reply-To: <1303869098.2489.67.camel@kenm-i7> (Ken McGuire's message of
	"Tue, 26 Apr 2011 19:51:38 -0600")
References: <1303869098.2489.67.camel@kenm-i7>
Message-ID: <8739l41d0n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ken" == Ken McGuire <kenm@desertweyr.com> writes:
 
 Ken> Unfortunately since the referenced changes, busybox's devmem is more
 Ken> difficult to use, not impossible, just a pita because it is different
 Ken> form devmem2 which I use on non busybox/uClibc/buildroot based systems
 Ken> (the final software configuration). Now, I compile devmem2 outside of
 Ken> Bulildroot, it just takes a few seconds and I have a little script to do
 Ken> it when I change uclibc/libc versions or machine architectures.

But we still have devmem2 in buildroot, just enable BR2_DEPRECATED
(Build options -> Show packages that are deprecated or obsolete).

-- 
Bye, Peter Korsgaard
