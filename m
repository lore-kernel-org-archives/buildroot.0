From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 23:22:15 +0200
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
 configuredownload site
In-Reply-To: <000001cb054a$04f5af80$0ee10e80$@pauljones.id.au>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
	<002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
	<20100604103232.3f415c39@surf> <20100605154934.6ebd9068@surf>
	<000001cb054a$04f5af80$0ee10e80$@pauljones.id.au>
Message-ID: <20100607232215.3d36732e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 6 Jun 2010 17:29:35 +1000
"Paul Jones" <paul@pauljones.id.au> wrote:

> There seems to be a bug in your bootloaders-cleanup branch somewhere.
> If I do a make distclean and then configure the kernel to be built
> into a uImage I get the following error:
> (have attached .config)

Fixed by
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=bootloaders-cleanup&id=cc8813eaab198ee4d142a38d1e5eebc8e41561b3
which is a new commit in my bootloaders-cleanup branch.

Thanks for your test report!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
