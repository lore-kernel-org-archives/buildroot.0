From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:33:20 +0100
Subject: [Buildroot] [PATCH v2] rt-tests: allow building subset of tests
 with non-NPTL toolchains
In-Reply-To: <1415714208-825-1-git-send-email-abrodkin@synopsys.com>
References: <1415714208-825-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141111153320.2c970a7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 11 Nov 2014 16:56:48 +0300, Alexey Brodkin wrote:

> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
> +RT_TESTS_HAVE_NPTL=no
> +endif

I've changed this to use positive logic and committed your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
