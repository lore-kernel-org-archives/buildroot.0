From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 18 Jun 2007 17:13:33 +0200
Subject: [Buildroot] uClibc's index function
In-Reply-To: <20070618130452.GA7970@z1.synertronixx>
References: <20070618074508.GD1841@z1.synertronixx>
	<20070618085343.GA17187@aon.at>
	<20070618130452.GA7970@z1.synertronixx>
Message-ID: <20070618151333.GA860@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 18, 2007 at 03:04:52PM +0200, Konstantin Kletschke wrote:
>Am 2007-06-18 10:53 +0200 schrieb Bernhard Fischer:
>
>> See the help-text of UCLIBC_SUSV3_LEGACY
>
>Aaahh! Thanks for the Hint me stupid did not find it...
>
>> You should not use these anymore but use their modern, current
>> counterparts.
>
>What are these modern counterparts then (again I have no luck with
>google & Co today).

man bzero

see e.g.:
buildroot/toolchain/gcc/4.2.0/305-libmudflap-susv3-legacy.patch
