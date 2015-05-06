From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:23:18 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: enable context functions
In-Reply-To: <20150506175030.GA2853@waldemar-brodkorb.de>
References: <20150506175030.GA2853@waldemar-brodkorb.de>
Message-ID: <20150506212318.6025af52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 6 May 2015 19:50:30 +0200, Waldemar Brodkorb wrote:
> For mongrel2/libsigsegv we need to enable this in the uClibc-ng config.
> Tested with ARM:
> 
> file output/target/usr/bin/mongrel2
> output/target/usr/bin/mongrel2: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped
> 
> Should fix:
> http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
> http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
> http://autobuild.buildroot.net/results/5ee7e83ebcfa43f6ee0a2a8b9f40f1ae84664aca/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/uClibc-ng.config |    1 +
>  1 file changed, 1 insertion(+)

We don't have this option enabled in uClibc-0.9.33.config. Should I
assume that it's because this option doesn't exist in the 0.9.33.x
uClibc branch?

Also, why don't we have this option enabled in uClibc-snapshot.config?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
