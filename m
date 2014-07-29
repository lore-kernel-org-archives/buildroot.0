From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 20:18:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] qemu/sparc-ss10: fix networking
 support
In-Reply-To: <20140729145806.GA25034@waldemar-brodkorb.de>
References: <20140729145806.GA25034@waldemar-brodkorb.de>
Message-ID: <20140729201809.3f9d1236@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 29 Jul 2014 16:58:07 +0200, Waldemar Brodkorb wrote:
> While updating the default config I recognized that
> networking is broken. The reason is a uClibc backport patch
> from master. Adding a fix on top of it.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied, but the title of your commit was wrong: a prefix
"qemu/sparc-ss10" for a uClibc change doesn't make any sense. So I
fixed that and slightly reworded the commit message as well.

See:

  http://git.buildroot.net/buildroot/commit/?id=edeee941c8e20fa5aad8edd5448553e89e7e858c

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
