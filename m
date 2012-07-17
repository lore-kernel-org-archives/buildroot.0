From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 17 Jul 2012 17:20:58 +0200
Subject: [Buildroot] [UNSURE]Re: [UNSURE]Re: [PATCH 1/5] lua : fix
	autobuild.buildroot
In-Reply-To: <20120717165710.7b1a0dd0@skate>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <20120716173958.39ab39b3@skate>
 <CAB0FRsszFbq5_yMhpxeW4NzQHJ1oG24S1+SGoj8qgR0-3A3rBw@mail.gmail.com>
 <20120717104000.695658f8@skate>
 <CAB0FRss38A4p+34=D+L42tdkyevrpFV5M5ZcZt4UDGksh8Nvvw@mail.gmail.com>
 <20120717165710.7b1a0dd0@skate>
Message-ID: <CAB0FRsuBVmsA66yUYw4+g-t2EnVXqvgfV1z5yhuqJi=eUga5GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Tue, 17 Jul 2012 16:46:32 +0200,
> Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :
>
>> There are 3 series of patches :
>>
>> a serie for luajit
>> [1/2] luajit: new package
>>       work in progress
>> [2/2] luajit: fix dependencies of Lua modules
>
> Ok, so I need to wait for both of these that you prepare a nice patch
> set that solves the bitness building problem for luajit. Correct?
>

as you suggest, I use (with success) the proposal of Jean-Christophe
Plagnol-Villard
(http://patchwork.ozlabs.org/patch/153235/)
so now, in fact, I wait you integrate it.

>> a serie for refactor lua
>> [PATCH 1/5] lua : fix autobuild.buildroot
>> [PATCH 2/5] lua : don't install static library in target
>> [PATCH 3/5] lua : don't install shared library in staging
>> [PATCH 4/5] lua : refactor with POST_PATH_HOOKS
>> [PATCH 5/5] lua: split and rename patches
>> trash them, only the last one deserves to be saved by a new version
>
> Ok, so I ignore those 5 patches, correct?

ok
>
>> a new serie for refactor lua
>> [PATCH 1/2] lua: split and rename patches v2
>> [PATCH 2/2] lua: refactor root path
>
> Ok, I will merge them.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
