From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 11 Dec 2009 11:36:28 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <4B221A6E.3090105@gmail.com>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
Message-ID: <5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/11 Kieran Bingham <kieranbingham@gmail.com>:
>
>> But I find that strange as I'm pretty sure I've successfully used
>> Buildroot
>> revisions after this commit before.
>>
>> I think it must be something wrong with *my* setup since nobody else has
>> noticed this (and the commit is from July), but I don't know what it may
>> be.
>> Any suggestions?
>>
>
> Actually I pulled Buildroot yesterday and also found this.

Then at least I'm not the only one.

> Perhaps its our environments ... I'm on ubuntu 9.10 Karmic ...
> I don't think its a bash/dashism as I have /bin/sh -> /bin/bash ...

I'm on Ubuntu 9.10 Karmic amd64. I just tried BR on another machine (also
Karmic amd64) and the same thing happens there. I also tried to symlink /bin/sh
to /bin/dash on one of the machines. It didn't help.

Best regards,
Bj?rn Forsman
