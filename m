From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:48:38 +0200
Subject: [Buildroot] [PATCH v5 0/8] Linux kernel specific infrastructure
In-Reply-To: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
References: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150714234838.50f9640c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 14 Jul 2015 19:35:07 +0200, Romain Naour wrote:

> Romain Naour (4):
>   linux: add linux-tools infra
>   linux-tools: add cpupower
>   package/perf: migrate perf to use the new linux-tools infrastructure
>   docs/manual: add documentation for linux-ext and linux-tools.
> 
> Steven Noonan (4):
>   package/perf: if slang is enabled, depend on it
>   package/perf: if numactl (libnuma) is enabled, depend on it
>   package/perf: if libunwind is enabled, depend on it
>   package/perf: use correct definition of ARCH on x86_64

I've applied all the patches. I've done some minor changes on some
of them, except to the documentation where I did some more substantial
changes. Each commit has some details about the changes I made.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
