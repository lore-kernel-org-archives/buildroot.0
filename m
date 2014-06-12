From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 20:46:52 +0200
Subject: [Buildroot] [PATCH] gcc 4.8.x does not compile a working kernel
 for sparc
In-Reply-To: <20140612165138.GA12634@waldemar-brodkorb.de>
References: <20140612165138.GA12634@waldemar-brodkorb.de>
Message-ID: <20140612204652.4aae736f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Thu, 12 Jun 2014 18:51:38 +0200, Waldemar Brodkorb wrote:
> Since the switch to 4.8.x as default, the qemu-sparc target is broken.
> For a gcc bug report see here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60624
> 
> Switch back to gcc 4.7.x as default for sparc.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/Config.in.host |    1 +
>  1 file changed, 1 insertion(+)

If gcc 4.8.x is indeed broken on sparc, shouldn't we completely prevent
the selection of 4.8.x on SPARC ?

Have you tested 4.9.x ?

Thanks for the report and patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
