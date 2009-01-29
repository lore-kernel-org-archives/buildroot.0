From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 16:27:10 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk><1233005366.2298.118.camel@elrond.atmel.com><871vup4ul9.fsf@macbook.be.48ers.dk><1233008389.2298.129.camel@elrond.atmel.com><87vds114op.fsf@macbook.be.48ers.dk><FE6DCE243B7A4724B6B33E85771AD61F@aeglos>
	<871vumtb1w.fsf@macbook.be.48ers.dk>
Message-ID: <A223C54B106543948AC36303E7C74F76@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
> We already have a situation where more than half the size of buildroot
> is patches, continuing to grow this is not a workable situation.
>
I agree with this, but the solution I want to see is that you
only keep the latest patches in the tree,
and as we introduce new kernel versions we
let older patches slip into the mirror server.

I just want them to build as long as possible.
I do not suggest that we spend time on testing od kernels.
Ideally each distribution focus on a single kernel.

> If people want to use an old kernel they can maintain it outside of
> buildroot or in their local buildroot tree.
>

I want to give people the capability to build old kernel
with a new root fs.

If they want to build old kernel with old rootfs,
then they have to handle that on their own.

> I do agree we should make it easier to build u-boot / linux from a
> non-mainline svn/git/whatever tree, that's something I will work on
> after the release.



> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57 
