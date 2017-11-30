From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 08:57:53 +0100
Subject: [Buildroot] [PATCH 3/3] musl: enable or1k architecture
In-Reply-To: <20171130060027.GA25417@waldemar-brodkorb.de>
References: <20171130060027.GA25417@waldemar-brodkorb.de>
Message-ID: <20171130085753.3391e458@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 07:00:28 +0100, Waldemar Brodkorb wrote:
> With Linux kernel >= 4.13.x musl or1k can be used
> with Qemu.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Could you clarify why it was not possible to use musl on or1k with
kernels < 4.13 ?

Was it just a limitation of the or1k support causing runtime issues ? A
build problem ?

I.e, I'm wondering if we should just enable or1k like you did, or if we
should make it conditional on the kernel headers being >= 4.13.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
