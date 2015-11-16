From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:04:49 +0100
Subject: [Buildroot] [PATCH] package/gauche: force to use intenal
 libatomic_ops
In-Reply-To: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
References: <201511131006.tADA64m9008638@ms-omx01.plus.so-net.ne.jp>
Message-ID: <20151116230449.2d728b4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Fri, 13 Nov 2015 19:06:04 +0900, Hiroshi Kawashima wrote:
> Force to use internal libatomic_ops of gauche.
> 
> Fix:
> http://autobuild.buildroot.org/results/a97/a979f6a58f0fbb1896830461d6c384f4a65c9429//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Applied to master, after slightly tweaking the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
