From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 13 Oct 2009 13:10:09 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD3B2BE.2010809@wp.pl>
References: <4AD389B2.20400@wp.pl> <87my3w4bw6.fsf@macbook.be.48ers.dk>
	<4AD3918B.5000908@wp.pl> <20091012203645.GX2266@mx.loc>
	<4AD3B2BE.2010809@wp.pl>
Message-ID: <20091013111009.GB23718@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 13, 2009 at 12:50:38AM +0200, W.P. wrote:

>There is a system (Manta "Multimedia Recorder" HDD-2000 = Shenzen Mele
>HMC-35HD) that was build using (i am almost sure after several hours of
>googling) using those versions of tools. And binutils: 2.16 or even
>2.15. I want to be able to build some kernel modules, so (correct me if
>I am wrong) I need EXACT versions of tools/configure options to do so.

for kernel modules it's a 80%-90% yes.
>
>BTW It looks crazy, those Chinese/Taiwanese developpers (Mele, Edimax,
>maybe others) seems to be TIED to gcc 3.4.4(3).....

It is. It's a pity that this way eventual (size)regressions don't get
fixed. I'f nevertheless try to build the module with 3.4.6 and see if
that works.

>(look at published Edimax toolchains for BR-6204Wg, BR-6104KP...)
>
>BTW2: looks Manta(Poland) violates GPL.... : there is NO mention about
>sources on their web.

I think there is a paragraph on the busybox page:
http://busybox.net/license.html#enforce
