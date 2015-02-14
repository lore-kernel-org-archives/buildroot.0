From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 14 Feb 2015 14:47:23 +0100
Subject: [Buildroot] [PATCH] Linux kernel: add support for config
 fragment files
In-Reply-To: <20150214100145.10d1d32b@free-electrons.com>
References: <1423576221-24249-1-git-send-email-bos@je-eigen-domein.nl>
 <20150214100145.10d1d32b@free-electrons.com>
Message-ID: <54DF51EB.40603@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 02/14/2015 10:01 AM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> On Tue, 10 Feb 2015 14:50:21 +0100, Floris Bos wrote:
>
>> +config BR2_LINUX_KERNEL_CONFIG_FRAGMENTS
>> +	string "Additional configuration fragment files"
>> +	help
>> +	  A space-seperated list of kernel configuration fragment files,
>> +	  that will be merged to the main kernel configuration file.
> Instead of introducing a new option for this, can't we make the
> existing option that provides the kernel configuration file path a
> space-separated option that allows you to pass multiple kernel config
> file fragments?
>
> Or maybe you want to support the combination of a kernel defconfig +
> some fragments?

As mentioned in the commit message my use-case indeed involves combining 
a kernel defconfig with a fragment.
To be more precise: I simply want to stay in sync with the Raspberry Pi 
defconfig -which changes a lot-, with a few tiny modifications of my own.

-- 
Yours sincerely,

Floris Bos
