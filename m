From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Tue, 10 Nov 2015 20:59:06 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
	for target, fix a typo
In-Reply-To: <20151110114211.365afbbc@free-electrons.com>
References: <201511100922.tAA9Ml77000486@ms-omx02.plus.so-net.ne.jp>
 <20151110104858.6c49b759@free-electrons.com>
 <E219834A-E8E4-4AF5-974C-45B03804F2A2@ca2.so-net.ne.jp>
 <20151110114211.365afbbc@free-electrons.com>
Message-ID: <66603563-D814-4E9C-8EBD-A88AE2D027FD@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

> 2015/11/10 19:42?Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ?????
> 
> Hiroshi,
> 
> On Tue, 10 Nov 2015 19:21:26 +0900, Hiroshi Kawashima wrote:
> 
>> Most problems seems to be architectures that boehm gc not ported.
> 
> Indeed. First thing would be to see if gauche can used an external
> boehm gc implementation rather than its own. Indeed, we already have a
> package for boehm gc in package/bdwgc/.
> 
> And this package is only built for architectures where libatomic_ops is
> available.

I didn?t note buildroot already have external boehm gc package.
Ok, I will try, thank you.

As last resort, I will limit architecture to be built as you indicated.

Regards,
Kawashima
