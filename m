From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 12:36:40 +0200
Subject: [Buildroot] [PATCH 0/2] Add Xenomai real-time framework
In-Reply-To: <CAHeZHmvLFtv6tCsQCs__qCpLs0HpDN2FjuGsq6uOEMMX0WJ-NA@mail.gmail.com>
References: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
 <20110713182346.0ec83ec6@skate>
 <CAAXf6LVM1FaAV_J5Qjvg=sNW_44=9eZYjFKR62KBXwu2oaabeg@mail.gmail.com>
 <20110912215245.3b7b0a0b@skate>
 <CAHeZHmvLFtv6tCsQCs__qCpLs0HpDN2FjuGsq6uOEMMX0WJ-NA@mail.gmail.com>
Message-ID: <CAAXf6LWNi4uv+Z-0MKzx41mfT+Psa-0sK7NjaBwat8LuwiTtzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Beno?t,

2011/9/13 Beno?t Mauduit <benoit.mauduit@gmail.com>:
> On Mon, Sep 12, 2011 at 9:52 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Le Mon, 12 Sep 2011 21:24:40 +0200,
>> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>>
>>> What is the current status of this? I haven't seen any recent updated
>>> patches for xenomai in buildroot.
>>>
>>> Benoit, do you have the time to submit a new patch based on the
>>> feedback you received?
>>> Thomas (P.), are there more comments you wanted to add?
>>
>> I haven't had the time to do a more careful review process yet, but
>> it's on my TODO-list: my colleague Maxime Ripard can testify that I did
>> talk to him today about those Xenomai patches.
>>
>> Regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>>
>
> Hello,
>
> I am sorry but i am very busy this last weeks. (new job, etc...)
>
> But, it is on my TODO-list and I think i will resend patches for the
> next week-end.
>
> Thanks for the reminder :)

I was in the process of upgrading to buildroot-2011.08, and had to fix
my own Xenomai patch anyway, so I decided to switch to your patches. I
modified them according to the comments I gave earlier, and tested on
a powerpc target with SMP.

I attach the changes to your patches to this mail, for your reference.
I'll send the resulting patch as a separate mail.

Feel free to make whatever modifications you still want to make, e.g.
on feedback from Thomas.

Best regards,
Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xenomai-01-changes.patch
Type: application/octet-stream
Size: 793 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110914/27d9f76b/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: xenomai-02-changes.patch
Type: application/octet-stream
Size: 4226 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110914/27d9f76b/attachment-0003.obj>
