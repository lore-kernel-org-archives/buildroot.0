From: Clark Rawlins <clark.rawlins@escient.com>
Date: Fri, 28 Sep 2007 16:49:06 -0400
Subject: [Buildroot] Kernel Download Error with external toolchain
In-Reply-To: <20070928191632.GT20951@aon.at>
References: <1190985506.17683.6.camel@venture.bit63.org>
	<20070928180849.GQ20951@aon.at>
	<1191006117.5322.225.camel@elrond.atmel.sweden>
	<20070928191632.GT20951@aon.at>
Message-ID: <1191012546.6616.15.camel@venture.bit63.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-09-28 at 21:16 +0200, Bernhard Fischer wrote:
> On Fri, Sep 28, 2007 at 09:01:57PM +0200, Ulf Samuelsson wrote:
> >fre 2007-09-28 klockan 20:08 +0200 skrev Bernhard Fischer:
> >> On Fri, Sep 28, 2007 at 09:18:26AM -0400, Clark Rawlins wrote:
> >> >When attempting to build a fairly simple config including a kernel using
> >> >an external toolchain I am getting the following error:
> >> >
> >> >http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2
> 
> >Give time to do development, without beeing to intrusive.
> >
> >Been tied down with other stuff so It has not gotten
> >the attention it deserved.
> 
> np. It wouldn't have really helped either way without a little love..
> Compiling a kernel with his external toolchain and setting the
> INST_MOD_PATH properly shouldn't be that hard.

True, It is easy enough, I just hopped (based on the configuration
options) that this was supported.

Here is the patch I am using to accomplish this.  It seems like it may
be a bit of a hack, but I couldn't see a better way to do it without
really diving in, so I am open to suggestions.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: external-kernel.patch
Type: text/x-patch
Size: 1387 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070928/676fe752/attachment.bin 
