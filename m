From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Sun, 7 Feb 2016 10:41:27 -0300
Subject: [Buildroot] [PATCH] linux: add conditional patch for
	timeconst.pl
In-Reply-To: <20160206215033.GA8084@tarshish>
References: <1454700784-32341-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160206215033.GA8084@tarshish>
Message-ID: <56B74987.3010401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/16 18:50, Baruch Siach wrote:

> Hi Gustavo,
>
> On Fri, Feb 05, 2016 at 04:33:04PM -0300, gustavo.zacarias at free-electrons.com wrote:
>> @@ -251,8 +261,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
>>   	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>>   		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>> -	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
>> -		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
>
> Is this change intended?

Hi Baruch.
Argh, not, i'll send v2 rebased on latest master, thanks.
Regards.
