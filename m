From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 31 Oct 2008 12:02:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
In-Reply-To: <d6cda7730810310354g280c9ffbyd720dba75f965138@mail.gmail.com>
References: <20081031040328.19ABB3C784@busybox.net>
	<20081031103023.GH26468@mx.loc>
	<d6cda7730810310354g280c9ffbyd720dba75f965138@mail.gmail.com>
Message-ID: <20081031110225.GA27517@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2008 at 08:54:59AM -0200, Thiago A. Corr?a wrote:

>>>Fix bug #0005884 - pciutils depends on zlib
>>
>> This is not correct.
>
>Patches welcome.

http://repo.or.cz/w/buildroot.git?a=tree;f=package/pciutils;hb=HEAD

>Either way, building without zlib, althougth possible, cripples
>pciutils in not being able to use compressed PCI ID databases.

yes, and that's perfectly fine.
