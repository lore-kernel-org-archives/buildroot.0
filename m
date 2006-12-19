From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 19 Dec 2006 17:49:11 +0100
Subject: [Buildroot] kernel compile problem
In-Reply-To: <Pine.LNX.4.64.0612191120350.31862@smtcorms05.samuelmanutech.com>
References: <Pine.LNX.4.64.0612151513000.9011@smtcorms05.samuelmanutech.com>
	<Pine.LNX.4.64.0612191120350.31862@smtcorms05.samuelmanutech.com>
Message-ID: <20061219164911.GA18730@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 19, 2006 at 11:22:01AM -0500, Robin Mordasiewicz wrote:
>On Fri, 15 Dec 2006, Robin Mordasiewicz wrote:
>
>> 2. I had to apply this kernel patch
>> http://www.kernel.org/pub/linux/devel/binutils/linux-2.6-seg-5.patch
>
>I see a kernel-patches directory. Is it possible to drop the kernel patch 
>into that directory and have the ystem automatically patch the kernel, or 
>is there another way of doing this automatically, or am I to manually 
>apply the patch ?

I don't see why you would need that patch unless you'd use old binutils
or an anciant kernel.

If you think you need this patch, put it into that kernel-patches dir
and recompile, it'll get applied automagically.
