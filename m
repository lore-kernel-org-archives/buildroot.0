From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 14:38:53 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
 toolchain-wrapper
In-Reply-To: <20161016142837.62bc74ba@free-electrons.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
 <20161016120510.55c138f0@free-electrons.com>
 <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
 <20161016142837.62bc74ba@free-electrons.com>
Message-ID: <816e611d-747b-6e15-5aea-1d83f246c43e@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

have you recently seen the dmalloc package failing because of using the
wrong emulation in ld? Or because using ld instead of gcc for linking,
in general?

Indeed it uses ld instead of gcc, and that's something that could be
improved upstream. However, since it's not failing to build for us I
think there is nothing we need to fix in Buildroot.

Regards,

Vincent.

On 16/10/16 14:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 16 Oct 2016 13:36:19 +0200, Jan Heylen wrote:
>> So we should fix libdmalloc as well?
> 
> Vicente is working on this. Do you have references to autobuilder
> failures on libdmalloc caused by this problem ?
> 
> Thanks!
> 
> Thomas
> 
