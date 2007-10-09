From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Oct 2007 23:31:56 +0200
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470BEB08.3060209@the-hug.org>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
	<470B88CC.9040705@ruby.dti.ne.jp>
	<470BD383.4060504@the-hug.org> <20071009193325.GR20951@aon.at>
	<470BD9AB.2020909@the-hug.org> <470BEB08.3060209@the-hug.org>
Message-ID: <20071009213155.GU20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 09:56:40PM +0100, Elizabeth Oldham wrote:
> Elizabeth Oldham wrote:

> gcc supports it, but AFAIK it isn't used on MIPS/Linux, so I assume 
> buildroot/uclibc wont be interested in it?

It shouldn't hurt to support it IMHO.

> I've hacked target/Config.in.arch to what I _think_ it should perhaps look 
> like, and attached it.

Look quite similar to what i currently have, yes.

Thanks for your help and kind regards,
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2.mips-ABIselection.00.diff
Type: text/x-diff
Size: 2210 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071009/1674700b/attachment.bin 
