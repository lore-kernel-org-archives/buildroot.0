From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 28 Sep 2010 15:32:38 +0200
Subject: [Buildroot] [PATCH] add lzop dependency
In-Reply-To: <87aan211an.fsf@macbook.be.48ers.dk>
References: <4CA0542C.4080400@visionsystems.de>
	<87aan211an.fsf@macbook.be.48ers.dk>
Message-ID: <4CA1EE76.9090605@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>  Yegor> lzop will be required to compress Linux kernel via lzo compression method.
>  Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Lzop isn't that common and it's only needed for a fairly specific setup,
> wouldn't it make more sense to build it if needed using the host
> infrastructure we have instead?

Yes, it makes sense. I'll rewrite the patch. What do you think about letting user to specify kernel compression:
Kernel->Compression method->gzip
                                                    ->lzma
                                                    ->lzo

Then I could combine these two issues.

Regards,
Yegor
