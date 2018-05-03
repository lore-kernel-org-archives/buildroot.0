From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Thu, 3 May 2018 21:01:36 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: add
 --with-open-posix-testsuite
In-Reply-To: <20180503215504.356b46be@windsurf>
References: <CAFXrp_cbD89wmzAf44aNjHfQS+ixvMUqMmxFxeLjLbvGDr3FFA@mail.gmail.com>
 <20180503215504.356b46be@windsurf>
Message-ID: <CAFXrp_dU0yzejWuHyVrqO2pZPcajqndwbUyP6dBzogWZv9k-jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 3, 2018 at 8:55 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Ciro,
>
> On Thu, 3 May 2018 17:03:16 +0100, Ciro Santilli wrote:
>> The issues mentioned on the removed comments were resolved,
>> tested in QEMU x86_64 and aarch64.
>>
>> Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
>> ---
>> This patch supposes that the removed comments imply that a default
>> --with-open-posix-testsuite
>> is desirable (and I confirm that it does not take unreasoble build
>> time or disk space),
>> and that there is no generic way to add autotools configs to packages:
>> https://stackoverflow.com/questions/44341188/how-to-pass-extra-custom-configure-autotools-options-to-a-buildroot-package
>
> Thanks for this contribution. However, your patch was corrupted, so it
> would be nice to use "git send-email" next time to submit a patch.
>

Ah, sorry about that.

git send-email didn't work on the network I was on, but it works on my
home network with the exact same git configs.

The problem is described at:
https://stackoverflow.com/questions/28038662/unable-to-initialize-smtp-properly-using-git
but none of the answers helped :-(

I wonder if anyone has ever solved it.

> However, since the patch was simple, I fixed it up, and applied. Thanks
> again!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
