From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Apr 2015 09:46:44 -0300
Subject: [Buildroot] [RFC PATCH v2 4/5] aarch64: ilp32: add ilp32 build
	config
In-Reply-To: <1426672192-21041-5-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426672192-21041-5-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <5527C634.3080708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2015 06:49 AM, Zhang Jian(Bamvor) wrote:

> +config BR2_GCC_TARGET_ABI
> +	default "" if BR2_AARCH64_LP64
> +	default "ilp32" if BR2_AARCH64_ILP32

Even though it's unused we like giving things a name, so it would be
"lp64" for the pure 64-bit ABI.
Also like i said before having a toolchain to test all this would be nice.
Regards.
