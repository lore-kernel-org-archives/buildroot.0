From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Dec 2017 13:12:08 +0100
Subject: [Buildroot] [PATCH v1] libdrm: fix libatomic_ops linking
References: <20171216195516.27144-1-ps.report@gmx.net>
Message-ID: <oh3igexsnk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 16 Dec 2017 20:55:16 +0100 schrieb Peter Seiderer:

> Add explicit libatomic_ops linking, fixes etnavid tests linking
> 
> Fixes [1]:
> 
>     CCLD     etnaviv_cmd_stream_test
>   ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to
>   `AO_store_full_emulation' ../../etnaviv/.libs/libdrm_etnaviv.so:
>   undefined reference to `AO_fetch_compare_and_swap_emulation'
>   collect2: error: ld returned 1 exit status
> 
> [1]
> http://autobuild.buildroot.net/
results/92e074c49417261843eef95872ff935a56077c98

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(build-tested using the defconfig mentioned here)
