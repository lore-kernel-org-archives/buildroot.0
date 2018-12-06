From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 06 Dec 2018 20:16:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-04
In-Reply-To: <f3cpi33oica7lbub1hjw72x0.1544043243948@email.android.com>
References: <20181205070024.027E420A59@mail.bootlin.com>
 <CAMRc=MeKx3DWa6DZs3h7MH2uuJusBr08+ycoOnX3Drsmw22JWQ@mail.gmail.com>
 <f3cpi33oica7lbub1hjw72x0.1544043243948@email.android.com>
Message-ID: <87efaujzby.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

David J. Fogle writes:
> Is this patch going to be put into 2018.11, or is this going into
> 2019.02. I am rather new to your project, forgive me not knowing how
> your patch cycle works.

This patch fixes an issue in the current master branch. So this patch
(or a better one) will be applied to that branch. The master branch will
be released as 2019.02.

Patches fixing issues that affect stable branches (currently 2018.08.x
and 2018.02.x are maintained) will be backported to these branches. In
the case of this patch, stable branches seem not to be affected. The
build failure trigger is the bump of pulseview to version 0.4.1. This
bump is not in the stable branches.

Hope this helps,
baruch

> -------- Original message --------
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Date: 12/5/18 2:50 PM (GMT-06:00)
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Your build results for 2018-12-04
>
> ?r., 5 gru 2018 o 08:00 Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> napisa?(a):
>>
>> Hello,
>>
>> This is the list of Buildroot build failures that occured on
>> 2018-12-04, and for which you are a registered architecture developer
>> or package developer. Please help us improving the quality of
>> Buildroot by investigating those build failures and sending patches to
>> fix them. Thanks!
>>
>> Results for the 'master' branch
>> ===============================
>>
>> Build failures related to your packages:
>>
>>  powerpc64le |                pulseview-0.4.1 | http://autobuild.buildroot.net/results/9a9e8d390941cbfde70c4b4033d7e68ce28e041e
>>
>> --
>> http://autobuild.buildroot.net
>
> Pending patch[1] will fix it.
>
> Best regards,
> Bartosz Golaszewski
>
> [1] http://lists.busybox.net/pipermail/buildroot/2018-December/237718.html

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
