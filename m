From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 21 Jan 2009 16:55:21 +0100
Subject: [Buildroot] DirectFB fetch problem (no tarball on the primary
 mirror)
In-Reply-To: <8763k8sncv.fsf@macbook.be.48ers.dk>
References: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com>
	<1232550294.6326.12.camel@sven>  <8763k8sncv.fsf@macbook.be.48ers.dk>
Message-ID: <1232553321.6326.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-01-21 at 16:14 +0100, Peter Korsgaard wrote:

>  Sven> But I agree that buildroot should update to version 1.2.7.
> 
> We can if someone is willing to test it - I don't have any readily
> available test setup for it. Otherwise I'll stick to the safe solution
> and use 1.2.6.

I have run some tests here with DirectFB 1.2.7 cross-compiled for ARM.
Everything I tested (mostly stuff from DirectFB-examples) works fine.
Attached is a patch to the directfb.mk file that updates it to 1.2.7 and
converts it to Makefile.autotools.in.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: directfb.diff
Type: text/x-patch
Size: 5068 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090121/3d3417a6/attachment.bin 
