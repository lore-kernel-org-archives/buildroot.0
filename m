From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 17:39:39 +0100
Subject: [Buildroot] cortex-m3 support ?
In-Reply-To: <ec1f3d401001272243l12a18ad9iee47ff04f7c366ea@mail.gmail.com> (RK
	Raggit's message of "Thu, 28 Jan 2010 12:13:14 +0530")
References: <ec1f3d401001272243l12a18ad9iee47ff04f7c366ea@mail.gmail.com>
Message-ID: <87wrz2mbec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "RK" == RK Raggit <rk.raggit@gmail.com> writes:

 RK> Hi,
 RK> ?
 RK> i just downloaded the buildroot-2009.11 package. I could not find support
 RK> for the ARM cortex-m3 target architecture in this package. I can see
 RK> cortex-a8 in the menu though. I am more interested in generating a
 RK> uclinux-uclibc toolchain for cortex-m3.
 RK> ?
 RK> Any patches available ? Any pointers ?

Isn't cortex-m3 for deeply embedded stuff? There's afaik no Linux or
uClibc support, so that's pretty much a showstopper.

-- 
Bye, Peter Korsgaard
