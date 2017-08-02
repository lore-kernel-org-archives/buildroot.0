From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 2 Aug 2017 11:43:39 -0700
Subject: [Buildroot] [PATCH 2/4] binutils: add support for binutils 2.29
In-Reply-To: <20170729181554.GF28707@waldemar-brodkorb.de>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
 <20170729130906.2140-3-thomas.petazzoni@free-electrons.com>
 <20170729181554.GF28707@waldemar-brodkorb.de>
Message-ID: <CAMo8BfLC7UC03ehNo7rZvL7yA6YDnPzr8V8Oa_un7uKwY2eE_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Sat, Jul 29, 2017 at 11:15 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> I am testing some more qemu defconfigs with binutils 2.29.
> sh4/sparc worked fine. But xtensa fails to compile busybox:
>
> /home/wbx/buildroot/output/host/lib/gcc/xtensa-buildroot-linux-uclibc/6.4.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
> BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965

Thanks for the heads up. I've posted a fix.

-- 
Thanks.
-- Max
