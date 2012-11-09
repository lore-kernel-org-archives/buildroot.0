From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 09 Nov 2012 15:13:27 +0200
Subject: [Buildroot] Need arm-buildroot config and arm-linux config
In-Reply-To: <509C2800.4080900@mind.be>
References: <509C0717.7030100@petroprogram.com> <509C2800.4080900@mind.be>
Message-ID: <509D0177.80705@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

8.11.2012 23:45, Arnout Vandecappelle kirjoitti:
> On 11/08/12 20:25, Stefan Fr?berg wrote:
>> Hello everyone
>>
>> I have now tried several times to build working arm-virtual image for
>> use with qemu.
>> Once i even managed to run it with qemu but then I made some changes
>> that I don't remember anymore
>> and it has stopped working again (just black screen in qemu).
>>
>> Could somebody kindly provide a minimal (just kernel, uclibc and busybox
>> is enough),
>> working arm buildroot .config and arm kernel .config  so
>> that I can run it under qemu, so that I can finally start testing
>> firefox under arm, so that
>> I can finally kick the updated, cleaned firefox patch out before
>> Christmas :-)
>
>  Do qemu_arm_versatile_defconfig or qemu_arm_vexpress_defconfig not work
> for you?  See board/qemu/arm-versatile/readme.txt for instructions how
> to run qemu.
>
>  Regards,
>  Arnout

Thank Arnout!

I will try that

Regards
Stefan
