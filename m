From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:02:35 +0200
Subject: [Buildroot] [PATCH v3 1/3] gcc: add hidden symbol for defaults
In-Reply-To: <20160603040302.GA31489@waldemar-brodkorb.de>
References: <20160603040302.GA31489@waldemar-brodkorb.de>
Message-ID: <20160704110235.09ea0660@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 06:03:02 +0200, Waldemar Brodkorb wrote:
> Some architectures, f.e. Blackfin doesn't support to
> configure GCC with --with-cpu to set some CPU specific
> default CFLAGS (-mcpu=foo). Use a hidden config symbol
> to give a hint which architecture supports it, otherwise
> add defaults to toolchain wrapper for internal toolchains.
> 
> Idea from Thomas Petazzoni.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v3:
>   - new patch
> ---
>  arch/Config.in     | 29 +++++++++++++++++++++++++++++
>  package/gcc/gcc.mk | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)

I've applied, after doing the changes suggested by Yann, plus a few
more cleanups. See
https://git.buildroot.org/buildroot/commit/?id=c101f1b1b8fe0b6cf6feb5916d045bc9713e76bd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
