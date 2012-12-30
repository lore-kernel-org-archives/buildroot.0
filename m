From: Willy Lambert <lambert.willy@gmail.com>
Date: Sun, 30 Dec 2012 13:56:54 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an
	external toolchain
In-Reply-To: <CAKvQZ_2ZJ9GOV-B2Gi1zG-gjJiFVYHxpd4GzFCHCAg7ABAPFUA@mail.gmail.com>
References: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
 <20121218135336.2e24d6bc@skate>
 <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
 <20121218163210.1573a9c7@skate>
 <CAKvQZ_2ZJ9GOV-B2Gi1zG-gjJiFVYHxpd4GzFCHCAg7ABAPFUA@mail.gmail.com>
Message-ID: <CAKvQZ_1hK1dXwVs5W5XpuZY=O6AZj-Y8XtCHirW+wyXQ4Fwx8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/18 Willy Lambert <lambert.willy@gmail.com>:
> 2012/12/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Dear Willy Lambert,
>>
>> On Tue, 18 Dec 2012 16:19:47 +0100, Willy Lambert wrote:
>>
>>> aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah. To be honest an entry
>>> in the manual to state this would be nice.
>>
>> Indeed. Feel free to submit a patch for the manual :-)
>>
>
> yes, but how ? Should I edit html files by and in the docs/manual folder ?
> I'm not at ease with git, so I will see during hollidays if I can do
> something with it.
>
>>> thanks, should I understand that I can't publish the buildroot
>>> toolchain on another  PC without installing it at the __same__ place ?
>>

may I bump this, how should I edit documentation ?

I succeeded in creating the toolchain in "MY_TOOLCAHIN_PATH", but :
_ if I do a make clean it disapear, so I suppose I have to change
BR2_HOST_DIR back the default value after having creating the
toolchain ?
_ what's happening if I create several toolchain for several arch in
the same "MY_TOOLCHAIN_PATH ? does they override or do they install
nicely both in the same dir ?
_ what is the path I have to give to buildroot ? "MY_TOOLCHAIN_PATH'
or something like "MY_TOOLCHAIN_PATH'/usr/...

>> Your understanding is correct. Making the toolchain relocatable is part
>> of our TODO-list, though.
>>
>
> Ok thanks
>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
