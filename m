From: ren_guo <ren_guo@c-sky.com>
Date: Wed, 22 Feb 2017 10:11:09 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup
	check_gcc_version.
In-Reply-To: <1cd3c769-5372-28d6-a2f4-b120cb1e3864@mind.be>
References: <1487667876-27245-1-git-send-email-ren_guo@c-sky.com>
 <20170221102615.526d9bce@free-electrons.com>
 <1cd3c769-5372-28d6-a2f4-b120cb1e3864@mind.be>
Message-ID: <6bb82def-c23f-272a-b145-4eaffbdc1ced@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>   Sounds good to me. I ran that on my 300 toolchains and it seems to work. One
> thing however: some of them generate a few empty lines at the beginning, so the
> sed expression should also have /^$/d.
>
>   Regards,
>   Arnout
>
Good Test! Do you need I patch mail ? Or just fixup by yourself?

Best Regards

guoren
