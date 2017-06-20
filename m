From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 20 Jun 2017 14:26:42 +0530
Subject: [Buildroot] [PATCH v4 1/6] board: Add support for Engicam
 i.CoreM6 DualLite/Solo boards
In-Reply-To: <20170620074635.6c036cfc@windsurf.home>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
 <1497857252-8308-2-git-send-email-jteki@openedev.com>
 <20170619221759.63450810@windsurf.home>
 <CAMty3ZDRMu13a1tZfah8m39CxBNrNnwEYEcEQeDRMqt=6N74Rg@mail.gmail.com>
 <20170620074635.6c036cfc@windsurf.home>
Message-ID: <CAMty3ZCkw9z8qYgoZM7oO_0KydFpdn51KzA9zY5-hViPQ9JYSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 20, 2017 at 11:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 20 Jun 2017 07:55:26 +0530, Jagan Teki wrote:
>
>> >> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
>> >> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
>> >> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05-rc1"
>> >
>> > This doesn't make sense. Why are you rolling back from 2017.05 to
>> > 2017.05-rc1 ?
>> >
>> > I assume a feature present in the -rc1 is also present in the final
>> > release. Otherwise, it means the feature has been reverted, which is a
>> > bad sign.
>> >
>> > Maybe you wanted to use 2017.07-rc1 instead?
>>
>> Yes I need to use -rc1 because this feature is present in it. I was
>> trying for explicitly applying patches, but those are more.
>
> Did you read what I wrote? Your patch is using 2017.05-rc1, which is
> most likely not what you intended, because 2017.05 final is available.
> Wasn't your intention to use 2017.07-rc1.

Sorry, my intention here is to use 2017.07-rc1, I think I sent wrong patch.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
