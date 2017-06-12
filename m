From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:45:40 +0200
Subject: [Buildroot] [PATCH v2 02/13] package/libspatialindex: new
 package
In-Reply-To: <20170612205410.20230-2-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-2-romain.naour@gmail.com>
Message-ID: <20170612234540.7000c4a9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:53:59 +0200, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

> test-pkg reported an internal compiler error on microblaze (br-microblazeel-full)
> Index.cc: In member function 'void SpatialIndex::RTree::Index::adjustTree(SpatialIndex::RTree::Node*, std::stack<long long int>&)':
> Index.cc:327:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1027

Does this bug still exists with gcc 7.x? If so, can we report the bug
to upstream gcc? Or is it a bug that has already been reported, because
it happens with other packages as well?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
