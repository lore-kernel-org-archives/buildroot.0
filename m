From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 14:28:37 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
 toolchain-wrapper
In-Reply-To: <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
 <20161016120510.55c138f0@free-electrons.com>
 <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
Message-ID: <20161016142837.62bc74ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 13:36:19 +0200, Jan Heylen wrote:
> So we should fix libdmalloc as well?

Vicente is working on this. Do you have references to autobuilder
failures on libdmalloc caused by this problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
