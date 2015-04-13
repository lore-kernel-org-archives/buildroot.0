From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Date: Mon, 13 Apr 2015 18:02:56 +0800
Subject: [Buildroot] [RFC PATCH v2 4/5] aarch64: ilp32: add ilp32 build
	config
In-Reply-To: <5527C634.3080708@zacarias.com.ar>
References: <1426672192-21041-1-git-send-email-bamvor.zhangjian@huawei.com>
 <1426672192-21041-5-git-send-email-bamvor.zhangjian@huawei.com>
 <5527C634.3080708@zacarias.com.ar>
Message-ID: <552B9450.7060506@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015/4/10 20:46, Gustavo Zacarias wrote:
> On 03/18/2015 06:49 AM, Zhang Jian(Bamvor) wrote:
> 
>> > +config BR2_GCC_TARGET_ABI
>> > +	default "" if BR2_AARCH64_LP64
>> > +	default "ilp32" if BR2_AARCH64_ILP32
> Even though it's unused we like giving things a name, so it would be
> "lp64" for the pure 64-bit ABI.
> Also like i said before having a toolchain to test all this would be nice.
> Regards.
> 
I think I need to leave it as empty(""), because I want to follow your
suggection in March[1].
Please correct, if I misunderstand you.

regards

bamvor

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/122332.html
