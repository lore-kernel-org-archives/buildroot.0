From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 26 Apr 2016 09:50:08 +0200
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
	staging
In-Reply-To: <20160425231717.7a85e856@free-electrons.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <20160425231717.7a85e856@free-electrons.com>
Message-ID: <CAAXf6LVif-9gQyoBvyWN+BoZj5h+JhSBQo1HiV5b8mqs+hidKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 25, 2016 at 11:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 12 Feb 2016 20:20:21 +0100, Thomas De Schampheleire wrote:
>
>> Thomas De Schampheleire (5):
>>   toolchain-external: blackfin: install FDPIC libraries also to staging
>>   toolchain-external: remove unused calculation of ARCH_SUBDIR
>>   toolchain-external: extract installation of gdbserver to separate
>>     define
>>   toolchain-external: align library locations in target and staging dir
>>   toolchain-external: unify LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
>
> The entire series is applied. I've also applied two additional cleanups
> (see below). Thanks a lot for your work on this series. Not only it
> makes the thing more functional, but it also makes the code simpler.
> Definitely very good.
>
> Thanks to Arnout and Romain for reviewing those not-so-simple changes!


Thomas, Arnout, Romain: many thanks indeed for your review and apply
effort, I greatly appreciate it!
As you noticed, I did not yet have the time to apply the suggested
changes, but ThomasP took care of it now.

Thanks!
Thomas
