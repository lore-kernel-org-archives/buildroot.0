From: Christian Stewart <christian@paral.in>
Date: Mon, 15 Jun 2020 12:08:53 -0700
Subject: [Buildroot] [PATCH v1] package/rtl8821au: add two patches
 fixing compile/runtime for kernels >= 5.3
In-Reply-To: <20200615185911.16490-1-ps.report@gmx.net>
References: <20200615185911.16490-1-ps.report@gmx.net>
Message-ID: <87sgew5epm.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Seiderer <ps.report@gmx.net> writes:

> Add two patches from upstream merge request ([1] to fix compile
> and runtime failures in case of linux kernel >= 5.3.
>
> [1] https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/316
> +From: Jesper Skov <jb1811@jyskebank.dk>
> +Subject: [PATCH] Fix implicit fallthrough comments for kernel 5.3
> +From: Jesper Skov <jb1811@jyskebank.dk>
> +Subject: [PATCH] Fix kernel 5.3 driver crashes, from aircrack-ng/rtl8812au#421

Thanks very much for submitting. While I can't vouch for the content of
the patches (yet), I'll dig up some old rtl8821au USB cards and try this
out.

Thanks,
Christian
