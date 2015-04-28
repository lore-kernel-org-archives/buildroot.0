From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 28 Apr 2015 09:13:15 -0400
Subject: [Buildroot] [PATCH] raspberrypi2: kernel version does no more
	exist
In-Reply-To: <20150410222156.07957902@free-electrons.com>
References: <1428480480-6422-1-git-send-email-jezz@sysmic.org>
 <20150408232038.4942770f@free-electrons.com> <55282E0E.8010300@mind.be>
 <20150410222156.07957902@free-electrons.com>
Message-ID: <CA+-urNSypYEi+GGmzJU4mRVVQCVkgPT4W2Bm_fcC4ui1AtjXnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 10, 2015 at 4:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Fri, 10 Apr 2015 22:09:50 +0200, Arnout Vandecappelle wrote:
>
>>  In that issue, popcornmix writes:
>>
>> > The stable branches (e.g. 3.18.y) don't get rebased, so should have a linear history
>>
>> so perhaps we should stick to the stable 3.18 branch instead? The
>> raspberry_dt_defconfig is based off the 3.18 branch, so why not do the same for
>> the RPi2?
>
> Absolutely. I'm hoping to see some patches about this from our RPi
> contributors. Yann? :-)

I recently tried a Raspberry Pi 2 with the 3.19 kernel from
raspberrypi2_defconfig, and it had issues mounting an ext2 rootfs
(presumably due to not finding mmcblk0p2, but I didn't debug). I
switched to a 3.18 kernel, and everything worked fine.

I don't mind sending a patch to switch to the 3.18 branch, but before
I did so, was there anything I missed on this issue? It looks like
it's been a couple of weeks since this email, and I didn't see other
RPi commits.

Thanks,
Frank
