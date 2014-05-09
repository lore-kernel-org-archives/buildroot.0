From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 May 2014 08:48:52 +0200
Subject: [Buildroot] [PATCH v2] protobuf: fix build for some unsupported
 architectures
In-Reply-To: <20140508192008.GN3861@tarshish>
References: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
 <20140508205627.3b6c61d3@free-electrons.com>
 <20140508192008.GN3861@tarshish>
Message-ID: <20140509084852.7c07107b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 8 May 2014 22:20:08 +0300, Baruch Siach wrote:

> > Unless there's a good reason to not support it, maybe we could keep
> > BR2_armeb here in the list of supported architectures?
> 
> I don't see __ARMEB__(?) in the list of protobuf supported architectures at 
> src/google/protobuf/stubs/platform_macros.h, only __ARMEL__.

Ok, thanks for checking!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
