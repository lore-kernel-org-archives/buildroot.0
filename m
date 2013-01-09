From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 09 Jan 2013 17:38:15 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <20130109172316.41493eed@skate>
References: <50EC1EBF.80807@yahoo.fr> <50EC7F16.3090008@mind.be>
 <50ED24FE.3070703@yahoo.fr> <20130109092722.7cb8409b@skate>
 <50ED2E18.8070502@yahoo.fr> <20130109095119.39ad1ee9@skate>
 <50ED3A00.3060907@yahoo.fr> <50ED9600.1000700@yahoo.fr>
 <20130109172316.41493eed@skate>
Message-ID: <50ED9CF7.2030706@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2013 05:23 PM, Thomas Petazzoni wrote:
> Dear Patrick,
>
> On Wed, 09 Jan 2013 17:08:32 +0100, Patrick wrote:
>
>> After changing the toolchain I have a really annoying side effect: my
>> kernel do not boot anymore !
>>
>> My previous toolchain was Sourcery G++ Lite 2009q1-203 GCC 4.3.3, my
>> new toolchain is Sourcery CodeBench ARM 2012.03. I run Linux 3.0 on a
>> Ti DM3730 processor.
>>
>> With both toolchain I do not change the kernel configuration. With
>> the old toolchain the kernel boot nicelly, with the new toolchain the
>> kernel do not boot after u-boot message "Starting kernel ...". I use
>> the same version of u-boot in both case with the same rootfs...
>>
>> Any idea why changing the toolchain could result in this issue ?
>
> Most likely a compiler bug. Maybe you're being hit by
> https://patchwork.kernel.org/patch/1438281/. Since you're using a Ti
> DM3730, can you instead use the Linaro toolchains, that are also
> pre-configured in Buildroot (just make sure you selected the Cortex-A8
> architecture variant in Buildroot) ?
>
> Thanks,
>
> Thomas
>

Same issue with Linaro 2012.10...
I have selected ARM little Endian and Cortex-A8

Patrick
