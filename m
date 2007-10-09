From: Elizabeth Oldham <beth@the-hug.org>
Date: Tue, 09 Oct 2007 21:56:40 +0100
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470BD9AB.2020909@the-hug.org>
References: <470ADDA8.3080105@ruby.dti.ne.jp>
	<20071009070816.GP20951@aon.at>	<470B5043.5010606@ruby.dti.ne.jp>
	<20071009122700.GB15786@aon.at>	<470B88CC.9040705@ruby.dti.ne.jp>	<470BD383.4060504@the-hug.org>
	<20071009193325.GR20951@aon.at> <470BD9AB.2020909@the-hug.org>
Message-ID: <470BEB08.3060209@the-hug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Elizabeth Oldham wrote:
> Bernhard Fischer wrote:
>>>             o32    n32    n64
>>>MIPS I         o
>>>MIPS II        o
>>>MIPS III       o      o       o
>>>MIPS IV        o      o       o
>>>MIPS32(r1)     o
>>>MIPS32R2       o
>>>MIPS64(r1)     o      o       o
>>>MIPS64R2       o      o       o
>>>(blank is not supported)
> I'm not familar with eabi, I've not heard of it with reference to MIPS. 
> I'd have to ask my more learned colleagues :)

gcc supports it, but AFAIK it isn't used on MIPS/Linux, so I assume 
buildroot/uclibc wont be interested in it?

> Once you have a supported ISA/ABI you can choose your endian with impunity.

Or vice-versa.

I've hacked target/Config.in.arch to what I _think_ it should perhaps 
look like, and attached it.

Beth


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in.arch.patch
Url: http://busybox.net/lists/buildroot/attachments/20071009/423c9a47/attachment.diff 
