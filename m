From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 23:43:42 +0200
Subject: [Buildroot] [PATCH] musl: enable mips64 support
In-Reply-To: <20160822191953.GA12397@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 22 Aug 2016 21:19:54 +0200")
References: <20160822191953.GA12397@waldemar-brodkorb.de>
Message-ID: <8737lwo4xd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Add support for mips64, which is available since musl 1.1.15.
 > Only gcc 6.x has required support for it. Tested variations of
 > little/big endian and hard/soft float.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > you need the mips musl regression patch from master to bootup and
 > test. Patch is suggested for -next.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
