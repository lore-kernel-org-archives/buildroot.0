From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 20 Jul 2015 08:56:06 -0500
Subject: [Buildroot] [PATCH v9 05/15] busybox: selinux support
In-Reply-To: <20150718150618.285b03cf@free-electrons.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-6-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150718150618.285b03cf@free-electrons.com>
Message-ID: <CANn-YGQvaLD1PecuKsiZNdNRaF_raRMaH-HcsDaRKWjHHdZ5DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Jul 18, 2015 at 8:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Tue, 14 Jul 2015 15:20:17 -0500, Clayton Shotwell wrote:
>> Add a configure option to enable the SELinux support in the
>> busybox configuration from the Buildroot menuconfig.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> Changes v8 -> v9:
>>   - No changes
>
> I've applied the patch. However, could you submit the Busybox patch
> upstream?

I'll get it sent out today. Thanks for merging the rest of it.

> Also, the Config.in help text mentions
> BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES, for which I haven't merged the
> patch yet because I still had comments. So we will have to hurry to
> merge it, to not keep for too long this currently "invalid" reference!

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
