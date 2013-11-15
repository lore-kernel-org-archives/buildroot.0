From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 10:47:05 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
 November 17)
In-Reply-To: <OFB8654BDF.8F87209F-ON86257C20.004B9357-86257C20.004BFC8C@rockwellcollins.com>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
 <CAAXf6LXNrRKU5dvc8DqXdrgS-L1nZQ7GC4YNceFSpbkbz+2XeA@mail.gmail.com>
 <OFB8654BDF.8F87209F-ON86257C20.004B9357-86257C20.004BFC8C@rockwellcollins.com>
Message-ID: <CAAXf6LU-fz4dvSw2TLYgvynw9h+ry2ZUZX2DbEvnkwEXKLS3VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Mon, Nov 11, 2013 at 2:50 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Thomas, All,
>
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 11/10/2013
> 10:18:55 AM:
>
> [...]
>
>> > [1/4] If linux-pam is built, enable dbm functionality in Berkeley DB
>> > Dimitry Golubovsky <golubovsky@gmail.com>
>> > http://patchwork.ozlabs.org/patch/182497
>> >
>> > [2/4] Make Berkeley DB a dependency of linux-pam and make sure it is
> selected
>> > Dimitry Golubovsky <golubovsky@gmail.com>
>> > http://patchwork.ozlabs.org/patch/182498
>> >
>> > [3/4] Provide PAM default configuration files when building linux-pam
> package
>> > Dimitry Golubovsky <golubovsky@gmail.com>
>> > http://patchwork.ozlabs.org/patch/182499
>> >
>> > [4/4] PAM support in Busybox if linux-pam is built
>> > Dimitry Golubovsky <golubovsky@gmail.com>
>> > http://patchwork.ozlabs.org/patch/182500
>> >
>> > Fixing linux-pam build failures
>> > Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> > http://patchwork.ozlabs.org/patch/182537
>> >
>>
>> All the above patches are related to PAM. If anyone is interested in
>> better linux-pam support in buildroot, I'd suggest to have a look at
>> the above patches. I don't personally need it, and I also don't know
>> how common PAM usage is in embedded systems.
>
> linux-pam will be used more once SELinux (at least that is where we use
> it) related packages are merged in. However, I don't know how applicable
> these patches since I know the version has been bumped since these patches
> were submitted. I don't have time to investigate whether these patches
> still apply, so if you haven't heard anything back on them, I would say we
> just mark them deprecated.
>

Thanks for your feedback. Unless someone steps up by Sunday, I will
indeed mark them as Rejected in patchwork.

Best regards,
Thomas
