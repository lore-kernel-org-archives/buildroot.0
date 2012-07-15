From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 14:41:58 +0200
Subject: [Buildroot] [PATCH 1/4] Rework support for the device tree
In-Reply-To: <5002B8D2.6050401@mind.be>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
 <1341309676-18681-2-git-send-email-maxime.ripard@free-electrons.com>
 <5002B8D2.6050401@mind.be>
Message-ID: <5002BA96.8070806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 14:34, Arnout Vandecappelle wrote:
>> +config BR2_LINUX_KERNEL_DTS_SUPPORT
>> +    bool "Device tree support"
>> +    help
>> +      Compile a device tree source into a device tree blob.
>> +      Select the dts file to compile in the options below.
>> +
>> +if BR2_LINUX_KERNEL_DTS_SUPPORT
>
>   Maybe it's better to remove this option, and instead just
> detect if BR2_LINUX_KERNEL_DTS_FILE is defined.  Or would
> that make things more confusing?

  Forget it, it would make the later patches unnecessarily complex.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
