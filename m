From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 9 Feb 2020 14:33:03 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qemu: Bump to version 4.2.0
In-Reply-To: <91337da1-a611-ebbe-d344-f99388e46bc1@gmail.com>
References: <20200208211512.994361-1-aduskett@gmail.com>
 <91337da1-a611-ebbe-d344-f99388e46bc1@gmail.com>
Message-ID: <1e980ad7-7660-01de-a8cd-4aa2e37c5a39@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam, All,

Le 09/02/2020 ? 11:35, Romain Naour a ?crit?:
> Hi Adam,
> 
> Le 08/02/2020 ? 22:15, aduskett at gmail.com a ?crit?:
>> From: Adam Duskett <Aduskett@gmail.com>
>>
>> Other changes:
>>   - Remove upstream patches
>>   - Update COPYING.LIB hash as upstream updated the file to match the new LGPL
>>     2.1 license from upstream. See:
>>     https://github.com/qemu/qemu/commit/f0d44cc4462f112bce5ec556e87eff4eec682e39
>>
>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>> ---
>> Changes v1 -> v2:
>>   - Remove the uneeded pactches in the qemu/3.1.1.1 directory (Baruch)
>>   - Move the upstream patches to qemu/4.2.0
>>
> 
> Thanks for this update.
> 
> I'm testing your patch with my series about Qemu runtime testing in gitlab.
> 
> Last time I tested using Qemu 3.1.1.1 and most of qemu defconfig were ok:
> https://gitlab.com/kubu93/buildroot/pipelines/116212917
> 
> Here is a new test using Qemu 4.2:
> https://gitlab.com/kubu93/buildroot/pipelines/116270515
> 
> We will see if there is any regression :)

All tests passed except qemu_arm_vexpress-tz that was already broken due to a
python crypto issue (ImportError: No module named 'Crypto').

Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Best regards,
> Romain
> 
