From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 10:31:34 +0200
Subject: [Buildroot] [PATCH] uclibc: fix static linking of pthread apps
 for x86/x86_64
In-Reply-To: <20150722161325.GA7861@waldemar-brodkorb.de>
References: <20150722161325.GA7861@waldemar-brodkorb.de>
Message-ID: <20150728103134.64b30325@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 22 Jul 2015 18:13:26 +0200, Waldemar Brodkorb wrote:
> Fixes:
> http://autobuild.buildroot.net/results/182424bd2fea36af95eea31f7dd53f0399433616/
> http://autobuild.buildroot.net/results/6b1e2132a34e0c263bb0f2ea31caf4ce697e9c9c/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

FWIW, we have the same problem on SuperH:

  http://autobuild.buildroot.net/results/755/7559993edf68cc697832d65ab3bd925724861e5e/build-end.log

The toolchain was built with Buildroot at commit 85945aa.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
